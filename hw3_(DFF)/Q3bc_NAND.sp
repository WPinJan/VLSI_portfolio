**** hw3 ***********************************************
.protect
.lib 'cic018.l' TT
.unprotect
.option
+ delmax = 1E-12
+ measform = 2
+ measdgt = 6
+ post                                            $output時才會有waveform檔出來
+ runlvl=6                                        $增加精準度，runlvl從0-6越來越精準，acout=0使得模擬不會輸出ac結果
+ captable                                        $顯示每個節點的電容值
+ ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1
.temp 25


**** parameters **************************************************
.param VDD = 1.8
*.param t_su = 38p                                 $ for rising
.param t_su = 73p                                $ for falling
*.param t_hold = 105p                              $ for rising
.param t_hold = 32p                              $ for falling

.param t = 5n
.param t1 = (t + 10n - t_su)
.param t11 = (t + 10n - t_su + 50p)
.param t3 = (t + 10n + t_hold)
.param t31 = (t + 10n + t_hold + 50p)

**** Voltage sources ***********************************************************
VDD VDD VSS DC = VDD
VSS VSS GND DC = 0

**** Circuit ***************************************************************
*** for Q3(b) 
.include 'DFFnand2.spi'
XDFFnand2 CLK in D2 Q1 out QM1 QM2 Qbar1 Qbar2 VDD VSS / DFFnand2

*** for Q3(c) 
*.include 'DFFnand20.spi'
*XDFFnand1 CLK in Q1 QM1 Qbar1 A1 B1 clkinv1 VDD VSS / DFFnand
*XDFFnand2 CLK D2 out QM2 Qbar2 A2 B2 clkinv2 VDD VSS / DFFnand
*Vshort Q1 D2 0

**** Input Signals *************************************************************
VCLK CLK 0 PULSE(0 VDD t 50p 50p 4.95n 10n)                            $(V1 V2 t_delay模擬開始後隔多久有脈衝進來 t_rise上升時間 t_fall p_width持續V2時間 period週期)
*VD in 0 PWL 0 0 t1 0 t11 VDD t3 VDD t31 0 25n 0                     $ for rising
VD in 0 PWL 0 VDD t1 VDD t11 0 t3 0 t31 VDD 25n VDD                $ for falling

*VD in 0 PULSE(0 VDD t1 50p 50p 4.95n 10n)                             $ for rising (測setup time才用)
*VD in 0 PULSE(VDD 0 t1 50p 50p 4.95n 10n)                             $ for falling (測setup time才用)
 
**** Simulation ****************************************************************
*.tran 5p 25n sweep t_su 38p 5038p 100p                             $掃setup time
*.tran 5p 15n sweep t_hold 25p 34p 1p                               $掃hold time
.tran 5p 35n
.op



.end
