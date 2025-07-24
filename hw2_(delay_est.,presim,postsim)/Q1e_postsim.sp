nor gate
.protect 
.lib 'cic018.l' TT                               $�s�X�s�{�� TT �N��зǻs�{���]Typical-Typical�^ FF(fast-fast) SS(slow-slow)
.unprotect
.temp=25                                         $�]�w�ū�
.option
+post                                            $output�ɤ~�|��waveform�ɥX��
+runlvl=6                                        $�W�[��ǫסArunlvl�q0-6�V�ӶV��ǡAacout=0�ϱo�������|��Xac���G
+captable                                        $��ܨC�Ӹ`�I���q�e��
+ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1


.include 'nor.pex.spi'                              $�s�iinv.spi�A�p�G�n����
.PARAM VDD = 1.8                                  $���w�@�ӰѼƭ�



****************** cicuit 1 *************************
X1 VDD OUT GND A B nor                          $�Y�n�ޤJspi�A�W�r�]��X�Ʀr �᭱���I���Ƿӵ�spi�ɤ������ǩ� �̫�A�[�Wcell name

CL out 0 2p
**************** source definition ******************
vdd vdd 0 'VDD'                                  $sourcename node1 node2 value
*VA A 0 0
*VB B 0 0
VA A 0 PULSE(0 VDD 0.5u 0.1n 0.1n 0.5u 1u)         $(V1 V2 t_delay�����}�l��j�h�[���߽Ķi�� t_rise�W�ɮɶ� t_fall p_width����V2�ɶ� period�g��)
VB B 0 PULSE(0 VDD 0.5u 0.1n 0.1n 0.5u 1u)

***************** analysis **************************
.op                                              $�i��operation point���R�A��l���A�U�`�I���q���Mmos���u�@���A


****************dc analysis *************************

.tran 0.1p 4u
.meas tran t_phl trig v(A) val=0.5*VDD rise=2 targ v(out) val=0.5*VDD fall=2 
.meas tran t_plh trig v(A) val=0.5*VDD fall=2 targ v(out) val=0.5*VDD rise=2 
.meas tran t_r trig v(out) val=0.1*VDD rise=2 targ v(out) val=0.9*VDD rise=2 
.meas tran t_f trig v(out) val=0.9*VDD fall=2 targ v(out) val=0.1*VDD fall=2 


.end

