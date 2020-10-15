//Firmware for the MIDI solenoid driver board: https://github.com/willemcvu/midi-solenoid-driver
//Author: Willem Hillier, with MIDI decoding code taken from: https://forum.arduino.cc/index.php?topic=22447.0

//Configuration constants
#define SETUP_TEST_DELAY 100

//Pin mappings for big dip switch input, used for selecting the MIDI note number of the lowest note the board responds to
byte MIDI_NOTE_BIT[] =  {15, 16, 17, 18, 19, 1, 2};

// Digital output pin mappings in sequential order ("OUTPUTS 1-16")
byte pinNumbers[] = {3, 4, 23, 24, 20, 21, 5, 6, 7, 8, 9, 10, 11, 12, 13, 25};

// Global vars
byte MIDI_CHANNEL = 0;
byte LOWEST_MIDI_NOTE = 0;
byte incomingByte;
byte byteNumber = 0;
byte note;
byte velocity;
int action = 2;

boolean readSmallDip(int bitNo) {
  boolean bit0 = false;
  boolean bit1 = false;
  boolean bit2 = false;
  boolean bit3 = false;

  int adc_bit01_val = analogRead(A0);
  int adc_bit23_val = analogRead(A7);

  if (adc_bit01_val > 750) {
    bit0 = false;
    bit1 = false;
  } else if ((adc_bit01_val > 550) and (adc_bit01_val <= 750)) {
    bit0 = false;
    bit1 = true;
  } else if ((adc_bit01_val > 480) and (adc_bit01_val <= 550)) {
    bit0 = true;
    bit1 = false;
  } else if ((adc_bit01_val <= 480)) {
    bit0 = true;
    bit1 = true;
  }

  if (adc_bit23_val > 750) {
    bit2 = false;
    bit3 = false;
  } else if ((adc_bit23_val > 550) and (adc_bit23_val < 750)) {
    bit2 = false;
    bit3 = true;
  } else if ((adc_bit23_val > 480) and (adc_bit23_val <= 550)) {
    bit2 = true;
    bit3 = false;
  } else if ((adc_bit23_val <= 480)) {
    bit2 = true;
    bit3 = true;
  }

  if (bitNo == 0) {
    return bit0;
  } else if (bitNo == 1) {
    return bit1;
  } else if (bitNo == 2) {
    return bit2;
  } else if (bitNo == 3) {
    return bit3;
  } else {
    return false;
  }
}

void TestDipSwitches() {
  while (1 == 1) {

    //Set first 7 outputs to the state of the large dip switch
    digitalWrite(pinNumbers[0], ! digitalRead(MIDI_NOTE_BIT[6]));
    digitalWrite(pinNumbers[1], ! digitalRead(MIDI_NOTE_BIT[5]));
    digitalWrite(pinNumbers[2], ! digitalRead(MIDI_NOTE_BIT[4]));
    digitalWrite(pinNumbers[3], ! digitalRead(MIDI_NOTE_BIT[3]));
    digitalWrite(pinNumbers[4], ! digitalRead(MIDI_NOTE_BIT[2]));
    digitalWrite(pinNumbers[5], ! digitalRead(MIDI_NOTE_BIT[1]));
    digitalWrite(pinNumbers[6], ! digitalRead(MIDI_NOTE_BIT[0]));

    // Set first four outputs to the state of the small dip switch
    digitalWrite(pinNumbers[7], readSmallDip(0));
    digitalWrite(pinNumbers[8], readSmallDip(1));
    digitalWrite(pinNumbers[9], readSmallDip(2));
    digitalWrite(pinNumbers[10], readSmallDip(3));
  }
}

void setup() {
  //Set output pins mode
  for (int n = 0; n < 16; n++) {
    pinMode(pinNumbers[n], OUTPUT);
  }

  //DIP switch input mode
  for (int n = 0; n < 7; n++) {
    pinMode(MIDI_NOTE_BIT[n], INPUT_PULLUP);
  }

  // test outputs
  for (int n = 0; n < 16; n++) {
    digitalWrite(pinNumbers[n], HIGH);
    delay(SETUP_TEST_DELAY);
    digitalWrite(pinNumbers[n], LOW);
  }

  // test DIP switches
  //TestDipSwitches();
  //The above function is an infinite while-loop. Reflash this firmware with the above line uncommented, and the status of the ouputs will mirror the status of the DIP switches.
  //Useful for testing outputs and DIP switches.

  //read midi channel to respond to, zero-indexed (!! most midi software is 1-indexed !!)
  if (readSmallDip(3)) MIDI_CHANNEL = MIDI_CHANNEL + 1;
  if (readSmallDip(2)) MIDI_CHANNEL = MIDI_CHANNEL + 2;
  if (readSmallDip(1)) MIDI_CHANNEL = MIDI_CHANNEL + 4;
  if (readSmallDip(0)) MIDI_CHANNEL = MIDI_CHANNEL + 8;

  //read lowest midi note to respond to
  if (!digitalRead(MIDI_NOTE_BIT[0])) LOWEST_MIDI_NOTE = LOWEST_MIDI_NOTE + 1;
  if (!digitalRead(MIDI_NOTE_BIT[1])) LOWEST_MIDI_NOTE = LOWEST_MIDI_NOTE + 2;
  if (!digitalRead(MIDI_NOTE_BIT[2])) LOWEST_MIDI_NOTE = LOWEST_MIDI_NOTE + 4;
  if (!digitalRead(MIDI_NOTE_BIT[3])) LOWEST_MIDI_NOTE = LOWEST_MIDI_NOTE + 8;
  if (!digitalRead(MIDI_NOTE_BIT[4])) LOWEST_MIDI_NOTE = LOWEST_MIDI_NOTE + 16;
  if (!digitalRead(MIDI_NOTE_BIT[5])) LOWEST_MIDI_NOTE = LOWEST_MIDI_NOTE + 32;
  if (!digitalRead(MIDI_NOTE_BIT[6])) LOWEST_MIDI_NOTE = LOWEST_MIDI_NOTE + 64;

  //begin serial receive, no transmit
  Serial.begin(38400);
  //Disable hardware UART transmit
  UCSR0B &= ~bit (TXEN0);
}

//loop: wait for serial data, and interpret the message
void loop () {
  if (Serial.available() > 0) {
    //digitalWrite(pinNumbers[15],HIGH);
    //delay(1);
    //digitalWrite(pinNumbers[15],LOW);
    // read the incoming byte:
    incomingByte = Serial.read();

    // wait for as status-byte, channel 1, note on or off
    if (incomingByte == 144 + MIDI_CHANNEL) { // note on message starting starting
      //digitalWrite(pinNumbers[14],HIGH);
      //delay(1);
      //digitalWrite(pinNumbers[14],LOW);
      action = 1;
      byteNumber = 1;
    } else if (incomingByte == 128 + MIDI_CHANNEL) { // note off message starting
      action = 0;
      byteNumber = 1;
    } else if (incomingByte == 208) { // aftertouch message starting
      //not implemented yet
    } else if (incomingByte == 160) { // polypressure message starting
      //not implemented yet
    } else if ( (action == 0) && (byteNumber == 1) ) { // if we received a "note off", we wait for which note (databyte)
      note = incomingByte;
      playNote(note, 0);
      note = 0;
      velocity = 0;
      action = 2;
      byteNumber = 0;
    } else if ( (action == 1) && (byteNumber == 1) ) { // if we received a "note on", we wait for the note (databyte)
      note = incomingByte;
      byteNumber = 2;
    } else if ( (action == 1) && (byteNumber == 2) ) { // ...and then the velocity
      velocity = incomingByte;
      playNote(note, velocity);
      note = 0;
      velocity = 0;
      action = 0;
      byteNumber = 0;
    } else {
    }
  }
}

void playNote(byte note, byte velocity) {
  //digitalWrite(pinNumbers[13],HIGH);
  //delay(1);
  //digitalWrite(pinNumbers[13],LOW);
  int value = LOW;
  if (velocity > 0) {
    value = HIGH;
  } else {
    value = LOW;
  }

  //play note if it's in the correct range
  if ((note >= LOWEST_MIDI_NOTE) and (note < LOWEST_MIDI_NOTE + 16)) {
    digitalWrite(pinNumbers[note - LOWEST_MIDI_NOTE], value);
    //digitalWrite(pinNumbers[12],value);
  }
}
