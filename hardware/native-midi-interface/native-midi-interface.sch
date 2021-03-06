EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Isolator:6N138 U1
U 1 1 5D43A16D
P 4400 2700
F 0 "U1" H 4400 3167 50  0000 C CNN
F 1 "6N138" H 4400 3076 50  0000 C CNN
F 2 "Package_DIP:SMDIP-8_W9.53mm" H 4690 2400 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/HCPL2731-D.pdf" H 4690 2400 50  0001 C CNN
	1    4400 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5D445C46
P 2750 2850
F 0 "#PWR0101" H 2750 2600 50  0001 C CNN
F 1 "GND" H 2755 2677 50  0000 C CNN
F 2 "" H 2750 2850 50  0001 C CNN
F 3 "" H 2750 2850 50  0001 C CNN
	1    2750 2850
	1    0    0    -1  
$EndComp
$Comp
L CUSTOM_IC:MIDI_DIN5 J1
U 1 1 5D4455CD
P 3150 2700
F 0 "J1" V 3000 2950 50  0000 L CNN
F 1 "MIDI_RX" V 3300 2950 50  0000 L CNN
F 2 "footprints:57PC5F_5_DIN_MIDI_GENERIC" H 3150 2700 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 3150 2700 50  0001 C CNN
	1    3150 2700
	0    1    1    0   
$EndComp
$Comp
L CUSTOM_IC:MIDI_DIN5 J2
U 1 1 5D44740C
P 3150 4600
F 0 "J2" V 3100 4950 50  0000 C CNN
F 1 "MIDI_PASSTHROUGH" V 3000 5200 50  0000 C CNN
F 2 "footprints:57PC5F_5_DIN_MIDI_GENERIC" H 3150 4600 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 3150 4600 50  0001 C CNN
	1    3150 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 2700 2750 2700
Wire Wire Line
	2750 2700 2750 2850
Wire Wire Line
	2800 4600 2750 4600
$Comp
L power:GND #PWR0102
U 1 1 5D455499
P 2750 4750
F 0 "#PWR0102" H 2750 4500 50  0001 C CNN
F 1 "GND" H 2755 4577 50  0000 C CNN
F 2 "" H 2750 4750 50  0001 C CNN
F 3 "" H 2750 4750 50  0001 C CNN
	1    2750 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4600 2750 4750
Wire Wire Line
	3250 2400 3750 2400
Wire Wire Line
	3750 2400 3750 2600
Wire Wire Line
	3750 2600 4100 2600
Wire Wire Line
	3250 3000 3750 3000
Wire Wire Line
	3750 3000 3750 2800
Wire Wire Line
	3750 2800 4100 2800
$Comp
L power:+5V #PWR0103
U 1 1 5D457B0D
P 4950 2350
F 0 "#PWR0103" H 4950 2200 50  0001 C CNN
F 1 "+5V" H 4965 2523 50  0000 C CNN
F 2 "" H 4950 2350 50  0001 C CNN
F 3 "" H 4950 2350 50  0001 C CNN
	1    4950 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R3
U 1 1 5D4588B8
P 4950 2650
F 0 "R3" H 5018 2696 50  0000 L CNN
F 1 "470" H 5018 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4990 2640 50  0001 C CNN
F 3 "~" H 4950 2650 50  0001 C CNN
	1    4950 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 5D4598EA
P 4950 2950
F 0 "R4" H 5018 2996 50  0000 L CNN
F 1 "1k" H 5018 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4990 2940 50  0001 C CNN
F 3 "~" H 4950 2950 50  0001 C CNN
	1    4950 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2800 4950 2800
Wire Wire Line
	4700 2900 4750 2900
Wire Wire Line
	4750 2900 4750 3100
$Comp
L power:GND #PWR0104
U 1 1 5D45AA40
P 4950 3100
F 0 "#PWR0104" H 4950 2850 50  0001 C CNN
F 1 "GND" H 4955 2927 50  0000 C CNN
F 2 "" H 4950 3100 50  0001 C CNN
F 3 "" H 4950 3100 50  0001 C CNN
	1    4950 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5D45AE53
P 4750 3100
F 0 "#PWR0105" H 4750 2850 50  0001 C CNN
F 1 "GND" H 4755 2927 50  0000 C CNN
F 2 "" H 4750 3100 50  0001 C CNN
F 3 "" H 4750 3100 50  0001 C CNN
	1    4750 3100
	1    0    0    -1  
$EndComp
Connection ~ 4950 2800
Wire Wire Line
	4700 2500 4950 2500
Connection ~ 4950 2500
Wire Wire Line
	4950 2350 4950 2500
$Comp
L CUSTOM_IC:74HCT2G04,_74HC2G04 U2
U 1 1 5D462CFC
P 4650 4950
F 0 "U2" H 4650 4633 50  0000 C CNN
F 1 "74HC2G04" H 4650 4724 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 4650 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4650 4950 50  0001 C CNN
	1    4650 4950
	-1   0    0    1   
$EndComp
$Comp
L CUSTOM_IC:74HCT2G04,_74HC2G04 U2
U 2 1 5D464826
P 4050 4950
F 0 "U2" H 4050 4633 50  0000 C CNN
F 1 "74HC2G04" H 4050 4724 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 4050 4950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4050 4950 50  0001 C CNN
	2    4050 4950
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5D46884C
P 3750 4150
F 0 "#PWR0106" H 3750 4000 50  0001 C CNN
F 1 "+5V" H 3765 4323 50  0000 C CNN
F 2 "" H 3750 4150 50  0001 C CNN
F 3 "" H 3750 4150 50  0001 C CNN
	1    3750 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 5D4694A3
P 3450 4200
F 0 "R1" V 3245 4200 50  0000 C CNN
F 1 "220" V 3336 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3490 4190 50  0001 C CNN
F 3 "~" H 3450 4200 50  0001 C CNN
	1    3450 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 4150 3750 4200
Wire Wire Line
	3750 4200 3600 4200
Wire Wire Line
	3300 4200 3250 4200
Wire Wire Line
	3250 4200 3250 4300
$Comp
L Device:R_US R2
U 1 1 5D46F975
P 3550 4950
F 0 "R2" V 3345 4950 50  0000 C CNN
F 1 "220" V 3436 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3590 4940 50  0001 C CNN
F 3 "~" H 3550 4950 50  0001 C CNN
	1    3550 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 4950 3700 4950
Wire Wire Line
	3400 4950 3250 4950
Wire Wire Line
	3250 4950 3250 4900
$Comp
L power:GND #PWR0107
U 1 1 5D473A1C
P 3550 4600
F 0 "#PWR0107" H 3550 4350 50  0001 C CNN
F 1 "GND" V 3555 4472 50  0000 R CNN
F 2 "" H 3550 4600 50  0001 C CNN
F 3 "" H 3550 4600 50  0001 C CNN
	1    3550 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 4600 3450 4600
Text Label 5600 2800 2    50   ~ 0
MIDI_UART
Wire Wire Line
	4950 2800 5600 2800
Text Label 5350 4950 2    50   ~ 0
MIDI_UART
Wire Wire Line
	4950 4950 5350 4950
$Comp
L Connector:6P6C J4
U 1 1 5D48468E
P 6650 4500
F 0 "J4" H 6320 4596 50  0000 R CNN
F 1 "6P6C" H 6320 4505 50  0000 R CNN
F 2 "footprints:RJ12_Amphenol_54601" V 6650 4525 50  0001 C CNN
F 3 "~" V 6650 4525 50  0001 C CNN
	1    6650 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5D485F81
P 7250 4850
F 0 "#PWR0108" H 7250 4600 50  0001 C CNN
F 1 "GND" H 7255 4677 50  0000 C CNN
F 2 "" H 7250 4850 50  0001 C CNN
F 3 "" H 7250 4850 50  0001 C CNN
	1    7250 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7250 4850 7250 4500
Wire Wire Line
	7250 4500 7050 4500
$Comp
L Device:R_US R5
U 1 1 5D488034
P 7350 4400
F 0 "R5" V 7145 4400 50  0000 C CNN
F 1 "330" V 7236 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7390 4390 50  0001 C CNN
F 3 "~" H 7350 4400 50  0001 C CNN
	1    7350 4400
	0    -1   1    0   
$EndComp
Wire Wire Line
	7200 4400 7050 4400
Wire Wire Line
	7500 4400 7900 4400
Text Label 7900 4400 2    50   ~ 0
MIDI_UART
$Comp
L Regulator_Linear:L7805 U3
U 1 1 5D4991E2
P 8250 2600
F 0 "U3" H 8250 2842 50  0000 C CNN
F 1 "L7805" H 8250 2751 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 8275 2450 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 8250 2550 50  0001 C CNN
	1    8250 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D4992FC
P 7750 2750
F 0 "C2" H 7865 2796 50  0000 L CNN
F 1 "10u" H 7865 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7788 2600 50  0001 C CNN
F 3 "~" H 7750 2750 50  0001 C CNN
	1    7750 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0109
U 1 1 5D499901
P 7750 2400
F 0 "#PWR0109" H 7750 2250 50  0001 C CNN
F 1 "+12V" H 7765 2573 50  0000 C CNN
F 2 "" H 7750 2400 50  0001 C CNN
F 3 "" H 7750 2400 50  0001 C CNN
	1    7750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2400 7750 2600
Wire Wire Line
	7750 2600 7950 2600
Connection ~ 7750 2600
$Comp
L power:GND #PWR0110
U 1 1 5D49A3B2
P 7750 3000
F 0 "#PWR0110" H 7750 2750 50  0001 C CNN
F 1 "GND" H 7755 2827 50  0000 C CNN
F 2 "" H 7750 3000 50  0001 C CNN
F 3 "" H 7750 3000 50  0001 C CNN
	1    7750 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3000 7750 2900
$Comp
L power:GND #PWR0111
U 1 1 5D49AE57
P 8250 3000
F 0 "#PWR0111" H 8250 2750 50  0001 C CNN
F 1 "GND" H 8255 2827 50  0000 C CNN
F 2 "" H 8250 3000 50  0001 C CNN
F 3 "" H 8250 3000 50  0001 C CNN
	1    8250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2900 8250 3000
$Comp
L Device:C C3
U 1 1 5D49CFF7
P 8750 2750
F 0 "C3" H 8865 2796 50  0000 L CNN
F 1 "10u" H 8865 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8788 2600 50  0001 C CNN
F 3 "~" H 8750 2750 50  0001 C CNN
	1    8750 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2400 8750 2600
$Comp
L power:GND #PWR0112
U 1 1 5D49D006
P 8750 3000
F 0 "#PWR0112" H 8750 2750 50  0001 C CNN
F 1 "GND" H 8755 2827 50  0000 C CNN
F 2 "" H 8750 3000 50  0001 C CNN
F 3 "" H 8750 3000 50  0001 C CNN
	1    8750 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3000 8750 2900
Wire Wire Line
	8550 2600 8750 2600
Connection ~ 8750 2600
$Comp
L power:+5V #PWR0113
U 1 1 5D49F6A6
P 8750 2400
F 0 "#PWR0113" H 8750 2250 50  0001 C CNN
F 1 "+5V" H 8765 2573 50  0000 C CNN
F 2 "" H 8750 2400 50  0001 C CNN
F 3 "" H 8750 2400 50  0001 C CNN
	1    8750 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J5
U 1 1 5D4A6DC9
P 6700 2750
F 0 "J5" H 6757 3067 50  0000 C CNN
F 1 "BARREL_JACK_12V" H 6757 2976 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 6750 2710 50  0001 C CNN
F 3 "~" H 6750 2710 50  0001 C CNN
	1    6700 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5D4A7897
P 7150 2850
F 0 "#PWR0114" H 7150 2600 50  0001 C CNN
F 1 "GND" V 7155 2722 50  0000 R CNN
F 2 "" H 7150 2850 50  0001 C CNN
F 3 "" H 7150 2850 50  0001 C CNN
	1    7150 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7150 2850 7000 2850
$Comp
L power:+12V #PWR0115
U 1 1 5D4A8711
P 7200 2600
F 0 "#PWR0115" H 7200 2450 50  0001 C CNN
F 1 "+12V" H 7215 2773 50  0000 C CNN
F 2 "" H 7200 2600 50  0001 C CNN
F 3 "" H 7200 2600 50  0001 C CNN
	1    7200 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2600 7200 2650
Wire Wire Line
	7200 2650 7000 2650
Wire Notes Line
	6050 3400 9050 3400
Wire Notes Line
	9050 3400 9050 1900
Wire Notes Line
	9050 1900 6050 1900
Wire Notes Line
	6050 1900 6050 3400
Text Notes 6100 2100 0    100  ~ 20
DC IN + VREG
Wire Notes Line
	6050 3700 6050 5200
Wire Notes Line
	6050 5200 8050 5200
Wire Notes Line
	8050 5200 8050 3700
Wire Notes Line
	8050 3700 6050 3700
Text Notes 6150 3900 0    100  ~ 20
RJ12
Wire Notes Line
	5700 3300 5700 1900
Wire Notes Line
	5700 1900 2600 1900
Wire Notes Line
	2600 1900 2600 3300
Wire Notes Line
	2600 3300 5700 3300
Text Notes 2650 2100 0    100  ~ 20
MIDI IN
Wire Notes Line
	2600 5200 5700 5200
Wire Notes Line
	5700 5200 5700 3700
Wire Notes Line
	5700 3700 2600 3700
Text Notes 2700 3900 0    100  ~ 20
MIDI PASSTHROUGH
Wire Notes Line
	2600 5200 2600 3700
Text Notes 7050 6800 0    100  ~ 20
MIDI to MIDI-Over-RJ12
Text Notes 7050 7000 0    100  ~ 20
Willem Hillier  rev1  19.213
$Comp
L CUSTOM_IC:74HCT2G04,_74HC2G04 U2
U 3 1 5D511C3B
P 5450 4450
F 0 "U2" H 5100 4900 50  0000 L CNN
F 1 "74HC2G04" H 5050 4800 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5450 4450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5450 4450 50  0001 C CNN
	3    5450 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5D512BB0
P 4750 4150
F 0 "C1" H 4842 4196 50  0000 L CNN
F 1 "1u" H 4842 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4750 4150 50  0001 C CNN
F 3 "~" H 4750 4150 50  0001 C CNN
	1    4750 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 5D51301F
P 4750 4000
F 0 "#PWR0118" H 4750 3850 50  0001 C CNN
F 1 "+5V" H 4765 4173 50  0000 C CNN
F 2 "" H 4750 4000 50  0001 C CNN
F 3 "" H 4750 4000 50  0001 C CNN
	1    4750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4000 4750 4050
$Comp
L power:GND #PWR0119
U 1 1 5D514119
P 4750 4300
F 0 "#PWR0119" H 4750 4050 50  0001 C CNN
F 1 "GND" H 4755 4127 50  0000 C CNN
F 2 "" H 4750 4300 50  0001 C CNN
F 3 "" H 4750 4300 50  0001 C CNN
	1    4750 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4300 4750 4250
$Comp
L power:GND #PWR0120
U 1 1 5D5157BC
P 5450 4950
F 0 "#PWR0120" H 5450 4700 50  0001 C CNN
F 1 "GND" H 5455 4777 50  0000 C CNN
F 2 "" H 5450 4950 50  0001 C CNN
F 3 "" H 5450 4950 50  0001 C CNN
	1    5450 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0121
U 1 1 5D51605C
P 5450 3950
F 0 "#PWR0121" H 5450 3800 50  0001 C CNN
F 1 "+5V" H 5465 4123 50  0000 C CNN
F 2 "" H 5450 3950 50  0001 C CNN
F 3 "" H 5450 3950 50  0001 C CNN
	1    5450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2750 7000 2850
Connection ~ 7000 2850
$EndSCHEMATC
