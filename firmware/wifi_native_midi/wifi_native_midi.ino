#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <WiFiUdp.h>

#include "MIDI.h" // dependency: https://github.com/FortySevenEffects/arduino_midi_library 
#include "AppleMidi.h"

//comment this out to actually send via RJ12 jack, as that UART is shared between RJ12 and serial header
//If you uncomment this, then you'll want to unplug any boards from the RJ12 jack as they'll get non-MIDI debug messages.
//#define SERIAL_DEBUG_ON

char ssid[] = "Shell-2.4"; //  your network SSID (name)
char pass[] = "Herm1tCrabs";    // your network password (use for WPA, or use as key for WEP)

unsigned long t0 = millis();
bool isConnected = false;

//RJ12 MIDI settings
struct rj12MidiSettings : public midi::DefaultSettings
{
    static const long BaudRate = 38400;
};

APPLEMIDI_CREATE_INSTANCE(WiFiUDP, AppleMIDI); // see definition in AppleMidi_Defs.h

// Created and binds the MIDI interface to the default hardware Serial port
MIDI_CREATE_INSTANCE(HardwareSerial,Serial1,nativeMidi);
//MIDI_CREATE_CUSTOM_INSTANCE(HardwareSerial,Serial,rj12Midi,rj12MidiSettings);

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
void setup() {
  Serial.begin(38400);
#ifdef SERIAL_DEBUG_ON
  // Serial for debug
 // Serial.begin(115200);
  while (!Serial) {
    ; // wait for serial port to connect.
  }

  Serial.print(F("Getting IP address..."));
  
#endif

  WiFi.begin(ssid, pass);


  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
#ifdef SERIAL_DEBUG_ON
    Serial.print(F("."));
#endif
  }

#ifdef SERIAL_DEBUG_ON
  Serial.println(F(""));
  Serial.println(F("WiFi connected"));

  Serial.println();
  Serial.print(F("IP address is "));
  Serial.println(WiFi.localIP());

  Serial.println(F("OK, now make sure you an rtpMIDI session that is Enabled"));
  Serial.print(F("Add device named Arduino with Host/Port "));
  Serial.print(WiFi.localIP());
  Serial.println(F(":5004"));
  Serial.println(F("Then press the Connect button"));
  Serial.println(F("Then open a MIDI listener (eg MIDI-OX) and monitor incoming notes"));

#endif

  // Create a session and wait for a remote host to connect to us
  AppleMIDI.begin("test");

  AppleMIDI.OnConnected(OnAppleMidiConnected);
  AppleMIDI.OnDisconnected(OnAppleMidiDisconnected);

  AppleMIDI.OnReceiveNoteOn(OnAppleMidiNoteOn);
  AppleMIDI.OnReceiveNoteOff(OnAppleMidiNoteOff);

#ifdef SERIAL_DEBUG_ON
  Serial.println(F("Sending NoteOn/Off of note 45, every second"));
#endif

  pinMode(13,OUTPUT);
  digitalWrite(13,HIGH);
}

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
void loop()
{
  // Listen to incoming notes
  AppleMIDI.read();

  // Read incoming messages
  nativeMidi.read();
  //rj12Midi.read();
}

// ====================================================================================
// Event handlers for incoming MIDI messages
// ====================================================================================

// -----------------------------------------------------------------------------
// rtpMIDI session. Device connected
// -----------------------------------------------------------------------------
void OnAppleMidiConnected(uint32_t ssrc, char* name) {
  isConnected = true;
#ifdef SERIAL_DEBUG_ON
  Serial.print(F("Connected to session "));
  Serial.println(name);
#endif  
}

// -----------------------------------------------------------------------------
// rtpMIDI session. Device disconnected
// -----------------------------------------------------------------------------
void OnAppleMidiDisconnected(uint32_t ssrc) {
  isConnected = false;
#ifdef SERIAL_DEBUG_ON
  Serial.println(F("Disconnected"));
#endif
}

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
static void OnAppleMidiNoteOn(byte channel, byte note, byte velocity) {
#ifdef SERIAL_DEBUG_ON
  Serial.println(F("received noteOn via rtp, sending via serial MIDI"));
#endif
  nativeMidi.sendNoteOn(note, velocity, channel);
  //rj12Midi.sendNoteOn(note, velocity, channel);
  Serial.write(144+channel);
  Serial.write(note);
  Serial.write(velocity);
  digitalWrite(13,LOW);
}

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
static void OnAppleMidiNoteOff(byte channel, byte note, byte velocity) {
#ifdef SERIAL_DEBUG_ON
  Serial.println(F("received noteOff via rtp, sending via serial MIDI"));
#endif
  nativeMidi.sendNoteOff(note, velocity, channel);
  //rj12Midi.sendNoteOff(note, velocity, channel);
  Serial.write(128+channel);
  Serial.write(note);
  Serial.write(velocity);
  digitalWrite(13,HIGH);
  
}
