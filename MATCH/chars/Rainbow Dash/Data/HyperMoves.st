;-| Hyper Attacks |-------------------------------------------------------
;-------------------------------------------------------------------------
;Rainbow Barrage
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
Trigger2 = AnimElem = 43, < 0
Trigger3 = 0;PalNo = [7,12]
Trigger3 = AnimElem = 9, < 0
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
Pos = 0, -35
PosType = P1
Facing = 1
StateNo = 8210
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 3000, 重力]
Type = Gravity
Trigger1 = AnimElem = 43, > 0

[State 3000, VelSet]
Type = VelSet
Trigger1 = AnimElem = 7
X = 6
Y = 1

[State 3000, VelSet]
Type = VelSet
Trigger1 = AnimElem = 43
Y = -6

[State 3000, PosSet]
Type = PosSet
Trigger1 = Pos Y >= 0
Y = 0

[State 3000, 掴んだ相手の位置]
Type = TargetBind
TriggerAll = RoundState = 2
TriggerAll = NumTarget
TriggerAll = Target,Alive && Target,Life
Trigger1 = AnimElem = 43, < 0
Trigger1 = P2Dist Y < 0
Trigger1 = P2StateType = A
Trigger1 = MoveHit = 1
Time = 1
Pos = P2Dist X, 0
IgNoreHitPause = 1

[State 3000, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse(PalNo = 12,2.5,IfElse(PalNo = 11,1.95,1.0)) * FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3000, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 8
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 40, 15
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 20, 30
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -40
HitSound = S1, 25
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 16
Ground.HitTime = 16
Air.HitTime = 16
Guard.SlideTime = 14
Guard.HitTime = 14
Guard.CtrlTime = 14
AirGuard.HitTime = 14
AirGuard.CtrlTime = 14
Down.HitTime = 16
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
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
EnvShake.Time = 10
EnvShake.Freq = 90
EnvShake.Ampl = -8
EnvShake.Phase = 90

[State 3000, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 11
Trigger2 = AnimElem = 14
Trigger3 = AnimElem = 18
Trigger4 = AnimElem = 22
Trigger5 = AnimElem = 27
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 12, 4
GetPower = 0, 0
GivePower = 10, 5
PauseTime = 4, 10
Guard.PauseTime = 4, 4
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -40
HitSound = S1, 20 + (Random % 4)
GuardSound = S1, 112
Ground.Type = Low   ;High,Low,Trip,Non
Air.Type = Low
Ground.SlideTime = 16
Ground.HitTime = 16
Air.HitTime = 16
Guard.SlideTime = 14
Guard.HitTime = 14
Guard.CtrlTime = 14
AirGuard.HitTime = 14
AirGuard.CtrlTime = 14
Down.HitTime = 16
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
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

[State 3000, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 32
Trigger2 = AnimElem = 32, = 1
Trigger3 = AnimElem = 34
Trigger4 = AnimElem = 34, = 1
Trigger5 = AnimElem = 38
Trigger6 = AnimElem = 38, = 1
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 12, 4
GetPower = 0, 0
GivePower = 10, 5
PauseTime = 6, 10
Guard.PauseTime = 6, 6
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -40
HitSound = S1, 20 + (Random % 4)
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 16
Ground.HitTime = 16
Air.HitTime = 16
Guard.SlideTime = 14
Guard.HitTime = 14
Guard.CtrlTime = 14
AirGuard.HitTime = 14
AirGuard.CtrlTime = 14
Down.HitTime = 16
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
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

[State 3000, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 43
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = DiagUp   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = DiagUp
Fall.AnimType = DiagUp
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 80, 20
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 20, 20
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -40
HitSound = S1, 25
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 16
Ground.HitTime = 16
Air.HitTime = 16
Guard.SlideTime = 14
Guard.HitTime = 14
Guard.CtrlTime = 14
AirGuard.HitTime = 14
AirGuard.CtrlTime = 14
Down.HitTime = 16
YAccel = .35
Ground.Velocity = -8, -1.5
Guard.Velocity = -3.5
Air.Velocity = -8, -1.5
AirGuard.Velocity = -3.5, -1.5
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
ID = 3000
NoChainID = 9999
Kill = 1
Guard.Kill = 1
EnvShake.Time = 10
EnvShake.Freq = 90
EnvShake.Ampl = -8
EnvShake.Phase = 90

[State 3000, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
TriggerAll = AnimElem = 43, >= 0
TriggerAll = MoveHit = 1
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
Value = 50050
ID = 3000
Persistent = 20
IgNoreHitPause = 1

[State 3000, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
TriggerAll = AnimElem = 43, >= 0
TriggerAll = MoveHit = 1
TriggerAll = Facing = Target(3000),Facing
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
Value = -1
ID = 3000
Persistent = 20
IgNoreHitPause = 1

[State 3000, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = AnimElem = 43, > 0
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3005

;-------------------------------------------------------------------------
[Statedef 3005]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3005
PowerAdd = 0
SprPriority = 2

[State 3005, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3005, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3005, CtrlSet]
Type = CtrlSet
Trigger1 = PalNo = [7,12]
Value = 1

[State 3005, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Maximum Rainbow
;-------------------------------------------------------------------------
[Statedef 3100]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3100
PowerAdd = -1000
SprPriority = 2
FaceP2 = 1

[State 3100, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 3100, 最低ダメージ保証]
Type = VarSet
TriggerAll = FVar(0) <= 0.35
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.35
IgNoreHitPause = 1

[State 3100, 無敵]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 50

[State 3100, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3100, 暗転の時間停止]
Type = Pause
Trigger1 = Time = 0
Time = 50
MoveTime = 50

[State 3100, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 6000, 0

[State 3100, ヘルパー呼出]
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

[State 3100, ヘルパー呼出]
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

[State 3100, Reset]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 0

[State 3100, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -10
Y = -10

[State 3100, 重力]
Type = VelAdd
Trigger1 = StateType = A
Y = 0.25

[State 3100, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3100, 次へ]
Type = ChangeState
Trigger1 = BackEdgeBodyDist <= 5
Trigger1 = Time >= 20
Trigger2 = Time = 50
Trigger3 = Vel Y > 0
Trigger3 = Pos Y >= 0
Value = 3101

;-------------------------------------------------------------------------
[Statedef 3101]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3101
PowerAdd = 0
SprPriority = 2

[State 3101, 無敵]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 30

[State 3101, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3101, 暗転の時間停止]
Type = Pause
Trigger1 = Time = 0
Time = 30
MoveTime = 30

[State 3101, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3101, 位置合わせ]
Type = PosAdd
Trigger1 = Time = 0
X = -BackEdgeBodyDist

[State 3101, 次へ]
Type = ChangeState
Trigger1 = Time = 30
Value = 3102

;-------------------------------------------------------------------------
[Statedef 3102]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3102
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 3102, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Trigger2 = 0;PalNo = 11
Trigger3 = 0;PalNo = [7,12]
Trigger3 = PrevStateNo = 3101 || Time < 5
Value = SCA,AA,AP,AT
Time = 1

[State 3102, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3102, ScreenBound]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0
IgNoreHitPause = 1

[State 3102, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3100, 0

[State 3102, PosSet]
Type = PosSet
TriggerAll = PrevStateNo != 3101
Trigger1 = Time = 0
X = -160 * Facing
Y = Pos Y - ScreenPos Y + 60 + (Random % 120)

[State 3102, 相手距離]
Type = VarSet
Trigger1 = Time = 0
FV = 30
Value = P2Dist X + 0.0000001

[State 3102, 相手高さ]
Type = VarSet
Trigger1 = Time = 0
FV = 31
Value = P2Dist Y + 0.0000001 - 60

[State 3102, 軌道]
Type = AngleSet
Trigger1 = Time = 0
Value = (Atan(FVar(30) / FVar(31)) * 180 / Pi) + (180 * (FVar(31) > 0))

[State 3102, 発射速度]
Type = VelSet
Trigger1 = Time = 0
X = (FVar(30) / (Abs(FVar(30)) + Abs(FVar(31)))) * 50
Y = ((FVar(31)) / (Abs(FVar(30)) + Abs(FVar(31)))) * 50

[State 3102, 角度描画]
Type = AngleDraw
Trigger1 = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Persistent = 1
IgNoreHitPause = 1

[State 3102, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 3104
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3104
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3102, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse(PalNo = 12,2.35,IfElse(PalNo = 11,1.8,1.0)) * FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3102, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = Time = 0
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 20, 10
GetPower = 0, 0
GivePower = 10, 5
PauseTime = 6, 6
Guard.PauseTime = 6, 6
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = S1, 23
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = -3.5, -3.5
Guard.Velocity = -3.5
Air.Velocity = -3.5, -3.5
AirGuard.Velocity = -3.5, -3.5
Down.Velocity = -3.5, -3.5
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

[State 3102, ChangeState]
Type = ChangeState
TriggerAll = Time
Trigger1 = FrontEdgeBodyDist <= 5
Trigger2 = ScreenPos Y != [0,239]
Trigger2 = Time >= 10
Trigger3 = Time = 50
Value = 3103

;-------------------------------------------------------------------------
[Statedef 3103];虹ヘルパー認識用
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 10000
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 3103, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3103, Count]
Type = VarAdd
Trigger1 = Time = 0
V = 5
Value = 1

[State 3103, ChangeState]
Type = ChangeState
TriggerAll = Time
TriggerAll = Var(5) >= 8
Trigger1 = EnemyNear(Var(57)),StateType = L
Trigger2 = EnemyNear(Var(57)),MoveType != H
Trigger3 = EnemyNear(Var(57)),StateNo = [120,159]
Value = 3105

[State 3103, ChangeState]
Type = ChangeState
TriggerAll = Time
Trigger1 = Var(5) >= 8
Value = 3110

[State 3103, ChangeState]
Type = ChangeState
Trigger1 = Time
Value = 3102

;-------------------------------------------------------------------------
;HELPER : Maximum Rainbow
;-------------------------------------------------------------------------
[Statedef 3104]
Physics = N
Ctrl = 0
Anim = 3104
SprPriority = 0

[State 3104, 影を不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
IgNoreHitPause = 1

[State 3104, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 3104, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper(3105)
Time = 1
Facing = 1
Pos = -4, -60

[State 3104, 本体に追従]
Type = BindToRoot
TriggerAll = IsHelper(3110)
Trigger1 = Root,StateNo = 3110
Time = 1
Facing = 1
Pos = 4, -60

[State 3104, 本体に追従]
Type = BindToRoot
TriggerAll = IsHelper(3110)
Trigger1 = Root,StateNo = 3111
Time = 1
Facing = 1
Pos = -5, -35

[State 3104, 軌道]
Type = AngleSet
TriggerAll = IsHelper
Trigger1 = Time = 0
Value = (Atan(Root,FVar(30) / Root,FVar(31)) * 180 / Pi) + (180 * (Root,FVar(31) > 0))

[State 3104, 軌道]
Type = AngleSet
TriggerAll = IsHelper(3105)
Trigger1 = Time = 0
Value = 180

[State 3104, 軌道]
Type = AngleSet
TriggerAll = IsHelper(3110)
Trigger1 = Time = 0
Value = 0

[State 3104, 軌道]
Type = AngleSet
TriggerAll = IsHelper(3110)
Trigger1 = Root,StateNo = 3111
Value = 180

[State 3104, 角度描画]
Type = AngleDraw
Trigger1 = 1

[State 3104, AngleDraw]
Type = AngleDraw
Trigger1 = IsHelper(3110)
Scale = 1,2

[State 3104, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,StateType = L
Trigger3 = Root,StateNo != 3102
Trigger3 = Root,StateNo != 3105
Trigger3 = Root,StateNo != 3110
Trigger3 = Root,StateNo != 3111

;-------------------------------------------------------------------------
[Statedef 3105]
Type    = A
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3105
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 3105, StateTypeSet]
Type = StateTypeSet
TriggerAll = PalNo = [7,12]
Trigger1 = Time = 0
MoveType = A

[State 3105, ChangeAnim]
Type = ChangeAnim
TriggerAll = PalNo = [7,12]
Trigger1 = Time = 0
Value = 3107

[State 3105, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3105, ScreenBound]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0
IgNoreHitPause = 1

[State 3105, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3100, 0

[State 3105, PosSet]
Type = PosSet
Trigger1 = Time = 0
X = 0
Y = Pos Y - ScreenPos Y - 20

[State 3105, 発射速度]
Type = VelSet
Trigger1 = Time = 0
Y = 20

[State 3105, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 3105
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3104
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3105, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3105, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse(PalNo = 12,2.35,IfElse(PalNo = 11,1.8,1.0)) * FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3105, ヒット定義]
Type = HitDef
TriggerAll = PalNo = [7,12]
Trigger1 = Time = 0
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 20, 10
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = S1, 24
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = 0, 5
Guard.Velocity = -3.5
Air.Velocity = 0, 5
AirGuard.Velocity = -3.5, 5
Down.Velocity = 0, 5
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
P2Facing = 1
EnvShake.Time = 10
EnvShake.Freq = 90
EnvShake.Ampl = -8
EnvShake.Phase = 90

[State 3105, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3106

;-------------------------------------------------------------------------
[Statedef 3106]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3106
PowerAdd = 0
SprPriority = 2

[State 3106, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3106, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3106, CtrlSet]
Type = CtrlSet
Trigger1 = PalNo = [7,12]
Value = 1

[State 3106, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
[Statedef 3110]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3110
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 3110, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Trigger2 = 0;PalNo = [7,12]
Trigger2 = Time < 5
Value = SCA,AA,AP,AT
Time = 1

[State 3110, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3110, ScreenBound]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0
IgNoreHitPause = 1

[State 3110, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3100, 0

[State 3110, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = Pos Y - ScreenPos Y + 240 + 60

[State 3110, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000)
Trigger1 = Time = 0
X = Target(3000),Pos X

[State 3110, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000) = 0
Trigger1 = Time = 0
X = EnemyNear(Var(57)),Pos X

[State 3110, 軌道]
Type = AngleSet
Trigger1 = Time = 0
Value = 0

[State 3110, 発射速度]
Type = VelSet
Trigger1 = Time = 0
Y = -50

[State 3110, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 3110
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3104
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3110, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse(PalNo = 12,2.35,IfElse(PalNo = 11,1.8,1.0)) * FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3110, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = Time = 0
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 20, 10
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -100
HitSound = S1, 23
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = 0, -8
Guard.Velocity = -3.5
Air.Velocity = 0, -8
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = 0, -8
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

[State 3110, ChangeState]
Type = ChangeState
TriggerAll = Time
Trigger1 = ScreenPos Y != [0,239]
Trigger1 = Time >= 20
Trigger2 = Time = 50
Value = 3111

;-------------------------------------------------------------------------
[Statedef 3111]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3111
PowerAdd = 0
SprPriority = 2

[State 3111, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Trigger2 = 0;PalNo = [7,12]
Trigger2 = Time < 5
Value = SCA,AA,AP,AT
Time = 1

[State 3111, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3111, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3100, 0

[State 3111, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = Pos Y - ScreenPos Y - 20

[State 3111, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),Pos Y <= Pos Y + 20
Trigger1 = Time = 0
Y = Target(3000),Pos Y - 20

[State 3111, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000) = 0
TriggerAll = EnemyNear(Var(57)),Pos Y <= Pos Y + 20
Trigger1 = Time = 0
Y = EnemyNear(Var(57)),Pos Y - 20

[State 3111, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000)
Trigger1 = Time = 0
X = Target(3000),Pos X

[State 3111, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000) = 0
Trigger1 = Time = 0
X = EnemyNear(Var(57)),Pos X

[State 3111, 発射速度]
Type = VelSet
Trigger1 = Time = 0
Y = 20

[State 3111, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 3111
Pos = 10, 0

[State 3111, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse(PalNo = 12,2.35,IfElse(PalNo = 11,1.8,1.0)) * FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3111, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = Time = 0
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 20, 10
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = S1, 24
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = 0, -1.5
Guard.Velocity = -3.5
Air.Velocity = 0, -1.5
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = 0, -1.5
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
ID = 3111
NoChainID = 9999
Kill = 1
Guard.Kill = 1
P2Facing = 1
EnvShake.Time = 10
EnvShake.Freq = 90
EnvShake.Ampl = -8
EnvShake.Phase = 90

[State 3111, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = MoveHit = 1
Value = 3120
ID = 3111

[State 3111, ヒット数を増やす]
Type = HitAdd
Trigger1 = MoveHit
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 3111, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = MoveHit
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 20
ID = 3111

[State 3111, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = MoveHit
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(40 * Const(Data.Attack) / 100 * IfElse(PalNo = 12,2.5,IfElse(PalNo = 11,1.95,1.0)) * FVar(0))
ID = 3111

[State 3111, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = MoveHit
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3121
ID = 3111

[State 3111, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = MoveHit
TriggerAll = Vel Y > 0
TriggerAll = Pos Y >= 0
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
Value = 3122
ID = 3111

[State 3111, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3112

;-------------------------------------------------------------------------
[Statedef 3112]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3112
PowerAdd = 0

[State 3112, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 3112, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3112, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 3112, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3100, 1

[State 3112, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -8
Phase = 90

[State 3112, Effect]
Type = Explod
Trigger1 = Time = 0
Anim = 6200
ID = 6200
Pos = 0,0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = -2
OwnPal = 1

[State 3112, Effect]
Type = Explod
Trigger1 = Time = 0
Anim = 6020
ID = 6020
Pos = 0,0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 2, 2
SprPriority = -2
OwnPal = 1

[State 3112, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3112, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 3120]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 3120, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3120, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3120, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 3120

[State 3120, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 3120, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 投げられ
;-------------------------------------------------------------------------
[Statedef 3121]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 3121, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3121, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 3121, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3121, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3121, 相手のステートを返還]
Type = SelfState
Trigger1 = Time = 20
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 投げられb
;-------------------------------------------------------------------------
[Statedef 3122]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 3122, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3122, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 3122, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3122, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3122, 次]
Type = ChangeState
Trigger1 = Time = 20
Value = 50302

;-------------------------------------------------------------------------
;Sonic Rainboom
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

[State 3500, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse(PalNo = 12,2.35,IfElse(PalNo = 11,1.85,1.0))
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3500, 無敵]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 50

[State 3500, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Trigger2 = PalNo = 11
Trigger3 = PalNo = [7,12]
Trigger3 = AnimElem = 5, < 10
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

[State 3500, 空中状態]
Type = StateTypeSet
Trigger1 = AnimElem = 5
StateType = A

[State 3500, VelSet]
Type = VelSet
Trigger1 = AnimElem = 5
X = 5
Y = -20

[State 3500, AngleDraw]
Type = AngleDraw
Trigger1 = AnimElemNo(0) = 5
Value = -15
IgNoreHitPause = 1

[State 3500, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = AnimElemNo(0) = 5
Value = 0

[State 3500, ScreenBound]
Type = ScreenBound
Trigger1 = AnimElemNo(0) = 5
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 3500, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 5
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 6,Hit    ;Hit,Miss,Dodge
Damage = 100, 30
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = S1, 24
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = -3.5, -8
Guard.Velocity = -3.5
Air.Velocity = -3.5, -8
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -3.5, -8
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

[State 3500, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
Trigger1 = MoveHit = 1
Value = 50300
ID = 3000
Persistent = 10
IgNoreHitPause = 1

[State 3500, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
Trigger1 = MoveHit = 1
Trigger1 = Facing = Target(3000),Facing
Value = -1
ID = 3000
Persistent = 10
IgNoreHitPause = 1

[State 3500, 次へ]
Type = ChangeState
Trigger1 = Time = 80
Value = 3501

;-------------------------------------------------------------------------
[Statedef 3501]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3501
PowerAdd = 0
SprPriority = 2

[State 3501, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse(PalNo = 12,2.35,IfElse(PalNo = 11,1.85,1.0))
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3501, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Trigger2 = PalNo = [7,12]
Trigger2 = Time < 10
Value = SCA,AA,AP,AT
Time = 1

[State 3501, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3501, ScreenBound]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0
IgNoreHitPause = 1

[State 3501, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = Pos Y - ScreenPos Y - 20

[State 3501, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000)
Trigger1 = Time = 0
X = Target(3000),Pos X

[State 3501, PosSet]
Type = PosSet
TriggerAll = NumTarget(3000) = 0
Trigger1 = Time = 0
X = EnemyNear(Var(57)),Pos X

[State 3501, 発射速度]
Type = VelSet
Trigger1 = Time = 0
Y = 20

[State 3501, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 1002
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1002
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3501, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = P2Dist Y < 0
Trigger1 = P2StateType = A
Trigger1 = MoveHit = 1
Time = 1
Pos = P2Dist X, 0
IgNoreHitPause = 1

[State 3501, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 3504
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3504
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3501, ヒット定義]
Type = HitDef
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = Time % 2 = 0
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 6,Hit    ;Hit,Miss,Dodge
Damage = 20, 10
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 10, 20
Guard.PauseTime = 10, 10
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = S1, 23
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = -3.5, -1.5
Guard.Velocity = -3.5
Air.Velocity = -3.5, -1.5
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -3.5, -1.5
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

[State 3501, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
Trigger1 = MoveHit = 1
Value = 50300
ID = 3000
Persistent = 10
IgNoreHitPause = 1

[State 3501, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = NumTarget(3000)
TriggerAll = Target(3000),IsHelper = 0
Trigger1 = MoveHit = 1
Trigger1 = Facing = Target(3000),Facing
Value = -1
ID = 3000
Persistent = 10
IgNoreHitPause = 1

[State 3501, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3505

;-------------------------------------------------------------------------
;HELPER : Sonic Rainboom
;-------------------------------------------------------------------------
[Statedef 3502]
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3502

[State 3502, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse(Root,PalNo = 12,2.35,IfElse(Root,PalNo = 11,1.85,1.0))
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3502, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1
IgNoreHitPause = 1

[State 3502, 再起動]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = StateNo
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 3502, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3502, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3503
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3503
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3502, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = DiagUp   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = DiagUp
Fall.AnimType = DiagUp
Priority = 6,Hit    ;Hit,Miss,Dodge
Damage = 180, 60
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 20, 20
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = -1
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = -8, -2
Guard.Velocity = -4
Air.Velocity = -8, -2
AirGuard.Velocity = -4, -1
Down.Velocity = -8, -2
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

[State 3502, ステート奪取]
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
Persistent = 20
IgNoreHitPause = 1

[State 3502, 相手を振り向かせる]
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
Persistent = 20
IgNoreHitPause = 1

[State 3502, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
;HELPER : Sonic Rainboom Effect
;-------------------------------------------------------------------------
[Statedef 3503]
MoveType= I
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 7020
SprPriority = 9

;Var(0)  = 透過値

[State 3503, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3503, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1
IgNoreHitPause = 1

[State 3503, 再起動]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 10000
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 3503, 影を不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
IgNoreHitPause = 1

[State 3503, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 0
Trigger2 = AnimTime >= -7
Trigger2 = 1 || Var(0) := Var(0) + 32

[State 3503, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)
IgNoreHitPause = 1

[State 3503, SE : 爆発]
Type = PlaySnd
Trigger1 = Time = 0
Value = 3500, 0

[State 3503, 振動]
Type = EnvShake
Trigger1 = Time = 0
Trigger2 = Time = 10
Trigger3 = Time = 20
Time = 10
Freq = 90
Ampl = -10
Phase = 95

[State 3503, フラッシュ]
Type = EnvColor
Trigger1 = Time = 0
Trigger2 = Time = 5
Trigger3 = Time = 10
Value = 255,255,255
Under = 0
Time = 2
MoveTime = 2

[State 3503, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0
Trigger2 = Var(0) >= 256

;-------------------------------------------------------------------------
;HELPER : Rainbow
;-------------------------------------------------------------------------
[Statedef 3504]
Physics = N
Ctrl = 0
Anim = 3504
SprPriority = 0

[State 3504, 影を不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
IgNoreHitPause = 1

[State 3504, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = -4, -60

[State 3504, AngleDraw]
Type = AngleDraw
Trigger1 = 1
Value = 180

[State 3504, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,StateType = L
Trigger3 = Root,StateNo != 3501
Trigger3 = Root,StateNo != 3612

;-------------------------------------------------------------------------
[Statedef 3505]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3505
PowerAdd = 0
SprPriority = 2

[State 3505, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3505, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3505, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Hitdef"
ID = 3502
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3502
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3505, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -3
Y = -12

[State 3505, VelSet]
Type = VelSet
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
X = -2
Y = -10

[State 3505, 重力]
Type = Gravity
Trigger1 = StateType = A

[State 3505, ゲージ還元]
Type = PowerAdd
TriggerAll = PalNo = [11,12]
TriggerAll = Time = 0
Trigger1 = EnemyNear(Var(57)),StateType = L
Trigger2 = EnemyNear(Var(57)),MoveType != H
Trigger3 = EnemyNear(Var(57)),StateNo = [120,159]
Value = 2000

[State 3505, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3505, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3506

;-------------------------------------------------------------------------
[Statedef 3506]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3506
PowerAdd = 0
SprPriority = 2

[State 3506, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3506, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 3506, CtrlSet]
Type = CtrlSet
Trigger1 = PalNo = [7,12]
Value = 1

[State 3506, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Sonic Rainboom, Lv2
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
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3601, 相殺定義]
Type = ReversalDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 1
Reversal.Attr = SCA,AA,AP,AT
PauseTime = 20,20
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
;HELPER : Effect
;-------------------------------------------------------------------------
[Statedef 3609]
Physics = N
Ctrl = 0
Anim = 3609
SprPriority = 4

[State 3609, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 3609, 本体に追従]
Type = BindToRoot
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 3609, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,Anim != 3610
Trigger3 = AnimTime = 0

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
Anim = 3610
PowerAdd = 0

[State 3610, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = NumTarget
TriggerAll = Target,IsHelper = 0
Trigger1 = Time = 0
Trigger1 = Facing = Target,Facing
Value = -1

[State 3610, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 30,0

[State 3610, VelSet]
Type = VelSet
Trigger1 = AnimElem = 4
X = 1

[State 3610, SE]
Type = PlaySnd
Trigger1 = AnimElem = 4
Value = 1, 25

[State 3610, 振動]
Type = EnvShake
Trigger1 = AnimElem = 4
Time = 10
Freq = 90
Ampl = -10
Phase = 90

[State 3610, Effect]
Type = Explod
Trigger1 = AnimElem = 4
Anim = 8001
ID = 8001
Pos = -10,-50
PosType = P2
BindTime = 1
Random = 20, 20
ReMoveTime = -2
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 1, 1
SprPriority = 5
OwnPal = 1

[State 3610, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = AnimElem = 4
Value = 20

[State 3610, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = AnimElem = 4
Value = -Floor(200 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),2.0,1.0))
Kill = 0

[State 3610, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
Trigger1 = AnimElem = 4
Attr = S,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 200, 0
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 0, 0
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 25
GuardSound = S1, 112
YAccel = .35
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
Kill = 0
Guard.Kill = 0
EnvShake.Time = 10
EnvShake.Freq = 90
EnvShake.Ampl = -10
EnvShake.Phase = 90
P2Facing = 1
P2StateNo = 3620
Guard.Dist = 0

[State 3610, Pause]
Type = Pause
Trigger1 = AnimElem = 4
Time = 20

[State 3610, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(52) <= 0
Time = 1
Pos = 50, 0

[State 3610, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(7) >= 0
Trigger1 = AnimElemTime(52) <= 0
Time = 1
Pos = 30, 0

[State 3610, 振動]
Type = EnvShake
TriggerAll = NumTarget
Trigger1 = AnimElemTime(7) = 0
Trigger2 = AnimElemTime(10) = 0
Trigger3 = AnimElemTime(14) = 0
Trigger4 = AnimElemTime(18) = 0
Trigger5 = AnimElemTime(23) = 0
Trigger6 = AnimElemTime(28) = 0
Trigger7 = AnimElemTime(30) = 0
Trigger8 = AnimElemTime(35) = 0
Trigger9 = AnimElemTime(39) = 0
Trigger10= AnimElemTime(43) = 0
Trigger11= AnimElemTime(43) = 3
Trigger12= AnimElemTime(47) = 0
Trigger13= AnimElemTime(47) = 3
Trigger14= AnimElemTime(52) = 0
Time = 5
Freq = 90
Ampl = -4
Phase = 90

[State 3610, フラッシュ]
Type = EnvColor
TriggerAll = NumTarget
Trigger1 = AnimElemTime(4) = 0
Trigger2 = AnimElemTime(7) = 0
Trigger3 = AnimElemTime(10) = 0
Trigger4 = AnimElemTime(14) = 0
Trigger5 = AnimElemTime(18) = 0
Trigger6 = AnimElemTime(23) = 0
Trigger7 = AnimElemTime(28) = 0
Trigger8 = AnimElemTime(30) = 0
Trigger9 = AnimElemTime(35) = 0
Trigger10= AnimElemTime(39) = 0
Trigger11= AnimElemTime(43) = 0
Trigger12= AnimElemTime(43) = 3
Trigger13= AnimElemTime(47) = 0
Trigger14= AnimElemTime(47) = 3
Trigger15= AnimElemTime(52) = 0
Value = 255,255,255
Under = 0
Time = 1
MoveTime = 1

[State 3610, SE]
Type = PlaySnd
TriggerAll = NumTarget
Trigger1 = AnimElemTime(7) = 0
Trigger2 = AnimElemTime(10) = 0
Trigger3 = AnimElemTime(14) = 0
Trigger4 = AnimElemTime(18) = 0
Trigger5 = AnimElemTime(23) = 0
Trigger6 = AnimElemTime(28) = 0
Trigger7 = AnimElemTime(30) = 0
Trigger8 = AnimElemTime(35) = 0
Trigger9 = AnimElemTime(39) = 0
Trigger10= AnimElemTime(43) = 0
Trigger11= AnimElemTime(43) = 3
Trigger12= AnimElemTime(47) = 0
Trigger13= AnimElemTime(47) = 3
Value = 1, 20 + (Random % 4)

[State 3610, SE]
Type = PlaySnd
Trigger1 = AnimElemTime(52) = 0
Value = 430, 0

[State 3610, SE]
Type = PlaySnd
TriggerAll = NumTarget
Trigger1 = AnimElemTime(52) = 0
Value = 1, 24

[State 3610, 振動]
Type = EnvShake
TriggerAll = NumTarget
Trigger1 = AnimElemTime(52) = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 3610, Effect]
Type = Explod
TriggerAll = NumTarget
Trigger1 = AnimElemTime(10) = 0
Trigger2 = AnimElemTime(14) = 0
Trigger3 = AnimElemTime(18) = 0
Trigger4 = AnimElemTime(28) = 0
Trigger5 = AnimElemTime(30) = 0
Trigger6 = AnimElemTime(35) = 0
Trigger7 = AnimElemTime(39) = 0
Trigger8 = AnimElemTime(43) = 0
Trigger9 = AnimElemTime(43) = 3
Trigger10= AnimElemTime(47) = 0
Trigger11= AnimElemTime(47) = 3
Trigger12= AnimElemTime(52) = 0
Anim = 8001
ID = 8001
Pos = -10,-50
PosType = P2
BindTime = 1
Random = 20, 20
ReMoveTime = -2
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 1, 1
SprPriority = 5
OwnPal = 1

[State 3610, Effect]
Type = Explod
TriggerAll = NumTarget
Trigger1 = AnimElemTime(7) = 0
Trigger2 = AnimElemTime(23) = 0
Anim = 8001
ID = 8001
Pos = -10,-20
PosType = P2
BindTime = 1
Random = 20, 20
ReMoveTime = -2
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 1, 1
SprPriority = 5
OwnPal = 1

[State 3610, ヒット数を増やす]
Type = HitAdd
TriggerAll = NumTarget
Trigger1 = AnimElemTime(4) = 0
Trigger2 = AnimElemTime(7) = 0
Trigger3 = AnimElemTime(10) = 0
Trigger4 = AnimElemTime(14) = 0
Trigger5 = AnimElemTime(18) = 0
Trigger6 = AnimElemTime(23) = 0
Trigger7 = AnimElemTime(28) = 0
Trigger8 = AnimElemTime(30) = 0
Trigger9 = AnimElemTime(35) = 0
Trigger10= AnimElemTime(39) = 0
Trigger11= AnimElemTime(43) = 0
Trigger12= AnimElemTime(43) = 3
Trigger13= AnimElemTime(47) = 0
Trigger14= AnimElemTime(47) = 3
Trigger15= AnimElemTime(52) = 0
Value = 1

[State 3610, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = AnimElemTime(7) = 0
Trigger2 = AnimElemTime(10) = 0
Trigger3 = AnimElemTime(14) = 0
Trigger4 = AnimElemTime(18) = 0
Trigger5 = AnimElemTime(23) = 0
Trigger6 = AnimElemTime(28) = 0
Trigger7 = AnimElemTime(30) = 0
Trigger8 = AnimElemTime(35) = 0
Trigger9 = AnimElemTime(39) = 0
Trigger10= AnimElemTime(43) = 0
Trigger11= AnimElemTime(43) = 3
Trigger12= AnimElemTime(47) = 0
Trigger13= AnimElemTime(47) = 3
Trigger14= AnimElemTime(52) = 0
Value = 2

[State 3610, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = AnimElemTime(7) = 0
Trigger2 = AnimElemTime(10) = 0
Trigger3 = AnimElemTime(14) = 0
Trigger4 = AnimElemTime(18) = 0
Trigger5 = AnimElemTime(23) = 0
Trigger6 = AnimElemTime(28) = 0
Trigger7 = AnimElemTime(30) = 0
Trigger8 = AnimElemTime(35) = 0
Trigger9 = AnimElemTime(39) = 0
Trigger10= AnimElemTime(43) = 0
Trigger11= AnimElemTime(43) = 3
Trigger12= AnimElemTime(47) = 0
Trigger13= AnimElemTime(47) = 3
Trigger14= AnimElemTime(52) = 0
Value = -Floor(20 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),2.0,1.0))
Kill = 0

[State 3610, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
Trigger1 = AnimElemTime(7) = 0
Trigger2 = AnimElemTime(10) = 0
Trigger3 = AnimElemTime(14) = 0
Trigger4 = AnimElemTime(18) = 0
Trigger5 = AnimElemTime(23) = 0
Trigger6 = AnimElemTime(28) = 0
Trigger7 = AnimElemTime(30) = 0
Trigger8 = AnimElemTime(35) = 0
Trigger9 = AnimElemTime(39) = 0
Trigger10= AnimElemTime(43) = 0
Trigger11= AnimElemTime(43) = 3
Trigger12= AnimElemTime(47) = 0
Trigger13= AnimElemTime(47) = 3
Attr = S,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 20, 0
GetPower = 0, 0
GivePower = 2, 1
PauseTime = 0, 0
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 20 + (Random % 4)
GuardSound = S1, 112
YAccel = .35
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
Kill = 0
Guard.Kill = 0
EnvShake.Time = 10
EnvShake.Freq = 90
EnvShake.Ampl = -8
EnvShake.Phase = 90
P2Facing = 1
P2StateNo = 3621
Guard.Dist = 0

[State 3610, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
Trigger1 = AnimElemTime(52) = 0
Attr = S,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 20, 0
GetPower = 0, 0
GivePower = 2, 1
PauseTime = 0, 0
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 24
GuardSound = S1, 112
YAccel = .35
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
Kill = 0
Guard.Kill = 0
EnvShake.Time = 10
EnvShake.Freq = 90
EnvShake.Ampl = -8
EnvShake.Phase = 90
P2Facing = 1
P2StateNo = 3622
Guard.Dist = 0
Snap = 30,0

[State 3610, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = AnimElemTime(52) = 0
Value = 3622

[State 3610, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElemTime(51) = 0
HelperType = Normal
Name = "Effect"
ID = 3609
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3609
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.65
Size.YScale = 0.65

[State 3610, 停止]
Type = Pause
TriggerAll = NumTarget
Trigger1 = AnimElemTime(52) = 0
Time = 10

[State 3610, ScreenBound]
Type = ScreenBound
Trigger1 = AnimElemTime(53) >= 0
Value = 1
MoveCamera = 1,0

[State 3610, StateTypeSet]
Type = StateTypeSet
Trigger1 = AnimElemTime(53) = 0
StateType = A

[State 3610, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(53) = 0
X = 3
Y = -10

[State 3610, 重力]
Type = Gravity
TriggerAll = StateType = A
Trigger1 = AnimElemTime(53) >= 0
Trigger1 = AnimElemTime(56) < 0

[State 3610, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(56) = 0
X = 0
Y = -20

[State 3610, SE]
Type = PlaySnd
Trigger1 = AnimElemTime(56) = 0
Value = 45, 0

[State 3610, ChangeState]
Type = ChangeState
Trigger1 = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Trigger2 = AnimElemTime(56) = 20
Value = 3611

;-------------------------------------------------------------------------
[Statedef 3611]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 10000
PowerAdd = 0

[State 3611, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3615
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3615
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3611, Pause]
Type = Pause
Trigger1 = Time = 0
Time = 150
;MoveTime = 150

[State 3611, ChangeState]
Type = ChangeState
Trigger1 = NumHelper(3615) = 0
Value = 3612

;-------------------------------------------------------------------------
[Statedef 3612]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3612
PowerAdd = 0

[State 3612, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = Pos Y - ScreenPos Y - 20

[State 3612, PosSet]
Type = PosSet
TriggerAll = NumTarget
Trigger1 = Time = 0
X = Target,Pos X

[State 3612, PosSet]
Type = PosSet
TriggerAll = NumTarget = 0
Trigger1 = Time = 0
X = EnemyNear(Var(57)),Pos X

[State 3612, 発射速度]
Type = VelSet
Trigger1 = Time = 0
Y = 20

[State 3612, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 3612
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1002
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3612, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 3504
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3504
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5

[State 3612, ヘルパー呼出]
Type = Helper
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
HelperType = Normal
Name = "Helper"
ID = 3616
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3616
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5
Persistent = 0

[State 3612, ヒット数を増やす]
Type = HitAdd
TriggerAll = NumTarget
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 3612, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 20

[State 3612, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
TriggerAll = PalNo != [11,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(370 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),2.35,1.0))

[State 3612, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
TriggerAll = PalNo = [11,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(1000 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),2.35,1.0))

[State 3612, ヒット定義]
Type = HitDef
TriggerAll = PalNo != [11,12]
TriggerAll = RoundState <= 2
Trigger1 = Time = 0
Attr = S,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 370, 0
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 0, 0
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 25
GuardSound = S1, 112
YAccel = .35
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
EnvShake.Time = 20
EnvShake.Freq = 90
EnvShake.Ampl = -15
EnvShake.Phase = 90
P2Facing = 1
P2StateNo = 3623
Guard.Dist = 0

[State 3612, ヒット定義]
Type = HitDef
TriggerAll = PalNo = [11,12]
TriggerAll = RoundState <= 2
Trigger1 = Time = 0
Attr = S,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 1000, 0
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 0, 0
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 25
GuardSound = S1, 112
YAccel = .35
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
EnvShake.Time = 20
EnvShake.Freq = 90
EnvShake.Ampl = -15
EnvShake.Phase = 90
P2Facing = 1
P2StateNo = 3624
Guard.Dist = 0

[State 3612, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo != [11,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3623

[State 3612, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo = [11,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3624

[State 3612, Pause]
Type = Pause
Trigger1 = 1
Time = 2
MoveTime = 2

[State 3612, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3613

;-------------------------------------------------------------------------
[Statedef 3613]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3613
PowerAdd = 0
SprPriority = 2

[State 3613, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3613, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 3613, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -2
Y = -10

[State 3613, 重力]
Type = Gravity
Trigger1 = StateType = A

[State 3613, ゲージ還元]
Type = PowerAdd
TriggerAll = PalNo = [11,12]
TriggerAll = NumTarget = 0
Trigger1 = Time = 0
Value = 4000

[State 3613, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3613, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 3614

;-------------------------------------------------------------------------
[Statedef 3614]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 1
Anim = 3614
PowerAdd = 0
SprPriority = 2

[State 3614, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3614, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 3614, CtrlSet]
Type = CtrlSet
Trigger1 = Time = 0
Value = 1

[State 3614, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;HELPER : Sonic Rainboom, Lv2
;-------------------------------------------------------------------------
[Statedef 3615]
Physics = N
Ctrl = 0
Anim = 3611
SprPriority = 98

[State 3615, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 3615, Effect]
Type = Explod
Trigger1 = 1
Anim = 7023
ID = 7023
Pos = 0, 0
PosType = Left
BindTime = 1
ReMoveTime = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 1, 1
SprPriority = 90

[State 3615, PosSet]
Type = PosSet
Trigger1 = Time = 0
X = 0
Y = Pos Y - ScreenPos Y + 260

[State 3615, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = -5

[State 3615, VelSet]
Type = VelSet
Trigger1 = AnimElem = 2
Y = 0

[State 3615, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 2
Y = -30

[State 3615, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 3
X = 15
Y = -80

[State 3615, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 4
X = -15
Y = 10

[State 3615, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 5
Y = 10

[State 3615, SE]
Type = PlaySnd
Trigger1 = AnimElem = 5
Value = 6000, 12

[State 3615, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 5
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

[State 3615, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 5
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

[State 3615, VelSet]
Type = VelSet
Trigger1 = AnimElem = 9
Y = 20

[State -2, Voice : Sonic Rainboom, Lv2];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = IsHelper
TriggerAll = Root,Var(33) = 1
Trigger1 = AnimElem = 9
Value = 100000 + Root,Var(33), 3615
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom, Lv2];Japanese
Type = PlaySnd
TriggerAll = IsHelper
TriggerAll = Root,Var(33) = 2
Trigger1 = AnimElem = 9
Value = 100000 + Root,Var(33), 3615
Channel = 0
Volume = 128

[State 3615, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Time = 150

;-------------------------------------------------------------------------
;HELPER : Sonic Rainboom, Lv2b
;-------------------------------------------------------------------------
[Statedef 3616]
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 3502

[State 3616, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse((Root,PalNo = [11,12]),2.35,1.0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 3616, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1
IgNoreHitPause = 1

[State 3616, 再起動]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = StateNo
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 3616, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 3616, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 3503
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 3503
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 3616, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
TriggerAll = Root,PalNo != [11,12]
Trigger1 = !MoveContact && !MoveReversed
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
AnimType = DiagUp   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = DiagUp
Fall.AnimType = DiagUp
Priority = 7,Hit    ;Hit,Miss,Dodge
Damage = 370, 0
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 20, 20
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = S1, 25
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = -8, -4
Guard.Velocity = -4
Air.Velocity = -8, -4
AirGuard.Velocity = -4, -2
Down.Velocity = -8, -4
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
EnvShake.Time = 20
EnvShake.Freq = 90
EnvShake.Ampl = -15
EnvShake.Phase = 90
Guard.Dist = 0

[State 3616, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
TriggerAll = Root,PalNo = [11,12]
Trigger1 = !MoveContact && !MoveReversed
Attr = A,HA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFD      ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
AnimType = DiagUp   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = DiagUp
Fall.AnimType = DiagUp
Priority = 7,Hit    ;Hit,Miss,Dodge
Damage = 1000, 0
GetPower = 0, 0
GivePower = 20, 10
PauseTime = 20, 20
Guard.PauseTime = 20, 20
SparkNo = S8001
Guard.SparkNo = S8020
SparkXY = -25, -10
HitSound = S1, 25
GuardSound = S1, 112
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 15
Ground.HitTime = 15
Air.HitTime = 15
Guard.SlideTime = 13
Guard.HitTime = 13
Guard.CtrlTime = 13
AirGuard.HitTime = 13
AirGuard.CtrlTime = 13
Down.HitTime = 15
YAccel = .35
Ground.Velocity = -8, -4
Guard.Velocity = -4
Air.Velocity = -8, -4
AirGuard.Velocity = -4, -2
Down.Velocity = -8, -4
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
EnvShake.Time = 20
EnvShake.Freq = 90
EnvShake.Ampl = -15
EnvShake.Phase = 90
Guard.Dist = 0

[State 3616, ステート奪取]
Type = TargetState
TriggerAll = IsHelper
TriggerAll = Root,PalNo != [11,12]
TriggerAll = NumTarget
TriggerAll = Target,IsHelper = 0
Trigger1 = MoveHit = 1
Value = 3623
Persistent = 20
IgNoreHitPause = 1

[State 3616, ステート奪取]
Type = TargetState
TriggerAll = IsHelper
TriggerAll = Root,PalNo = [11,12]
TriggerAll = NumTarget
TriggerAll = Target,IsHelper = 0
Trigger1 = MoveHit = 1
Value = 3624
Persistent = 20
IgNoreHitPause = 1

[State 3616, 相手を振り向かせる]
Type = TargetFacing
TriggerAll = IsHelper
TriggerAll = NumTarget
TriggerAll = Target,IsHelper = 0
Trigger1 = MoveHit = 1
Trigger1 = Facing = Target,Facing
Value = -1
Persistent = 20
IgNoreHitPause = 1

[State 3616, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

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

[State 3620, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 3620

[State 3620, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 3620, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 3621

;-------------------------------------------------------------------------
[Statedef 3621]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

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

[State 3621, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 3621

[State 3621, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 3621, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 投げられ
;-------------------------------------------------------------------------
[Statedef 3622]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5050
PowerAdd = 0

[State 3622, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3622, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 3622

[State 3622, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 3622, 速度]
Type = VelSet
Trigger1 = Time = 0
X = -4
Y = -6

[State 3622, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.25

[State 3622, 地面にめり込まないように]
Type = PosSet
Trigger1 = Pos Y >= 0
Y = 0

[State 3622, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3622, 相手のステートを返還]
Type = SelfState
Trigger1 = Time = 120
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 投げられ2
;-------------------------------------------------------------------------
[Statedef 3623]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5035
PowerAdd = 0

[State 3623, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3623, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3623, 速度]
Type = VelSet
Trigger1 = Time = 0
X = -16
Y = -6

[State 3623, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 3623, Change Anim when done with Transition]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 3623, Coming Down Anim]
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

[State 3623, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 50302

[State 3623, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 投げられ2b
;-------------------------------------------------------------------------
[Statedef 3624]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5035
PowerAdd = 0

[State 3624, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 3624, LifeSet]
Type = LifeSet
Trigger1 = Time = 0
Value = 0

[State 3624, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 3624, 速度]
Type = VelSet
Trigger1 = Time = 0
X = -16
Y = -6

[State 3624, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 3624, Change Anim when done with Transition]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 3624, Coming Down Anim]
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

[State 3624, ChangeState]
Type = ChangeState
TriggerAll = Alive
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 50302

[State 3624, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5100
