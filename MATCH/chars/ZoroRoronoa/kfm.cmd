;-| 超必殺技 |--------------------------------------------------------
;ここには超必殺技を記述してください、同じ名前を「name =」欄に書けますが
;コマンドは絶対に違ったものにしてください。
;カンフーマンは弱パンチと強パンチで技が出せるように同じ名前のコマンドで
;内容が弱と強になっています。
;「time=20」と書くことで「コマンドを20フレーム以内に入力」と設定できます。


[Command]
name = "248b+c"   
command = ~D, DB, B, b+c
time = 20

[Command]
name = "248a+b"   
command = ~D, DB, B, a+b
time = 20

[Command]
name = "22a+b"
command = ~D, D, a+b  

[Command]
name = "263b+c"
command = ~F, D, F,b+c
time = 20

[Command]
name = "263a+b"
command = ~F, D, F,a+b
time = 20

[Command]
name = "236b+c"
command = ~D, DF, F,b+c
time = 20

[Command]
name = "236a+b"
command = ~D, DF, F,a+b
time = 20

;-| 必殺技 |------------------------------------------------------

[Command]
name = "248c"
command = ~D, DB, B, c

[Command]
name = "248a"
command = ~D, DB, B, a

[Command]
name = "248b"
command = ~D, DB, B, b

[Command]
name = "22c"
command = ~D, D,  c

[Command]
name = "22b"
command = ~D, D,  b

[Command]
name = "22a"
command = ~D, D,  a

[Command]
name = "263c"
command = ~F, D, F, c

[Command]
name = "263b"
command = ~F, D, F, b

[Command]
name = "263a"
command = ~F, D, F, a

[Command]
name = "236c"
command = ~D, DF, F, c

[Command]
name = "236b"
command = ~D, DF, F, b

[Command]
name = "236a"
command = ~D, DF, F, a


;※※※※※※※※※※※※※※※※※※※※前避け
;前を押しながらＡ＋Ｂ、という意味
[Command]
name = "away-f"    
command = /F,a+b
time = 10

;※※※※※※※※※※※※※※※※※※※※前避け
;後を押しながらＡ＋Ｂ、という意味
[Command]
name = "away-b"    
command = /B,a+b
time = 10

;※※※※※※※※※※※※※※※※※※※※ハイジャンプコマンド
;下をちょっと押して上を押す、と言う意味。
[Command]
name = "jump"    
command = ~D,$U
time = 10

;-| ２回押し技 |-----------------------------------------------------------
[Command]
name = "FF"     
command = F, F
time = 10

[Command]
name = "BB"     
command = B, B
time = 10

[Command]
name = "xx"     
command = x, x
time = 1000

;-| ２・３個の同時押し技 |-----------------------------------------------
[Command]
name = "recovery"
command = x+y
time = 1

;-| 方向とボタンで出す技 |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "down_y"
command = /F,y

[Command]
name = "f_z"
command = /F, z,

[Command]
name = "f_c"
command = /F, c,

[Command]
name = "f_b"
command = /F, b,

[Command]
name = "f_a"
command = /F, a,

[Command]
name = "b_c"
command = /B, c,

[Command]
name = "b_b"
command = /B, b,

[Command]
name = "b_a"
command = /B, a,

[Command]
name = "f_x"
command = /F, x,

;-| ボタン設定（いじらない）|---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;※※※※※※※※※※※※※※※※※※※※ハイジャンプコマンド
;下をちょっと押して上を押す、と言う意味。
[Command]
name = "jump"    
command = ~D,$U
time = 10

;-| 押しっぱなし設定（いじらない）-------------------------------------------------------
[Command]
name = "holdfwd"
command = /$F
time = 1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup" 
command = /$U
time = 1

[Command]
name = "holddown"
command = /$D
time = 1

[Command]
name = "holdx"
command = /$x
time = 1

[Command]
name = "holdy"
command = /$y
time = 1

[Command]
name = "holda"
command = /$a
time = 1

[Command]
name = "holdb"
command = /$b
time = 1

; 下の記述↓は絶対に消さないでください。
[Statedef -1]
;===========================================================================
;格闘（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3300
triggerall = command = "263b+c"
triggerall = power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = movecontact
;===========================================================================
;格闘（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 2800
triggerall = command = "263a+b"
triggerall = power >= 500
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA
trigger2 = movecontact
trigger3 = (stateno = 330) && movecontact
;===========================================================================
;格闘（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 2700
triggerall = command = "22a+b"
triggerall = power >= 500
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA
trigger2 = movecontact
trigger3 = (stateno = 330) && movecontact
;===========================================================================
;格闘（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3100
triggerall = command = "248b+c"
triggerall = power >= 1000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = movecontact
;===========================================================================
;格闘（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 1300
triggerall = command = "248a+b"
triggerall = power >= 500
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA
trigger2 = movecontact
trigger3 = (stateno = 330) && movecontact
;---------------------------------------------------------------------------
;ビームC（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "236b+c"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = movecontact
;---------------------------------------------------------------------------
;ビームC（ゲージレベル１）
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 2500
triggerall = command = "236a+b"
triggerall = power >= 500
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA
trigger2 = movecontact
trigger3 = (stateno = 330) && movecontact

;===========================================================================
;-------------------------------------------------------
;昇竜（強）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 2300
triggerall = command = "248b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 610) && movecontact
trigger4 = (stateno = 620) && movecontact
trigger5 = (stateno = 640) && movecontact
;---------------------------------------------------------------------------
;コールドメタルソード縦斬り
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1400
triggerall = command = "263c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [140,155]
trigger2 = power >= 1000
trigger2 = statetype != A
trigger3 = (stateno = 300) && movecontact
trigger4 = (stateno = 310) && movecontact
trigger5 = (stateno = 320) && movecontact
trigger6 = (stateno = 330) && movecontact
trigger7 = (stateno = 340) && movecontact
trigger8 = (stateno = 345) && movecontact
trigger9 = (stateno = 400) && movecontact
trigger10 = (stateno = 410) && movecontact
trigger11 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;コールドメタルソード縦斬り
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 2600
triggerall = command = "263b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [140,155]
trigger2 = power >= 1000
trigger2 = statetype != A
trigger3 = (stateno = 300) && movecontact
trigger4 = (stateno = 310) && movecontact
trigger5 = (stateno = 320) && movecontact
trigger6 = (stateno = 330) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;立ち・中攻撃
[State -1, Stand Light Kick]
type = ChangeState
value = 330
triggerall = command = "263a"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 400) && movecontact
trigger6 = (stateno = 410) && movecontact
trigger7 = (stateno = 420) && movecontact

;-------------------------------------------------------
;昇竜（強）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1900
triggerall = command = "22c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;昇竜（弱）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1500
triggerall = command = "22b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;-------------------------------------------------------
;昇竜（強）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1700
triggerall = command = "22a"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;-------------------------------------------------------
;昇竜（強）
[State -1, Light Kung Fu Knee]
type = ChangeState
value = 1750
triggerall = command = "22a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 610) && movecontact
trigger4 = (stateno = 620) && movecontact
trigger5 = (stateno = 640) && movecontact
;---------------------------------------------------------------------------
;コールドメタルソード縦斬り
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1600
triggerall = command = "236c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;ビームサーベル突進
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 2100
triggerall = command = "236c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [140,155]
trigger2 = power >= 1000
trigger2 = statetype = A
trigger3 = (stateno = 600) && movecontact
trigger4 = (stateno = 610) && movecontact
trigger5 = (stateno = 620) && movecontact
trigger6 = (stateno = 640) && movecontact
;---------------------------------------------------------------------------
;カンフー突き手（弱）
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1200
triggerall = command = "236b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;カンフー突き手（弱）
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 2900
triggerall = command = "236a"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;カンフー突き手（弱）
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 2200
triggerall = command = "263b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [140,155]
trigger2 = power >= 1000
trigger2 = statetype = A
trigger3 = (stateno = 600) && movecontact
trigger4 = (stateno = 610) && movecontact
trigger5 = (stateno = 620) && movecontact
trigger6 = (stateno = 630) && movecontact
trigger7 = (stateno = 640) && movecontact
;---------------------------------------------------------------------------
;ファンネル
[State -1, Light Kung Fu Palmaa]
type = ChangeState
value = 2400
triggerall = command = "248c" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;ビームライフル
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1100
triggerall =  command = "248b" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
;バズーカ
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "248a" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 320) && movecontact
trigger5 = (stateno = 330) && movecontact
trigger6 = (stateno = 340) && movecontact
trigger7 = (stateno = 345) && movecontact
trigger8 = (stateno = 400) && movecontact
trigger9 = (stateno = 410) && movecontact
trigger10 = (stateno = 420) && movecontact

;---------------------------------------------------------------------------
;前避け
;とても簡単なステートです。
;ここでやってる特殊なことは「効率化」です。
;詳細はaway.cnsで

[State -1, Run Back]
type = ChangeState
value = 900
triggerall = command = "away-f"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = [140,155]
trigger2 = power >= 500

;---------------------------------------------------------------------------
;後避け
;とても簡単なステートです。
;ここでやってる特殊なことは「効率化」です。
;詳細はaway.cnsで

[State -1, Run Back]
type = ChangeState
value = 950
triggerall = command = "away-b"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = [140,155]
trigger2 = power >= 500

;---------------------------------------------------------------------------
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;パワー溜め
;新しく「holdx」「holdy」というコマンドを作ります
;あわせるとXとYを同時に押すとってことです。
;パワーがＭＡＸなのに溜めるのは変なのでトリガーにpower != 3000を付けます。
;詳細はpower.cnsで

[State -1, Run Back]
type = ChangeState
value = 2000
triggerall = power != 3000
trigger1 = command = "holdx"
trigger1 = statetype = S
trigger1 = ctrl


;---------------------------------------------------------------------------
;投げ
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "y"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = stateno != 100

;---------------------------------------------------------------------------
;立ち・中攻撃
[State -1, Stand Light Kick]
type = ChangeState
value = 345
triggerall = command = "f_b"
triggerall = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;立ち・弱攻撃
[State -1, Stand Light Punch]
type = ChangeState
value = 300
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 300) && time > 8

;---------------------------------------------------------------------------
;立ち・中攻撃
[State -1, Stand Light Kick]
type = ChangeState
value = 310
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 400) && movecontact

;---------------------------------------------------------------------------
;立ち・強攻撃
[State -1, Standing Strong Kick]
type = ChangeState
value = 320
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 300) && movecontact
trigger3 = (stateno = 310) && movecontact
trigger4 = (stateno = 400) && movecontact
trigger5 = (stateno = 410) && movecontact

;---------------------------------------------------------------------------
;挑発
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;しゃがみ弱攻撃
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && time > 8

;---------------------------------------------------------------------------
;屈み・中攻撃
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = 310) && movecontact

;---------------------------------------------------------------------------
;しゃがみ大攻撃
[State -1, Crouching Light Kick]
type = ChangeState
value = 420
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = 410) && movecontact
trigger4 = (stateno = 320) && movecontact

;---------------------------------------------------------------------------
;ファンネル
[State -1, Light Kung Fu Palmaa]
type = ChangeState
value = 630
triggerall = command = "down_a" 
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 610) && movecontact
trigger4 = (stateno = 620) && movecontact
;---------------------------------------------------------------------------
;空中強パンチ
[State -1, Jump Strong Punch]
type = ChangeState
value = 600
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;空中強パンチ
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 620) && movecontact
;---------------------------------------------------------------------------
;ファンネル
[State -1, Light Kung Fu Palmaa]
type = ChangeState
value = 620
triggerall = command = "c" 
trigger1= statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 610) && movecontact
