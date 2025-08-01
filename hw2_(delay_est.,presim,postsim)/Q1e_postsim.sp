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


.include 'nor.pex.spi'                              $叫進inv.spi，如果要的話
.PARAM VDD = 1.8                                  $指定一個參數值



****************** cicuit 1 *************************
X1 VDD OUT GND A B nor                          $若要引入spi，名字設成X數字 後面接點順序照著spi檔中的順序放 最後再加上cell name

CL out 0 2p
**************** source definition ******************
vdd vdd 0 'VDD'                                  $sourcename node1 node2 value
*VA A 0 0
*VB B 0 0
VA A 0 PULSE(0 VDD 0.5u 0.1n 0.1n 0.5u 1u)         $(V1 V2 t_delay模擬開始後隔多久有脈衝進來 t_rise上升時間 t_fall p_width持續V2時間 period週期)
VB B 0 PULSE(0 VDD 0.5u 0.1n 0.1n 0.5u 1u)

***************** analysis **************************
.op                                              $進行operation point分析，初始狀態各節點的電壓和mos的工作狀態


****************dc analysis *************************

.tran 0.1p 4u
.meas tran t_phl trig v(A) val=0.5*VDD rise=2 targ v(out) val=0.5*VDD fall=2 
.meas tran t_plh trig v(A) val=0.5*VDD fall=2 targ v(out) val=0.5*VDD rise=2 
.meas tran t_r trig v(out) val=0.1*VDD rise=2 targ v(out) val=0.9*VDD rise=2 
.meas tran t_f trig v(out) val=0.9*VDD fall=2 targ v(out) val=0.1*VDD fall=2 


.end

