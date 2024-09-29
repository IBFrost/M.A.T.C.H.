;-| Hyper Attacks |-------------------------------------------------------
;-------------------------------------------------------------------------
;Cupcake Assault
;-------------------------------------------------------------------------
[Statedef 3000]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3000
PowerAdd = -1000
SprPriority = 2
FaceP2 = 1

[State 3000, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 3000, 最低ダメージ保証]
Type = VarSet
TriggerAll = FVar(0) <= 0.35
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.35
IgNoreHitPause = 1

[State 3000, 無敵]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 50

[State 3000, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Trigger2 = 0;PalNo = 11
Trigger2 = AnimElem = 33, < 0
Trigger3 = 0;PalNo = [7,12]
Trigger3 = AnimElem = 25, < 0
Value = SCA,AA,AP,AT
Time = 1

[State 3000, 暗転の時間停止]
Type = Pause
Trigger1 = Time = 0
Time = 50
MoveTime = 50

[State 3000, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 6000, 0

[State 3000, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 9000
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 9000
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 3000, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8210
Pos = 0, -25
PosType = P1
Facing = 1
StateNo = 8210
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 3000, ヘルパー呼出]
Type = Helper
TriggerAll = NumHelper(6142) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Pie"
ID = 6142
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6142
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3000, SE]
Type = PlaySnd
Trigger1 = AnimElem = 13
Value = 3000, 0

[State 3000, 乱数]
Type = VarRandom
Trigger1 = 1
V = 5
Range = 0,999

[State 3000, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 13
Trigger2 = AnimElem = 14
Trigger3 = AnimElem = 15
Trigger4 = AnimElem = 16
Trigger5 = AnimElem = 17
Trigger6 = AnimElem = 18
Trigger7 = AnimElem = 19
Trigger8 = AnimElem = 20
Trigger9 = AnimElem = 21
Trigger10= AnimElem = 22
Trigger11= AnimElem = 23
Trigger12= AnimElem = 24
HelperType = Normal
Name = "Helper"
ID = IfElse(Var(5) < 250,3005,IfElse(Var(5) < 500,3006,IfElse(Var(5) < 750,3007,3008)))
Pos = 20, -25
PosType = P1
Facing = 1
StateNo = 3005
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3000, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 33
HelperType = Normal
Name = "HitDef"
ID = 3009
Pos = 20, -35
PosType = P1
Facing = 1
StateNo = 3009
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3000, VelSet]
Type = VelSet
Trigger1 = Pos Y >= 0
Trigger1 = AnimElem = 13
Y = -1.25

[State 3000, 重力]
Type = Gravity
Trigger1 = StateType = A
Trigger1 = AnimElem = 33, > 0

[State 3000, VelSet]
Type = VelSet
Trigger1 = AnimElem = 33
X = -0.5
Y = -2

[State 3000, SE]
Type = PlaySnd
TriggerAll = RoundState = 2
TriggerAll = P2MoveType = H
TriggerAll = P2StateNo != [120,159]
Trigger1 = AnimElem = 28
Trigger2 = AnimElem = 29
Trigger3 = AnimElem = 30
Value = 3000, 1

[State 3000, フラッシュ]
Type = EnvColor
TriggerAll = RoundState = 2
TriggerAll = P2MoveType = H
TriggerAll = P2StateNo != [120,159]
Trigger1 = AnimElem = 28
Trigger2 = AnimElem = 29
Trigger3 = AnimElem = 30
Value = 255,255,255
Under = 0
Time = 1
MoveTime = 1

[State 3000, Pause]
Type = Pause
TriggerAll = RoundState = 2
TriggerAll = P2MoveType = H
TriggerAll = P2StateNo != [120,159]
Trigger1 = AnimElem = 28
Trigger2 = AnimElem = 29
Trigger3 = AnimElem = 30
Time = 15

[State 3000, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

[State 3000, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;HELPER : カップケーキ
;-------------------------------------------------------------------------
[Statedef 3005]
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6115
SprPriority = 5

[State 3005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3006)
Trigger1 = Time = 0
Value = 6136

[State 3005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3007)
Trigger1 = Time = 0
Value = 6138

[State 3005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3008)
Trigger1 = Time = 0
Value = 6140

[State 3005, 補正値計算 : コンボ補正]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.90 ** EnemyNear(Root,Var(57)),GetHitVar(HitCount)
Persistent = 0
IgNoreHitPause = 1

[State 3005, 最低ダメージ保証]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = Root,FVar(0) <= 0.35
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.35
IgNoreHitPause = 1

[State 3005, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse(Root,PalNo = 12,2.35,IfElse(Root,PalNo = 11,1.85,1.0)) * Root,FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3005, 一部攻撃以外無敵]
Type = HitBy
Trigger1 = IsHelper
Value = SCA,AA,AP
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3005, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Trigger1 = Root,PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3005, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 3006
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 3005, 発射]
Type = VelSet
TriggerAll = IsHelper
Trigger1 = Time = 0
X = 10 + Random % 20 * 0.1
Y = 6 - Random % 20 * 0.1

[State 3005, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 3005, 回転]
Type = AngleDraw
Trigger1 = 1
Value = -Time * 30 % 360

[State 3005, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
TriggerAll = Root,RoundState <= 2
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = A,HP         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFP      ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 3,Hit    ;Hit,Miss,Dodge
Damage = 30, 10
GetPower = 0, 0
GivePower = 0, 0
PauseTime = 1, 3
Guard.PauseTime = 1, 3
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 2
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 18
Ground.HitTime = 18
Air.HitTime = 18
Guard.SlideTime = 10
Guard.HitTime = 10
Guard.CtrlTime = 10
AirGuard.HitTime = 10
AirGuard.CtrlTime = 10
Down.HitTime = 18
YAccel = .35
Ground.Velocity = -1.5, 0
Guard.Velocity = -3.5
Air.Velocity = -1.5, -1.5
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -1.5, -1.5
Ground.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
Down.CornerPush.VelOff = 0
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 3000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 3005, 終了]
Type = ChangeState
Trigger1 = MoveContact = 1 || MoveReversed = 1
Value = 3006

[State 3005, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3007

[State 3005, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = ScreenPos X != [0,319]
Trigger2 = ScreenPos Y != [0,239]

;-------------------------------------------------------------------------
[Statedef 3006]
MoveType= I
Physics = N
Juggle  = 0
VelSet = -1,-7 + (Random % 7)
Ctrl = 0
Anim = 6115

[State 3006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3006)
Trigger1 = Time = 0
Value = 6136

[State 3006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3007)
Trigger1 = Time = 0
Value = 6138

[State 3006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3008)
Trigger1 = Time = 0
Value = 6140

[State 3006, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 3006, 回転]
Type = AngleDraw
Trigger1 = 1
Value = Time * 30 % 360

[State 3006, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3006, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 10000
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 3006, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3007

;-------------------------------------------------------------------------
[Statedef 3007]
MoveType= I
Physics = S
Juggle  = 0
Ctrl = 0
Anim = 6116

[State 3007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3006)
Trigger1 = Time = 0
Value = 6137

[State 3007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3007)
Trigger1 = Time = 0
Value = 6139

[State 3007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(3008)
Trigger1 = Time = 0
Value = 6141

[State 3007, 停止]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 3007, 接地]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3007, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3007, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 10000
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 3007, SE]
Type = PlaySnd
TriggerAll = IsHelper
Trigger1 = Root,StateType != A
Trigger1 = Root,StateType != L
Trigger1 = RootDist X = [-16,16]
Value = 0, 21
Persistent = 0
IgNoreHitPause = 1

[State 3007, 終了]
Type = ChangeState
TriggerAll = IsHelper
Trigger1 = Root,StateType != A
Trigger1 = Root,StateType != L
Trigger1 = RootDist X = [-16,16]
Value = 10000
Persistent = 0
IgNoreHitPause = 1

[State 3007, ヘルパー消去]
Type = ChangeState
Trigger1 = Time = 120
Value = 3008

;-------------------------------------------------------------------------
[Statedef 3008]
MoveType= I
Physics = N
VelSet = 0,0
Ctrl = 0

[State 3008, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 0
Trigger2 = Time >= 1
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 3008, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)

[State 3008, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Var(0) >= 256

;-------------------------------------------------------------------------
;HELPER : パイ
;-------------------------------------------------------------------------
[Statedef 3009]
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6133
SprPriority = 3

[State 3009, 補正値計算 : コンボ補正]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.90 ** EnemyNear(Root,Var(57)),GetHitVar(HitCount)
Persistent = 0
IgNoreHitPause = 1

[State 3009, 最低ダメージ保証]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = Root,FVar(0) <= 0.35
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.35
IgNoreHitPause = 1

[State 3009, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse(Root,PalNo = 12,2.65,IfElse(Root,PalNo = 11,2.05,1.0)) * Root,FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3009, 一部攻撃以外無敵]
Type = HitBy
Trigger1 = IsHelper
Value = SCA,AA,AP
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3009, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Trigger1 = Root,PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3009, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 1306
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 3009, 発射]
Type = VelSet
Trigger1 = Time = 0
X = 10
Y = 5

[State 3009, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
TriggerAll = Root,RoundState <= 2
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = A,HP         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFP      ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = DiagUp   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = DiagUp
Fall.AnimType = DiagUp
Priority = 3,Hit    ;Hit,Miss,Dodge
Damage = 90, 30
GetPower = 0, 0
GivePower = 0, 0
PauseTime = 1, 3
Guard.PauseTime = 1, 3
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 25
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 18
Ground.HitTime = 18
Air.HitTime = 18
Guard.SlideTime = 10
Guard.HitTime = 10
Guard.CtrlTime = 10
AirGuard.HitTime = 10
AirGuard.CtrlTime = 10
Down.HitTime = 18
YAccel = .35
Ground.Velocity = -4, -1.5
Guard.Velocity = -4
Air.Velocity = -4, 8
AirGuard.Velocity = -4, -1.5
Down.Velocity = -4, 8
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
ID = 3000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 3009, Pause]
Type = Pause
Trigger1 = MoveHit = 1
Time = 10

[State 3009, ステート奪取]
Type = TargetState
TriggerAll = IsHelper
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
TriggerAll = MoveHit = 1
Trigger1 = Root,PalNo = [7,8]
Trigger1 = Root,Var(37) > 0
Trigger1 = Root,Var(37) / 1000 % 10 >= 1
Trigger2 = Root,PalNo = [9,10]
Trigger2 = Root,Var(37) > 0
Trigger2 = Root,Var(37) / 100 % 10 >= 1
Trigger3 = Root,PalNo = 11
Trigger3 = Root,Var(37) > 0
Trigger3 = Root,Var(37) / 10 % 10 >= 1
Trigger4 = Root,PalNo = 12
Trigger4 = Root,Var(37) % 10 >= 1
Value = 50500
ID = 3000
Persistent = 0
IgNoreHitPause = 1

[State 3009, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = IsHelper
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
TriggerAll = MoveHit = 1
TriggerAll = Facing = Target(3000),Facing
Trigger1 = Root,PalNo = [7,8]
Trigger1 = Root,Var(37) > 0
Trigger1 = Root,Var(37) / 1000 % 10 >= 1
Trigger2 = Root,PalNo = [9,10]
Trigger2 = Root,Var(37) > 0
Trigger2 = Root,Var(37) / 100 % 10 >= 1
Trigger3 = Root,PalNo = 11
Trigger3 = Root,Var(37) > 0
Trigger3 = Root,Var(37) / 10 % 10 >= 1
Trigger4 = Root,PalNo = 12
Trigger4 = Root,Var(37) % 10 >= 1
Value = -1
ID = 3000
Persistent = 0
IgNoreHitPause = 1

[State 3009, 終了]
Type = ChangeState
Trigger1 = MoveContact = 1 || MoveReversed = 1
Value = 1306

[State 3009, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1307

[State 3009, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = ScreenPos X != [0,319]
Trigger2 = ScreenPos Y != [0,239]

;-------------------------------------------------------------------------
;Pinkamena
;-------------------------------------------------------------------------
[Statedef 3500]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3500
PowerAdd = -3000
SprPriority = 2
FaceP2 = 1

[State 3500, ChangeAnim]
Type = ChangeAnim
Trigger1 = PalNo = [7,12]
Trigger1 = Time = 0
Value = 3501

[State 3500, 相手ガード認識範囲]
Type = AttackDist
Trigger1 = 1
Value = 0

[State 3500, 無敵]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 50

[State 3500, 無敵]
Type = NotHitBy
Trigger1 = PalNo = [7,11]
Value = SCA,AA,AP,AT
Time = 1

[State 3500, 暗転の時間停止]
Type = Pause
Trigger1 = Time = 0
Time = 50
MoveTime = 50

[State 3500, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 6000, 12

[State 3500, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 9000
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 9000
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 3500, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8215
Pos = 0, -25
PosType = P1
Facing = 1
StateNo = 8215
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 3500, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
TriggerAll = EnemyNear(Var(57)),StateNo != [30,49]
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
TriggerAll = EnemyNear(Var(57)),StateType != A || EnemyNear(Var(57)),MoveType = H
Trigger1 = AnimElemNo(0) = 18
Attr = S,HT         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 6,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 3000
NoChainID = 9999
NumHits = 0

[State 3500, ヒット定義]
Type = HitDef
TriggerAll = PalNo = [7,12]
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 18
Attr = S,HT         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 6,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 3000
NoChainID = 9999
NumHits = 0

[State 3500, 相殺定義]
Type = ReversalDef
TriggerAll = PalNo = [7,12]
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemTime(18) > 3
Reversal.Attr = SCA,AA,AP,AT
PauseTime = 0,0
SparkNo = -1
HitSound = -1
P1StateNo = 3510
P2StateNo = 3520
ID = 3000
NumHits = 0

[State 3500, 成立ステートへ]
Type = HitOverRide
Trigger1 = PalNo = 12
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 3510
Time = 1
ForceAir = 0

[State 3500, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
Trigger1 = MoveHit
Value = 3520
ID = 3000
Persistent = 0
IgNoreHitPause = 1

[State 3500, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget(3000)
Trigger1 = Target(3000),StateNo = 3520
Value = 3510
Persistent = 0
IgNoreHitPause = 1

[State 3500, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 3505

;-------------------------------------------------------------------------
;失敗
;-------------------------------------------------------------------------
[Statedef 3505]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3505
PowerAdd = 0

[State 3505, ChangeAnim]
Type = ChangeAnim
Trigger1 = PalNo = [7,12]
Trigger1 = Time = 0
Value = 3506

[State 3505, ゲージ還元]
Type = PowerAdd
TriggerAll = PalNo = [11,12]
Trigger1 = Time = 0
Value = 2000

[State 3505, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3505, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

[State 3505, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;成立
;-------------------------------------------------------------------------
[Statedef 3510]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3510
PowerAdd = 0

[State 3510, 飛び道具]
Type = Projectile
Trigger1 = PalNo = [7,12]
Trigger1 = NumTarget(3000) = 0
ProjID = 3509
ProjAnim = 3509
ProjScale = 1, 1
ProjReMove = 1
ProjReMoveTime = 1
ProjPriority = 9
OffSet = 0, 0
PosType = P1
Attr = S,HP         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFDP     ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Damage = 10, 0
GetPower = 0, 0
GivePower = 0, 0
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = -1
Guard.SparkNo = -1
SparkXY = 0, 0
HitSound = -1
GuardSound = -1
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 22
Ground.HitTime = 22
Air.HitTime = 22
Guard.SlideTime = 20
Guard.HitTime = 20
Guard.CtrlTime = 20
AirGuard.HitTime = 20
AirGuard.CtrlTime = 20
Down.HitTime = 22
YAccel = .35
Ground.Velocity = 0, 0
Guard.Velocity = 0
Air.Velocity = 0, 0
AirGuard.Velocity = 0, 0
Down.Velocity = 0, 0
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
ID = 3000
NoChainID = 9999
Kill = 1
Guard.Kill = 1
NumHits = 0

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3511
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3511
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3512
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3512
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "BG"
ID = 6200
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6200
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, Pause]
Type = Pause
Trigger1 = Time = 0
Time = 49
MoveTime = 49

[State 3510, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3510, 0

[State 3510, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
Trigger1 = Time = 50
Trigger1 = Facing = Target(3000),Facing
Value = -1
ID = 3000

[State 3510, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 3000
Pos = 0, 0

[State 3510, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(21) < 0
Time = 1
ID = 3000
Pos = P2Dist X, P2Dist Y

[State 3510, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(21) >= 0
Trigger1 = AnimElemTime(24) < 0
Time = 1
ID = 3000
Pos = 40, -50

[State 3510, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(24) >= 0
Time = 1
ID = 3000
Pos = 12, -50

[State 3510, PosSet]
Type = PosSet
Trigger1 = Time >= 50
X = 0

[State 3510, 画像表示の優先度]
Type = SprPriority
Trigger1 = Time = 50
Value = 1

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 120
HelperType = Normal
Name = "Helper"
ID = 6201
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 180
HelperType = Normal
Name = "Helper"
ID = 6202
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 220
HelperType = Normal
Name = "Helper"
ID = 6203
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 250
HelperType = Normal
Name = "Helper"
ID = 6204
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 280
HelperType = Normal
Name = "Helper"
ID = 6205
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 300
HelperType = Normal
Name = "Helper"
ID = 6206
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 320
HelperType = Normal
Name = "Helper"
ID = 6207
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 340
HelperType = Normal
Name = "Helper"
ID = 6208
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 350
HelperType = Normal
Name = "Helper"
ID = 6209
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 360
HelperType = Normal
Name = "Helper"
ID = 6210
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 370
HelperType = Normal
Name = "Helper"
ID = 6211
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 380
HelperType = Normal
Name = "Helper"
ID = 6212
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 385
HelperType = Normal
Name = "Helper"
ID = 6213
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 390
HelperType = Normal
Name = "Helper"
ID = 6214
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 395
HelperType = Normal
Name = "Helper"
ID = 6215
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 400
HelperType = Normal
Name = "Helper"
ID = 6216
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3510, SE]
Type = PlaySnd
Trigger1 = Time = 60
Value = 3510, 3

[State 3510, SE]
Type = PlaySnd
Trigger1 = Time = 300
Value = 3510, 4

[State 3510, SE]
Type = PlaySnd
Trigger1 = AnimElem = 23
Value = 3510, 1

[State 3510, SE]
Type = PlaySnd
Trigger1 = Time = 120
Trigger2 = Time = 180
Trigger3 = Time = 220
Trigger4 = Time = 250
Trigger5 = Time = 280
Trigger6 = Time = 300
Trigger7 = Time = 320
Trigger8 = Time = 340
Trigger9 = Time = 350
Trigger10= Time = 360
Trigger11= Time = 370
Trigger12= Time = 380
Trigger13= Time = 385
Trigger14= Time = 390
Trigger15= Time = 395
Trigger16= Time = 400
Trigger17= Time = 405
Trigger18= Time = 410
Trigger19= Time = 415
Trigger20= Time = 420
Value = 3510, 2

[State 3510, ヒット数を増やす]
Type = HitAdd
Trigger1 = Time = 120
Trigger2 = Time = 180
Trigger3 = Time = 220
Trigger4 = Time = 250
Trigger5 = Time = 280
Trigger6 = Time = 300
Trigger7 = Time = 320
Trigger8 = Time = 340
Trigger9 = Time = 350
Trigger10= Time = 360
Trigger11= Time = 370
Trigger12= Time = 380
Trigger13= Time = 385
Trigger14= Time = 390
Trigger15= Time = 395
Trigger16= Time = 400
Trigger17= Time = 405
Trigger18= Time = 410
Trigger19= Time = 415
Trigger20= Time = 420
Value = 1

[State 3510, バー非表示]
Type = AssertSpecial
Trigger1 = 1
Flag = NoBarDisplay

[State 3510, ステート奪取]
Type = TargetState
TriggerAll = AnimElemTime(21) < 0
Trigger1 = NumTarget(3000)
Trigger1 = Target(3000),StateNo != [3520,3521]
Trigger2 = ProjHitTime(3509) = 1
Value = 3520
ID = 3000

[State 3510, ステート奪取]
Type = TargetState
TriggerAll = AnimElemTime(21) >= 0
Trigger1 = NumTarget(3000)
Trigger1 = Target(3000),StateNo != [3520,3521]
Trigger2 = ProjHitTime(3509) = 1
Value = 3521
ID = 3000

[State 3510, 終了]
Type = ChangeState
Trigger1 = Time = 420
Value = 3515

;-------------------------------------------------------------------------
;終了
;-------------------------------------------------------------------------
[Statedef 3515]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3515
PowerAdd = 0

[State 3515, StopSnd]
Type = StopSnd
Trigger1 = Time = 0
Channel = 0

[State 3515, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3516
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3516
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3515, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3517
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3517
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3515, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3515, 0

[State 3515, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3515, 1

[State 3515, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = Time = 0
Time = 1
ID = 3000
Pos = 40, 0

[State 3515, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Time = 0
Value = 60
ID = 3000

[State 3515, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Time = 0
Value = -Floor(410 * Const(Data.Attack) / 100 * IfElse(PalNo = 12,2.25,IfElse(PalNo = 11,1.85,1.0)))
ID = 3000

[State 3515, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Time = 0
Value = 3522
ID = 3000

[State 3515, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = Time = 0
Trigger1 = PalNo = [7,8]
Trigger1 = Var(37) > 0
Trigger1 = Var(37) / 1000 % 10 >= 1
Trigger2 = PalNo = [9,10]
Trigger2 = Var(37) > 0
Trigger2 = Var(37) / 100 % 10 >= 1
Trigger3 = PalNo = 11
Trigger3 = Var(37) > 0
Trigger3 = Var(37) / 10 % 10 >= 1
Trigger4 = PalNo = 12
Trigger4 = Var(37) % 10 >= 1
Value = 3523
ID = 3000

[State 3515, ゲージ還元]
Type = PowerAdd
TriggerAll = PalNo = [11,12]
TriggerAll = NumTarget(3000) = 0
Trigger1 = Time = 0
Value = 2000

[State 3515, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 30
Freq = 90
Ampl = -15
Phase = 90

[State 3515, 変数]
Type = Null
Trigger1 = Time = 0
Trigger1 = 1 || Var(5) := 256
Trigger2 = Time <= 64
Trigger2 = 1 || Var(5) := Var(5) - 4

[State 3515, 背景明転]
Type = BGPalFX
Trigger1 = Time <= 64
Time = 1
Add = Var(5),Var(5),Var(5)
InvertAll = 0
Color = 256

[State 3515, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

[State 3515, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 3520]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0
SprPriority = 2

[State 3520, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3520, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3520, 喰らい中のアニメ指定]
Type = ChangeAnim
TriggerAll = Anim = [5000,5299]
Trigger1 = Time = 0
Value = 5010

[State 3520, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0

[State 3520, バー非表示]
Type = AssertSpecial
Trigger1 = 1
Flag = NoBarDisplay

[State 3520, ChangeState]
Type = ChangeState
Trigger1 = Time
Value = 3521

;-------------------------------------------------------------------------
;ENEMY : 掴まれb
;-------------------------------------------------------------------------
[Statedef 3521]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0
SprPriority = 2

[State 3521, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3521, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3521, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 3520

[State 3521, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0

[State 3521, バー非表示]
Type = AssertSpecial
Trigger1 = 1
Flag = NoBarDisplay

[State 3521, ステート返還]
Type = SelfState
Trigger1 = Time
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 投げられ
;-------------------------------------------------------------------------
[Statedef 3522]
Type    = L
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 3522, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3522, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3522, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3522, 相手のステートを返還]
Type = SelfState
Trigger1 = Alive = 0 || Life = 0
Value = 5150

[State 3522, 相手のステートを返還]
Type = SelfState
Trigger1 = Time = 100
Value = IfElse(Alive,5120,5150)

;-------------------------------------------------------------------------
;ENEMY : 投げられb
;-------------------------------------------------------------------------
[Statedef 3523]
Type    = L
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 3523, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3523, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3523, 相手のステートを返還]
Type = SelfState
Trigger1 = Alive = 0 || Life = 0
Value = 5150

[State 3523, 相手のステートを返還]
Type = SelfState
Trigger1 = Time = 100
Value = IfElse(Alive,5120,5150)

;-------------------------------------------------------------------------
;Pinkamena, Lv2
;-------------------------------------------------------------------------
[Statedef 3600]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3600
PowerAdd = -5000
SprPriority = 2
FaceP2 = 1

[State 3600, 相手ガード認識範囲]
Type = AttackDist
Trigger1 = 1
Value = 0

[State 3600, 無敵]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 50

[State 3600, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3600, 暗転の時間停止]
Type = Pause
Trigger1 = Time = 0
Time = 50
MoveTime = 50

[State 3600, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 6000, 1

[State 3600, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 9000
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 9000
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 3600, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8215
Pos = 0, -25
PosType = P1
Facing = 1
StateNo = 8215
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 3600, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 3601

;-------------------------------------------------------------------------
[Statedef 3601]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3601
PowerAdd = 0

[State 3601, 相手ガード認識範囲]
Type = AttackDist
Trigger1 = 1
Value = 0

[State 3601, 無敵]
Type = Null;NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3601, 相殺定義]
Type = ReversalDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 1
Reversal.Attr = SCA,AA,AP,AT
PauseTime = 0,0
SparkNo = -1
HitSound = -1
P1StateNo = 3610
P2StateNo = 3620
ID = 3000
NumHits = 0

[State 3601, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElem = 1
Trigger2 = EnemyNear(Var(57)),MoveType = H
Attr = S,HT         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 6,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 3000
NoChainID = 9999
NumHits = 0

[State 3601, 成立ステートへ]
Type = HitOverRide
Trigger1 = 1
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 3610
Time = 1
ForceAir = 0

[State 3601, ステート奪取]
Type = TargetState
TriggerAll = NumTarget
TriggerAll = Target,IsHelper = 0
Trigger1 = MoveHit
Trigger2 = AnimElemNo(0) = 1
Trigger2 = Target,Pos Y >= -30
Value = 3620
Persistent = 0
IgNoreHitPause = 1

[State 3601, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget
Trigger1 = Target,StateNo = 3620
Value = 3610
Persistent = 0
IgNoreHitPause = 1

[State 3601, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 3605

;-------------------------------------------------------------------------
;失敗
;-------------------------------------------------------------------------
[Statedef 3605]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3605
PowerAdd = 0

[State 3605, ゲージ還元]
Type = PowerAdd
TriggerAll = PalNo = [11,12]
Trigger1 = Time = 0
Value = 4000

[State 3605, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3605, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

[State 3605, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;成立
;-------------------------------------------------------------------------
[Statedef 3610]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3510
PowerAdd = 0

[State 3610, 飛び道具]
Type = Projectile
Trigger1 = NumTarget = 0
ProjID = 3509
ProjAnim = 3509
ProjScale = 1, 1
ProjReMove = 1
ProjReMoveTime = 1
ProjPriority = 9
OffSet = 0, 0
PosType = P1
Attr = S,HP         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFDP     ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Damage = 50, 0
GetPower = 0, 0
GivePower = 0, 0
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = -1
Guard.SparkNo = -1
SparkXY = 0, 0
HitSound = -1
GuardSound = -1
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 22
Ground.HitTime = 22
Air.HitTime = 22
Guard.SlideTime = 20
Guard.HitTime = 20
Guard.CtrlTime = 20
AirGuard.HitTime = 20
AirGuard.CtrlTime = 20
Down.HitTime = 22
YAccel = .35
Ground.Velocity = 0, 0
Guard.Velocity = 0
Air.Velocity = 0, 0
AirGuard.Velocity = 0, 0
Down.Velocity = 0, 0
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
ID = 3000
NoChainID = 9999
Kill = 1
Guard.Kill = 1
NumHits = 0

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3511
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3511
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3512
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3512
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "BG"
ID = 6200
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6200
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, Pause]
Type = Pause
Trigger1 = Time = 0
Time = 49
MoveTime = 49

[State 3610, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3510, 0

[State 3610, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = NumTarget
TriggerAll = Target,IsHelper = 0
Trigger1 = Time = 50
Trigger1 = Facing = Target,Facing
Value = -1

[State 3610, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
Pos = 0, 0

[State 3610, 掴んだ相手の位置]
Type = TargetBind
TriggerAll = NumTarget
Trigger1 = AnimElemTime(21) < 0
Time = 1
Pos = P2Dist X, P2Dist Y

[State 3610, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(21) >= 0
Trigger1 = AnimElemTime(24) < 0
Time = 1
Pos = 40, -50

[State 3610, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(24) >= 0
Time = 1
Pos = 12, -50

[State 6201, PosSet]
Type = PosSet
Trigger1 = Time >= 50
X = 0

[State 3610, 画像表示の優先度]
Type = SprPriority
Trigger1 = Time = 50
Value = 1

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 120
HelperType = Normal
Name = "Helper"
ID = 6201
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 180
HelperType = Normal
Name = "Helper"
ID = 6202
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 220
HelperType = Normal
Name = "Helper"
ID = 6203
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 250
HelperType = Normal
Name = "Helper"
ID = 6204
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 280
HelperType = Normal
Name = "Helper"
ID = 6205
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 300
HelperType = Normal
Name = "Helper"
ID = 6206
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 320
HelperType = Normal
Name = "Helper"
ID = 6207
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 340
HelperType = Normal
Name = "Helper"
ID = 6208
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 350
HelperType = Normal
Name = "Helper"
ID = 6209
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 360
HelperType = Normal
Name = "Helper"
ID = 6210
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 370
HelperType = Normal
Name = "Helper"
ID = 6211
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 380
HelperType = Normal
Name = "Helper"
ID = 6212
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 385
HelperType = Normal
Name = "Helper"
ID = 6213
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 390
HelperType = Normal
Name = "Helper"
ID = 6214
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 395
HelperType = Normal
Name = "Helper"
ID = 6215
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 400
HelperType = Normal
Name = "Helper"
ID = 6216
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 6201
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3610, SE]
Type = PlaySnd
Trigger1 = Time = 60
Value = 3510, 3

[State 3610, SE]
Type = PlaySnd
Trigger1 = Time = 300
Value = 3510, 4

[State 3610, SE]
Type = PlaySnd
Trigger1 = AnimElem = 23
Value = 3510, 1

[State 3610, SE]
Type = PlaySnd
Trigger1 = Time = 120
Trigger2 = Time = 180
Trigger3 = Time = 220
Trigger4 = Time = 250
Trigger5 = Time = 280
Trigger6 = Time = 300
Trigger7 = Time = 320
Trigger8 = Time = 340
Trigger9 = Time = 350
Trigger10= Time = 360
Trigger11= Time = 370
Trigger12= Time = 380
Trigger13= Time = 385
Trigger14= Time = 390
Trigger15= Time = 395
Trigger16= Time = 400
Trigger17= Time = 405
Trigger18= Time = 410
Trigger19= Time = 415
Trigger20= Time = 420
Value = 3510, 2

[State 3610, ヒット数を増やす]
Type = HitAdd
Trigger1 = Time = 120
Trigger2 = Time = 180
Trigger3 = Time = 220
Trigger4 = Time = 250
Trigger5 = Time = 280
Trigger6 = Time = 300
Trigger7 = Time = 320
Trigger8 = Time = 340
Trigger9 = Time = 350
Trigger10= Time = 360
Trigger11= Time = 370
Trigger12= Time = 380
Trigger13= Time = 385
Trigger14= Time = 390
Trigger15= Time = 395
Trigger16= Time = 400
Trigger17= Time = 405
Trigger18= Time = 410
Trigger19= Time = 415
Trigger20= Time = 420
Value = 1

[State 3610, ヒット数を増やす]
Type = HitAdd
Trigger1 = Time = 360
Trigger2 = Time = 370
Trigger3 = Time = 380
Trigger4 = Time = 385
Trigger5 = Time = 390
Trigger6 = Time = 395
Trigger7 = Time = 400
Trigger8 = Time = 405
Trigger9 = Time = 410
Trigger10= Time = 415
Trigger11= Time = 420
Value = 1

[State 3610, ヒット数を増やす]
Type = HitAdd
Trigger1 = Time = 390
Trigger2 = Time = 395
Trigger3 = Time = 400
Trigger4 = Time = 405
Trigger5 = Time = 410
Trigger6 = Time = 415
Trigger7 = Time = 420
Value = 1

[State 3610, ヒット数を増やす]
Type = HitAdd
Trigger1 = Time = 415
Trigger2 = Time = 420
Value = 1

[State 3610, フラッシュ]
Type = EnvColor
Trigger1 = Time = 120
Trigger2 = Time = 180
Trigger3 = Time = 220
Trigger4 = Time = 250
Trigger5 = Time = 280
Trigger6 = Time = 300
Trigger7 = Time = 320
Trigger8 = Time = 340
Trigger9 = Time = 350
Trigger10= Time = 360
Trigger11= Time = 370
Value = 255,255,255
Under = 0
Time = 2
MoveTime = 2

[State 3610, フラッシュ]
Type = EnvColor
Trigger1 = Time = 380
Trigger2 = Time = 385
Trigger3 = Time = 390
Trigger4 = Time = 395
Trigger5 = Time = 400
Trigger6 = Time = 405
Trigger7 = Time = 410
Trigger8 = Time = 415
Trigger9 = Time = 420
Value = 255,255,255
Under = 0
Time = 1
MoveTime = 1

[State 3610, PalFx]
Type = PalFx
Trigger1 = 1
Time = 1
Mul = 0,0,0

[State 3610, バー非表示]
Type = AssertSpecial
Trigger1 = 1
Flag = NoBarDisplay

[State 3610, ステート奪取]
Type = TargetState
TriggerAll = AnimElemTime(21) < 0
Trigger1 = NumTarget
Trigger1 = Target,StateNo != [3620,3621]
Trigger2 = ProjHitTime(3509) = 1
Value = 3620

[State 3610, ステート奪取]
Type = TargetState
TriggerAll = AnimElemTime(21) >= 0
Trigger1 = NumTarget
Trigger1 = Target,StateNo != [3620,3621]
Trigger2 = ProjHitTime(3509) = 1
Value = 3621

[State 3610, 終了]
Type = ChangeState
Trigger1 = Time = 420
Value = 3615

;-------------------------------------------------------------------------
;終了
;-------------------------------------------------------------------------
[Statedef 3615]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3515
PowerAdd = 0

[State 3615, StopSnd]
Type = StopSnd
Trigger1 = Time = 0
Channel = 0

[State 3615, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3516
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3516
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3615, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3517
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3517
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3615, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3515, 0

[State 3615, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3515, 1

[State 3615, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = Time = 0
Time = 1
Pos = 40, 0

[State 3615, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Time = 0
Value = 60

[State 3615, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Time = 0
Value = -Floor(850 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),2.25,1.0))

[State 3615, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo != [11,12]
Trigger1 = Time = 0
Value = 3523

[State 3615, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo = [11,12]
Trigger1 = Time = 0
Value = 3622

[State 3615, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 30
Freq = 90
Ampl = -15
Phase = 90

[State 3615, 変数]
Type = Null
Trigger1 = Time = 0
Trigger1 = 1 || Var(5) := 256
Trigger2 = Time <= 64
Trigger2 = 1 || Var(5) := Var(5) - 4

[State 3615, 背景明転]
Type = BGPalFX
Trigger1 = Time <= 64
Time = 1
Add = Var(5),Var(5),Var(5)
InvertAll = 0
Color = 256

[State 3615, ゲージ還元]
Type = PowerAdd
TriggerAll = PalNo = [11,12]
TriggerAll = NumTarget = 0
Trigger1 = Time = 0
Value = 4000

[State 3615, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

[State 3615, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 3620]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0
SprPriority = 2

[State 3620, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3620, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3620, PalFx]
Type = PalFx
Trigger1 = 1
Time = 1
Mul = 0,0,0

[State 3620, 喰らい中のアニメ指定]
Type = ChangeAnim
TriggerAll = Anim = [5000,5299]
Trigger1 = Time = 0
Value = 5010

[State 3620, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0

[State 3620, バー非表示]
Type = AssertSpecial
Trigger1 = 1
Flag = NoBarDisplay

[State 3620, ChangeState]
Type = ChangeState
Trigger1 = Time
Value = 3621

;-------------------------------------------------------------------------
;ENEMY : 掴まれb
;-------------------------------------------------------------------------
[Statedef 3621]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0
SprPriority = 2

[State 3621, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3621, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3621, PalFx]
Type = PalFx
Trigger1 = 1
Time = 1
Mul = 0,0,0

[State 3621, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 3520

[State 3621, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0

[State 3621, バー非表示]
Type = AssertSpecial
Trigger1 = 1
Flag = NoBarDisplay

[State 3621, ステート返還]
Type = SelfState
Trigger1 = Time
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 投げられ
;-------------------------------------------------------------------------
[Statedef 3622]
Type    = L
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 3622, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3622, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3622, LifeSet]
Type = LifeSet
Trigger1 = Time = 0
Value = 0

[State 3622, 相手のステートを返還]
Type = SelfState
Trigger1 = Alive = 0 || Life = 0
Value = 5150

[State 3622, 相手のステートを返還]
Type = SelfState
Trigger1 = Time = 100
Value = IfElse(Alive,5120,5150)
