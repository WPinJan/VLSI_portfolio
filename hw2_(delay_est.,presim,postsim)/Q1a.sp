nor gate
.protect 
.lib 'cic018.l' TT                               $叫出製程檔 TT 代表標準製程角（Typical-Typical） FF(fast-fast) SS(slow-slow)
.unprotect
.temp=25                                         $設定溫度
.option
+post                                            $output時才會有waveform檔出來
+runlvl=6                                        $增加精準度，runlvl從0-6越來越精準，acout=0使得模擬不會輸出ac結果
+captable                                        $顯示每個節點的電容值
+ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1



.PARAM VDD = 1.8                                  $指定一個參數值
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

VIN AB 0 0.9                                     $把node A B都改成AB

***************** analysis **************************
.op                                              $進行operation point分析，初始狀態各節點的電壓和mos的工作狀態


****************dc analysis *************************
*.dc vin 0 1.8 0.1m                                $.dc 要掃的parameter 開始掃的值 結束的值 step size
.dc Wp 25u 29u 0.01u

.print DC V(out)
.probe dc V(out)

.end

