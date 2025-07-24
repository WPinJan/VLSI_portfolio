**** EE5250 VLSI Final Project ***********************************************
.protect
.lib 'cic018.l' FF
.temp 25
.unprotect
.include 'Data.txt'
.option
+ probe
+ captab
+ post
+ delmax = 1E-12
+ measform = 2
+ measdgt = 6

**** Voltage sources ***********************************************************
VDD VDD VSS DC = 'vdd'
VSS VSS GND DC = 0

**** RIS Circuit ***************************************************************
XTBC CH0 CH1 CH2 CH3 CLK M0 M1 RST VDD VSS / RIS

**** Input Signals *************************************************************
VCLK  CLK  0 pulse(0v vdd 0 10p 10p '0.5/fclk-10p' '1/fclk')
VRSTb RSTb 0 pulse(0v vdd '1/fclk+td_in' 10p 10p '1023/fclk-10p' '1024/fclk')
ERST  RST  0 PWL(1) RSTb 0 0 vdd vdd 0
VM0 M0 0 pulse(VDD 0 '1025/fclk+td_in' 10p 10p '1024/fclk-10p' '2048/fclk')
VM1 M1 0 pulse(VDD 0 '2049/fclk+td_in' 10p 10p '2048/fclk-10p' '4096/fclk')

**** Simulation ****************************************************************
.tran 1p '4097/fclk'

**** Probe these signals only **************************************************
.probe V(CLK) V(RST) V(M1) V(M0) V(CH3) V(CH2) V(CH1) V(CH0)

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
