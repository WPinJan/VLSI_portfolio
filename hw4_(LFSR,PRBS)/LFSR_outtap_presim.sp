**** hw4 ***********************************************
.protect
.lib 'cic018.l' TT
.unprotect
.option
+ delmax = 1E-12
+ measform = 2
+ measdgt = 6
+ post                                            $output�ɤ~�|��waveform�ɥX��
+ runlvl=6                                        $�W�[��ǫסArunlvl�q0-6�V�ӶV��ǡAacout=0�ϱo�������|��Xac���G
+ captable                                        $��ܨC�Ӹ`�I���q�e��
+ ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1
.temp 25

**** parameters **************************************************
.param VDD = 1.8
.param t_su = 34p
.param t_hold = 1n
.param freq = 25e8
.param t_period = 1/freq
.param t_half = (t_period/2 - 10p)

.param t = 2n
.param t1 = (t + 10p)
.param t2 = (t + t_period*262)

.param t3 = (t + t_period - t_su)
.param t4 = (t3 +55p)
.param t41 = (t4 +100p)

.param t5 = (t + t_period + t_hold)
.param t6 = (t5 +10p)

**** Voltage sources ***********************************************************
VDD VDD VSS DC = VDD
VSS VSS GND DC = 0

**** Circuit ***************************************************************
.include 'Fib_LFSR.spi'
*X1 CLK bit0 bit1 bit2 bit3 bit4 bit5 bit6 bit7 VDD VSS reset D1 / Fib_LFSR

X2 CLK D Q Qbar VDD VSS reset / DFF_dynamic

**** Input Signals *************************************************************
VCLK CLK 0 PULSE(0 VDD t 10p 10p t_half t_period)                            $(V1 V2 t_delay�����}�l��j�h�[���߽Ķi�� t_rise�W�ɮɶ� t_fall p_width����V2�ɶ� period�g��)

*Vreset reset 0 PWL 0 0 t 0 t1 VDD t2 VDD                                   $ for reset

**** finding setup/hold/c-to-q *********
Vreset reset 0 PWL 0 VDD t2 VDD
VD D 0 PWL 0 0 t3 0 t4 1 t2 1
*VD D 0 PWL 0 VDD t3 VDD t4 0 t2 0
*VD D 0 PWL 0 0 t3 0 t4 VDD t5 VDD t6 0 t2 0
*VD D 0 PWL 0 VDD t3 VDD t4 0 t5 0 t6 VDD t2 VDD
 
**** Simulation ****************************************************************
*.tran 2p t2
*.tran 2p t2 sweep freq 1e8 8e8 1e8                                        $23�i�A25
.tran 2p 5n sweep t_su 30p 130p 10p                                        $0p / 34p
*.tran 2p 5n sweep t_hold 150p 170p 1p                                        $23p / 34p
.op

**** Corner ********************************************************************
*.alter
*.lib 'cic018.l' FF            $23�i�A28�i�A30

*.alter
*.lib 'cic018.l' SS            $14���i�A8

*.alter
*.lib 'cic018.l' FS            $16

*.alter
*.lib 'cic018.l' SF            $14���i�A12

.end
