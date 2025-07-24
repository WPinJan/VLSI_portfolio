inverter                                         $第一行不會讀取 *開頭的整行忽略 $之後的全部忽略
.protect 
.lib 'cic018.l' TT                               $叫出製程檔 TT 代表標準製程角（Typical-Typical） FF(fast-fast) SS(slow-slow)
.unprotect
.temp=25                                         $設定溫度
.option
+post                                            $output時才會有waveform檔出來
+acout=0 runlvl=6                                $增加精準度，runlvl從0-6越來越精準，acout=0使得模擬不會輸出ac結果
+captable                                        $顯示每個節點的電容值
+ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1

.include 'inv.spi'                               $叫進inv.spi
.param VD=1.8                                    $指定一個參數值
****************** cicuit 1 *************************
X1 vin vout vdd vss inv                          $名字設成X數字 後面接點順序照著spi檔中的順序放 最後再加上cell name



**************** source definition ******************
vdd1 vdd 0 'VD'                                  $sourcename node1 node2 value
vss1 vss 0 0
vin1 vin 0 dc 0.9 ac 1                           $sourcename node1 node2 dc dc的值 ac ac的值，ac的頻率及其他設定要在ac analysis設定
*source也可以有pulse：vin1 vin 0 PULSE(0 1.8 5n 10n 10n 40n 100n)也就是(V1 V2 t_delay模擬開始後隔多久有脈衝進來 t_rise上升時間 t_fall p_width持續V2時間 period週期)

***************** analysis **************************
.op                                              $進行operation point分析，初始狀態各節點的電壓和mos的工作狀態


****************dc analysis *************************
.dc vin1 0 1.8 1m                                $.dc 要掃的parameter 開始掃的值 結束的值 step size

****************ac analysis *************************
*.ac dec 10 1 1g                                  $.ac 縱軸取對數 每十倍取幾個數據 開始頻率 結束頻率，也可以.ac lin 10 1 1g 那就是1到1g均勻取10點

***************transient analysis********************
*.tran 0.1ns 300n
*.meas tran t_f_0.2 when v(vout)='0.2*VD' fall=1
*.meas tran t_f_0.8 when v(vout)='0.8*VD' fall=1
*.meas tran t_fall param='t_f_0.2-t_f_0.8'


.end


