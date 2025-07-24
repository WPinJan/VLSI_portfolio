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



.PARAM VDD = 1.8                                  $���w�@�ӰѼƭ�
.PARAM Ln = 0.2u
.PARAM Wn = 2u
.PARAM Lp = 0.2u
.PARAM Wp = 28.62u



****************** cicuit 1 *************************

**   D    G    S    b   model   ** 
M1  NODE  AB   VDD  VDD  P_18   W=Wp L=Lp
M2  OUT   AB   NODE VDD  P_18   W=Wp L=Lp
M3  OUT   AB    0    0   N_18   W=Wn L=Ln
M4  OUT   AB    0    0   N_18   W=Wn L=Ln

**************** source definition ******************
vdd vdd 0 'VDD'                                  $sourcename node1 node2 value

VIN AB 0 0.9                                     $��node A B���令AB

***************** analysis **************************
.op                                              $�i��operation point���R�A��l���A�U�`�I���q���Mmos���u�@���A


****************dc analysis *************************
*.dc vin 0 1.8 0.1m                                $.dc �n����parameter �}�l������ �������� step size
.dc Wp 25u 29u 0.01u

.print DC V(out)
.probe dc V(out)

.end

