nor gate
.protect 
.lib 'cic018.l' FF                               $�s�X�s�{�� TT �N��зǻs�{���]Typical-Typical�^ FF(fast-fast) SS(slow-slow)
.unprotect
.temp=25                                         $�]�w�ū�
.option
+post                                            $output�ɤ~�|��waveform�ɥX��
+runlvl=6                                        $�W�[��ǫסArunlvl�q0-6�V�ӶV��ǡAacout=0�ϱo�������|��Xac���G
+captable                                        $��ܨC�Ӹ`�I���q�e��
+ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1


.include 'nor.pex.spi'                              $�s�iinv.spi�A�p�G�n����
.PARAM VDD = 1.8                                  $���w�@�ӰѼƭ�
.PARAM Ln = 0.2u
.PARAM Wn = 2u
.PARAM Lp = 0.2u
.PARAM Wp = 28.62u



****************** cicuit 1 *************************
X1 VDD OUT GND A B nor                          $�Y�n�ޤJspi�A�W�r�]��X�Ʀr �᭱���I���Ƿӵ�spi�ɤ������ǩ� �̫�A�[�Wcell name
**   D    G    S    b   model   ** 
*M1  NODE  A   VDD  VDD  P_18   W=Wp L=Lp
*M2  OUT   B   NODE VDD  P_18   W=Wp L=Lp
*M3  OUT   A    0    0   N_18   W=Wn L=Ln
*M4  OUT   B    0    0   N_18   W=Wn L=Ln
*M1  NODE  AB   VDD  VDD  P_18   W=Wp L=Lp
*M2  OUT   AB   NODE VDD  P_18   W=Wp L=Lp
*M3  OUT   AB    0    0   N_18   W=Wn L=Ln
*M4  OUT   AB    0    0   N_18   W=Wn L=Ln
CL out 0 2p
**************** source definition ******************
vdd vdd 0 'VDD'                                  $sourcename node1 node2 value
*VA A 0 0
*VB B 0 0
VA A 0 PULSE(0 VDD 0.5u 0.1n 0.1n 0.5u 1u)         $(V1 V2 t_delay�����}�l��j�h�[���߽Ķi�� t_rise�W�ɮɶ� t_fall p_width����V2�ɶ� period�g��)
VB B 0 PULSE(0 VDD 0.5u 0.1n 0.1n 0.5u 1u)
*Vin AB 0 PULSE(0 VDD 0.5u 0.1n 0.1n 0.5u 1u)
*VIN AB 0 0.9                                     $��node A B���令AB

***************** analysis **************************
.op                                              $�i��operation point���R�A��l���A�U�`�I���q���Mmos���u�@���A


****************dc analysis *************************
*.dc vin 0 1.8 0.1m                                $.dc �n����parameter �}�l������ �������� step size
*.dc Wp 20u 30u 0.01u

*.print DC V(out)
*.probe dc V(out)

.tran 0.1p 4u
.meas tran t_phl trig v(A) val=0.5*VDD rise=2 targ v(out) val=0.5*VDD fall=2 
.meas tran t_plh trig v(A) val=0.5*VDD fall=2 targ v(out) val=0.5*VDD rise=2 
.meas tran t_r trig v(out) val=0.1*VDD rise=2 targ v(out) val=0.9*VDD rise=2 
.meas tran t_f trig v(out) val=0.9*VDD fall=2 targ v(out) val=0.1*VDD fall=2 


.end

