**** EE5250 VLSI Final Project ***********************************************
.protect
.lib 'cic018.l' TT
.temp 25
.unprotect
.include 'Data.txt'
.option
+ probe
+ post
+ measform = 2
+ measdgt = 6

**** Voltage sources ***********************************************************
VDD VDD VSS DC = 'vdd'
VSS VSS GND DC = 0

**** RIS Circuit ***************************************************************
XTBC CLK RST VDD VSS M<1> M<0> Ch<3> Ch<2> Ch<1> Ch<0> / RIS

**** Input Signals *************************************************************
VCLK  CLK  0 pulse(0v vdd 0 50p 50p '0.5/fclk-50p' '1/fclk')
VRSTb RSTb 0 pulse(0v vdd '1/fclk+td_in' 50p 50p '1023/fclk-50p' '1024/fclk')
ERST  RST  0 PWL(1) RSTb 0 0 vdd vdd 0
VM<0> M<0> 0 pulse(0v vdd '1025/fclk+td_in' 50p 50p '1024/fclk-50p' '2048/fclk')
VM<1> M<1> 0 pulse(0v vdd '2049/fclk+td_in' 50p 50p '2048/fclk-50p' '4096/fclk')

**** Simulation ****************************************************************
.tran 10p '4097/fclk'

**** Probe these signals only **************************************************
.probe V(CLK) V(RST) V(M<1>) V(M<0>) V(Ch<3>) V(Ch<2>) V(Ch<1>) V(Ch<0>)

**** Power Measurement *********************************************************
.meas tran Power AVG PAR('(V(VDD)*I(VDD))') from = '1/fclk' to = '4097/fclk'

**** Corner ********************************************************************
*.alter
*.lib 'cic018.l' FF

*.alter
*.lib 'cic018.l' SS

*.alter
*.lib 'cic018.l' FS

*.alter
*.lib 'cic018.l' SF

.end
