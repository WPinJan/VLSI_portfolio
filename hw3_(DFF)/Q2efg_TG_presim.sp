**** hw3 ***********************************************
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
.param t_su = 95p                                 $ for rising
*.param t_su = 114p                                $ for falling
.param t_hold = 39p                              $ for rising
*.param t_hold = 0p                              $ for falling

.param t = 5n
.param t1 = (t + 10n - t_su)
.param t11 = (t + 10n - t_su + 50p)
.param t3 = (t + 10n + t_hold)
.param t31 = (t + 10n + t_hold + 50p)

**** Voltage sources ***********************************************************
VDD VDD VSS DC = VDD
VSS VSS GND DC = 0

**** DFFnand Circuit ***************************************************************
.include 'DFFTG.spi'
XDFFTG CLK D Q QM VDD VSS / DFFTG


**** Input Signals *************************************************************
VCLK CLK 0 PULSE(0 VDD t 50p 50p 4.95n 10n)                            $(V1 V2 t_delay�����}�l��j�h�[���߽Ķi�� t_rise�W�ɮɶ� t_fall p_width����V2�ɶ� period�g��)
VD D 0 PWL 0 0 t1 0 t11 VDD t3 VDD t31 0 25n 0                     $ for rising
*VD D 0 PWL 0 VDD t1 VDD t11 0 t3 0 t31 VDD 25n VDD                $ for falling

*VD D 0 PULSE(0 VDD t1 50p 50p 4.95n 10n)                             $ for rising (��setup time�~��)
*VD D 0 PULSE(VDD 0 t1 50p 50p 4.95n 10n)                             $ for falling (��setup time�~��)

**** Simulation ****************************************************************
*.tran 5p 25n sweep t_su 110p 120p 1p
*.tran 5p 25n sweep t_hold 0p 5p 1p
.tran 5p 25n
.op



.end
