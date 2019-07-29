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
L Interface_USB:CP2102N-A01-GQFN24 U?
U 1 1 5D3E0BCA
P 4700 3150
F 0 "U?" H 4350 4000 50  0000 C CNN
F 1 "CP2102N-A01-GQFN24" H 5250 4000 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 5150 2350 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/cp2102n-datasheet.pdf" H 4750 2100 50  0001 C CNN
	1    4700 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J?
U 1 1 5D3E163D
P 2750 3600
F 0 "J?" H 2807 4067 50  0000 C CNN
F 1 "USB_B" H 2807 3976 50  0000 C CNN
F 2 "" H 2900 3550 50  0001 C CNN
F 3 " ~" H 2900 3550 50  0001 C CNN
	1    2750 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:RJ12 J?
U 1 1 5D3E4111
P 6500 3550
F 0 "J?" H 6170 3646 50  0000 R CNN
F 1 "RJ12" H 6170 3555 50  0000 R CNN
F 2 "" V 6500 3575 50  0001 C CNN
F 3 "~" V 6500 3575 50  0001 C CNN
	1    6500 3550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D3EB7B5
P 5900 3750
F 0 "#PWR?" H 5900 3500 50  0001 C CNN
F 1 "GND" H 5905 3577 50  0000 C CNN
F 2 "" H 5900 3750 50  0001 C CNN
F 3 "" H 5900 3750 50  0001 C CNN
	1    5900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3750 5900 3550
Wire Wire Line
	5900 3550 6100 3550
$Comp
L Power_Protection:SP0503BAHT D?
U 1 1 5D3ECA93
P 2750 2300
F 0 "D?" V 2350 2200 50  0000 L CNN
F 1 "SP0503BAHT" V 2450 2000 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-143" H 2975 2250 50  0001 L CNN
F 3 "http://www.littelfuse.com/~/media/files/littelfuse/technical%20resources/documents/data%20sheets/sp05xxba.pdf" H 2875 2425 50  0001 C CNN
	1    2750 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5D3ED588
P 3950 2350
F 0 "R?" H 4018 2396 50  0000 L CNN
F 1 "4.7k" H 4018 2305 50  0000 L CNN
F 2 "" V 3990 2340 50  0001 C CNN
F 3 "~" H 3950 2350 50  0001 C CNN
	1    3950 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2500 3950 2550
Wire Wire Line
	3950 2550 4100 2550
$Comp
L power:VBUS #PWR?
U 1 1 5D3EDD7D
P 3950 2200
F 0 "#PWR?" H 3950 2050 50  0001 C CNN
F 1 "VBUS" H 3965 2373 50  0000 C CNN
F 2 "" H 3950 2200 50  0001 C CNN
F 3 "" H 3950 2200 50  0001 C CNN
	1    3950 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 5D3EE2A1
P 3150 3300
F 0 "#PWR?" H 3150 3150 50  0001 C CNN
F 1 "VBUS" H 3165 3473 50  0000 C CNN
F 2 "" H 3150 3300 50  0001 C CNN
F 3 "" H 3150 3300 50  0001 C CNN
	1    3150 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3300 3150 3400
Wire Wire Line
	3150 3400 3050 3400
Wire Wire Line
	4600 2250 4650 2250
$Comp
L power:VCC #PWR?
U 1 1 5D3EF7D0
P 4650 2200
F 0 "#PWR?" H 4650 2050 50  0001 C CNN
F 1 "VCC" H 4667 2373 50  0000 C CNN
F 2 "" H 4650 2200 50  0001 C CNN
F 3 "" H 4650 2200 50  0001 C CNN
	1    4650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2200 4650 2250
Connection ~ 4650 2250
Wire Wire Line
	4650 2250 4700 2250
Wire Wire Line
	5300 2950 5650 2950
Text Label 5650 2950 2    50   ~ 0
TXD
Text Label 5900 3450 0    50   ~ 0
TXD
Wire Wire Line
	5900 3450 6100 3450
$Comp
L Device:LED_Small D?
U 1 1 5D3F40DF
P 6200 2400
F 0 "D?" H 6200 2195 50  0000 C CNN
F 1 "LED" H 6200 2286 50  0000 C CNN
F 2 "" V 6200 2400 50  0001 C CNN
F 3 "~" V 6200 2400 50  0001 C CNN
	1    6200 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5D3F49BF
P 6450 2400
F 0 "R?" V 6245 2400 50  0000 C CNN
F 1 "1k" V 6336 2400 50  0000 C CNN
F 2 "" V 6490 2390 50  0001 C CNN
F 3 "~" H 6450 2400 50  0001 C CNN
	1    6450 2400
	0    1    1    0   
$EndComp
Text Label 6850 2400 2    50   ~ 0
TXD
Wire Wire Line
	6600 2400 6850 2400
$Comp
L power:VCC #PWR?
U 1 1 5D3F63D4
P 5950 2300
F 0 "#PWR?" H 5950 2150 50  0001 C CNN
F 1 "VCC" H 5967 2473 50  0000 C CNN
F 2 "" H 5950 2300 50  0001 C CNN
F 3 "" H 5950 2300 50  0001 C CNN
	1    5950 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2300 5950 2400
Wire Wire Line
	5950 2400 6100 2400
Text Notes 6950 2400 0    50   ~ 0
Data Indicator
Wire Wire Line
	3050 3600 3350 3600
Wire Wire Line
	3050 3700 3350 3700
Text Label 3350 3600 2    50   ~ 0
D+
Text Label 3350 3700 2    50   ~ 0
D-
Text Label 3950 3550 0    50   ~ 0
D+
Text Label 3950 3650 0    50   ~ 0
D-
$Comp
L power:VBUS #PWR?
U 1 1 5D400971
P 4100 3450
F 0 "#PWR?" H 4100 3300 50  0001 C CNN
F 1 "VBUS" V 4115 3577 50  0000 L CNN
F 2 "" H 4100 3450 50  0001 C CNN
F 3 "" H 4100 3450 50  0001 C CNN
	1    4100 3450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D40134A
P 4750 4100
F 0 "#PWR?" H 4750 3850 50  0001 C CNN
F 1 "GND" H 4755 3927 50  0000 C CNN
F 2 "" H 4750 4100 50  0001 C CNN
F 3 "" H 4750 4100 50  0001 C CNN
	1    4750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4050 4750 4050
Wire Wire Line
	4750 4050 4750 4100
Connection ~ 4750 4050
Wire Wire Line
	4750 4050 4800 4050
$Comp
L power:GND #PWR?
U 1 1 5D402267
P 2700 4050
F 0 "#PWR?" H 2700 3800 50  0001 C CNN
F 1 "GND" H 2705 3877 50  0000 C CNN
F 2 "" H 2700 4050 50  0001 C CNN
F 3 "" H 2700 4050 50  0001 C CNN
	1    2700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4000 2700 4000
Wire Wire Line
	2700 4000 2700 4050
Connection ~ 2700 4000
Wire Wire Line
	2700 4000 2750 4000
$Comp
L power:GND #PWR?
U 1 1 5D406CE4
P 2500 2450
F 0 "#PWR?" H 2500 2200 50  0001 C CNN
F 1 "GND" H 2505 2277 50  0000 C CNN
F 2 "" H 2500 2450 50  0001 C CNN
F 3 "" H 2500 2450 50  0001 C CNN
	1    2500 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2450 2500 2300
Wire Wire Line
	2500 2300 2550 2300
$Comp
L power:VBUS #PWR?
U 1 1 5D40E1A6
P 3050 2150
F 0 "#PWR?" H 3050 2000 50  0001 C CNN
F 1 "VBUS" H 3065 2323 50  0000 C CNN
F 2 "" H 3050 2150 50  0001 C CNN
F 3 "" H 3050 2150 50  0001 C CNN
	1    3050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2150 3050 2200
Wire Wire Line
	3050 2200 2950 2200
Wire Wire Line
	2950 2300 3200 2300
Wire Wire Line
	2950 2400 3200 2400
Text Label 3200 2300 2    50   ~ 0
D+
Text Label 3200 2400 2    50   ~ 0
D-
Wire Wire Line
	3950 3550 4100 3550
Wire Wire Line
	3950 3650 4100 3650
$Comp
L Device:C_Small C?
U 1 1 5D41929F
P 3650 3250
F 0 "C?" H 3742 3296 50  0000 L CNN
F 1 "0.1u" H 3742 3205 50  0000 L CNN
F 2 "" H 3650 3250 50  0001 C CNN
F 3 "~" H 3650 3250 50  0001 C CNN
	1    3650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3150 4100 3150
$Comp
L power:GND #PWR?
U 1 1 5D41B690
P 3650 3350
F 0 "#PWR?" H 3650 3100 50  0001 C CNN
F 1 "GND" H 3655 3177 50  0000 C CNN
F 2 "" H 3650 3350 50  0001 C CNN
F 3 "" H 3650 3350 50  0001 C CNN
	1    3650 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5D43E089
P 6200 2800
F 0 "D?" H 6200 2595 50  0000 C CNN
F 1 "LED" H 6200 2686 50  0000 C CNN
F 2 "" V 6200 2800 50  0001 C CNN
F 3 "~" V 6200 2800 50  0001 C CNN
	1    6200 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5D43E08F
P 6450 2800
F 0 "R?" V 6245 2800 50  0000 C CNN
F 1 "1k" V 6336 2800 50  0000 C CNN
F 2 "" V 6490 2790 50  0001 C CNN
F 3 "~" H 6450 2800 50  0001 C CNN
	1    6450 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 2700 5950 2800
Wire Wire Line
	5950 2800 6100 2800
Text Notes 6950 2800 0    50   ~ 0
USB power
$Comp
L power:VBUS #PWR?
U 1 1 5D43EADF
P 5950 2700
F 0 "#PWR?" H 5950 2550 50  0001 C CNN
F 1 "VBUS" H 5965 2873 50  0000 C CNN
F 2 "" H 5950 2700 50  0001 C CNN
F 3 "" H 5950 2700 50  0001 C CNN
	1    5950 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5D43F4AB
P 6650 2850
F 0 "#PWR?" H 6650 2600 50  0001 C CNN
F 1 "GND" H 6655 2677 50  0000 C CNN
F 2 "" H 6650 2850 50  0001 C CNN
F 3 "" H 6650 2850 50  0001 C CNN
	1    6650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2800 6650 2800
Wire Wire Line
	6650 2800 6650 2850
$EndSCHEMATC