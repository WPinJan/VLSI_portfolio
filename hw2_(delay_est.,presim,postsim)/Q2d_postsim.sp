inverter chain
.protect 
.lib 'cic018.l' TT                               $叫出製程檔 TT 代表標準製程角（Typical-Typical） FF(fast-fast) SS(slow-slow)
.unprotect
.temp=25                                         $設定溫度
.option
+post                                            $output時才會有waveform檔出來
+runlvl=6                                        $增加精準度，runlvl從0-6越來越精準，acout=0使得模擬不會輸出ac結果
+captable                                        $顯示每個節點的電容值
+ABSTOL=1e-12 RELTOL=1e-7 ACCURATE=1             $absolute relative tolerance accurate=0 or 1


.include 'invchain.pex.spi'                              $叫進inv.spi，如果要的話
.PARAM VDD = 1.8                                  $指定一個參數值

****************** cicuit 1 *************************
X1 VIN VSS VOUT VDD invchain                          $若要引入spi，名字設成X數字 後面接點順序照著spi檔中的順序放 最後再加上cell name

CL vout VSS 0.5p
**************** source definition ******************
vdd vdd 0 VDD                                  $sourcename node1 node2 value
vss vss 0 0
vin vin 0 PULSE(0 VDD 0.1u 0.1n 0.1n 0.1u 0.2u)         $(V1 V2 t_delay模擬開始後隔多久有脈衝進來 t_rise上升時間 t_fall p_width持續V2時間 period週期)


.op


.tran 0.01p 0.8u
.probe tran V(vout)


.end
