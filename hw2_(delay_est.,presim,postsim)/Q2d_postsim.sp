inverter chain
.protect 
.lib 'cic018.l' TT                               $�s�X�s�{�� TT �N��зǻs�{���]Typical-Typical�^ FF(fast-fast) SS(slow-slow)
.unprotect
.temp=25                                         $�]�w�ū�
.option
+post                                            $output�ɤ~�|��waveform�ɥX��
+runlvl=6                                        $�W�[��ǫסArunlvl�q0-6�V�ӶV��ǡAacout=0�ϱo�������|��Xac���G
+captable                                        $��ܨC�Ӹ`�I���q�e��
+ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1


.include 'invchain.pex.spi'                              $�s�iinv.spi�A�p�G�n����
.PARAM VDD = 1.8                                  $���w�@�ӰѼƭ�

****************** cicuit 1 *************************
X1 VIN VSS VOUT VDD invchain                          $�Y�n�ޤJspi�A�W�r�]��X�Ʀr �᭱���I���Ƿӵ�spi�ɤ������ǩ� �̫�A�[�Wcell name

CL vout VSS 0.5p
**************** source definition ******************
vdd vdd 0 VDD                                  $sourcename node1 node2 value
vss vss 0 0
vin vin 0 PULSE(0 VDD 0.1u 0.1n 0.1n 0.1u 0.2u)         $(V1 V2 t_delay�����}�l��j�h�[���߽Ķi�� t_rise�W�ɮɶ� t_fall p_width����V2�ɶ� period�g��)


.op


.tran 0.01p 0.8u
.probe tran V(vout)


.end
