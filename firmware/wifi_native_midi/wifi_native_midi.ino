#include <WiFiManager.h>

#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <WiFiUdp.h>

#include "MIDI.h" // dependency: https://github.com/FortySevenEffects/arduino_midi_library 
#include "AppleMidi.h"

unsigned long t0 = millis();
bool isConnected = false;

//RJ12 MIDI settings
struct rj12MidiSettings : public midi::DefaultSettings {
    static const long BaudRate = 38400;
};

APPLEMIDI_CREATE_INSTANCE(WiFiUDP, AppleMIDI); // see definition in AppleMidi_Defs.h

WiFiManager wifiManager;


// Created and binds the MIDI interface to the default hardware Serial port
MIDI_CREATE_INSTANCE(HardwareSerial,Serial1,nativeMidi);
//MIDI_CREATE_CUSTOM_INSTANCE(HardwareSerial,Serial,rj12Midi,rj12MidiSettings);

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
//for LED status

#include <Ticker.h>
Ticker ticker;

void tick()
{
  //toggle state
  int state = digitalRead(BUILTIN_LED);  // get the current state of GPIO1 pin
  digitalWrite(BUILTIN_LED, !state);     // set pin to the opposite state
}

//gets called when WiFiManager enters configuration mode
void configModeCallback (WiFiManager *myWiFiManager) {
  Serial.println("Entered config mode");
  Serial.println(WiFi.softAPIP());
  //if you used auto generated SSID, print it
  Serial.println(myWiFiManager->getConfigPortalSSID());
  //entered config mode, make led toggle faster
  ticker.attach(0.2, tick);
}

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------

void setup() {
  Serial.begin(38400);
  
  //set led pin as output
  pinMode(BUILTIN_LED, OUTPUT);
  // start ticker with 0.5 because we start in AP mode and try to connect
  ticker.attach(0.6, tick);

  //WiFiManager
  //Local intialization. Once its business is done, there is no need to keep it around
  WiFiManager wifiManager;
  //reset settings - for testing
  //wifiManager.resetSettings();

  //set callback that gets called when connecting to previous WiFi fails, and enters Access Point mode
  wifiManager.setAPCallback(configModeCallback);

  //fetches ssid and pass and tries to connect
  //if it does not connect it starts an access point with the specified name
  //here  "AutoConnectAP"
  //and goes into a blocking loop awaiting configuration
  if (!wifiManager.autoConnect()) {
    //reset and try again, or maybe put it to deep sleep
    ESP.reset();
    delay(1000);
  }
  
  //if you get here you have connected to the WiFi
  Serial.println("connected...yeey :)");
  ticker.detach();
  //keep LED on
  digitalWrite(BUILTIN_LED, LOW);

    // Create a session and wait for a remote host to connect to us
  AppleMIDI.begin("test");

  AppleMIDI.OnConnected(OnAppleMidiConnected);
  AppleMIDI.OnDisconnected(OnAppleMidiDisconnected);

  AppleMIDI.OnReceiveNoteOn(OnAppleMidiNoteOn);
  AppleMIDI.OnReceiveNoteOff(OnAppleMidiNoteOff);

  pinMode(13,OUTPUT);
  digitalWrite(13,HIGH);
}
  
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
