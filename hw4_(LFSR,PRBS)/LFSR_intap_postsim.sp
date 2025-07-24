**** hw4 ***********************************************
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
.param freq = 40e8
.param t_period = 1/freq
.param t_half = (t_period/2 - 10p)

.param t = 2n
.param t2 = (t + 10p)
.param t3 = (t + t_period*262)


**** Voltage sources ***********************************************************
VDD VDD VSS DC = VDD
VSS VSS GND DC = 0

**** Circuit ***************************************************************
.include 'Gal_LFSR.pex.spi'
X1 bit7 RESET CLK VDD VSS bit6 bit0 bit1 bit3 bit4 bit2 bit5 / Gal_LFSR

**** Input Signals *************************************************************
VCLK CLK 0 PULSE(0 VDD t 10p 10p t_half t_period)                            $(V1 V2 t_delay模擬開始後隔多久有脈衝進來 t_rise上升時間 t_fall p_width持續V2時間 period週期)

Vreset reset 0 PWL 0 0 t 0 t2 VDD t3 VDD                                   $ for reset

 
**** Simulation ****************************************************************
*.tran 2p t3
.tran 3p t3 sweep freq 25e8 40e8 1e8                         $40
.op


**** Corner ********************************************************************
*.alter
*.lib 'cic018.l' FF                                 $36可，42可，46

*.alter
*.lib 'cic018.l' SS                                 $20不可，14

*.alter
*.lib 'cic018.l' FS                                 $30

*.alter
*.lib 'cic018.l' SF                                 $22

.end
