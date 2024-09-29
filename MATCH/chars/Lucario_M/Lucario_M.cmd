[Remap]
x = x      ;Ｘボタンの入力判定を実際に押すボタンに割り当てる。
y = y      ;Ｙボタン　　　　　　　　　〃
z = z      ;Ｚボタン　　　　　　　　　〃
a = a      ;Ａボタン　　　　　　　　　〃
b = b      ;Ｂボタン　　　　　　　　　〃
c = c      ;Ｃボタン　　　　　　　　　〃
s = s      ;スタートボタン　　　　　　〃
;==========================================================================================

[Defaults]
command.time = 15

command.buffer.time = 1
;==========================================================================================

;-| ＡＩ発動用コマンド |-------------------------------------------------------

[Command]
name = "AI-000"
command = ~F,a,~D,y,~U,c+x,D,b+y,F,z,z,z+a
time = 1

[Command]
name = "AI-001"
command = ~F,c,~D,y,~U,c+a,D,b+x,B,z,z,z+b
time = 1

[Command]
name = "AI-002"
command = ~F,y,~D,y,~U,c+y,D,b+z,F,z,z,z+c
time = 1

[Command]
name = "AI-003"
command = ~F,b,~D,y,~U,c+b,D,b+a,B,z,z,z+x
time = 1

[Command]
name = "AI-004"
command = ~F,x,~D,x,~U,c+x,D,b+y,F,z,z,z+y
time = 1

[Command]
name = "AI-005"
command = ~F,z,~D,y,~U,c+a,D,b+c,B,z,z,z+a
time = 1

[Command]
name = "AI-006"
command = ~D,U,x+y+z,~F,F,b,c,y,B,~B,a+b+c,U
time = 1

[Command]
name = "AI-007"
command = ~U,D,x+b+z,~F,F,b,b,x,B,~B,a+y+c,F
time = 1

[Command]
name = "AI-008"
command = ~D,U,a+y+c,~F,F,b,a,z,B,~B,x+b+z,D
time = 1

[Command]
name = "AI-009"
command = ~U,D,x+b+c,~F,F,b,c,x,B,~B,a+y+z,B
time = 1

[Command]
name = "AI-010"
command = ~x,~y,~z,~a,~b,~c,~s,a+b+c,x+y+z,~F,B
time = 1

;***********************************
[Command]
name = "AI-011"
command = F,D,F
time = 0

[Command]
name = "AI-012"
command = B,F,B
time = 0

[Command]
name = "AI-013"
command = U,B,U
time = 0

[Command]
name = "AI-014"
command = D,U,D
time = 0

;***********************************
[Command]
name = "AI-015"
command = a,s,a
time = 0

[Command]
name = "AI-016"
command = b,a,b
time = 0

[Command]
name = "AI-017"
command = c,b,c
time = 0

[Command]
name = "AI-018"
command = x,c,x
time = 0

[Command]
name = "AI-019"
command = y,x,y
time = 0

[Command]
name = "AI-020"
command = z,y,z
time = 0

[Command]
name = "AI-021"
command = s,z,s
time = 0

;-| スーパーアーツ |-----------------------------------------------------------

[Command]
name = "インファイト"
command = x,x,F,a,z
time = 30

;***********************************
;はどうのあらし
[Command]
name = "hadou_no_arashi"
command = ~D, DB, B, D, DB, B, a
time = 30

[Command]
name = "hadou_no_arashi"
command = ~D, DB, B, D, DB, B, b
time = 30

[Command]
name = "hadou_no_arashi"
command = ~D, DB, B, D, DB, B, c
time = 30

;***********************************
;バレットパンチ
[Command]
name = "バレットパンチ"
command = ~D,DF,F,D,DF,F,a
time = 30

[Command]
name = "バレットパンチ"
command = ~D,DF,F,D,DF,F,b
time = 30

[Command]
name = "バレットパンチ"
command = ~D,DF,F,D,DF,F,c
time = 30

;***********************************
;しんくうはどうだん
[Command]
name = "shinku_hadoudan"
command = ~D,DF,F,D,DF,F,x
time = 30

[Command]
name = "shinku_hadoudan"
command = ~D,DF,F,D,DF,F,y
time = 30

[Command]
name = "shinku_hadoudan"
command = ~D,DF,F,D,DF,F,z
time = 30

;***********************************

;-| 必殺技 |-------------------------------------------------------------------

;かげぶんしん
[Command]
name = "kage_bunshin-000"
command = ~F,D,DF,a+b
time = 15

[Command]
name = "kage_bunshin-001"
command = ~F,D,DF,x+y
time = 15

[Command]
name = "kage_bunshin-002"
command = ~B,D,DB,a+b
time = 15

[Command]
name = "kage_bunshin-003"
command = ~B,D,DB,x+y
time = 15

;***********************************
;フェイント
[Command]
Name    = "フェイント-000"
Command = ~D, D, a
time = 15

[Command]
Name    = "フェイント-001"
Command = ~D, D, b
time = 15

[Command]
Name    = "フェイント-002"
Command = ~D, D, c
time = 15

;***********************************
;空中しんそく
[Command]
name = "空中しんそく-000"
command = ~D, DB, B, a
time = 15

[Command]
name = "空中しんそく-001"
command = ~D, DB, B, b
time = 15

[Command]
name = "空中しんそく-002"
command = ~D, DB, B, c
time = 15

;***********************************
;しんそく
[Command]
name = "しんそく-000"
command = ~D, DB, B, a
time = 15

[Command]
name = "しんそく-001"
command = ~D, DB, B, b
time = 15

[Command]
name = "しんそく-002"
command = ~D, DB, B, c
time = 15


;***********************************
;スカイアッパー
[Command]
name = "スカイアッパー-000"
command = ~F, D, DF, x
time = 15

[Command]
name = "スカイアッパー-001"
command = ~F, D, DF, y
time = 15

[Command]
name = "スカイアッパー-002"
command = ~F, D, DF, z
time = 15

;***********************************
;はどうだん
[Command]
name = "hadoudan-000"
command = ~D,DF,F,x
time = 15

[Command]
name = "hadoudan-001"
command = ~D,DF,F,y
time = 15

[Command]
name = "hadoudan-002"
command = ~D,DF,F,z
time = 15

;***********************************
;ざんくうはどうだん
[Command]
name = "zanku_hadoudan-000"
command = ~D,DF,F,x
time = 15

[Command]
name = "zanku_hadoudan-001"
command = ~D,DF,F,y
time = 15

[Command]
name = "zanku_hadoudan-002"
command = ~D,DF,F,z
time = 15

;***********************************
;ブレイズキック
[Command]
name = "ブレイズキック-000"
command = ~B, DB, D, DF, F, a
time = 20

[Command]
name = "ブレイズキック-001"
command = ~B, DB, D, DF, F, b
time = 20

[Command]
name = "ブレイズキック-002"
command = ~B, DB, D, DF, F, c
time = 20

;***********************************

;------------------------------------------------------------------------------
;-| 特殊技 |-------------------------------------------------------------------

;***********************************
;ブロッキング
[Command]
name = "blocking-000"
command = F
time = 1

[Command]
name = "blocking-001"
command = /F
time = 1

[Command]
name = "blocking-002"
command = D
time = 1

[Command]
name = "blocking-003"
command = /D
time = 1

;***********************************
;スーパージャンプ
[Command]
name = "super_jump"
command = D,$U
time = 8

;-| キー２回連続入力 |---------------------------------------------------------

[Command]
name = "FF"       ;必須コマンド名
command = F, F
time = 10

[Command]
name = "BB"       ;必須コマンド名
command = B, B
time = 10
;==========================================================================================

;-| 同時押し |-----------------------------------------------------------------

[Command]
name = "recovery" ;必須コマンド名
command = x
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = y
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = z
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = a
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = b
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = c
time = 1

;==========================================================================================

;-| 方向キー＋ボタン |---------------------------------------------------------

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1
;==========================================================================================

;-| ボタン単発 |---------------------------------------------------------------

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
;==========================================================================================

;-| 方向キー |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1
;==========================================================================================

[Statedef -1]



;---------------------------------------------------------------------------
;ＡＩ発動用フラグ

[State -1, 変数]
type = VarSet
triggerall = (var(0) != 1) && (RoundState < 3)
trigger1 = (command = "AI-000") || (command = "AI-011")
trigger2 = (command = "AI-001") || (command = "AI-012")
trigger3 = (command = "AI-002") || (command = "AI-013")
trigger4 = (command = "AI-003") || (command = "AI-014")
trigger5 = (command = "AI-004") || (command = "AI-015")
trigger6 = (command = "AI-005") || (command = "AI-016")
trigger7 = (command = "AI-006") || (command = "AI-017")
trigger8 = (command = "AI-007") || (command = "AI-018")
trigger9 = (command = "AI-008") || (command = "AI-019")
trigger10= (command = "AI-009") || (command = "AI-020")
trigger11= (command = "AI-010") || (command = "AI-021")
var(0) = 1
IgnoreHitPause = 1
Persistent = 1

;===========================================================================








;==============================================================================
; スーパーアーツ
;==============================================================================
;------------------------------------------------------------------------------

[State -1, インファイト]
type = ChangeState
value = 2500
triggerall = var(0) = 0
triggerall = (command = "インファイト")
triggerall = (Power > 2999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,299])
trigger3 = (StateNo = [1000,1099]) && (time >= 10) && (StateType != A)

[State -1, はどうのあらし]
type = ChangeState
value = 2100
triggerall = var(0) = 0
triggerall = (command = "hadou_no_arashi")
triggerall = (Power > 1999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact)
trigger3 = (StateNo = [1000,1099]) && (time >= 10) && (StateType != A)
trigger4 = (StateNo = [1100,1699]) && (StateType != A) && (MoveContact)


[State -1, バレットパンチ]
type = ChangeState
value = 2200
triggerall = var(0) = 0
triggerall = (command = "バレットパンチ")
triggerall = (Power > 999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact)
trigger3 = (StateNo = [1000,1099]) && (time >= 10) && (StateType != A)
trigger4 = (StateNo = [1100,1699]) && (StateType != A) && (MoveContact)

[State -1, しんくうはどうだん]
type = ChangeState
value = 2000
triggerall = var(0) = 0
triggerall = (command = "shinku_hadoudan")
triggerall = (Power > 999)
trigger1 = (StateType != A) && (Ctrl)
trigger2 = (StateNo = [200,499]) && (MoveContact)
trigger3 = (StateNo = [1000,1099]) && (time >= 10) && (StateType != A)
trigger4 = (StateNo = [1100,1699]) && (StateType != A) && (MoveContact)



;==============================================================================
; 必殺技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, かげぶんしん-000（小前進）]
type = ChangeState
value = 1100
triggerall = var(0) = 0
triggerall = (command = "kage_bunshin-000")
trigger1 = (StateType != A) && (Ctrl)

[State -1, かげぶんしん-001（大前進）]
type = ChangeState
value = 1110
triggerall = var(0) = 0
triggerall = (command = "kage_bunshin-001")
trigger1 = (StateType != A) && (Ctrl)

[State -1, かげぶんしん-002（小後退）]
type = ChangeState
value = 1120
triggerall = var(0) = 0
triggerall = (command = "kage_bunshin-002")
trigger1 = (StateType != A) && (Ctrl)

[State -1, かげぶんしん-003（大後退）]
type = ChangeState
value = 1130
triggerall = var(0) = 0
triggerall = (command = "kage_bunshin-003")
trigger1 = (StateType != A) && (Ctrl)

[State -1, 	フェイント（弱）]
type = ChangeState
value = 1600
triggerall = var(0) = 0
triggerall = (command = "フェイント-000")
trigger1 = (Ctrl) && (StateType != A)

[State -1, 	フェイント（中）]
type = ChangeState
value = 1610
triggerall = var(0) = 0
triggerall = (command = "フェイント-001")
trigger1 = (Ctrl) && (StateType != A)

[State -1, 	フェイント（強）]
type = ChangeState
value = 1620
triggerall = var(0) = 0
triggerall = (command = "フェイント-002")
trigger1 = (Ctrl) && (StateType != A)

[State -1, 空中しんそく（弱）]
type = ChangeState
value = 1500
triggerall = var(0) = 0
triggerall = (command = "空中しんそく-000")
trigger1 = (Ctrl) && (StateType = A)

[State -1, 空中しんそく（中）]
type = ChangeState
value = 1510
triggerall = var(0) = 0
triggerall = (command = "空中しんそく-001")
trigger1 = (Ctrl) && (StateType = A)

[State -1, 空中しんそく（強）]
type = ChangeState
value = 1520
triggerall = var(0) = 0
triggerall = (command = "空中しんそく-002")
trigger1 = (Ctrl) && (StateType = A)

[State -1, しんそく（弱）]
type = ChangeState
value = 1400
triggerall = var(0) = 0
triggerall = (command = "しんそく-000")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact)

[State -1, しんそく（中）]
type = ChangeState
value = 1410
triggerall = var(0) = 0
triggerall = (command = "しんそく-001")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact)

[State -1, しんそく（強）]
type = ChangeState
value = 1420
triggerall = var(0) = 0
triggerall = (command = "しんそく-002")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact)


[State -1, ブレイズキック（弱）]
type = ChangeState
value = 1300
triggerall = var(0) = 0
triggerall = (command = "ブレイズキック-000")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact)

[State -1, ブレイズキック（中）]
type = ChangeState
value = 1310
triggerall = var(0) = 0
triggerall = (command = "ブレイズキック-001")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact)

[State -1, ブレイズキック（強）]
type = ChangeState
value = 1320
triggerall = var(0) = 0
triggerall = (command = "ブレイズキック-002")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact)

[State -1, スカイアッパー（弱）]
type = ChangeState
value = 1200
triggerall = var(0) = 0
triggerall = (command = "スカイアッパー-000")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact) && (Time > 4)

[State -1, スカイアッパー（中）]
type = ChangeState
value = 1210
triggerall = var(0) = 0
triggerall = (command = "スカイアッパー-001")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact) && (Time > 4)

[State -1, スカイアッパー（強）]
type = ChangeState
value = 1220
triggerall = var(0) = 0
triggerall = (command = "スカイアッパー-002")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact) && (Time > 4)

[State -1, はどうだん（弱）]
type = ChangeState
value = 1000
triggerall = var(0) = 0
triggerall = NumHelper(1000) = 0
triggerall = (command = "hadoudan-000")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact) && (Time > 4)

[State -1, はどうだん（中）]
type = ChangeState
value = 1010
triggerall = var(0) = 0
triggerall = NumHelper(1000) = 0
triggerall = (command = "hadoudan-001")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact) && (Time > 4)

[State -1, はどうだん（強）]
type = ChangeState
value = 1020
triggerall = var(0) = 0
triggerall = NumHelper(1000) = 0
triggerall = (command = "hadoudan-002")
trigger1 = (Ctrl) && (StateType != A)
trigger2 = (StateNo = [200,499]) && (MoveContact) && (Time > 4)


[State -1, ざんくうはどうだん（弱）]
type = ChangeState
value = 1050
triggerall = var(0) = 0
triggerall = NumHelper(1050) = 0
triggerall = (command = "zanku_hadoudan-000")
trigger1 = (Ctrl) && (StateType = A)

[State -1, ざんくうはどうだん（中）]
type = ChangeState
value = 1060
triggerall = var(0) = 0
triggerall = NumHelper(1050) = 0
triggerall = (command = "zanku_hadoudan-001")
trigger1 = (Ctrl) && (StateType = A)

[State -1, ざんくうはどうだん（強）]
type = ChangeState
value = 1070
triggerall = var(0) = 0
triggerall = NumHelper(1050) = 0
triggerall = (command = "zanku_hadoudan-002")
trigger1 = (Ctrl) && (StateType = A)

;==============================================================================
; 移動関連
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 走る]
type = ChangeState
value = 100
triggerall = var(0) = 0
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, バックステップ]
type = ChangeState
value = 105
triggerall = var(0) = 0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl


[State -1, 空中ダッシュ]
type = ChangeState
triggerall = var(0) = 0
triggerall = (Pos Y < -40)
triggerall = (StateNo != 102)
triggerall = (StateNo != 103)
triggerall = (StateNo != 120)
triggerall = (StateNo != 132)
triggerall = (StateNo != 140)
trigger1 = (command = "FF") && (StateType = A) && (Ctrl)
value = 102

[State -1, 空中バックダッシュ]
type = ChangeState
triggerall = var(0) = 0
triggerall = (Pos Y < -40)
triggerall = (StateNo != 102)
triggerall = (StateNo != 103)
triggerall = (StateNo != 120)
triggerall = (StateNo != 132)
triggerall = (StateNo != 140)
trigger1 = (command = "BB") && (StateType = A) && (Ctrl)
value = 103


;==========================================================================================

[State -1, 前投げ]
type = ChangeState
value = 800
triggerall = var(0) = 0
triggerall = command = "x"
triggerall = command = "a"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

;==========================================================================================

[State -1, 後投げ]
type = ChangeState
value = 801
triggerall = var(0) = 0
triggerall = command = "x"
triggerall = command = "a"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdback"
trigger1 = p2bodydist X < 7
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H

[State -1, スーパージャンプ]
type = ChangeState
triggerall = var(0) = 0
trigger1 = (command = "super_jump") && (StateType != A) && (Ctrl)
value = 10003

;==============================================================================
; 通常攻撃技
;==============================================================================
;------------------------------------------------------------------------------

[State -1, 立ち弱パンチ]
type = ChangeState
value = 200
triggerall = var(0) = 0
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, 立ち中パンチ]
type = ChangeState
value = 210
triggerall = var(0) = 0
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 6
trigger3 = (stateno = 230) && time > 6

[State -1, 立ち強パンチ]
type = ChangeState
value = 220
triggerall = var(0) = 0
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 240) && time > 6

[State -1, 立ち弱キック]
type = ChangeState
value = 230
triggerall = var(0) = 0
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time > 6

[State -1, 立ち中キック]
type = ChangeState
value = 240
triggerall = var(0) = 0
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, 立ち強キック]
type = ChangeState
value = 250
triggerall = var(0) = 0
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;------------------------------------------------------------------------------

[State -1, しゃがみ弱パンチ]
type = ChangeState
value = 400
triggerall = var(0) = 0
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 430)
trigger2 = (time > 9) || (MoveContact && time > 4)

[State -1, しゃがみ中パンチ]
type = ChangeState
value = 410
triggerall = var(0) = 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400)
trigger2 = (time > 9) || (MoveContact && time > 4)

[State -1, しゃがみ強パンチ]
type = ChangeState
value = 420
triggerall = var(0) = 0
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, しゃがみ弱キック]
type = ChangeState
value = 430
triggerall = var(0) = 0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 430)
trigger2 = (time > 9) || (MoveContact && time > 6)

[State -1, しゃがみ中キック]
type = ChangeState
value = 440
triggerall = var(0) = 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, しゃがみ強キック]
type = ChangeState
value = 450
triggerall = var(0) = 0
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 440)
trigger2 = (time > 9) || (MoveContact && time > 4)

;------------------------------------------------------------------------------

[State -1, ジャンプ弱パンチ]
type = ChangeState
value = 600
triggerall = var(0) = 0
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ジャンプ中パンチ]
type = ChangeState
value = 610
triggerall = var(0) = 0
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ジャンプ強パンチ]
type = ChangeState
value = 620
triggerall = var(0) = 0
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ジャンプ弱キック]
type = ChangeState
value = 630
triggerall = var(0) = 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ジャンプ中キック]
type = ChangeState
value = 640
triggerall = var(0) = 0
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, ジャンプ強キック]
type = ChangeState
value = 650
triggerall = var(0) = 0
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

;------------------------------------------------------------------------------

[State -1, 挑発]
type = ChangeState
value = 195
triggerall = var(0) = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

