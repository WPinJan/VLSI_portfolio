**** EE5250 VLSI Midterm Project ***********************************************
**** 2024/10/31 update *********************************************************
.protect
.lib 'cic018.l' TT
.temp 25
.unprotect
.include 'Data.txt'
.option
+ captab
+ post
+ delmax = 1E-12
+ measform = 2
+ measdgt = 6

**** Sub-circuit of input buffer ***********************************************
.subckt in_buff VDD VSS in out
Mp1 n0 in VDD VDD P_18 w = 1.5u l = 0.18u m = 1
Mp2 out n0 VDD VDD P_18 w = 1.5u l = 0.18u m = 1
Mn1 n0 in VSS VSS n_18 w = 0.5u l = 0.18u m = 1
Mn2 out n0 VSS VSS n_18 w = 0.5u l = 0.18u m = 1
.ends

**** Voltage sources ***********************************************************
VDD VDD VSS DC = 'vdd'
VSS VSS GND DC = 0

**** TBC Circuit ***************************************************************
XTBC VDD VSS T<0> T<1> T<2> T<3> T<4> T<5> T<6> T<7> T<8> T<9> T<10> T<11> T<12>
+ T<13> T<14> B<0> B<1> B<2> B<3> / TBC

**** Input Signals *************************************************************
Vin<0> in<0> VSS PWL 0 0 15n 0 15.1n 'vdd' 450n 'vdd' 450.1n 0 465n 0
Vin<1> in<1> VSS PWL 0 0 30n 0 30.1n 'vdd' 435n 'vdd' 435.1n 0 465n 0
Vin<2> in<2> VSS PWL 0 0 45n 0 45.1n 'vdd' 420n 'vdd' 420.1n 0 465n 0
Vin<3> in<3> VSS PWL 0 0 60n 0 60.1n 'vdd' 405n 'vdd' 405.1n 0 465n 0
Vin<4> in<4> VSS PWL 0 0 75n 0 75.1n 'vdd' 390n 'vdd' 390.1n 0 465n 0
Vin<5> in<5> VSS PWL 0 0 90n 0 90.1n 'vdd' 375n 'vdd' 375.1n 0 465n 0
Vin<6> in<6> VSS PWL 0 0 105n 0 105.1n 'vdd' 360n 'vdd' 360.1n 0 465n 0
Vin<7> in<7> VSS PWL 0 0 120n 0 120.1n 'vdd' 345n 'vdd' 345.1n 0 465n 0
Vin<8> in<8> VSS PWL 0 0 135n 0 135.1n 'vdd' 330n 'vdd' 330.1n 0 465n 0
Vin<9> in<9> VSS PWL 0 0 150n 0 150.1n 'vdd' 315n 'vdd' 315.1n 0 465n 0
Vin<10> in<10> VSS PWL 0 0 165n 0 165.1n 'vdd' 300n 'vdd' 300.1n 0 465n 0
Vin<11> in<11> VSS PWL 0 0 180n 0 180.1n 'vdd' 285n 'vdd' 285.1n 0 465n 0
Vin<12> in<12> VSS PWL 0 0 195n 0 195.1n 'vdd' 270n 'vdd' 270.1n 0 465n 0
Vin<13> in<13> VSS PWL 0 0 210n 0 210.1n 'vdd' 255n 'vdd' 255.1n 0 465n 0
Vin<14> in<14> VSS PWL 0 0 225n 0 225.1n 'vdd' 240n 'vdd' 240.1n 0 465n 0

**** Input Buffer & Output Loading *********************************************
X0 VDD VSS in<0> T<0> in_buff
X1 VDD VSS in<1> T<1> in_buff
X2 VDD VSS in<2> T<2> in_buff
X3 VDD VSS in<3> T<3> in_buff
X4 VDD VSS in<4> T<4> in_buff
X5 VDD VSS in<5> T<5> in_buff
X6 VDD VSS in<6> T<6> in_buff
X7 VDD VSS in<7> T<7> in_buff
X8 VDD VSS in<8> T<8> in_buff
X9 VDD VSS in<9> T<9> in_buff
X10 VDD VSS in<10> T<10> in_buff
X11 VDD VSS in<11> T<11> in_buff
X12 VDD VSS in<12> T<12> in_buff
X13 VDD VSS in<13> T<13> in_buff
X14 VDD VSS in<14> T<14> in_buff
C0 B<0> VSS 1.5p
C1 B<1> VSS 1.5p
C2 B<2> VSS 1.5p
C3 B<3> VSS 1.5p

**** Simulation ****************************************************************
.op
.tran 10p 465n

**** Probe these signals only **************************************************
.probe 
+ V(VDD) V(VSS) V(in<0>) V(in<1>) V(in<2>) V(in<3>) V(in<4>) V(in<5>) V(in<6>) 
+ V(in<7>) V(in<8>) V(in<9>) V(in<10>) V(in<11>) V(in<12>) V(in<13>) V(in<14>)
+ V(T<0>) V(T<1>) V(T<2>) V(T<3>) V(T<4>) V(T<5>) V(T<6>) V(T<7>) V(T<8>) V(T<9>) 
+ V(T<10>) V(T<11>) V(T<12>) V(T<13>) V(T<14>) V(B<0>) V(B<1>) V(B<2>) V(B<3>)

**** Input Transition Edge Measurement *****************************************
.meas tran in0_rise WHEN V(in<0>)='0.5*vdd' rise=1
.meas tran in1_rise WHEN V(in<1>)='0.5*vdd' rise=1
.meas tran in2_rise WHEN V(in<2>)='0.5*vdd' rise=1
.meas tran in3_rise WHEN V(in<3>)='0.5*vdd' rise=1
.meas tran in4_rise WHEN V(in<4>)='0.5*vdd' rise=1
.meas tran in5_rise WHEN V(in<5>)='0.5*vdd' rise=1
.meas tran in6_rise WHEN V(in<6>)='0.5*vdd' rise=1
.meas tran in7_rise WHEN V(in<7>)='0.5*vdd' rise=1
.meas tran in8_rise WHEN V(in<8>)='0.5*vdd' rise=1
.meas tran in9_rise WHEN V(in<9>)='0.5*vdd' rise=1
.meas tran in10_rise WHEN V(in<10>)='0.5*vdd' rise=1
.meas tran in11_rise WHEN V(in<11>)='0.5*vdd' rise=1
.meas tran in12_rise WHEN V(in<12>)='0.5*vdd' rise=1
.meas tran in13_rise WHEN V(in<13>)='0.5*vdd' rise=1
.meas tran in14_rise WHEN V(in<14>)='0.5*vdd' rise=1
.meas tran in0_fall WHEN V(in<0>)='0.5*vdd' fall=1
.meas tran in1_fall WHEN V(in<1>)='0.5*vdd' fall=1
.meas tran in2_fall WHEN V(in<2>)='0.5*vdd' fall=1
.meas tran in3_fall WHEN V(in<3>)='0.5*vdd' fall=1
.meas tran in4_fall WHEN V(in<4>)='0.5*vdd' fall=1
.meas tran in5_fall WHEN V(in<5>)='0.5*vdd' fall=1
.meas tran in6_fall WHEN V(in<6>)='0.5*vdd' fall=1
.meas tran in7_fall WHEN V(in<7>)='0.5*vdd' fall=1
.meas tran in8_fall WHEN V(in<8>)='0.5*vdd' fall=1
.meas tran in9_fall WHEN V(in<9>)='0.5*vdd' fall=1
.meas tran in10_fall WHEN V(in<10>)='0.5*vdd' fall=1
.meas tran in11_fall WHEN V(in<11>)='0.5*vdd' fall=1
.meas tran in12_fall WHEN V(in<12>)='0.5*vdd' fall=1
.meas tran in13_fall WHEN V(in<13>)='0.5*vdd' fall=1
.meas tran in14_fall WHEN V(in<14>)='0.5*vdd' fall=1

**** Output Transition Edge Measurement ****************************************
.meas tran b0_rise1 WHEN V(B<0>)='0.5*vdd' rise=1
.meas tran b0_rise2 WHEN V(B<0>)='0.5*vdd' rise=2
.meas tran b0_rise3 WHEN V(B<0>)='0.5*vdd' rise=3
.meas tran b0_rise4 WHEN V(B<0>)='0.5*vdd' rise=4
.meas tran b0_rise5 WHEN V(B<0>)='0.5*vdd' rise=5
.meas tran b0_rise6 WHEN V(B<0>)='0.5*vdd' rise=6
.meas tran b0_rise7 WHEN V(B<0>)='0.5*vdd' rise=7
.meas tran b0_rise8 WHEN V(B<0>)='0.5*vdd' rise=8
.meas tran b0_rise9 WHEN V(B<0>)='0.5*vdd' rise=9
.meas tran b0_rise10 WHEN V(B<0>)='0.5*vdd' rise=10
.meas tran b0_rise11 WHEN V(B<0>)='0.5*vdd' rise=11
.meas tran b0_rise12 WHEN V(B<0>)='0.5*vdd' rise=12
.meas tran b0_rise13 WHEN V(B<0>)='0.5*vdd' rise=13
.meas tran b0_rise14 WHEN V(B<0>)='0.5*vdd' rise=14
.meas tran b0_rise15 WHEN V(B<0>)='0.5*vdd' rise=15

.meas tran b1_rise1 WHEN V(B<1>)='0.5*vdd' rise=1
.meas tran b1_rise2 WHEN V(B<1>)='0.5*vdd' rise=2
.meas tran b1_rise3 WHEN V(B<1>)='0.5*vdd' rise=3
.meas tran b1_rise4 WHEN V(B<1>)='0.5*vdd' rise=4
.meas tran b1_rise5 WHEN V(B<1>)='0.5*vdd' rise=5
.meas tran b1_rise6 WHEN V(B<1>)='0.5*vdd' rise=6
.meas tran b1_rise7 WHEN V(B<1>)='0.5*vdd' rise=7

.meas tran b2_rise1 WHEN V(B<2>)='0.5*vdd' rise=1
.meas tran b2_rise2 WHEN V(B<2>)='0.5*vdd' rise=2
.meas tran b2_rise3 WHEN V(B<2>)='0.5*vdd' rise=3

.meas tran b3_rise1 WHEN V(B<3>)='0.5*vdd' rise=1

.meas tran b0_fall1 WHEN V(B<0>)='0.5*vdd' fall=1
.meas tran b0_fall2 WHEN V(B<0>)='0.5*vdd' fall=2
.meas tran b0_fall3 WHEN V(B<0>)='0.5*vdd' fall=3
.meas tran b0_fall4 WHEN V(B<0>)='0.5*vdd' fall=4
.meas tran b0_fall5 WHEN V(B<0>)='0.5*vdd' fall=5
.meas tran b0_fall6 WHEN V(B<0>)='0.5*vdd' fall=6
.meas tran b0_fall7 WHEN V(B<0>)='0.5*vdd' fall=7
.meas tran b0_fall8 WHEN V(B<0>)='0.5*vdd' fall=8
.meas tran b0_fall9 WHEN V(B<0>)='0.5*vdd' fall=9
.meas tran b0_fall10 WHEN V(B<0>)='0.5*vdd' fall=10
.meas tran b0_fall11 WHEN V(B<0>)='0.5*vdd' fall=11
.meas tran b0_fall12 WHEN V(B<0>)='0.5*vdd' fall=12
.meas tran b0_fall13 WHEN V(B<0>)='0.5*vdd' fall=13
.meas tran b0_fall14 WHEN V(B<0>)='0.5*vdd' fall=14
.meas tran b0_fall15 WHEN V(B<0>)='0.5*vdd' fall=15

.meas tran b1_fall1 WHEN V(B<1>)='0.5*vdd' fall=1
.meas tran b1_fall2 WHEN V(B<1>)='0.5*vdd' fall=2
.meas tran b1_fall3 WHEN V(B<1>)='0.5*vdd' fall=3
.meas tran b1_fall4 WHEN V(B<1>)='0.5*vdd' fall=4
.meas tran b1_fall5 WHEN V(B<1>)='0.5*vdd' fall=5
.meas tran b1_fall6 WHEN V(B<1>)='0.5*vdd' fall=6
.meas tran b1_fall7 WHEN V(B<1>)='0.5*vdd' fall=7

.meas tran b2_fall1 WHEN V(B<2>)='0.5*vdd' fall=1
.meas tran b2_fall2 WHEN V(B<2>)='0.5*vdd' fall=2
.meas tran b2_fall3 WHEN V(B<2>)='0.5*vdd' fall=3

.meas tran b3_fall1 WHEN V(B<3>)='0.5*vdd' fall=1

**** Delay Calculation *********************************************************
.meas tran Delay_0_1   param='b0_rise1 - in0_rise'
.meas tran Delay_1_2   param='max(b0_fall1,b1_rise1) - in1_rise'
.meas tran Delay_2_3   param='b0_rise2 - in2_rise'
.meas tran Delay_3_4   param='max(max(b0_fall2,b1_fall1),b2_rise1) - in3_rise'
.meas tran Delay_4_5   param='b0_rise3 - in4_rise'
.meas tran Delay_5_6   param='max(b0_fall3,b1_rise2) - in5_rise'
.meas tran Delay_6_7   param='b0_rise4 - in6_rise'
.meas tran Delay_7_8   param='max(max(max(b0_fall4,b1_fall2),b2_fall1),b3_rise1) - in7_rise'
.meas tran Delay_8_9   param='b0_rise5 - in8_rise'
.meas tran Delay_9_10  param='max(b0_fall5,b1_rise3) - in9_rise'
.meas tran Delay_10_11 param='b0_rise6 - in10_rise'
.meas tran Delay_11_12 param='max(max(b0_fall6,b1_fall3),b2_rise2) - in11_rise'
.meas tran Delay_12_13 param='b0_rise7 - in12_rise'
.meas tran Delay_13_14 param='max(b0_fall7,b1_rise4) - in13_rise'
.meas tran Delay_14_15 param='b0_rise8 - in14_rise'
.meas tran Delay_15_14 param='b0_fall8 - in14_fall'
.meas tran Delay_14_13 param='max(b0_rise9,b1_fall4) - in13_fall'
.meas tran Delay_13_12 param='b0_fall9 - in12_fall'
.meas tran Delay_12_11 param='max(max(b0_rise10,b1_rise5),b2_fall2) - in11_fall'
.meas tran Delay_11_10 param='b0_fall10 - in10_fall'
.meas tran Delay_10_9  param='max(b0_rise11,b1_fall5) - in9_fall'
.meas tran Delay_9_8   param='b0_fall11 - in8_fall'
.meas tran Delay_8_7   param='max(max(max(b0_rise12,b1_rise6),b2_rise3),b3_fall1) - in7_fall'
.meas tran Delay_7_6   param='b0_fall12 - in6_fall'
.meas tran Delay_6_5   param='max(b0_rise13,b1_fall6) - in5_fall'
.meas tran Delay_5_4   param='b0_fall13 - in4_fall'
.meas tran Delay_4_3   param='max(max(b0_rise14,b1_rise7),b2_fall3) - in3_fall'
.meas tran Delay_3_2   param='b0_fall14 - in2_fall'
.meas tran Delay_2_1   param='max(b0_rise15,b1_fall7) - in1_fall'
.meas tran Delay_1_0   param='b0_fall15 - in0_fall'


**** Power Measurement *********************************************************
.meas tran Total_Power AVG PAR('(V(VDD)*I(VDD))') from = 0n   to = 465n
.meas tran Power_0_1   AVG PAR('(V(VDD)*I(VDD))') from = 15n  to = 30n
.meas tran Power_1_2   AVG PAR('(V(VDD)*I(VDD))') from = 30n  to = 45n
.meas tran Power_2_3   AVG PAR('(V(VDD)*I(VDD))') from = 45n  to = 60n
.meas tran Power_3_4   AVG PAR('(V(VDD)*I(VDD))') from = 60n  to = 75n
.meas tran Power_4_5   AVG PAR('(V(VDD)*I(VDD))') from = 75n  to = 90n
.meas tran Power_5_6   AVG PAR('(V(VDD)*I(VDD))') from = 90n  to = 105n
.meas tran Power_6_7   AVG PAR('(V(VDD)*I(VDD))') from = 105n to = 120n
.meas tran Power_7_8   AVG PAR('(V(VDD)*I(VDD))') from = 120n to = 135n
.meas tran Power_8_9   AVG PAR('(V(VDD)*I(VDD))') from = 135n to = 150n
.meas tran Power_9_10  AVG PAR('(V(VDD)*I(VDD))') from = 150n to = 165n
.meas tran Power_10_11 AVG PAR('(V(VDD)*I(VDD))') from = 165n to = 180n
.meas tran Power_11_12 AVG PAR('(V(VDD)*I(VDD))') from = 180n to = 195n
.meas tran Power_12_13 AVG PAR('(V(VDD)*I(VDD))') from = 195n to = 210n
.meas tran Power_13_14 AVG PAR('(V(VDD)*I(VDD))') from = 210n to = 225n
.meas tran Power_14_15 AVG PAR('(V(VDD)*I(VDD))') from = 225n to = 240n
.meas tran Power_15_14 AVG PAR('(V(VDD)*I(VDD))') from = 240n to = 255n
.meas tran Power_14_13 AVG PAR('(V(VDD)*I(VDD))') from = 255n to = 270n
.meas tran Power_13_12 AVG PAR('(V(VDD)*I(VDD))') from = 270n to = 285n
.meas tran Power_12_11 AVG PAR('(V(VDD)*I(VDD))') from = 285n to = 300n
.meas tran Power_11_10 AVG PAR('(V(VDD)*I(VDD))') from = 300n to = 315n
.meas tran Power_10_9  AVG PAR('(V(VDD)*I(VDD))') from = 315n to = 330n
.meas tran Power_9_8   AVG PAR('(V(VDD)*I(VDD))') from = 330n to = 345n
.meas tran Power_8_7   AVG PAR('(V(VDD)*I(VDD))') from = 345n to = 360n
.meas tran Power_7_6   AVG PAR('(V(VDD)*I(VDD))') from = 360n to = 375n
.meas tran Power_6_5   AVG PAR('(V(VDD)*I(VDD))') from = 375n to = 390n
.meas tran Power_5_4   AVG PAR('(V(VDD)*I(VDD))') from = 390n to = 405n
.meas tran Power_4_3   AVG PAR('(V(VDD)*I(VDD))') from = 405n to = 420n
.meas tran Power_3_2   AVG PAR('(V(VDD)*I(VDD))') from = 420n to = 435n
.meas tran Power_2_1   AVG PAR('(V(VDD)*I(VDD))') from = 435n to = 450n
.meas tran Power_1_0   AVG PAR('(V(VDD)*I(VDD))') from = 450n to = 465n

**** Corner ********************************************************************
.alter
.lib 'cic018.l' FF

.alter
.lib 'cic018.l' SS

.alter
.lib 'cic018.l' FS

.alter
.lib 'cic018.l' SF

.end
