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


.PARAM VDD = 1.8                                  $���w�@�ӰѼƭ�
.PARAM Ln = 0.18u
.PARAM Wn1 = 0.5u
.PARAM Lp = 0.18u
.PARAM Wp1 = 1.5u
.PARAM Wn2 = 1.68u
.PARAM Wp2 = 5.04u
.PARAM Wn3 = 5.64u
.PARAM Wp3 = 16.92u
.PARAM Wn4 = 18.95u
.PARAM Wp4 = 56.84u



****************** cicuit 1 *************************
*MX  D    G    S   B  model 
M10 vin2 vin1 VSS VSS N_18 W=Wn1 L=Ln m=1
M11 vin2 vin1 VDD VDD P_18 W=Wp1 L=Lp m=1
M20 vin3 vin2 VSS VSS N_18 W=Wn2 L=Ln m=1
M21 vin3 vin2 VDD VDD P_18 W=Wp2 L=Lp m=1
M30 vin4 vin3 VSS VSS N_18 W=Wn3 L=Ln m=1
M31 vin4 vin3 VDD VDD P_18 W=Wp3 L=Lp m=1
M40 vout vin4 VSS VSS N_18 W=Wn4 L=Ln m=1
M41 vout vin4 VDD VDD P_18 W=Wp4 L=Lp m=1
CL vout VSS 0.5p
**************** source definition ******************
vdd vdd 0 VDD                                  $sourcename node1 node2 value
vss vss 0 0
vin vin1 0 PULSE(0 VDD 0.1u 0.1n 0.1n 0.1u 0.2u)         $(V1 V2 t_delay�����}�l��j�h�[���߽Ķi�� t_rise�W�ɮɶ� t_fall p_width����V2�ɶ� period�g��)

***************** analysis **************************
.op                                              $�i��operation point���R�A��l���A�U�`�I���q���Mmos���u�@���A





.tran 0.01p 0.8u
.probe tran V(vout)
.meas tran t_pdf trig v(vin1) val=0.5*VDD fall=2 targ v(vout) val=0.5*VDD fall=2 
.meas tran t_pdr trig v(vin1) val=0.5*VDD rise=2 targ v(vout) val=0.5*VDD rise=2 
.meas tran t_r trig v(vout) val=0.1*VDD rise=2 targ v(vout) val=0.9*VDD rise=2 
.meas tran t_f trig v(vout) val=0.9*VDD fall=2 targ v(vout) val=0.1*VDD fall=2 




.end
