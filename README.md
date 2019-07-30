# midi-solenoid-driver
A set of PCBs to drive solenoids using MIDI data, for use in automating musical instruments.

**The boards in this repo will be available for sale shortly on Tindie and/or eBay. If you are interested in buying assembled PCBs or bare PCBs, please send me a message as it would be helpful to know how many might sell. Thanks!**

The system consists of two parts: the solenoid driver board(s), and the USB interface board. The solenoid driver board(s) are daisy-chained via RJ12 ("phone cables"), and at the end of the chain is the USB interface board, which passes MIDI data from the USB port to all the solenoid driver boards (as many driver boards as are needed):

![all boards](https://github.com/willemcvu/midi-solenoid-driver/blob/master/hardware/multiple-boards.PNG)

In addition to supporting daisy-chaining, the solenoid driver board has several notable features that allow for high usability with limited electronics experience.

![solenoid board annotated](https://github.com/willemcvu/midi-solenoid-driver/blob/master/hardware/midi-solenoid-driver/front.JPG)


Currently, MIDI data is fed to the solenoid drivers by a custom USB to serial-over-RJ12 board:

![usb interface board](https://github.com/willemcvu/midi-solenoid-driver/blob/master/hardware/usb-serial-interface/front.JPG)

In the near future, more RJ12-compatible MIDI interface boards will be designed and released, allowing for more connectivity options. These will likely include:
 - Native plug-and-play USB MIDI (as opposed to the MIDI-over-serial in use right now)
 - Actual MIDI connector
 - Bluetooth adapter
 - AppleMIDI (RTP-MIDI / MIDI-over-network) WiFi interface

Additionally, more driver boards for devices other than solenoids will be designed/released, including a MIDI servo driver.

If you have specific needs for a particular project and need customized hardware, I can probably accomodate. Open an issue or contact me via my blog (https://willemhillier.wordpress.com/)and we'll go from there.
