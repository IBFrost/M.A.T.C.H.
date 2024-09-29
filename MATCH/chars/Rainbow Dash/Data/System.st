;-| System States |-------------------------------------------------------

;-------------------------------------------------------------------------
;ガードキャンセル
;-------------------------------------------------------------------------
[Statedef 750]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 750
PowerAdd = -1000
SprPriority = 2
FaceP2 = 1

[State 750, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8220
Pos = 0, -25
PosType = P1
Facing = 1
StateNo = 8220
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State 750, 時間停止]
Type = Pause
Trigger1 = Time = 0
Time = 20
MoveTime = 20

[State 750, 無敵]
Type = NotHitBy
Trigger1 = AnimElem = 5, < 0
Trigger2 = PalNo = [7,12]
Trigger2 = AnimElem = 16, < 0
Trigger3 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 750, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 3

[State 750, PalFx]
Type = PalFx
Trigger1 = Time = 0
Time = 2
Mul = 0,0,0

[State 750, 速度]
Type = VelSet
Trigger1 = AnimElem = 5
X = 4

[State 750, 失速]
Type = VelMul
Trigger1 = AnimElem = 16, > 0
X = 0.80

[State 750, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 3
HelperType = Normal
Name = "Effect"
ID = 751
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 751
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 1
Size.YScale = 1

[State 750, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 3
HelperType = Normal
Name = "Effect"
ID = 752
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 751
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 1
Size.YScale = 1

[State 750, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 5
Trigger2 = AnimElem = 10
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 30, 10
GetPower = 0, 0
GivePower = 20, 15
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 5
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 21
Ground.HitTime = 21
Air.HitTime = 21
Guard.SlideTime = 19
Guard.HitTime = 19
Guard.CtrlTime = 19
AirGuard.HitTime = 19
AirGuard.CtrlTime = 19
Down.HitTime = 21
YAccel = .35
Ground.Velocity = -3, -2.5
Guard.Velocity = -1.5
Air.Velocity = -3, -2.5
AirGuard.Velocity = -1.5, -2.5
Down.Velocity = -3, -2.5
Ground.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
Down.CornerPush.VelOff = 0
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 750, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 15
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 30, 10
GetPower = 0, 0
GivePower = 20, 15
PauseTime = 20, 20
Guard.PauseTime = 20, 20
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 5
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 21
Ground.HitTime = 21
Air.HitTime = 21
Guard.SlideTime = 19
Guard.HitTime = 19
Guard.CtrlTime = 19
AirGuard.HitTime = 19
AirGuard.CtrlTime = 19
Down.HitTime = 21
YAccel = .35
Ground.Velocity = -8, -1.5
Guard.Velocity = -1.5
Air.Velocity = -8, -1.5
AirGuard.Velocity = -1.5, -1.5
Down.Velocity = -8, -1.5
Ground.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
Down.CornerPush.VelOff = 0
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 750, ステート奪取]
Type = TargetState
TriggerAll = PalNo = 12
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = AnimElem = 15, >= 0
Trigger1 = MoveHit = 1
Value = 50050
ID = 1000
Persistent = 20
IgNoreHitPause = 1

[State 750, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = PalNo = 12
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = AnimElem = 15, >= 0
Trigger1 = MoveHit = 1
Trigger1 = Facing = Target(1000),Facing
Value = -1
ID = 1000
Persistent = 20
IgNoreHitPause = 1

[State 750, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;HELPER : ガードキャンセル
;-------------------------------------------------------------------------
[Statedef 751]
Physics = N
Ctrl = 0
Anim = 6003
SprPriority = 0

[State 751, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 751, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper(751)
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 256
Trigger2 = Time <= 4
Trigger2 = 1 || Var(0) := Var(0) - 64
Trigger3 = Time = 5
Trigger3 = 1 || Var(0) := 0
Trigger4 = Root,StateNo = 750
Trigger4 = Root,AnimElem = 16, > 0
Trigger4 = 1 || Var(0) := Var(0) + 16

[State 751, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper(752)
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 256
Trigger2 = Time <= 4
Trigger2 = 1 || Var(0) := Var(0) - 48
Trigger3 = Time = 5
Trigger3 = 1 || Var(0) := 192
Trigger4 = Root,StateNo = 750
Trigger4 = Root,AnimElem = 16, > 0
Trigger4 = 1 || Var(0) := Var(0) + 16

[State 751, 画像表示の優先度]
Type = SprPriority
TriggerAll = IsHelper(752)
Trigger1 = Time = 0
Value = 3

[State 751, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), 256
IgNoreHitPause = 1

[State 751, SE]
Type = PlaySnd
TriggerAll = IsHelper(751)
Trigger1 = Time = 0
Value = 750, 0
Channel = 1

[State 751, StopSnd]
Type = StopSnd
TriggerAll = IsHelper(751)
Trigger1 = Root,MoveType = H
Trigger2 = Root,StateType = L
Trigger3 = Var(0) < 0
Channel = 1

[State 751, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,StateType = L
Trigger3 = Root,StateNo != 750
Trigger4 = Var(0) < 0

;-------------------------------------------------------------------------
;ENEMY : 足払いで転ぶ2（硬直）
;-------------------------------------------------------------------------
[Statedef 5072]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0

[State 5072, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5072, 1]
Type = ChangeAnim 
Trigger1 = 1
Value = 5070

[State 5072, 2]
Type = SelfState
Trigger1 = HitShakeOver
Trigger2 = Time = 100
Value = 5071

;-------------------------------------------------------------------------
;HELPER : Launcher
;-------------------------------------------------------------------------
[Statedef 6001]
Physics = N
Ctrl = 0
Anim = 6001
SprPriority = 3

[State 6001, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 6001, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 6001, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Root,Anim = 430
Value = Anim
Elem = Root,AnimElemNo(0)

[State 6001, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,Anim != 430

;-------------------------------------------------------------------------
;HELPER : ジャンプ強攻撃
;-------------------------------------------------------------------------
[Statedef 6002]
Physics = N
Ctrl = 0
Anim = 6002
SprPriority = 3

[State 6002, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 6002, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 6002, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Root,Anim = 620
Value = Anim
Elem = Root,AnimElemNo(0)

[State 6002, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,Anim != 620

;-------------------------------------------------------------------------
;HELPER : EX必殺技エフェクト
;-------------------------------------------------------------------------
[Statedef 8200]
Physics = N
Ctrl = 0
Anim = 8200
SprPriority = 9

[State 8200, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 6000, 20

[State 8200, 影を不可視化]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow

[State 8200, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8201
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 8201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 8200, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8202
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 8202
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 8200, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
[Statedef 8201]
Physics = N
Ctrl = 0
Anim = 8201
SprPriority = 10

[State 8201, 影を不可視化]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow

[State 8201, 座標]
Type = PosSet
TriggerAll = IsHelper
Trigger1 = Time = 0
Y = Root,Pos Y

[State 8201, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
[Statedef 8202]
Physics = N
Ctrl = 0
Anim = 8202
SprPriority = -10

[State 8202, 影を不可視化]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow

[State 8202, 座標]
Type = PosSet
TriggerAll = IsHelper
Trigger1 = Time = 0
Y = Root,Pos Y

[State 8202, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
;HELPER : 超必殺技エフェクト
;-------------------------------------------------------------------------
[Statedef 8210]
Physics = N
Ctrl = 0
Anim = 8210
SprPriority = -9

[State 8210, 影を不可視化]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow

[State 8210, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8211
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 8211
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 8210, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
[Statedef 8211]
Physics = N
Ctrl = 0
Anim = 8211
SprPriority = 10

[State 8211, 影を不可視化]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow

[State 8211, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 256
Trigger2 = Time <= 4
Trigger2 = 1 || Var(0) := Var(0) - 64
Trigger3 = Time = 5
Trigger3 = 1 || Var(0) := 0
Trigger4 = Time >= 34
Trigger4 = 1 || Var(0) := Var(0) + 16

[State 8211, 変数 : 伸縮の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(1) := 100
Trigger2 = Time >= 1
Trigger2 = 1 || Var(1) := Var(1) - 2

[State 8211, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), 256

[State 8211, 伸縮]
Type = AngleDraw
Trigger1 = IsHelper
Value = 0
Scale = Var(1) * 0.01,Var(1) * 0.01

[State 8211, 画像表示の優先度]
Type = SprPriority
TriggerAll = IsHelper
Trigger1 = Root,StateNo = 3611
Value = 99

[State 8211, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,StateType = L
Trigger3 = Root,StateNo != [3000,3999]
Trigger4 = Time = 50

;-------------------------------------------------------------------------
;HELPER : 超必殺技エフェクト, Lv2
;-------------------------------------------------------------------------
[Statedef 8215]
Physics = N
Ctrl = 0
Anim = 8215
SprPriority = -9

[State 8215, 影を不可視化]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow

[State 8215, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8211
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 8211
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 8215, 画像表示の優先度]
Type = SprPriority
TriggerAll = IsHelper
Trigger1 = Root,StateNo = 3611
Value = 97

[State 8215, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
;HELPER : ガードキャンセルエフェクト
;-------------------------------------------------------------------------
[Statedef 8220]
Physics = N
Ctrl = 0
Anim = 10000

[State 8220, 不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
Flag2 = Invisible

[State 8220, 暗転]
Type = BGPalFX
Trigger1 = Time = 0
Time = 20
Add = -256,-128,-64
SinAdd = 256,128,64,80

[State 8220, PalFx]
Type = PalFx
Trigger1 = Time = 0
Time = 20
SinAdd = -256,-256,-256,80

[State 8220, Effect]
Type = Explod
Trigger1 = Time = 0
Anim = 8220
ID = 8220
Pos = 0, -Ceil(Pos Y)
PosType = P1
BindTime = 1
ReMoveTime = -2
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 1, 1
SprPriority = -2
OwnPal = 1

[State 8220, Effect]
Type = Explod
Trigger1 = Time = 0
Anim = 8221
ID = 8221
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = 20
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 1, 1
SprPriority = 3

[State 8220, Effect]
Type = ModifyExplod
Trigger1 = NumExplod(8221)
ID = 8221
Scale = 0.2 + (0.09 * Time), 0.2 + (0.09 * Time)

[State 8220, Effect]
Type = Explod
Trigger1 = Time = 0
Anim = 8222
ID = 8222
Pos = 0, -Ceil(Pos Y)
PosType = P1
BindTime = 1
ReMoveTime = -2
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 1, 1
SprPriority = -2
OwnPal = 1

[State 8220, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Time >= 20

;-------------------------------------------------------------------------
;HELPER : 超必殺技カットイン
;-------------------------------------------------------------------------
[Statedef 9000]
Physics = N
Ctrl = 0
Anim = 9000
SprPriority = -99

;Var(0)  = 透過値
;Var(1)  = 伸縮値
;Var(2)  = 黒背景

;---------------------[無敵]
[State 9000, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1
IgNoreHitPause = 1

;---------------------[演出]
[State 9000, 影を不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
IgNoreHitPause = 1

;---------------------[位置]
[State 9000, 移動]
Type = PosSet
Trigger1 = Time < 34
X = -160 * Facing
Y = Pos Y - ScreenPos Y + 240

[State 9000, 前進]
Type = PosAdd
Trigger1 = Time >= 34
X = -8
Y = 8

;---------------------[変数]
[State 9000, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 256
Trigger2 = Time <= 8
Trigger2 = 1 || Var(0) := Var(0) - 32
Trigger3 = Time >= 34
Trigger3 = 1 || Var(0) := Var(0) + 16

[State 9000, 変数 : 伸縮の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(1) := 32
Trigger2 = Time <= 8
Trigger2 = 1 || Var(1) := Var(1) - 4
Trigger3 = Time >= 34
Trigger3 = 1 || Var(1) := Var(1) + 2

[State 9000, 変数]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(2) := 256
Trigger2 = Time <= 8
Trigger2 = 1 || Var(2) := Var(2) - 32
Trigger3 = Time >= 42
Trigger3 = 1 || Var(2) := Var(2) + 32

[State 9000, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)
IgNoreHitPause = 1

[State 9000, 伸縮]
Type = AngleDraw
Trigger1 = IsHelper
Value = 0
Scale = 0.75 + Var(1) * 0.01,0.75 + Var(1) * 0.01
IgNoreHitPause = 1

[State 9000, 背景暗転]
Type = BGPalFX
Trigger1 = 1
Time = 1
Mul = Var(2),Var(2),Var(2)

[State 9000, 画像表示の優先度]
Type = SprPriority
TriggerAll = IsHelper
Trigger1 = Root,StateNo = 3611
Value = 96

;---------------------[ステート移行]
[State 9000, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,StateType = L
Trigger3 = Root,StateNo != [3000,3999]
Trigger4 = Time = 50

;-------------------------------------------------------------------------
;HELPER : ヘルパー分身対策
;-------------------------------------------------------------------------
[Statedef 10000]
MoveType= I
Physics = N
Ctrl = 0
Anim = 10000
VelSet = 0,0
SprPriority = 0

;---------------------[例外処理]
[State 10000, 間違いで本体が来たら立ちへ復帰]
Type = SelfState
Trigger1 = !IsHelper
Value = 0
Ctrl = 1

;---------------------[無敵]
[State 10000, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1
Persistent = 1
IgNoreHitPause = 1

;---------------------[特殊効果]
[State 10000, 不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
Flag2 = Invisible
Persistent = 1
IgNoreHitPause = 1

;---------------------[ステート移行]
[State 10000, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0
IgNoreHitPause = 1

;-------------------------------------------------------------------------
;HELPER : 残像ヘルパー
;-------------------------------------------------------------------------
[Statedef 10001]
MoveType= I
Physics = N
Ctrl = 0
Anim = 10000
SprPriority = -9

;---------------------[当身関係]
[State 10001, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1

[State 10001, 再起動]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = StateNo
Time = 1
ForceAir = 0

;---------------------[特殊効果]
[State 10001, 影を不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow

;---------------------[移動]
[State 10001, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

;---------------------[アニメ]
[State 10001, アニメ同期]
Type = ChangeAnim
Trigger1 = IsHelper
Value = Root,Anim
Elem = Root,AnimElemNo(0)

[State 10001, 例外アニメ]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Root,AnimExist(Anim) = 0
Trigger2 = Root,StateNo = 100
Trigger3 = Root,StateNo = 1001
Trigger4 = Root,StateNo = 1101
Trigger5 = Root,StateNo = 1201
Trigger6 = Root,StateNo = 3102
Trigger7 = Root,StateNo = 3500
Value = 10000

;---------------------[演出]
[State 10001, 角度描画]
Type = AngleDraw
Trigger1 = IsHelper
Scale = 1 + (Time * 0.0055),1 + (Time * 0.0055)

[State 10001, 透過処理]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - (Time * 8), (Time * 8)

;---------------------[ステート移行]
[State 10001, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Time * 8 >= 256
Trigger2 = Root,MoveType = H
Trigger2 = Root,StateNo != [5000,5299]
Trigger2 = Root,StateNo != [120,159]

;-------------------------------------------------------------------------
;HELPER : 残像ヘルパー
;-------------------------------------------------------------------------
[Statedef 10005]
MoveType= I
Physics = N
Ctrl = 0
Anim = 10000
SprPriority = -6

;---------------------[当身関係]
[State 10005, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1

[State 10005, 再起動]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = StateNo
Time = 1
ForceAir = 0

;---------------------[特殊効果]
[State 10005, 不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
Flag2 = Invisible

;---------------------[移動]
[State 10005, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

;---------------------[アニメ]
[State 10005, アニメ同期]
Type = ChangeAnim
Trigger1 = IsHelper
Value = Root,Anim
Elem = Root,AnimElemNo(0)

[State 10005, 例外アニメ]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Root,AnimExist(Anim) = 0
Trigger2 = Root,StateNo = 100
Trigger3 = Root,StateNo = 1001
Trigger4 = Root,StateNo = 1101
Trigger5 = Root,StateNo = 1201
Trigger6 = Root,StateNo = 3102
Trigger7 = Root,StateNo = 3500
Value = 10000

[State 10005, 表示優先度]
Type = SprPriority
Trigger1 = IsHelper(10005)
Value = -7

[State 10005, 表示優先度]
Type = SprPriority
Trigger1 = IsHelper(10006)
Value = -8

[State 10005, 表示優先度]
Type = SprPriority
Trigger1 = IsHelper(10007)
Value = -9

;---------------------[演出]
[State 10005, 拡大表示]
Type = AngleDraw
Trigger1 = IsHelper(10005)
Scale = 1.015,1.015

[State 10005, 拡大表示]
Type = AngleDraw
Trigger1 = IsHelper(10006)
Scale = 1.035,1.035

[State 10005, 拡大表示]
Type = AngleDraw
Trigger1 = IsHelper(10007)
Scale = 1.055,1.055

[State 10005, 残像]
Type = AfterImage
TriggerAll = IsHelper(10005)
Trigger1 = Time = 0
Time = 2
Length = 16
PalBright = 2,2,2
PalContrast = 50,50,50
PalAdd = 0,0,0
PalMul = 0.67,0.67,0.67
TimeGap = 1
FrameGap = 1
Trans = Add

[State 10005, 残像]
Type = AfterImage
TriggerAll = IsHelper(10006)
Trigger1 = Time = 0
Time = 2
Length = 16
PalBright = 2,2,2
PalContrast = 40,40,40
PalAdd = 0,0,0
PalMul = 0.67,0.67,0.67
TimeGap = 1
FrameGap = 1
Trans = Add

[State 10005, 残像]
Type = AfterImage
TriggerAll = IsHelper(10007)
Trigger1 = Time = 0
Time = 2
Length = 16
PalBright = 2,2,2
PalContrast = 30,30,30
PalAdd = 0,0,0
PalMul = 0.67,0.67,0.67
TimeGap = 1
FrameGap = 1
Trans = Add

[State 10005, AfterImageTime]
Type = AfterImageTime
Trigger1 = 1
Time = 2

[State 10005, 強化カラーオーラ]
Type = Helper
TriggerAll = IsHelper(10005)
Trigger1 = NumHelper(10006) = 0
HelperType = Normal
Name = "P7 - P12 Effect"
ID = 10006
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 10005
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 10005, 強化カラーオーラ]
Type = Helper
TriggerAll = IsHelper(10006)
Trigger1 = NumHelper(10007) = 0
HelperType = Normal
Name = "P7 - P12 Effect"
ID = 10007
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 10005
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

;---------------------[ステート移行]
[State 10005, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger1 = Root,StateNo != [5000,5299]
Trigger1 = Root,StateNo != [120,159]

;-------------------------------------------------------------------------
;ENEMY : 空中喰らい2
;-------------------------------------------------------------------------
[Statedef 50020]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0

[State 50020, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 50020, 落下解除]
Type = HitFallSet
Trigger1 = Time = 0
Value = 0

[State 50020, 1] ;Anim for HIT_LIGHT to HIT_HARD
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) != [3,5]
Value = IfElse((GetHitVar(AirType) = 1),5000,5010) + GetHitVar(AnimType)

[State 50020, 2] ;Anim for HIT_BACK
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) = [3,5]
Value = 5030

[State 50020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
Value = 5047 + GetHitVar(AnimType) ;5051 - 4 + Type

[State 50020, 4] ;Freeze Anim
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

[State 50020, HitVelSet]
Type = HitVelSet
Trigger1 = HitShakeOver
Trigger2 = Time = 100
X = 1
Y = 1

[State 50020, Are you dead?]
Type = SelfState
TriggerAll = !Alive
Trigger1 = HitShakeOver
Trigger2 = Time = 100
Value = 5050

[State 50020, 5]
Type = SelfState
Trigger1 = HitShakeOver
Trigger2 = Time = 100
Value = 5040

;-------------------------------------------------------------------------
;ENEMY : 壁バウンド相手硬直
;-------------------------------------------------------------------------
[Statedef 50050]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5030
PowerAdd = 0

;---------------------[例外処理]
[State 50050, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[アニメ]
[State 50050, Freeze Anim]
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

;---------------------[ステート移行]
[State 50050, 地面バウンド吹っ飛び下降へ]
Type = ChangeState
Trigger1 = HitShakeOver
Value = IfElse(PrevStateNo = 50059,50059,50051)

;-------------------------------------------------------------------------
;ENEMY : 壁バウンド吹っ飛び
;-------------------------------------------------------------------------
[Statedef 50051]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5035
PowerAdd = 0

;---------------------[例外処理]
[State 50051, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[速度]
[State 50051, 吹っ飛び速度]
Type = VelSet
Trigger1 = Time = 0
X = -16
Y = -6

;---------------------[重力]
[State 50051, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.25

;---------------------[演出]
[State 50051, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0
IgNoreHitPause = 1

[State 50051, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

;---------------------[アニメ]
[State 50051, Change Anim when done with Transition]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 50051, Coming Down Anim]
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

;---------------------[ステート移行]
[State 50051, 壁激突へ]
Type = ChangeState
Trigger1 = BackEdgeBodyDist <= 10
Value = IfElse(PrevStateNo = 50059,50059,50052)

[State 50051, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 壁激突
;-------------------------------------------------------------------------
[Statedef 50052]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5010
PowerAdd = 0

;---------------------[例外処理]
[State 50052, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[方向]
[State 50052, 振り向く]
Type = Turn
Trigger1 = Time = 0
Trigger1 = BackEdgeBodyDist > FrontEdgeBodyDist

;---------------------[移動]
[State 50052, 位置合わせ]
Type = PosAdd
Trigger1 = Time = 0
X = -BackEdgeBodyDist

;---------------------[演出]
[State 50052, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0
IgNoreHitPause = 1

[State 50052, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 50052, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

;---------------------[エフェクト]
[State 50052, Effect]
Type = GameMakeAnim
Trigger1 = Time = 0
Value = 72
Pos = 0, 0
Under = 0

;---------------------[サウンド]
[State 50052, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = F7, 2

;---------------------[アニメ]
[State 50052, Freeze Anim]
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

;---------------------[ステート移行]
[State 50052, 壁バウンドへ]
Type = ChangeState
Trigger1 = Time = 5
Value = IfElse(PrevStateNo = 50059,50059,50053)

;-------------------------------------------------------------------------
;ENEMY : 壁バウンド
;-------------------------------------------------------------------------
[Statedef 50053]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5035
PowerAdd = 0

;---------------------[例外処理]
[State 50053, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[速度]
[State 50053, 吹っ飛び速度]
Type = VelSet
Trigger1 = Time = 0
X = 1
Y = -10

[State 50053, 吹っ飛び速度(重複時)]
Type = VelSet
TriggerAll = PrevStateNo = 50059
Trigger1 = Time = 0
Y = -4

;---------------------[重力]
[State 50053, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.45

;---------------------[演出]
[State 50053, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0
IgNoreHitPause = 1

[State 50053, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

;---------------------[アニメ]
[State 50053, Change Anim when done with Transition]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 50053, Coming Down Anim]
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

[State 50053, 無敵を無効化]
Type = HitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

;---------------------[ステート移行]
[State 50053, 地上受身へ] ; Recover near ground (use ChangeState)
Type = SelfState
TriggerAll = PrevStateNo = 50059
TriggerAll = Vel Y > 0
TriggerAll = Pos Y >= -20
TriggerAll = Alive
Trigger1 = Command = "recovery"
Value = 5200 ;HITFALL_RECOVER

[State 50053, 空中受身へ] ; Recover in mid air (use SelfState)
Type = SelfState
TriggerAll = PrevStateNo = 50059
TriggerAll = Alive
Trigger1 = Command = "recovery"
Value = 5210 ;HITFALL_AIRRECOVER

[State 50053, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 壁バウンド重複フラグ
;-------------------------------------------------------------------------
[Statedef 50059]

;---------------------[ステート移行]
[State 50059, 壁バウンドへ]
Type = ChangeState
Trigger1 = PrevStateNo = 50052
Value = 50053

[State 50059, 壁激突へ]
Type = ChangeState
Trigger1 = PrevStateNo = 50051
Value = 50052

[State 50059, 吹っ飛び下降へ]
Type = ChangeState
Trigger1 = PrevStateNo = 50050
Value = 50051

[State 50059, 相手硬直へ]
Type = ChangeState
Trigger1 = 1
Value = 50050

;-------------------------------------------------------------------------
;ENEMY : 地面バウンド相手硬直
;-------------------------------------------------------------------------
[Statedef 50100]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5030
SprPriority = 2

;---------------------[例外処理]
[State 50100, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[アニメ]
[State 50100, Freeze Anim]
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

;---------------------[ステート移行]
[State 50100, 地面バウンド吹っ飛び下降へ]
Type = ChangeState
Trigger1 = HitShakeOver
Value = IfElse(PrevStateNo = 50109,50109,50101)

;-------------------------------------------------------------------------
;ENEMY : 地面バウンド吹っ飛び下降
;-------------------------------------------------------------------------
[Statedef 50101]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5050
SprPriority = 2

;---------------------[例外処理]
[State 50101, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[重力]
[State 50101, Gravity]
Type = VelAdd
Trigger1 = 1
Y = GetHitVar(YAccel)

;---------------------[速度]
[State 50101, 吹っ飛び速度]
Type = HitVelSet
Trigger1 = Time = 0
X = 1
Y = 1

;---------------------[アニメ]
[State 50101, Change Anim when done with Transition]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 50101, Coming Down Anim]
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

[State 50101, 喰らいアニメ参照]
Type = ChangeAnim2
Trigger1 = Anim != [5050,5069]
Trigger2 = !SelfAnimExist(5050)
Value = 50600
Persistent = 0

;---------------------[ステート移行]
[State 50101, 相手のステートを返還]
Type = SelfState
TriggerAll = Alive
TriggerAll = PrevStateNo = 50109
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= IfElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, 25)
Value = 5200

[State 50101, HIT_BOUNCE]
Type = ChangeState
TriggerAll = Alive
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= IfElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, 25)
Value = 50102

[State 50101, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= IfElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, 25)
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 床激突
;-------------------------------------------------------------------------
[Statedef 50102]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
SprPriority = 2

;---------------------[例外処理]
[State 50102, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[座標]
[State 50102, 接地する]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 50102, 停止]
Type = PosFreeze
Trigger1 = 1
Value = 1

;---------------------[演出]
[State 50102, EnvShake]
Type = FallEnvShake
Trigger1 = Time = 0

;---------------------[エフェクト]
[State 50102, Effect]
Type = GameMakeAnim
Trigger1 = Time = 0
Value = 62
Pos = 0, 0
Under = 0

;---------------------[サウンド]
[State 50102, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = F7, 2

;---------------------[アニメ]
[State 50102, Hit Ground Anim (Normal)]
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != 5070
Trigger1 = (Anim != [5051,5059]) && (Anim != [5061,5069])
Trigger2 = !SelfAnimExist(5100 + (Anim % 10))
Value = 5100

[State 50102, Hit Ground Anim (for hit up)]
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = (Anim = [5051,5059]) || (Anim = [5061,5069])
Trigger1 = SelfAnimExist(5100 + (Anim % 10))
Value = 5100 + (Anim % 10)

;---------------------[ステート移行]
[State 50102, 相手バウンドの状態へ]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 50103

;-------------------------------------------------------------------------
;ENEMY : 地面バウンド
;-------------------------------------------------------------------------
[Statedef 50103]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
SprPriority = 2

;---------------------[例外処理]
[State 50103, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[座標]
[State 50103, 接地する]
Type = PosSet
Trigger1 = Time = 0
Y = 0

;---------------------[速度]
[State 50103, 吹っ飛び速度]
Type = VelSet
Trigger1 = Time = 0
Y = -4.5

;---------------------[重力]
[State 50103, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.4

;---------------------[アニメ]
[State 50103, Coming hit Ground Anim (Normal)]
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != 5070
Trigger1 = Anim != [5101,5109]
Trigger2 = !SelfAnimExist(5160 + (Anim % 10))
Value = 5160

[State 50103, Coming hit Ground Anim (for hit up)]
Type = ChangeAnim
TriggerAll = Time = 0
Trigger1 = Anim = [5101,5109]
Trigger1 = SelfAnimExist(5160 + (Anim % 10))
Value = 5160 + (Anim % 10)

;---------------------[ステート移行]
[State 50103, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5110

;-------------------------------------------------------------------------
;ENEMY : 地面バウンド重複フラグ
;-------------------------------------------------------------------------
[Statedef 50109]

;---------------------[ステート移行]
[State 50109, 地面バウンド吹っ飛び下降へ]
Type = ChangeState
Trigger1 = PrevStateNo = 50100
Value = 50101

[State 50109, 地面バウンド相手硬直へ]
Type = ChangeState
Trigger1 = 1
Value = 50100

;-------------------------------------------------------------------------
;ENEMY : エリアル相手硬直
;-------------------------------------------------------------------------
[Statedef 50300]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5030
SprPriority = 2

;---------------------[例外処理]
[State 50300, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[アニメ]
[State 50300, Freeze Anim]
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

;---------------------[ステート移行]
[State 50300, エリアル吹っ飛び下降へ]
Type = ChangeState
Trigger1 = HitShakeOver
Value = 50301

;-------------------------------------------------------------------------
;ENEMY : エリアル吹っ飛び下降
;-------------------------------------------------------------------------
[Statedef 50301]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5050
SprPriority = 2

;---------------------[例外処理]
[State 50301, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[重力]
[State 50301, Gravity]
Type = VelAdd
Trigger1 = 1
Y = GetHitVar(YAccel)

;---------------------[速度]
[State 50301, 吹っ飛び速度]
Type = HitVelSet
Trigger1 = Time = 0
X = 1
Y = 1

;---------------------[アニメ]
[State 50301, Change Anim when done with Transition]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 50301, Coming Down Anim]
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

;---------------------[ステート移行]
[State 50301, HIT_BOUNCE]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= IfElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, 25)
Value = 50302

;-------------------------------------------------------------------------
;ENEMY : エリアル床激突
;-------------------------------------------------------------------------
[Statedef 50302]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
SprPriority = 2

;---------------------[例外処理]
[State 50302, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[座標]
[State 50302, 接地する]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 50302, 停止]
Type = PosFreeze
Trigger1 = 1
Value = 1

;---------------------[演出]
[State 50302, EnvShake]
Type = FallEnvShake
Trigger1 = Time = 0

;---------------------[エフェクト]
[State 50302, Effect]
Type = GameMakeAnim
Trigger1 = Time = 0
Value = 62
Pos = 0, 0
Under = 0

;---------------------[サウンド]
[State 50302, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = F7, 2

;---------------------[アニメ]
[State 50302, Hit Ground Anim (Normal)]
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != 5070
Trigger1 = (Anim != [5051,5059]) && (Anim != [5061,5069])
Trigger2 = !SelfAnimExist(5100 + (Anim % 10))
Value = 5100

[State 50302, Hit Ground Anim (for hit up)]
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = (Anim = [5051,5059]) || (Anim = [5061,5069])
Trigger1 = SelfAnimExist(5100 + (Anim % 10))
Value = 5100 + (Anim % 10)

;---------------------[ステート移行]
[State 50302, 相手バウンドの状態へ]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 50303

;-------------------------------------------------------------------------
;ENEMY : エリアル地面バウンド
;-------------------------------------------------------------------------
[Statedef 50303]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
SprPriority = 2

;---------------------[例外処理]
[State 50303, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[座標]
[State 50303, 接地する]
Type = PosSet
Trigger1 = Time = 0
Y = 0

;---------------------[速度]
[State 50303, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = -4.5

;---------------------[重力]
[State 50303, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.4

;---------------------[アニメ]
[State 50303, Coming hit Ground Anim (Normal)]
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != 5070
Trigger1 = Anim != [5101,5109]
Trigger2 = !SelfAnimExist(5160 + (Anim % 10))
Value = 5160

[State 50303, Coming hit Ground Anim (for hit up)]
Type = ChangeAnim
TriggerAll = Time = 0
Trigger1 = Anim = [5101,5109]
Trigger1 = SelfAnimExist(5160 + (Anim % 10))
Value = 5160 + (Anim % 10)

;---------------------[ステート移行]
[State 50303, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5110

;-------------------------------------------------------------------------
;ENEMY : 地面吹っ飛び相手硬直
;-------------------------------------------------------------------------
[Statedef 50500]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5030
SprPriority = 2

;---------------------[例外処理]
[State 50500, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[アニメ]
[State 50500, Freeze Anim]
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

;---------------------[ステート移行]
[State 50500, エリアル吹っ飛び下降へ]
Type = ChangeState
Trigger1 = HitShakeOver
Value = 50501

;-------------------------------------------------------------------------
;ENEMY : 地面吹っ飛び下降
;-------------------------------------------------------------------------
[Statedef 50501]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5050
SprPriority = 2

;---------------------[例外処理]
[State 50501, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[重力]
[State 50501, Gravity]
Type = VelAdd
Trigger1 = 1
Y = 0.35

;---------------------[速度]
[State 50501, 吹っ飛び速度]
Type = VelSet
Trigger1 = Time = 0
X = -4
Y = 8

;---------------------[アニメ]
[State 50501, Change Anim when done with Transition]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 50501, Coming Down Anim]
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

;---------------------[ステート移行]
[State 50501, HIT_BOUNCE]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= IfElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, 25)
Value = 50502

;-------------------------------------------------------------------------
;ENEMY : 地面吹っ飛び床激突
;-------------------------------------------------------------------------
[Statedef 50502]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
SprPriority = 2

;---------------------[例外処理]
[State 50502, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[座標]
[State 50502, 接地する]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 50502, 停止]
Type = PosFreeze
Trigger1 = 1
Value = 1

;---------------------[演出]
[State 50502, EnvShake]
Type = FallEnvShake
Trigger1 = Time = 0

;---------------------[エフェクト]
[State 50502, Effect]
Type = GameMakeAnim
Trigger1 = Time = 0
Value = 62
Pos = 0, 0
Under = 0

;---------------------[サウンド]
[State 50502, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = F7, 2

;---------------------[アニメ]
[State 50502, Hit Ground Anim (Normal)]
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != 5070
Trigger1 = (Anim != [5051,5059]) && (Anim != [5061,5069])
Trigger2 = !SelfAnimExist(5100 + (Anim % 10))
Value = 5100

[State 50502, Hit Ground Anim (for hit up)]
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = (Anim = [5051,5059]) || (Anim = [5061,5069])
Trigger1 = SelfAnimExist(5100 + (Anim % 10))
Value = 5100 + (Anim % 10)

;---------------------[ステート移行]
[State 50502, 相手バウンドの状態へ]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 50503

;-------------------------------------------------------------------------
;ENEMY : 地面吹っ飛び
;-------------------------------------------------------------------------
[Statedef 50503]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
SprPriority = 2

;---------------------[例外処理]
[State 50503, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

;---------------------[座標]
[State 50503, 接地する]
Type = PosSet
Trigger1 = Time = 0
Y = 0

;---------------------[速度]
[State 50503, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -4
Y = -8

;---------------------[重力]
[State 50503, Gravity]
Type = VelAdd
Trigger1 = 1
Y = 0.35

;---------------------[アニメ]
[State 50503, Coming hit Ground Anim (Normal)]
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != 5070
Trigger1 = Anim != [5101,5109]
Trigger2 = !SelfAnimExist(5160 + (Anim % 10))
Value = 5160

[State 50503, Coming hit Ground Anim (for hit up)]
Type = ChangeAnim
TriggerAll = Time = 0
Trigger1 = Anim = [5101,5109]
Trigger1 = SelfAnimExist(5160 + (Anim % 10))
Value = 5160 + (Anim % 10)

;---------------------[ステート移行]
[State 50503, 相手バウンドの状態へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 50302

;-------------------------------------------------------------------------
;HELPER : システム用常駐ヘルパー
;-------------------------------------------------------------------------
[Statedef 60660000]
Ctrl = 0
Anim = 10000

;Var(0)  = 
;Var(1)  = 
;Var(2)  = ﾌﾚｪｪｪｪｪﾝｽﾞフラグ
;Var(3)  = ﾌﾚｪｪｪｪｪﾝｽﾞカウント
;Var(4)  = 
;Var(5)  = 死兆星カットイン判定
;Var(6)  = 鬼太郎（蝋燭）＆早苗さん（★ゲージ）＆柊やがみ（一撃ゲージ）カットイン用
;Var(7)  = 
;Var(8)  = 
;Var(9)  = 

;---------------------[当身関係]
[State 60660000, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1

[State 60660000, 再起動]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = StateNo
Time = 1
ForceAir = 0

;---------------------[移動]
[State 60660000, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0,0

;---------------------[特殊効果]
[State 60660000, 不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
Flag2 = Invisible

;---------------------[]
[State 60660000, フラグ]
Type = VarSet
TriggerAll = IsHelper
TriggerAll = Root,Var(36) > 0
TriggerAll = Root,RoundState = 3
TriggerAll = Root,MatchOver = 1
TriggerAll = Root,WinKO
Trigger1 = Root,StateNo = [3000,3999]
V = 2
Value = 1

[State 60660000, SE]
Type = PlaySnd
Trigger1 = Var(2) = 1
Value = 9999, 0
Volume = 255
AbsPan = 0
Persistent = 0

[State 60660000, カウント]
Type = VarAdd
Trigger1 = Var(2) = 1
V = 3
Value = 1

[State 60660000, 演出時間の延長]
Type = AssertSpecial
Trigger1 = Var(2) = 1
Trigger1 = Var(3) <= 8 * TicksPerSecond
Flag = RoundNotOver

[State 60660000, ステージBGMを消す]
Type = AssertSpecial
Trigger1 = Var(2) = 1
Flag = NoMusic

;---------------------[P2MANE]
[State ];死兆星カットイン判定
type=Varset
triggerall=roundstate!=0
trigger1=enemy,Authorname="Drowin hokuto"&&enemy,var(24)>=7&&(enemy,name="KENSHIRO"||enemy,name="RAOH"||enemy,name="Toki"||enemy,name="JAGI"||enemy,name="MOHIKAN"||enemy,name="amiba")
trigger2=enemy,Authorname="ahuron"&&((enemy,var(4)>=7&&(enemy,name="JAGI"||enemy,name="REI"||enemy,name="THOUTHER"||enemy,name="SHIN"))||(enemy,name="Heart&Heart"&&enemy,var(28)>=7))
trigger3=(enemy,Authorname="Ts"&&enemy,var(7)>=7&&(enemy,name="Toki"||enemy,name="Amiba"||enemy,name="Jagi"||enemy,name="JagiMeirin"))||(enemy,name="MAMIYA"&&enemy,Authorname="YU-TOHARU"&&enemy,var(51)=7&&enemy,palno!=7)
trigger4=enemy,Authorname="shuu"&&enemy,var(20)<=0&&(enemy,name="Toki Hakurei"||enemy,name="REIsen U Inaba"||enemy,name="TEOC REISEN"||enemy,name="TOKI_S"||enemy,name="Chiester410_S")
trigger5=enemy,Authorname="SAIKEI"&&enemy,fvar(1)<=0&&(enemy,name="KENSHIRO-SAIKEI"||enemy,name="KENSHIRO"||enemy,name="THOUTHER"||enemy,name="JUDA")
trigger6=enemy,Authorname="Tamago Kanten"&&((enemy,var(35)=7&&(enemy,name="tenshi_rei"||enemy,name="tenshi"))||(enemy,var(35)=7&&enemy,name="ikusan_juda"))
trigger7=(enemy,Authorname="NERICYA"&&enemy,var(20)<=0&&(enemy,name="TOKI-(NERICYA)"||enemy,name="JUDA-(NERICYA)"))||(enemy,name="Mr.HEART"&&enemy,Authorname="rei"&&enemy,var(27)=0)
trigger8=(enemy,Authorname="Nachel_Arrange_By_RockMARISA"&&enemy,var(57)>=7&&(enemy,name="HAKUREI"||enemy,name="TELETTE"))||(enemy,name="MegaMari"&&enemy,Authorname="RockMARISA"&&enemy,var(41)>=7)
trigger9=enemy,var(24)>=7&&((enemy,Authorname="Drowin"&&(enemy,name="Nagato Yuki"||enemy,name="Q-drowin"))||(enemy,Authorname="Drowin arcana"&&(enemy,name="Setsuna Sakurazaki"||enemy,name="Yumeka Ohajiki")))
trigger10=enemy,Authorname="simotsuki"&&((enemy,var(31)>=7&&(enemy,name="A-Rei"||enemy,name="saint-of-silver"||enemy,name="Rasho-Zero"))||(enemy,name="silver_of_saint"&&enemy,var(24)>=7))
trigger11=(enemy,Authorname="KAZ"&&enemy,var(28)>=7&&(enemy,name="Blue Eyes White Karin"||enemy,name="Master Sakura"))||(enemy,name="S-Tomy"&&enemy,Authorname="mosa"&&enemy,var(53)<=0)
trigger12=enemy,var(4)>=7&&((enemy,name="Hong Meilin"&&enemy,Authorname="barai")||(enemy,name="Buront"&&enemy,Authorname="kunshomo")||(enemy,name="KENSHIRO"&&enemy,Authorname="Cameron"))
trigger13=enemy,var(24)=7&&((enemy,name="amiba"&&enemy,Authorname="oki")||(enemy,name="CHENSHIROU"&&enemy,Authorname="seapon")||(enemy,name="KOMAOH"&&enemy,Authorname="Drowin hokuto_Unknown"))
trigger14=enemy,var(20)<=0&&((enemy,name="Ayu Tukumiya"&&enemy,Authorname="IYO")||(enemy,name="TOKI-(NERICYA) reimu patch"&&enemy,Authorname="NERICYA+lanperu"))
trigger15=(enemy,var(7)>=7&&((enemy,name="RAOH"&&enemy,Authorname="shikkoku")||(enemy,name="Shuh"&&enemy,Authorname="Fixxxer+Ts")))||(enemy,name="Hong Meirin"&&enemy,Authorname="hato"&&enemy,var(45)=1)
trigger16=(enemy,var(49)=7&&enemy,name="shiki_tohno"&&(enemy,Authorname="チユリ"||enemy,Authorname="チユリ&&エス"))||(enemy,var(38)=70&&enemy,name="zeroko"&&(enemy,Authorname="FenNes&5667&チユリ&エス"||enemy,Authorname=""))
trigger17=(enemy,var(7)=0&&((enemy,name="shin"&&enemy,Authorname="konpeitou")||(enemy,name="Arima_Miyako"&&enemy,Authorname="deretun")))||(enemy,name="hakureimu"&&enemy,Authorname="すとれいりとでび"&&enemy,var(13)>=7)
trigger18=(enemy,name="Mei"&&enemy,Authorname="霊柩なき者"&&enemy,var(55)<=0)||(enemy,name="ikusan"&&enemy,Authorname="ikusan"&&enemy,var(20)=7)||(enemy,name="SHYU"&&enemy,Authorname="Fixxxer"&&enemy,var(3)>=7)
trigger19=(enemy,name="RAOH ATL"&&enemy,Authorname="Ataru"&&enemy,var(8)<=0)||(enemy,name="KaLen"&&enemy,Authorname="BluishCat"&&enemy,var(50)=7)
trigger20=enemy,name="M-Reimu"&&enemy,authorName="okihaito"&&enemy,var(57)>=7&&enemy,SelfAnimExist(1000000001)=0&&enemy,PalNo<10&&(enemy,sysvar(4)&8388608)=0
trigger21=enemy,name="M-Reimu"&&enemy,authorname="okihaito"&&(((Floor(enemy,fvar(39))&960)/64)=[1,9])&&enemy,SelfAnimExist(1000000001)&&enemy,NumProjID(890101603)+((Floor(enemy,fvar(39))&7168)/1024)=0
trigger22=enemy,name="Order_Sol_Fist_of_North_Star"&&enemy,Authorname="flowrallia"&&enemy,var(4)>=7
var(5)=10
persistent=0

[State ]
type=Varset
triggerall=roundstate!=0&&numenemy>=2
trigger1=enemy(1),Authorname="Drowin hokuto"&&enemy(1),var(24)>=7&&(enemy(1),name="KENSHIRO"||enemy(1),name="RAOH"||enemy(1),name="Toki"||enemy(1),name="JAGI"||enemy(1),name="MOHIKAN"||enemy(1),name="amiba")
trigger2=enemy(1),Authorname="ahuron"&&((enemy(1),var(4)>=7&&(enemy(1),name="JAGI"||enemy(1),name="REI"||enemy(1),name="THOUTHER"||enemy(1),name="SHIN"))||(enemy(1),name="Heart&Heart"&&enemy(1),var(28)>=7))
trigger3=(enemy(1),Authorname="Ts"&&enemy(1),var(7)>=7&&(enemy(1),name="Toki"||enemy(1),name="Amiba"||enemy(1),name="Jagi"||enemy(1),name="JagiMeirin"))||(enemy(1),name="MAMIYA"&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),var(51)=7&&enemy(1),palno!=7)
trigger4=enemy(1),Authorname="shuu"&&enemy(1),var(20)<=0&&(enemy(1),name="Toki Hakurei"||enemy(1),name="REIsen U Inaba"||enemy(1),name="TEOC REISEN"||enemy(1),name="TOKI_S"||enemy(1),name="Chiester410_S")
trigger5=enemy(1),Authorname="SAIKEI"&&enemy(1),fvar(1)<=0&&(enemy(1),name="KENSHIRO-SAIKEI"||enemy(1),name="KENSHIRO"||enemy(1),name="THOUTHER"||enemy(1),name="JUDA")
trigger6=enemy(1),Authorname="Tamago Kanten"&&((enemy(1),var(35)=7&&(enemy(1),name="tenshi_rei"||enemy(1),name="tenshi"))||(enemy(1),var(35)=7&&enemy(1),name="ikusan_juda"))
trigger7=(enemy(1),Authorname="NERICYA"&&enemy(1),var(20)<=0&&(enemy(1),name="TOKI-(NERICYA)"||enemy(1),name="JUDA-(NERICYA)"))||(enemy(1),name="Mr.HEART"&&enemy(1),Authorname="rei"&&enemy(1),var(27)=0)
trigger8=(enemy(1),Authorname="Nachel_Arrange_By_RockMARISA"&&enemy(1),var(57)>=7&&(enemy(1),name="HAKUREI"||enemy(1),name="TELETTE"))||(enemy(1),name="MegaMari"&&enemy(1),Authorname="RockMARISA"&&enemy(1),var(41)>=7)
trigger9=enemy(1),var(24)>=7&&((enemy(1),Authorname="Drowin"&&(enemy(1),name="Nagato Yuki"||enemy(1),name="Q-drowin"))||(enemy(1),Authorname="Drowin arcana"&&(enemy(1),name="Setsuna Sakurazaki"||enemy(1),name="Yumeka Ohajiki")))
trigger10=enemy(1),Authorname="simotsuki"&&((enemy(1),var(31)>=7&&(enemy(1),name="A-Rei"||enemy(1),name="saint-of-silver"||enemy(1),name="Rasho-Zero"))||(enemy(1),name="silver_of_saint"&&enemy(1),var(24)>=7))
trigger11=(enemy(1),Authorname="KAZ"&&enemy(1),var(28)>=7&&(enemy(1),name="Blue Eyes White Karin"||enemy(1),name="Master Sakura"))||(enemy(1),name="S-Tomy"&&enemy(1),Authorname="mosa"&&enemy(1),var(53)<=0)
trigger12=enemy(1),var(4)>=7&&((enemy(1),name="Hong Meilin"&&enemy(1),Authorname="barai")||(enemy(1),name="Buront"&&enemy(1),Authorname="kunshomo")||(enemy(1),name="KENSHIRO"&&enemy(1),Authorname="Cameron"))
trigger13=enemy(1),var(24)=7&&((enemy(1),name="amiba"&&enemy(1),Authorname="oki")||(enemy(1),name="CHENSHIROU"&&enemy(1),Authorname="seapon")||(enemy(1),name="KOMAOH"&&enemy(1),Authorname="Drowin hokuto_Unknown"))
trigger14=enemy(1),var(20)<=0&&((enemy(1),name="Ayu Tukumiya"&&enemy(1),Authorname="IYO")||(enemy(1),name="TOKI-(NERICYA) reimu patch"&&enemy(1),Authorname="NERICYA+lanperu"))
trigger15=(enemy(1),var(7)>=7&&((enemy(1),name="RAOH"&&enemy(1),Authorname="shikkoku")||(enemy(1),name="Shuh"&&enemy(1),Authorname="Fixxxer+Ts")))||(enemy(1),name="Hong Meirin"&&enemy(1),Authorname="hato"&&enemy(1),var(45)=1)
trigger16=(enemy(1),var(49)=7&&enemy(1),name="shiki_tohno"&&(enemy(1),Authorname="チユリ"||enemy(1),Authorname="チユリ&&エス"))||(enemy(1),var(38)=70&&enemy(1),name="zeroko"&&(enemy(1),Authorname="FenNes&5667&チユリ&エス"||enemy(1),Authorname=""))
trigger17=(enemy(1),var(7)=0&&((enemy(1),name="shin"&&enemy(1),Authorname="konpeitou")||(enemy(1),name="Arima_Miyako"&&enemy(1),Authorname="deretun")))||(enemy(1),name="hakureimu"&&enemy(1),Authorname="すとれいりとでび"&&enemy(1),var(13)>=7)
trigger18=(enemy(1),name="Mei"&&enemy(1),Authorname="霊柩なき者"&&enemy(1),var(55)<=0)||(enemy(1),name="ikusan"&&enemy(1),Authorname="ikusan"&&enemy(1),var(20)=7)||(enemy(1),name="SHYU"&&enemy(1),Authorname="Fixxxer"&&enemy(1),var(3)>=7)
trigger19=(enemy(1),name="RAOH ATL"&&enemy(1),Authorname="Ataru"&&enemy(1),var(8)<=0)||(enemy(1),name="KaLen"&&enemy(1),Authorname="BluishCat"&&enemy(1),var(50)=7)
trigger20=enemy(1),Name="M-Reimu"&&enemy(1),authorName="okihaito"&&enemy(1),var(57)>=7&&enemy(1),SelfAnimExist(1000000001)=0&&enemy(1),PalNo<10&&(enemy(1),sysvar(4)&8388608)=0
trigger21=enemy(1),Name="M-Reimu"&&enemy(1),authorname="okihaito"&&(((Floor(enemy(1),fvar(39))&960)/64)=[1,9])&&enemy(1),SelfAnimExist(1000000001)&&enemy(1),NumProjID(890101603)+((Floor(enemy(1),fvar(39))&7168)/1024)=0
trigger22=enemy(1),name="Order_Sol_Fist_of_North_Star"&&enemy(1),Authorname="flowrallia"&&enemy(1),var(4)>=7
var(5)=10
persistent=0


[State ]
type=Varadd
trigger1=var(5)>=10
var(5)=1

[State ];鬼太郎（蝋燭）＆早苗さん（★ゲージ）＆柊やがみ（一撃ゲージ）カットイン用
type=Varset
triggerall=roundstate!=0
trigger1=(enemy,var(15)=0&&enemy,name="kitarou"&&(enemy,Authorname="Elecbyte"||enemy,Authorname="mother earth"))||(enemy,name="sanaesan"&&enemy,Authorname="huihui"&&enemy,var(4)>=9)
trigger2=enemy,name="yagami"&&enemy,Authorname="Yogoreneko"&&enemy,var(16)=800
trigger3=numenemy>=2
trigger3=(enemy(1),var(15)=0&&enemy(1),name="kitarou"&&(enemy(1),Authorname="Elecbyte"||enemy(1),Authorname="mother earth"))||(enemy(1),name="sanaesan"&&enemy(1),Authorname="huihui"&&enemy(1),var(4)>=9)
trigger4=numenemy>=2
trigger4=enemy(1),name="yagami"&&enemy(1),Authorname="Yogoreneko"&&enemy(1),var(16)=800
var(6)=10
persistent=0

[State ]
type=Varadd
trigger1=var(6)=[10,30]
var(6)=1

[State 7];死兆星カットイン
type=Explod
trigger1=TeamSide=1&&(var(5)=11||var(6)=11)
anim=103046
ID=3759
postype=right
pos=0,90
scale=0.5,0.5
sprpriority=-5
bindtime=-1
pausemovetime=100
supermovetime=100

[State 7];死兆星カットイン2P
type=Explod
trigger1=TeamSide=2&&(var(5)=11||var(6)=11)
anim=103046
ID=3759
postype=left
pos=0,90
scale=0.5,0.5
sprpriority=-5
facing=-1
bindtime=-1
pausemovetime=100
supermovetime=100

[State ]
type=modifyexplod
trigger1=(var(5)=[11,12])||(var(6)=[11,12])
ID=3759
scale=0.5,3

[State ]
type=modifyexplod
trigger1=var(5)=13||var(6)=13
ID=3759
scale=0.5,0.1

[State ]
type=modifyexplod
trigger1=var(5)=14||var(6)=14
ID=3759
scale=0.5,0.2

[State ]
type=modifyexplod
trigger1=var(5)=15||var(6)=15
ID=3759
scale=0.5,0.3

[State ]
type=modifyexplod
trigger1=var(5)=16||var(6)=16
ID=3759
scale=0.5,0.4

[State ]
type=modifyexplod
trigger1=var(5)>=17||var(6)>=17
ID=3759
scale=0.5,0.5

[state ];死兆星ボイス
type=PlaySnd
TriggerAll = IsHelper
trigger1=var(5)=11
value=100000 + Root,Var(33),3759
abspan=floor(root,pos x)
Volume = 192

;-------------------------------------------------------------------------
;P2NAME : 特殊演出対応
;-------------------------------------------------------------------------
;---------------------[dknさん]
;***シャルロットのヒールライト用ヘルパー
[Statedef 19858]
type    = A
movetype= I
physics = N
juggle  = 0
ctrl = 0
anim = IfElse(root,statetype=A,19859,19858)
velset = 0,0
poweradd = 0
sprpriority = 3

;無敵
[State 19858]
type = nothitby
trigger1 = 1
value = SCA
ignorehitpause = 1

[State 19858]
type = PalFX
trigger1 = time = 122
time = 128
add = 10,140,110
sinadd = -30,-30,-30,64
invertall = 0
color = 256

[State 19858, loop]
type = HitOverride
trigger1 = ishelper
attr = SCA,AA,AP,AT
stateno = 19858
time = -1
ignorehitpause = 1

[State 19858]
type = DestroySelf
trigger1 = Time = 297

;-------------------------------------------------------------------------
;---------------------[KAZさん]
; ストII VS. 画面イントロ
[StateDef 19601223];←このステートNo.は絶対に変えないでください。ガイル側が検知できなくなります。
Type = S
Ctrl = 0
Anim = 0
VelSet = 0,0

[State 19601223, VarSet];飛行機の行き先を設定できます。
Type = VarSet
Trigger1 = 1
sysvar(4) = 4 ;←0～14までの任意の数値を入れてください。なお指定以外の数値は0とみなされます。
;0=日本南部（＝リュウ）
;1=日本北部（＝Ｅ・本田）
;2=ブラジル（＝ブランカ）
;3=アメリカ南部（＝ガイル）
;4=アメリカ北部（＝ケン）
;5=中国（＝チュンリー）
;6=ロシア（＝ザンギエフ）
;7=インド（＝ダルシム）
;8=アメリカ北西部（＝Ｍ・バイソン）
;9=スペイン（＝バルログ）
;10=タイ（＝サガット・ベガ）
;11=メキシコ（＝Ｔ・ホーク）
;12=香港（＝フェイロン）
;13=ジャマイカ（＝ディージェイ）
;14=イギリス（＝キャミィ）

[State 19601223, 1]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT

[State 19601223, 2]; 自分側グラフィック(1P時)
Type = Explod
TriggerAll = TeamSide = 1
Trigger1 = Time = 0
Anim = 18000;←アニメ番号は任意で決めてください。
ID = 18000;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 10,164
PosType = Left
Facing = 1
SprPriority = 99993
OwnPal = 1
BindTime = -1
ReMoveTime = 2

[State 19601223, 3]; 自分側Name(1P時)
Type = Explod
TriggerAll = TeamSide = 1
Trigger1 = Time = 0
Anim = 18100;←アニメ番号は任意で決めてください。
ID = 18000;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 60,168
PosType = Left
Facing = 1
SprPriority = 99996
OwnPal = 1
BindTime = -1
ReMoveTime = 2

[State 19601223, 4]; 自分側グラフィック(2P時)
Type = Explod
TriggerAll = TeamSide = 2
Trigger1 = Time = 0
Anim = 18000;←アニメ番号は任意で決めてください。
ID = 18000;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -10,164
PosType = Right
Facing = -1
SprPriority = 99993
OwnPal = 1
BindTime = -1
ReMoveTime = 2

[State 19601223, 5]; 自分側Name(2P時)
Type = Explod
TriggerAll = TeamSide = 2
Trigger1 = Time = 0
Anim = 18100;←アニメ番号は任意で決めてください。
ID = 18000;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -60,168
PosType = Right
Facing = 1
SprPriority = 99996
OwnPal = 1
BindTime = -1
ReMoveTime = 2

[State 19601223, 6]
Type = ReMoveExplod
Trigger1 = Time >= 3
ID = 18000;←アニメID番号は上記のIDでお願いします。そうしないとアニメが消えなくなります。

[State 19601223, 7]
Type = SelfState
Trigger1 = Time > 3
Value = 0
Ctrl = 0

; スパII&&スパIIＸ VS. 画面イントロ
[StateDef 19680301];←このステートNo.は絶対に変えないでください。チュンリー側が検知できなくなります。
Type = S
Ctrl = 0
Anim = 0
VelSet = 0,0

[State 19680301, VarSet];飛行機の行き先を設定できます。
Type = VarSet
Trigger1 = 1
sysvar(4) = 4 ;←0～14までの任意の数値を入れてください。なお指定以外の数値は0とみなされます。
;0 or 1 =日本
;2 =ブラジル
;3 or 4 or 8 =アメリカ
;5 =中国
;6 =ロシア
;7 =インド
;9 =スペイン
;10 =タイ
;11 =メキシコ
;12 =香港
;13 =ジャマイカ
;14 =イギリス

[State 19680301, 1]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT

[State 19680301, 2]; 自分側グラフィック(1P側)
Type = Explod
Trigger1 = TeamSide = 1 && Enemy,StateNo = [193,194]
Persistent = 0
Anim = 18000;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 10,164
PosType = Left
Facing = 1
SprPriority = 99993
OwnPal = 1
BindTime = -1
ReMoveTime = 400
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State 19680301, 3]; 自分側Name(1P側)スパIIイントロ時
Type = Explod
Trigger1 = TeamSide = 1 && Enemy,StateNo = 193
Persistent = 0
Anim = 18101;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 60,168
PosType = Left
Facing = 1
SprPriority = 99996
OwnPal = 1
BindTime = -1
ReMoveTime = 400
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State 19680301, 4]; 自分側Name(1P側)スパIIＸイントロ時
Type = Explod
Trigger1 = TeamSide = 1 && Enemy,StateNo = 194
Persistent = 0
Anim = 18102;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 60,184
PosType = Left
Facing = 1
SprPriority = 99996
OwnPal = 1
BindTime = -1
ReMoveTime = 400
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State 19680301, 5]; 自分側グラフィック(2P時)
Type = Explod
Trigger1 = TeamSide = 2 && Enemy,StateNo = [193,194]
Persistent = 0
Anim = 18000;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -11,164
PosType = Right
Facing = -1
SprPriority = 99993
OwnPal = 1
BindTime = -1
ReMoveTime = 400
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State 19680301, 6]; 自分側Name(2P側)スパIIイントロ時
Type = Explod
Trigger1 = TeamSide = 2 && Enemy,StateNo = 193
Persistent = 0
Anim = 18101;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -60,168
PosType = Right
Facing = 1
SprPriority = 99996
OwnPal = 1
BindTime = -1
ReMoveTime = 400
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State 19680301, 7]; 自分側Name(2P側)スパIIＸイントロ時
Type = Explod
Trigger1 = TeamSide = 2 && Enemy,StateNo = 194
Persistent = 0
Anim = 18103;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -60,184
PosType = Right
Facing = 1
SprPriority = 99996
OwnPal = 1
BindTime = -1
ReMoveTime = 400
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State 19680301, 8]
Type = ReMoveExplod
Trigger1 = Time >= 4
ID = 18100;←アニメID番号は上記のIDでお願いします。そうしないとアニメが消えなくなります。

[State 19680301, 9]
Type = SelfState
Trigger1 = Time > 4
Value = 0
Ctrl = 0

;-------------------------------------------------------------------------
;---------------------[Iwakickさん]
[Statedef 100191]; VS iwakick
type = L
ctrl = 0
velset = 0,0
anim = 0

[state a]
type = varset
trigger1 = enemy,authorname = "iwakick"
trigger1 = enemy,name = "silversamurai"
trigger1 = sysvar(0) = 0
sysvar(0) = 100191

[state a]
type = varset
trigger1 = enemy,authorname = "iwakick"
trigger1 = enemy,name = "silversamurai"
trigger1 = sysvar(1) = 0
sysvar(1) = 1

[state a]
type = varset
trigger1 = enemy,authorname = "iwakick"
trigger1 = enemy,name = "silversamurai"
trigger1 = sysvar(2) = 0
sysvar(2) = 0

[state a]
type = varset
trigger1 = enemy,authorname = "iwakick"
trigger1 = enemy,name = "spiral"
trigger1 = sysvar(0) = 0
sysvar(0) = 100191

[state a]
type = varset
trigger1 = enemy,authorname = "iwakick"
trigger1 = enemy,name = "spiral"
trigger1 = sysvar(1) = 0
sysvar(1) = 1

[state a]
type = varset
trigger1 = enemy,authorname = "iwakick"
trigger1 = enemy,name = "spiral"
trigger1 = sysvar(2) = 0
sysvar(2) = 0

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro
flag2 = noshadow
flag3 = invisible

[state 191]
type = hitby
trigger1 = numenemy
trigger1 = enemy,authorname = "iwakick"
value = S, HT

[State 191, 3]
type = ChangeState
trigger1 = roundno = 1
trigger1 = time = 31
value = 190

[State 191, 3]
type = ChangeState
trigger1 = roundno > 1
trigger1 = time = 31
value = 5900

;---------------------------------------------------------------------------
[Statedef 100192]; VS iwakick helper
type = L
ctrl = 0
velset = 0,0
anim = 0

[state 191]
type = hitby
trigger1 = numenemy
trigger1 = enemy,authorname = "iwakick"
value = S, HT

[State 191, 2]
type = AssertSpecial
trigger1 = 1
flag = noshadow
flag2 = invisible

[State 191, 3]
type = destroyself
triggerall = ishelper
trigger1 = roundstate > 1
trigger2 = root,alive = 0

;---------------------------------------------------------------------------
[Statedef 100194]; VS iwakick helper
type = S
ctrl = 0
velset = 0,0
anim = 0
SprPriority = 65

[state a]
type = assertspecial
trigger1 = enemy,anim != 183
flag = invisible

[state a]
type = turn
triggerall = enemy,var(16) = 0
trigger1 = root,teamside = 1
trigger1 = facing = -1
trigger2 = root,teamside = 2
trigger2 = facing = 1

[state a]
type = varset
trigger1 = time = 0
v = 0
value = floor(screenpos y)
persistent = 0

[state a]
type = posset
trigger1 = time = 1
y = var(0) - var(0)

[state a]
type = varset
trigger1 = time = 2
v = 0
value = 240 - floor(screenpos y)
persistent = 0

[state a]
type = posset
trigger1 = time = 3
x = -facing * 60
y = -20 + var(0)

;---------------------------------------------------------
;VS処理
[state a]
type = posset
trigger1 = enemy,var(16)
x = facing * 240 + (var(1) * facing)
y = -180 + var(0) + var(2)
persistent = 0

[state a]
type = posadd
trigger1 = enemy,var(16) = [21,50]
x = -facing * facing * 16
y = -2

[state a]
type = posset
trigger1 = enemy,var(16) = 51
x = -facing * 240 + (var(1) * facing)
y = -240 + var(0) + var(2)

[state a]
type = posadd
trigger1 = enemy,var(16) > 80
x = 0.1

[state a]
type = SprPriority
trigger1 = enemy,var(16)
value = 54

[State 191, 3]
type = destroyself
triggerall = ishelper
trigger1 = roundstate > 1
trigger2 = root,alive = 0

;下記任意と明記された部分は対応者様側で任意の数値を代入して下さい。
;=========================================================
;ポージング
[state a]
type = changeanim
trigger1 = enemy,anim = 183
value = 100191;任意
persistent = 0

;↓下記changeanimは自由に編集して構いません。
[state a];任意(最後のアニメを繰り返したい、停止したい場合等)
type = Null;changeanim
trigger1 = enemy,anim = 183
trigger1 = animelemno(0) = 2
value = anim
elem = 1

;---------------------------------------------------------
;VS処理
[state a];カットインアニメのX軸調整(任意)
type = varset
trigger1 = 1
v = 1
value = 50

[state a];カットインアニメのY軸調整(任意)
type = varset
trigger1 = 1
v = 2
value = 10

[state a];任意(カットインアニメがない場合はポートレイトで代用、もしくは対応者様側で他画像指定して下さい)
type = changeanim
trigger1 = enemy,var(16)
value = 9003
persistent = 0

[state a];任意
type = angledraw
trigger1 = enemy,var(16)
scale = 1,1

;---------------------------------------------------------------------------
[Statedef 100195]; VS iwakick helper
type = S
ctrl = 0
velset = 0,0
anim = 0
sprpriority = 65

[State 191, 2]
type = AssertSpecial
trigger1 = enemy,var(16) < 1000
trigger2 = enemy,var(16) = [10000,1000000]
flag = invisible

[state a]
type = turn
triggerall = enemy,var(16) = 0
trigger1 = root,teamside = 1
trigger1 = facing = -1
trigger2 = root,teamside = 2
trigger2 = facing = 1

[state a]
type = varset
trigger1 = time = 1
v = 1
value = facing

[state a]
type = varadd
trigger1 = enemy,numhelper(18060)
trigger2 = enemy,numhelper(18062)
v = 10
value = 1

[state a]
type = posset
trigger1 = time = 0
y = 0

[state a]
type = varset
trigger1 = time = 0
v = 0
value = floor(screenpos y)
persistent = 0

[state a]
type = varset
trigger1 = time = 1
v = 0
value = 240 - floor(screenpos y)
persistent = 0

[state a]
type = posset
trigger1 = var(10) = 23
x = facing * (-100)
y = -20 + var(0)

;---------------------------------------------------------
;VS処理
[state a]
type = posset
trigger1 = enemy,var(16) > 1000000
x = (-facing * (enemy,var(0))) + (-facing*var(1))
y = var(0) + 240 + var(2)
persistent = 0

[state a]
type = posadd
trigger1 = enemy,var(16) = [1000000,1000010]
x = 1
y = -10

[state a]
type = posadd
trigger1 = enemy,var(16) > 1000010
x = 0.05
y = -0.1

[state a]
type = SprPriority
trigger1 = 1
value = 62

[State 191, 3]
type = destroyself
triggerall = ishelper
trigger1 = roundstate > 1
trigger2 = root,alive = 0
trigger3 = root,stateno = [1,199]
trigger4 = enemy,stateno = 199
trigger5 = enemy,stateno = 192

;下記任意と明記された部分は対応者様側で任意の数値を代入して下さい。
;=========================================================
;ポージング
[state a]
type = changeanim
trigger1 = enemy,var(16) > 1000
value = 100191;任意
persistent = 0

;↓下記changeanimは自由に編集して構いません。
[state a];任意(最後のアニメを繰り返したい、停止したい場合等)
type = Null;changeanim
trigger1 = enemy,var(16) > 1000
trigger1 = animelemno(0) = 2
value = anim
elem = animelemno(0)

;---------------------------------------------------
;音声処理
[state a];登場時音声
type = playsnd
TriggerAll = IsHelper
trigger1 = enemy,var(16) > 1000
value = 100000 + Root,Var(33),100191;任意
channel = 1
volume = 200
persistent = 0

[state a];カットイン音声
type = playsnd
TriggerAll = IsHelper
trigger1 = enemy,var(16) > 1000000
value = 100000 + Root,Var(33),100195;任意
channel = 2
volume = 200
persistent = 0

;---------------------------------------------------------
;VS処理
;※SFF画像登録の初期軸が0,0で
;画像サイズが500*500の場合の推奨代入値は
;X = 0
;Y = -(元の画像Yの数値*Scale) - ((元の画像Yの数値/2)*Scale)
;例
;画像サイズ500で[Size]項目のxscaleが0.5の場合
;-(500*0.5) - ((500/2)*0.5)
;結果
;X = 0
;Y = -375 ここから細かい画像位置を調整して下さい

[state a];カットインアニメのX軸調整(任意)
type = varset
trigger1 = 1
v = 1
value = 30

[state a];カットインアニメのY軸調整(任意)
type = varset
trigger1 = 1
v = 2
value = -375 + 50

[state a];任意(カットインアニメがない場合はポートレイトで代用、もしくは対応者様側で他画像指定して下さい)
type = changeanim
trigger1 = enemy,var(16) > 10000
value = 9003
persistent = 0

[state a];任意
type = angledraw
trigger1 = enemy,var(16) > 10000
scale = 1,1

;-------------------------------------------------------------------------
;---------------------[ブラウンさん]
;ＳＮＫネオジオ維新軍対応ステート（ヘルパー）
[Statedef 103880]
type=A
physics=N
ctrl=0
anim=10000

[State ]
type=varset
trigger1=time=0
var(0)=id-1

[State ]
type=DestroySelf
trigger1=(root,stateno!=[3893,3896])&&enemynear,stateno!=3810

;-------------------------------------------------------------------------
;---------------------[laiso_7さん]
;開始前の動作　サムチャイ
[Statedef 547]
type=S
ctrl=0
anim=10000
velset=0,0

[State ]
type=AssertSpecial
trigger1=1
flag=Intro
flag2=invisible

[State ]
type=Explod
trigger1=time=0
anim=108205
postype=left
pos=ifelse(teamside=1,25,295),82
scale=1,1
ontop=1
bindtime=-1
facing=ifelse(teamside=1,1,-1)

[State ]
type=ChangeState
trigger1=time=530
value=0
ctrl=0
