;---------------------------------------------------------------------------
; 通常立ち
[Statedef 0]
Type = S
Physics = S
SprPriority = 0

[State 0, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 0, Are you dead?]
Type = ChangeState
Trigger1 = !Alive
Value = 5050

[State 0, 1]
Type = ChangeAnim
Trigger1 = Anim != 0 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0 ;Turn Anim Over
Value = 0

[State 0, 2]
Type = VelSet
Trigger1 = Time = 0
X = 0
Y = 0

[State 0, フライング対策の無敵]
Type = NotHitBy
TriggerAll = PalNo = [7,12]
Trigger1 = Ctrl = 0
Value = SCA,AA,AP,AT
Time = 1

;---------------------------------------------------------------------------
; 立ち状態からしゃがむ(AI専用記述)
[Statedef 9]
Type    = C
Physics = C
Anim = 10
Ctrl = 0

[State 9, 1]
Type = VelMul
Trigger1 = Time = 0
X = Const(Movement.Crouch.Friction)

[State 9, 2]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 11

;---------------------------------------------------------------------------
; 立ち状態からしゃがむ
[Statedef 10]
Type    = C
Physics = C
Anim = 10

[State 10, AI]
Type = ChangeState
Trigger1 = Var(59) > 0
Value = 0
Ctrl = 1

[State 10, 1]
Type = VelMul
Trigger1 = Time = 0
X = Const(Movement.Crouch.Friction)

[State 10, 2]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 11

;---------------------------------------------------------------------------
; しゃがみ
[Statedef 11]
Type    = C
Physics = C
Anim = 11
SprPriority = 0

[State 11, 1] ;Change from turning Animation
Type = ChangeAnim
Trigger1 = Anim = 6 && AnimTime = 0
Value = 11

[State 11, AI]
Type = ChangeState
Value = 12
TriggerAll = Var(59) > 0
Trigger1 = RoundState != 2
Trigger2 = P2Dist X < 0
Trigger3 = EnemyNear(Var(57)),StateType = A

;---------------------------------------------------------------------------
; しゃがみ状態から立ち上がる
[Statedef 12]
Type    = S
Physics = S
Anim = 12

[State 12, 1]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 前進(AI専用記述)
[Statedef 18]
Type    = S
Physics = S
Ctrl = 0
SprPriority = 0

[State 18, 1]
Type = VelSet
Trigger1 = 1
X = Const(Velocity.Walk.Fwd.X)

[State 18, 3]
Type = ChangeAnim
TriggerAll = Vel X > 0
Trigger1 = Anim != 20 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
Value = 20

[State 18, 失速 : ジャギ(良くできた弟～!!)効果]
Type = VelMul
Trigger1 = (Var(10) & 65536)
X = 0.50

[State 18, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType = L
Trigger1 = P2BodyDist X <= 90
Value = 0
Ctrl = 1

[State 18, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = P2BodyDist X <= 20
Trigger1 = EnemyNear(Var(57)),StateNo = [50050,50053]
Value = 0
Ctrl = 1

[State 18, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType != H
TriggerAll = EnemyNear(Var(57)),MoveType = A || EnemyNear(Var(57)),StateNo < 200
Trigger1 = P2BodyDist X <= 5
Value = 0
Ctrl = 1

[State 18, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) > 0
Trigger1 = RoundState != 2
Trigger2 = EnemyNear(Var(57)),Alive = 0
Trigger3 = EnemyNear(Var(57)),Life = 0
Trigger4 = P2Dist X < 0
Trigger5 = FrontEdgeBodyDist <= 10
Trigger6 = P2BodyDist X <= 5
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 後退(AI専用記述)
[Statedef 19]
Type    = S
Physics = S
Ctrl = 0
SprPriority = 0

[State 19, 2]
Type = VelSet
Trigger1 = 1
X = Const(Velocity.Walk.Back.X)

[State 19, 4]
Type = ChangeAnim
TriggerAll = Vel X < 0
Trigger1 = Anim != 21 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
Value = 21

[State 19, 失速 : ジャギ(良くできた弟～!!)効果]
Type = VelMul
Trigger1 = (Var(10) & 65536)
X = 0.50

[State 19, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType = L
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = P2BodyDist X >= 100
Value = 0
Ctrl = 1

[State 19, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = P2BodyDist X >= 10
Trigger1 = EnemyNear(Var(57)),StateNo != 5040
Trigger1 = EnemyNear(Var(57)),StateNo != 5210
Trigger2 = P2BodyDist X >= 40
Trigger2 = EnemyNear(Var(57)),StateNo = [50050,50053]
Value = 0
Ctrl = 1

[State 19, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) > 0
Trigger1 = RoundState != 2
Trigger2 = EnemyNear(Var(57)),Alive = 0
Trigger3 = EnemyNear(Var(57)),Life = 0
Trigger4 = P2Dist X < 0
Trigger5 = BackEdgeBodyDist <= 10
Trigger6 = Time >= 50
Trigger6 = P2BodyDist X >= 140
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 歩き
[Statedef 20]
Type    = S
Physics = S
SprPriority = 0

[State 20, AI]
Type = ChangeState
Trigger1 = Var(59) > 0
Value = 0
Ctrl = 1

[State 20, 1]
Type = VelSet
TriggerAll = Var(59) <= 0
Trigger1 = Command = "holdfwd"
X = Const(Velocity.Walk.Fwd.X)

[State 20, 2]
Type = VelSet
TriggerAll = Var(59) <= 0
Trigger1 = Command = "holdback"
X = Const(Velocity.Walk.Back.X)

[State 20, 3]
Type = ChangeAnim
TriggerAll = Vel X > 0
Trigger1 = Anim != 20 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
Value = 20

[State 20, 4]
Type = ChangeAnim
TriggerAll = Vel X < 0
Trigger1 = Anim != 21 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
Value = 21

[State 20, 失速 : ジャギ(良くできた弟～!!)効果]
Type = VelMul
Trigger1 = (Var(10) & 65536)
X = 0.50

;---------------------------------------------------------------------------
; ジャンプ開始(AI専用記述)
[Statedef 39]
Type    = S
Physics = S
Anim = 40
Ctrl = 0
SprPriority = 1

[State 39, ステート移行 : ジャギ(良くできた弟～!!)効果]
Type = ChangeState
Trigger1 = (Var(10) & 65536)
Value = 0
Ctrl = 1

[State 39, 1]
Type = VarSet
Trigger1 = Time = 0
sysvar(1) = 0

[State 39, AI]
Type = VarSet
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200) || (FVar(39) = 1)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType = L
Trigger1 = P2Dist X > 0
Trigger1 = P2BodyDist X >= 10
sysvar(1) = 1

[State 39, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType != H
TriggerAll = EnemyNear(Var(57)),MoveType = A || EnemyNear(Var(57)),StateNo >= 200
Trigger1 = Facing != EnemyNear(Var(57)),Facing
Trigger2 = Facing = EnemyNear(Var(57)),Facing
Trigger2 = P2BodyDist X >= 80
sysvar(1) = 1

[State 39, AI]
Type = VarSet
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200) || (FVar(39) = 1)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != A
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = P2BodyDist X >= 60
Trigger1 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger1 = EnemyNear(Var(57)),HitShakeOver = 0
sysvar(1) = -1

[State 39, AI]
Type = VarSet
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200) || (FVar(39) = 1)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = P2Dist X > 0
Trigger1 = EnemyNear(Var(57)),StateType != A
Trigger1 = P2BodyDist X >= 60
Trigger1 = (Random + GameTime) % 2 = 0
Trigger1 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger1 = EnemyNear(Var(57)),HitShakeOver = 0
Trigger2 = EnemyNear(Var(57)),StateType = A
sysvar(1) = 0

[State 39, AI]
Type = VarSet
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200) || (FVar(39) = 1)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = EnemyNear(Var(57)),StateType != A
Trigger1 = P2BodyDist X >= 60
Trigger2 = EnemyNear(Var(57)),StateNo != [120,159]
Trigger2 = EnemyNear(Var(57)),StateType = A
Trigger2 = P2Dist X > 0
Trigger2 = EnemyNear(Var(57)),HitFall
Trigger2 = P2BodyDist X >= 10 || Var(43) > 50
Trigger3 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = EnemyNear(Var(57)),StateType != A
Trigger3 = P2BodyDist X >= 120
Trigger3 = (Random + GameTime) % 2 = 0
Trigger4 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger4 = EnemyNear(Var(57)),StateType != A
Trigger4 = P2BodyDist X >= 180
Trigger5 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger5 = EnemyNear(Var(57)),StateType = A
Trigger5 = P2BodyDist X >= 10
sysvar(1) = 1

[State 39, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != A
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType != H
TriggerAll = EnemyNear(Var(57)),StateNo < 200
TriggerAll = BackEdgeBodyDist >= 60
TriggerAll = P2Dist X > 0
Trigger1 = P2BodyDist X < 30
Trigger2 = P2BodyDist X < 120
Trigger2 = (Random + GameTime) % 3 < 2
sysvar(1) = -1

[State 39, AI]
Type = Null;VarSet
TriggerAll = Var(59) > 0
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType != H
TriggerAll = EnemyNear(Var(57)),StateNo < 200
TriggerAll = P2Dist X > 0
Trigger1 = P2BodyDist X >= 100
Trigger1 = (Random + GameTime) % 2 = 0
sysvar(1) = 0

[State 39, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType != H
TriggerAll = EnemyNear(Var(57)),StateNo < 200
Trigger1 = P2BodyDist X = [20,159]
Trigger1 = (Random + GameTime) % 3 < 2
Trigger2 = P2BodyDist X >= 160
sysvar(1) = 1

[State 39, 限定状況]
Type = VarSet
TriggerAll = Var(59) > 0 || FVar(39) > 0
Trigger1 = PrevStateNo = 430
Trigger2 = (Var(40) & 1024)
Trigger3 = Var(42) <= 80
Trigger4 = PrevStateNo = 225
sysvar(1) = 1

[State 39, 限定状況]
Type = VarSet
TriggerAll = Var(59) > 0 || FVar(39) > 0
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType != H
Trigger1 = PrevStateNo = 430
Trigger2 = PrevStateNo = 225
sysvar(1) = -1

[State 39, 4]
Type = VelSet
Trigger1 = AnimTime = 0
X = IfElse(SysVar(1) = 0, Const(Velocity.Jump.Neu.X), IfElse(SysVar(1) = 1, Const(Velocity.Jump.Fwd.X), Const(Velocity.Jump.Back.X)))
Y = Const(Velocity.Jump.Y)

[State 39, 5]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = PrevStateNo = 100 ;Run_FWD
Trigger1 = SysVar(1) = 1
X = Const(Velocity.RunJump.Fwd.X)

[State 39, SE : ジャンプ音]
Type = PlaySnd
Trigger1 = AnimTime = 0
Value = 40, 0

[State 39, 投げ無敵]
Type = HitBy
Trigger1 = 1
Value = SCA,AA,AP
Time = 1

[State 39, 6]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 50
Ctrl = 1

;---------------------------------------------------------------------------
; ジャンプ開始
[Statedef 40]
Type    = S
Physics = S
Anim = 40
Ctrl = 0
SprPriority = 1

[State 40, AI]
Type = ChangeState
Trigger1 = Var(59) > 0
Value = 0
Ctrl = 1

[State 40, ステート移行 : ジャギ(良くできた弟～!!)効果]
Type = ChangeState
Trigger1 = (Var(10) & 65536)
Value = 0
Ctrl = 1

[State 40, 1]
Type = VarSet
Trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = Command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = Command = "holdback"
sysvar(1) = -1

[State 40, 4]
Type = VelSet
Trigger1 = AnimTime = 0
X = IfElse(SysVar(1) = 0, Const(Velocity.Jump.Neu.X), IfElse(SysVar(1) = 1, Const(Velocity.Jump.Fwd.X), Const(Velocity.Jump.Back.X)))
Y = Const(Velocity.Jump.Y)

[State 40, 5]
Type = VelSet
Trigger1 = AnimTime = 0
Trigger1 = PrevStateNo = 100 ;Run_FWD
Trigger1 = SysVar(1) = 1
X = Const(Velocity.RunJump.Fwd.X)

[State 40, SE : ジャンプ音]
Type = PlaySnd
Trigger1 = AnimTime = 0
Value = 40, 0

[State 40, 投げ無敵]
Type = HitBy
Trigger1 = 1
Value = SCA,AA,AP
Time = 1

[State 40, 6]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 50
Ctrl = 1

;---------------------------------------------------------------------------
; 空中ジャンプ開始
[Statedef 45]
Type    = A
Physics = N
Ctrl = 0
VelSet = 0,0

[State 45, 1]
Type = ChangeAnim
Trigger1 = SelfAnimExist(44)
Value = 44

[State 45, 2]
Type = ChangeAnim
Trigger1 = !SelfAnimExist(44)
Value = 41

[State 45, 3]
Type = VarSet
Trigger1 = Time = 0
sysvar(1) = 0

[State 45, 4]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = Command = "holdfwd"
sysvar(1) = 1

[State 45, 5]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = Command = "holdback"
sysvar(1) = -1

[State 45, 6]
Type = VelSet
Trigger1 = AnimTime = 0
X = IfElse(SysVar(1) = 0, Const(Velocity.AirJump.Neu.X), IfElse(SysVar(1) = 1, Const(Velocity.AirJump.Fwd.X), Const(Velocity.AirJump.Back.X)))
Y = Const(Velocity.AirJump.Y)

[State 45, 7]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 50
Ctrl = 1

;---------------------------------------------------------------------------
; ジャンプ
[Statedef 50]
Type    = A
Physics = A

[State 50, 1]
Type = VarSet
Trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
Type = ChangeAnim
Trigger1 = Time = 0
Value = IfElse((Vel X) = 0, 41, IfElse((Vel X) > 0, 42, 43))

[State 50, Freeze Anim]
Type = ChangeAnim
Trigger1 = Vel Y <= -2
Value = Anim

;---------------------------------------------------------------------------
; ジャンプ下降
[Statedef 51]
Type    = A
Physics = A

[State 51, 1]
Type = ChangeAnim
Trigger1 = Time = 0
Value = IfElse((Vel X) = 0, 44, IfElse((Vel X) > 0, 45, 46))

;---------------------------------------------------------------------------
; 着地
[Statedef 52]
Type    = S
Physics = S
Ctrl = 1
Anim = 47

[State 52, 1]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 52, 2]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 52, 3]
Type = CtrlSet
Trigger1 = Time
Value = 1

[State 52, SE : 着地音]
Type = PlaySnd
Trigger1 = Time = 0
Value = 52, 0

[State 52, Effect : 着地]
Type = Explod
Trigger1 = Time = 0
Anim = 7000
ID = 7000
Pos = 0,0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = -2
OwnPal = 1

[State 52, 4]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; ダッシュ
[Statedef 100]
Type    = S
Physics = S
Ctrl = IfElse(Var(59) <= 0,1,0)
Anim = 100
SprPriority = 1

[State 100, 1]
Type = VelSet
Trigger1 = 1
X = Const(Velocity.Run.Fwd.X)

[State 100, 2] ;Prevent Run from canceling into Walk
Type = AssertSpecial
Trigger1 = 1
Flag = NoWalk

[State 100, 3] ;Prevent from turning
Type = AssertSpecial
Trigger1 = 1
Flag = NoAutoTurn

[State 100, SE]
Type = PlaySnd
Trigger1 = Time % 3 = 0
Value = 100, 0

[State 100, 4]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holdfwd"
Value = 0

[State 100, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType = L
TriggerAll = EnemyNear(Var(57)),MoveType = I
Trigger1 = P2BodyDist X <= 90
Value = 0
Ctrl = 1

[State 100, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = P2BodyDist X <= 20
Trigger1 = EnemyNear(Var(57)),StateNo = [50050,50053]
Value = 0
Ctrl = 1

[State 100, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType != H
TriggerAll = EnemyNear(Var(57)),MoveType = A || EnemyNear(Var(57)),StateNo < 200
Trigger1 = P2BodyDist X <= 5
Trigger2 = Time >= 30
Trigger2 = Time > 0 = Time % 10
Trigger2 = (Random + GameTime) % 5 < 1
Value = 0
Ctrl = 1

[State 100, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) > 0
Trigger1 = RoundState != 2
Trigger2 = EnemyNear(Var(57)),Alive = 0
Trigger3 = EnemyNear(Var(57)),Life = 0
Trigger4 = P2Dist X < 0
Trigger5 = FrontEdgeBodyDist <= 10
Trigger6 = P2BodyDist X <= 5
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 後退ダッシュ
[Statedef 105]
Type    = S
Physics = S
Ctrl = IfElse(Var(59) <= 0,1,0)
Anim = 105
SprPriority = 1

[State 105, 1]
Type = VelSet
Trigger1 = 1
X = Const(Velocity.Run.Back.X)

[State 105, 2] ;Prevent Run from canceling into Walk
Type = AssertSpecial
Trigger1 = 1
Flag = NoWalk

[State 105, 3] ;Prevent from turning
Type = AssertSpecial
Trigger1 = 1
Flag = NoAutoTurn

[State 105, SE]
Type = PlaySnd
Trigger1 = Time % 3 = 0
Value = 100, 0

[State 105, 4]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holdback"
Value = 0

[State 105, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType = L
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = P2BodyDist X >= 100
Value = 0
Ctrl = 1

[State 105, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) = 1
TriggerAll = EnemyNear(Var(57)),StateType != L
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = P2BodyDist X >= 10
Trigger1 = EnemyNear(Var(57)),StateNo != 5040
Trigger1 = EnemyNear(Var(57)),StateNo != 5210
Trigger2 = P2BodyDist X >= 40
Trigger2 = EnemyNear(Var(57)),StateNo = [50050,50053]
Value = 0
Ctrl = 1

[State 105, AI]
Type = ChangeState
TriggerAll = Var(59) > 0 || FVar(39) > 0
Trigger1 = RoundState != 2
Trigger2 = EnemyNear(Var(57)),Alive = 0
Trigger3 = EnemyNear(Var(57)),Life = 0
Trigger4 = P2Dist X < 0
Trigger5 = BackEdgeBodyDist <= 10
Trigger6 = Time >= 50
Trigger6 = P2BodyDist X >= 140
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; バックステップ後の着地
[Statedef 106]
Type    = S
Physics = S
Ctrl = 0
Anim = 47

[State 106, 1]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 106, 2]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 106, 4]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 未使用ステート
[Statedef 110]
Type    = S
Physics = N

[State 110, 0]
Type = CtrlSet
Trigger1 = Time = 0
Value = 0

[State 110, 1]
Type = ChangeAnim
Trigger1 = Time = 0
Value = 110

[State 110, 2]
Type = HitBy
Trigger1 = Time = 0
Value = SCA, NT, ST, HT
Time = 30

[State 110, 3]
Type = VelSet
Trigger1 = Time = 0
X = 0
Z = -7

[State 110, 4]
Type = VelMul
Trigger1 = 1
Z = 0.8

[State 110, 5]
Type = VelSet
Trigger1 = AnimTime = -8
Z = 0

[State 110, 7]
Type = CtrlSet
Trigger1 = AnimTime = 0
Value = 1

[State 110, 8]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; 未使用ステート
[Statedef 115]
Type    = S
Physics = N

[State 115, 0]
Type = CtrlSet
Trigger1 = Time = 0
Value = 0

[State 115, 1]
Type = ChangeAnim
Trigger1 = Time = 0
Value = 110

[State 115, 2]
Type = HitBy
Trigger1 = Time = 0
Value = SCA, NT, ST, HT
Time = 30

[State 115, 3]
Type = VelSet
Trigger1 = Time = 0
X = 0
Z = 7

[State 115, 4]
Type = VelMul
Trigger1 = 1
Z = 0.8

[State 115, 5]
Type = VelSet
Trigger1 = AnimTime = -8
Z = 0

[State 115, 7]
Type = CtrlSet
Trigger1 = AnimTime = 0
Value = 1

[State 115, 8]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; ガード開始
[Statedef 120]
Type = U    ;Leave State Type unchanged
Physics = U ;Leave Physics unchanged

[State 120, Guard_Object]
Type = Helper
Trigger1 = NumHelper(6100) = 0
Trigger1 = StateType = A
HelperType = Normal
Name = "Guard_Object"
ID = 6100
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6100
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 0.5
Size.YScale = 0.5
IgNoreHitPause = 1

[State 120, 1]
Type = ChangeAnim
TriggerAll = Anim != [130,159]
Trigger1 = Time = 0
Value = 120 + (StateType = C) + (StateType = A) * 2

[State 120, 2]
Type = StateTypeSet
Trigger1 = Time = 0 && StateType = S
Physics = S

[State 120, 3]
Type = StateTypeSet
Trigger1 = Time = 0 && StateType = C
Physics = C

[State 120, 4]
Type = StateTypeSet
Trigger1 = Time = 0 && StateType = A
Physics = A

[State 120, Hi to Lo]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = S && Command = "holddown"
StateType = C
Physics = C

[State 120, Lo to Hi]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = C && Command != "holddown"
StateType = S
Physics = S

[State 120, Hi to Lo(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = S
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType = C
Trigger1 = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) - Var(51) / 100000 * 100000 != 0
Trigger2 = Var(51) - Var(51) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) - Var(52) / 100000 * 100000 != 0
Trigger3 = Var(52) - Var(52) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != 0
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != 0
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != 0
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
StateType = C
Physics = C

[State 120, Lo to Hi(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = C
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType != C
Trigger1 = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) / 100000 != 0
Trigger2 = Var(51) / 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) / 100000 != 0
Trigger3 = Var(52) / 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) / 100000 != 0
Trigger4 = Helper(60000),Var(10) / 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) / 100000 != 0
Trigger5 = Helper(60000),Var(11) / 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) / 100000 != 0
Trigger6 = Helper(60000),Var(12) / 100000 = EnemyNear(Var(57)),StateNo
StateType = S
Physics = S

[State 120, 5]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 130 + (StateType = C) + (StateType = A) * 2

[State 120, Stop Guarding]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holdback"
Trigger2 = !InGuardDist
Value = 140

[State 120, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = NumHelper(66666)
Trigger1 = !InGuardDist
Trigger1 = !Helper(66666),Var(54)
Trigger2 = RoundState = 3
Trigger2 = Time >= 80
Value = 140

;---------------------------------------------------------------------------
; 立ちガード受付
[Statedef 130]
Type    = S
Physics = S

[State 130, 後退OFF]
Type = VarSet
TriggerAll = Var(59) > 0
Trigger1 = RoundState != 2
Trigger2 = PlayerIDExist(Var(48))
Trigger2 = (Facing * (PlayerID(Var(48)),Pos X - Pos X)) >= 120
Trigger3 = PlayerIDExist(Var(48)) = 0
Trigger4 = BackEdgeBodyDist <= 10
V = 40
Value = (Var(40) | 1) - 1

[State 130, 後退]
Type = VarSet
TriggerAll = Var(59) > 0
Trigger1 = PlayerIDExist(Var(48))
Trigger1 = (Facing * (PlayerID(Var(48)),Pos X - Pos X)) = [0,80]
Trigger1 = BackEdgeBodyDist > 20
V = 40
Value = (Var(40) | 1)

[State 130, 1]
Type = ChangeAnim
TriggerAll = !(Var(40) & 1)
Trigger1 = Anim != 130
Value = 130

[State 130, Hi to Lo]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command = "holddown"
Value = 131

[State 130, AI]
Type = VelSet
Trigger1 = Anim = 21
X = Const(Velocity.Walk.Back.X)

[State 130, AI]
Type = ChangeAnim
TriggerAll = (Var(40) & 1)
Trigger1 = Anim != 21 && Anim != 5
Trigger2 = Anim = 5 && AnimTime = 0
Value = 21

[State 130, Hi to Lo(AI)]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType = C
Trigger1 = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) - Var(51) / 100000 * 100000 != 0
Trigger2 = Var(51) - Var(51) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) - Var(52) / 100000 * 100000 != 0
Trigger3 = Var(52) - Var(52) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != 0
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != 0
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != 0
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Value = 131

[State 130, Stop Guarding]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holdback"
Trigger2 = !InGuardDist
Value = 140

[State 130, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = NumHelper(66666)
Trigger1 = !InGuardDist
Trigger1 = !Helper(66666),Var(54)
Trigger2 = RoundState = 3
Trigger2 = Time >= 80
Value = 140

;---------------------------------------------------------------------------
; しゃがみガード受付
[Statedef 131]
Type    = C
Physics = C

[State 131, 1]
Type = ChangeAnim
Trigger1 = Anim != 131
Value = 131

[State 131, Lo to Hi]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holddown"
Value = 130

[State 131, Lo to Hi(AI)]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType != C
Trigger1 = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) / 100000 != 0
Trigger2 = Var(51) / 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) / 100000 != 0
Trigger3 = Var(52) / 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) / 100000 != 0
Trigger4 = Helper(60000),Var(10) / 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) / 100000 != 0
Trigger5 = Helper(60000),Var(11) / 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) / 100000 != 0
Trigger6 = Helper(60000),Var(12) / 100000 = EnemyNear(Var(57)),StateNo
Value = 130

[State 131, Stop Guarding]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holdback"
Trigger2 = !InGuardDist
Value = 140

[State 131, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = NumHelper(66666)
Trigger1 = !InGuardDist
Trigger1 = !Helper(66666),Var(54)
Trigger2 = RoundState = 3
Trigger2 = Time >= 80
Value = 140

;---------------------------------------------------------------------------
; 空中ガード受付
[Statedef 132]
Type    = A
Physics = N

[State 132, 1]
Type = ChangeAnim
Trigger1 = Anim != 132
Value = 132

[State 132, 2]
Type = VelAdd
Trigger1 = 1
Y = Const(Movement.YAccel)

[State 132, 3]
Type = VarSet
Trigger1 = 1
sysvar(0) = (Pos Y >= 0) && (Vel Y > 0)

[State 132, 4]
Type = VelSet
Trigger1 = SysVar(0)
Y = 0

[State 132, 5]
Type = PosSet
Trigger1 = SysVar(0)
Y = 0

[State 132, 6]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = SysVar(0)
Trigger1 = Command = "holdback"
Trigger1 = InGuardDist
Value = 130

[State 132, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
Trigger1 = SysVar(0)
Trigger1 = InGuardDist
Value = 130

[State 132, 7]
Type = ChangeState
Trigger1 = SysVar(0)
Value = 52

[State 132, Stop Guarding]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holdback"
Trigger2 = !InGuardDist
Value = 140

[State 132, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = NumHelper(66666)
Trigger1 = !InGuardDist
Trigger1 = !Helper(66666),Var(54)
Trigger2 = RoundState = 3
Trigger2 = Time >= 80
Value = 140

;---------------------------------------------------------------------------
; ガード終了
[Statedef 140]
Type = U    ;Leave State Type unchanged
Physics = U ;Leave Physics unchanged
Ctrl = 1

[State 140, 1]
Type = ChangeAnim
Trigger1 = Time = 0
Value = 140 + (StateType = C) + (StateType = A) * 2

[State 140, 2]
Type = StateTypeSet
Trigger1 = Time = 0 && StateType = S
Physics = S

[State 140, 3]
Type = StateTypeSet
Trigger1 = Time = 0 && StateType = C
Physics = C

[State 140, 4]
Type = StateTypeSet
Trigger1 = Time = 0 && StateType = A
Physics = A

[State 140, Hi to Lo]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = S && Command = "holddown"
StateType = C
Physics = C

[State 140, Lo to Hi]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = C && Command != "holddown"
StateType = S
Physics = S

[State 140, Hi to Lo(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = S
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType = C
Trigger1 = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) - Var(51) / 100000 * 100000 != 0
Trigger2 = Var(51) - Var(51) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) - Var(52) / 100000 * 100000 != 0
Trigger3 = Var(52) - Var(52) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != 0
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != 0
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != 0
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
StateType = C
Physics = C

[State 140, Lo to Hi(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = C
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType != C
Trigger1 = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) / 100000 != 0
Trigger2 = Var(51) / 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) / 100000 != 0
Trigger3 = Var(52) / 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) / 100000 != 0
Trigger4 = Helper(60000),Var(10) / 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) / 100000 != 0
Trigger5 = Helper(60000),Var(11) / 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) / 100000 != 0
Trigger6 = Helper(60000),Var(12) / 100000 = EnemyNear(Var(57)),StateNo
StateType = S
Physics = S

;[State 140, 5] ;Implemented within engine
;Type = ChangeState
;Trigger1 = AnimTime = 0
;Value = (StateType = C) * 11 + (StateType = A) * 51

;---------------------------------------------------------------------------
; 立ちガード硬直
[Statedef 150]
Type    = S
MoveType= H
Physics = N
VelSet = 0,0

[State 150, 1]
Type = ChangeAnim
Trigger1 = 1
Value = 150

[State 150, 2]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = HitShakeOver
Value = 151 + 2 * (Command = "holddown")

[State 150, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
Trigger1 = HitShakeOver
Value = 151 + 2 * (StateType = C)

[State 150, Hi to Lo]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = S && Command = "holddown"
StateType = C
Physics = C

[State 150, Lo to Hi]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = C && Command != "holddown"
StateType = S
Physics = S

[State 150, Hi to Lo(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = S
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType = C
Trigger1 = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) - Var(51) / 100000 * 100000 != 0
Trigger2 = Var(51) - Var(51) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) - Var(52) / 100000 * 100000 != 0
Trigger3 = Var(52) - Var(52) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != 0
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != 0
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != 0
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
StateType = C
Physics = C

[State 150, Lo to Hi(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = C
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType != C
Trigger1 = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) / 100000 != 0
Trigger2 = Var(51) / 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) / 100000 != 0
Trigger3 = Var(52) / 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) / 100000 != 0
Trigger4 = Helper(60000),Var(10) / 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) / 100000 != 0
Trigger5 = Helper(60000),Var(11) / 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) / 100000 != 0
Trigger6 = Helper(60000),Var(12) / 100000 = EnemyNear(Var(57)),StateNo
StateType = S
Physics = S

[State 150, 3]
Type = ForceFeedBack
Trigger1 = Time = 0
WaveForm = Square
Time = 3

;---------------------------------------------------------------------------
; 立ちガード硬直後の後退
[Statedef 151]
Type    = S
MoveType= H
Physics = S
Anim = 150

[State 151, 1]
Type = HitVelSet
Trigger1 = Time = 0
X = 1

[State 151, 2]
Type = VelSet
Trigger1 = Time = GetHitVar(SlideTime)
Trigger2 = HitOver
X = 0

[State 151, 3]
Type = CtrlSet
Trigger1 = Time = GetHitVar(CtrlTime)
Value = 1

[State 151, Hi to Lo]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = S && Command = "holddown"
StateType = C
Physics = C

[State 151, Lo to Hi]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = C && Command != "holddown"
StateType = S
Physics = S

[State 151, Hi to Lo(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = S
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType = C
Trigger1 = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) - Var(51) / 100000 * 100000 != 0
Trigger2 = Var(51) - Var(51) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) - Var(52) / 100000 * 100000 != 0
Trigger3 = Var(52) - Var(52) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != 0
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != 0
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != 0
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
StateType = C
Physics = C

[State 151, Lo to Hi(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = C
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType != C
Trigger1 = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) / 100000 != 0
Trigger2 = Var(51) / 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) / 100000 != 0
Trigger3 = Var(52) / 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) / 100000 != 0
Trigger4 = Helper(60000),Var(10) / 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) / 100000 != 0
Trigger5 = Helper(60000),Var(11) / 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) / 100000 != 0
Trigger6 = Helper(60000),Var(12) / 100000 = EnemyNear(Var(57)),StateNo
StateType = S
Physics = S

[State 151, 4]
Type = ChangeState
Trigger1 = HitOver
Value = 130
Ctrl = 1

;---------------------------------------------------------------------------
; しゃがみガード硬直
[Statedef 152]
Type    = C
MoveType= H
Physics = N
VelSet = 0,0

[State 152, 1]
Type = ChangeAnim
Trigger1 = 1
Value = 151

[State 152, 3]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = HitShakeOver
Value = 151 + 2 * (Command = "holddown")

[State 152, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
Trigger1 = HitShakeOver
Value = 151 + 2 * (StateType = C)

[State 152, Hi to Lo]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = S && Command = "holddown"
StateType = C
Physics = C

[State 152, Lo to Hi]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = C && Command != "holddown"
StateType = S
Physics = S

[State 152, Hi to Lo(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = S
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType = C
Trigger1 = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) - Var(51) / 100000 * 100000 != 0
Trigger2 = Var(51) - Var(51) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) - Var(52) / 100000 * 100000 != 0
Trigger3 = Var(52) - Var(52) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != 0
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != 0
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != 0
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
StateType = C
Physics = C

[State 152, Lo to Hi(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = C
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType != C
Trigger1 = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) / 100000 != 0
Trigger2 = Var(51) / 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) / 100000 != 0
Trigger3 = Var(52) / 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) / 100000 != 0
Trigger4 = Helper(60000),Var(10) / 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) / 100000 != 0
Trigger5 = Helper(60000),Var(11) / 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) / 100000 != 0
Trigger6 = Helper(60000),Var(12) / 100000 = EnemyNear(Var(57)),StateNo
StateType = S
Physics = S

[State 152, 4]
Type = ForceFeedBack
Trigger1 = Time = 0
WaveForm = Square
Time = 4

;---------------------------------------------------------------------------
; しゃがみガード硬直後の後退
[Statedef 153]
Type    = C
MoveType= H
Physics = C
Anim = 151

[State 153, 1]
Type = HitVelSet
Trigger1 = Time = 0
X = 1

[State 153, 2]
Type = VelSet
Trigger1 = Time = GetHitVar(SlideTime)
Trigger2 = HitOver
X = 0

[State 153, 3]
Type = CtrlSet
Trigger1 = Time = GetHitVar(CtrlTime)
Value = 1

[State 153, Hi to Lo]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = S && Command = "holddown"
StateType = C
Physics = C

[State 153, Lo to Hi]
Type = StateTypeSet
TriggerAll = Var(59) <= 0
Trigger1 = StateType = C && Command != "holddown"
StateType = S
Physics = S

[State 153, Hi to Lo(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = S
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType = C
Trigger1 = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) - Var(51) / 100000 * 100000 != 0
Trigger2 = Var(51) - Var(51) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) - Var(52) / 100000 * 100000 != 0
Trigger3 = Var(52) - Var(52) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != 0
Trigger4 = Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != 0
Trigger5 = Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != 0
Trigger6 = Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = EnemyNear(Var(57)),StateNo
StateType = C
Physics = C

[State 153, Lo to Hi(AI)]
Type = StateTypeSet
TriggerAll = Var(59) > 0
TriggerAll = StateType = C
TriggerAll = NumHelper(60000)
TriggerAll = (Var(51) - Var(51) / 100000 * 100000 = 0) || (Var(51) - Var(51) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Var(52) - Var(52) / 100000 * 100000 = 0) || (Var(52) - Var(52) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 = 0) || (Helper(60000),Var(10) - Helper(60000),Var(10) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 = 0) || (Helper(60000),Var(11) - Helper(60000),Var(11) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
TriggerAll = (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 = 0) || (Helper(60000),Var(12) - Helper(60000),Var(12) / 100000 * 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = EnemyNear(Var(57)),StateType != C
Trigger1 = (Var(51) / 100000 = 0) || (Var(51) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Var(52) / 100000 = 0) || (Var(52) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(10) / 100000 = 0) || (Helper(60000),Var(10) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(11) / 100000 = 0) || (Helper(60000),Var(11) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger1 = (Helper(60000),Var(12) / 100000 = 0) || (Helper(60000),Var(12) / 100000 != EnemyNear(Var(57)),StateNo)
Trigger2 = Var(51) / 100000 != 0
Trigger2 = Var(51) / 100000 = EnemyNear(Var(57)),StateNo
Trigger3 = Var(52) / 100000 != 0
Trigger3 = Var(52) / 100000 = EnemyNear(Var(57)),StateNo
Trigger4 = Helper(60000),Var(10) / 100000 != 0
Trigger4 = Helper(60000),Var(10) / 100000 = EnemyNear(Var(57)),StateNo
Trigger5 = Helper(60000),Var(11) / 100000 != 0
Trigger5 = Helper(60000),Var(11) / 100000 = EnemyNear(Var(57)),StateNo
Trigger6 = Helper(60000),Var(12) / 100000 != 0
Trigger6 = Helper(60000),Var(12) / 100000 = EnemyNear(Var(57)),StateNo
StateType = S
Physics = S

[State 153, 4]
Type = ChangeState
Trigger1 = HitOver
Value = 131
Ctrl = 1

;---------------------------------------------------------------------------
; 空中ガード硬直
[Statedef 154]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0

[State 154, 1]
Type = ChangeAnim
Trigger1 = 1
Value = 152

[State 154, 2]
Type = ChangeState
Trigger1 = HitShakeOver
Value = 155 ;AGUARDHIT2

[State 154, 3]
Type = ForceFeedBack
Trigger1 = Time = 0
WaveForm = Square
Time = 4

;---------------------------------------------------------------------------
; 空中ガード硬直後の後退
[Statedef 155]
Type    = A
MoveType= H
Physics = N
Anim = 152

[State 155, 1]
Type = HitVelSet
Trigger1 = Time = 0
X = 1
Y = 1

[State 155, 2]
Type = VelAdd
Trigger1 = 1
Y = Const(Movement.YAccel)

[State 155, 3]
Type = CtrlSet
Trigger1 = Time = GetHitVar(CtrlTime)
Value = 1

[State 155, 4]
Type = VarSet
Trigger1 = 1
sysvar(0) = (Pos Y >= 0) && (Vel Y > 0)

[State 155, 5]
Type = VelSet
Trigger1 = SysVar(0)
Y = 0

[State 155, 6]
Type = PosSet
Trigger1 = SysVar(0)
Y = 0

[State 155, 6]
Type = ChangeState
TriggerAll = Var(59) <= 0
Trigger1 = SysVar(0)
Trigger1 = Command = "holdback"
Trigger1 = InGuardDist
Value = 130

[State 155, AI]
Type = ChangeState
TriggerAll = Var(59) > 0
Trigger1 = SysVar(0)
Trigger1 = InGuardDist
Value = 130

[State 155, 7]
Type = ChangeState
Trigger1 = SysVar(0)
Value = 52

;---------------------------------------------------------------------------
; タイムオーバーで負けた時
[Statedef 170]
Type = S
Ctrl = 0
Anim = 170
VelSet = 0,0

[State 170, 1]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

;---------------------------------------------------------------------------
; タイムオーバーで引き分けた時
[Statedef 175]
Type = S
Ctrl = 0
VelSet = 0,0

[State 175, 1] ; If no Anim, use go to lose State.
Type = ChangeState
Trigger1 = Time = 0
Trigger1 = !SelfAnimExist(175)
Value = 170

[State 175, 2]
Type = ChangeAnim
Trigger1 = Time = 0
Value = 175

[State 175, 3]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

;---------------------------------------------------------------------------
; 勝利ポーズ分岐
[Statedef 180]
Type = S

[State 180, 1]
Type = ChangeState
Trigger1 = Time = 0
Value = 181 + (Random + GameTime) % 2

;---------------------------------------------------------------------------
; 勝利ポーズ
[Statedef 181]
Type = S
Ctrl = 0
Anim = 181
VelSet = 0,0

[State 181, 1]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

;---------------------------------------------------------------------------
; 勝利ポーズ2
[Statedef 182]
Type = S
Ctrl = 0
Anim = 182
VelSet = 0,0

[State 182, 1]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 182, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Pinkie"
ID = 182002
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 182002
KeyCtrl = 0
OwnPal = 1
Size.XScale = 0.5
Size.YScale = 0.5

;-------------------------------------------------------------------------
;HELPER : ピンキー
;-------------------------------------------------------------------------
[Statedef 182002]
Physics = N
Ctrl = 0
Anim = 100
SprPriority = 0

[State 182002, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 182002, Effect]
Type = Explod
Trigger1 = Time % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 1

[State 182002, VelSet]
Type = VelSet
Trigger1 = 1
X = 12

[State 182002, ChangeState]
Type = ChangeState
Trigger1 = IsHelper
Trigger1 = FrontEdgeDist <= -100
Trigger1 = Var(0) >= 3
Value = 182003

[State 182002, 振り向く]
Type = Turn
Trigger1 = FrontEdgeDist <= -100
Trigger1 = 1 || Var(0) := Var(0) + 1

;-------------------------------------------------------------------------
[Statedef 182003]
Physics = N
Ctrl = 0
Anim = 10000
SprPriority = 99

[State 182003, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 182003, 影を不可視化]
Type = AssertSpecial
Trigger1 = 1
Flag = NoShadow

[State 182003, 振り向く]
Type = Turn
Trigger1 = Time = 0

[State 182003, PosSet]
Type = PosSet
Trigger1 = 1
X = 0

[State 182003, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = Pos Y - ScreenPos Y + 480

[State 182003, PosAdd]
Type = PosAdd
Trigger1 = ScreenPos Y > 240
Y = -6

[State 182003, PosSet]
Type = PosSet
Trigger1 = ScreenPos Y <= 240
Y = Pos Y - ScreenPos Y + 240

[State 182003, Effect]
Type = Explod
Trigger1 = 1
Anim = 5990
ID = 5990
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Scale = 0.5, 0.5
OnTop = 1
OwnPal = 1

;---------------------------------------------------------------------------
; イントロ分岐
[Statedef 190]
Type = S
Ctrl = 0
VelSet = 0,0

[State 190, 1]
Type = ChangeAnim
Trigger1 = SelfAnimExist(190)
Value = 190

;Var(14) = 1, VS. Twilight Sparkle
;Var(14) = 2, VS. Pinkie Pie
;Var(14) = 3, VS. Applejack
;Var(14) = 4, VS. Rarity
;Var(14) = 5, VS. Fluttershy
;Var(14) = 6, VS. Rainbow Dash

[State 190, VS. Twilight Sparkle]
Type = VarSet
Trigger1 = P2Name = "Twilight Sparkle" || P4Name = "Twilight Sparkle"
Trigger2 = P2Name = "Twilight S." || P4Name = "Twilight S."
Trigger3 = P2Name = "UMVC3_Twilight Sparkle" || P4Name = "UMVC3_Twilight Sparkle"
V = 14
Value = 1

[State 190, VS. Pinkie Pie]
Type = Null;VarSet
Trigger1 = P2Name = "Pinkie Pie" || P4Name = "Pinkie Pie"
Trigger2 = P2Name = "UMVC3_Pinkie Pie" || P4Name = "UMVC3_Pinkie Pie"
V = 14
Value = 2

[State 190, VS. Applejack]
Type = VarSet
Trigger1 = P2Name = "Applejack" || P4Name = "Applejack"
Trigger2 = P2Name = "AJ" || P4Name = "AJ"
Trigger3 = P2Name = "UMVC3_Applejack" || P4Name = "UMVC3_Applejack"
V = 14
Value = 3

[State 190, VS. Rarity]
Type = VarSet
Trigger1 = P2Name = "Rarity" || P4Name = "Rarity"
Trigger2 = P2Name = "UMVC3_Rarity" || P4Name = "UMVC3_Rarity"
V = 14
Value = 4

[State 190, VS. Fluttershy]
Type = VarSet
Trigger1 = P2Name = "Fluttershy" || P4Name = "Fluttershy"
Trigger2 = P2Name = "UMVC3_Fluttershy" || P4Name = "UMVC3_Fluttershy"
V = 14
Value = 5

[State 190, VS. Rainbow Dash]
Type = VarSet
Trigger1 = P2Name = "Rainbow Dash" || P4Name = "Rainbow Dash"
Trigger2 = P2Name = "UMVC3_Rainbow Dash" || P4Name = "UMVC3_Rainbow Dash"
V = 14
Value = 6

[State 190, VS. Twilight Sparkle]
Type = ChangeState
Trigger1 = Var(14) = 1
Value = 219100

[State 190, VS. Pinkie Pie]
Type = ChangeState
Trigger1 = Var(14) = 2
Value = 219101

[State 190, VS. Applejack]
Type = ChangeState
Trigger1 = Var(14) = 3
Value = 219102

[State 190, VS. Rarity]
Type = ChangeState
Trigger1 = Var(14) = 4
Value = 219103

[State 190, VS. Fluttershy]
Type = ChangeState
Trigger1 = Var(14) = 5
Value = 219104

[State 190, VS. Rainbow Dash]
Type = ChangeState
Trigger1 = Var(14) = 6
Value = 219105

[State 190, 2] ;Go straight to intro.
Type = ChangeState
Trigger1 = Time = 0
Value = 191 + (Random + GameTime) % 2

;---------------------------------------------------------------------------
; イントロ
[Statedef 191]
Type = S
Ctrl = 0
Anim = 191

[State 191, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 191, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 191003
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 191003
KeyCtrl = 0
OwnPal = 1
Size.XScale = 0.5
Size.YScale = 0.5

[State 191, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 60
HelperType = Normal
Name = "Pinkie"
ID = 191002
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 191002
KeyCtrl = 0
OwnPal = 1
Size.XScale = 0.5
Size.YScale = 0.5

[State 191, 1]
Type = ChangeState
Trigger1 = NumHelper(191002)
Trigger1 = Helper(191002),Vel Y > 0
Trigger1 = Helper(191002),Pos Y >= 0
Value = 0

;-------------------------------------------------------------------------
;HELPER : ピンキー
;-------------------------------------------------------------------------
[Statedef 191002]
Physics = N
Ctrl = 0
Anim = 191002
SprPriority = 0

[State 191002, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 191002, 重力]
Type = VelAdd
Trigger1 = AnimElem = 3, > 0
Y = 0.50

[State 191002, VelSet]
Type = VelSet
Trigger1 = AnimElem = 3
Y = -8

[State 191002, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 1050, 0

[State 191002, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 10000

;-------------------------------------------------------------------------
;HELPER : プレゼント
;-------------------------------------------------------------------------
[Statedef 191003]
Physics = N
Ctrl = 0
Anim = 191003
SprPriority = -1

[State 191003, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 191003, ChangeState]
Type = ChangeState
Trigger1 = Time = 60
Value = 191004

;-------------------------------------------------------------------------
[Statedef 191004]
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6120
SprPriority = -1

[State 191004, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 191004, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 4
HelperType = Normal
Name = "Helper"
ID = 191005
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 191005
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 191004, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 191006
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 191006
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 191004, ヘルパー消去]
Type = ChangeState
Trigger1 = Time = 60
Value = 1008

;-------------------------------------------------------------------------
[Statedef 191005]
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6121
SprPriority = -1

[State 191005, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 191005, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 191005, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -2
Y = -8

[State 191005, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 30
Trigger1 = 1 || Var(0) := 0
Trigger2 = Time >= 31
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 191005, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)

[State 191005, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Var(0) >= 256

;-------------------------------------------------------------------------
[Statedef 191006]
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6122
SprPriority = 1

;Var(10)  = 親ID

[State 191006, 親ID]
Type = VarSet
TriggerAll = IsHelper
Trigger1 = Time = 0
V = 10
Value = Parent,ID

[State 191006, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = PlayerIDExist(Var(10)) = 0

[State 191006, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 191006, 親に追従]
Type = BindToParent
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 191006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Parent,Anim = 6120
Value = Anim
Elem = Parent,AnimElemNo(0)

;---------------------------------------------------------------------------
; イントロ2
[Statedef 192]
Type = S
Ctrl = 0
Anim = 191

[State 192, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 192, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 30
HelperType = Normal
Name = "Pinkie"
ID = 192002
Pos = 0, 0
PosType = Back
Facing = 1
StateNo = 192002
KeyCtrl = 0
OwnPal = 1
Size.XScale = 0.5
Size.YScale = 0.5

[State 192, 1]
Type = ChangeState
Trigger1 = NumHelper(192002)
Trigger1 = Helper(192002),Var(0) = 1
Trigger1 = Facing * (Helper(192002),Pos X - Pos X) <= 0
Value = 0

;-------------------------------------------------------------------------
;HELPER : ピンキー
;-------------------------------------------------------------------------
[Statedef 192002]
Physics = N
Ctrl = 0
Anim = 100
SprPriority = 0

[State 192002, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 192002, Effect]
Type = Explod
Trigger1 = Time % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 1

[State 192002, VelSet]
Type = VelSet
Trigger1 = 1
X = 12

[State 192002, 振り向く]
Type = Turn
Trigger1 = Var(0) = 0
Trigger1 = FrontEdgeDist <= -100
Trigger1 = 1 || Var(0) := 1

[State 192002, ChangeState]
Type = ChangeState
Trigger1 = IsHelper
Trigger1 = Facing * (Root,Pos X - Pos X) <= 0
Trigger1 = Var(0) = 1
Value = 10000

;---------------------------------------------------------------------------
; VS. トワイライトスパークル 特殊イントロ
[Statedef 219100]
Type = S
Ctrl = 0
Anim = 219100

[State 219100, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 219100, 1]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; VS. ピンキーパイ 特殊イントロ
[Statedef 219101]
Type = S
Ctrl = 0
Anim = 219100

[State 219101, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 219101, 1]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; VS. アップルジャック 特殊イントロ
[Statedef 219102]
Type = S
Ctrl = 0
Anim = 219100

[State 219102, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 219102, 1]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; VS. ラリティ 特殊イントロ
[Statedef 219103]
Type = S
Ctrl = 0
Anim = 219100

[State 219103, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 219103, 1]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; VS. フラッターシャイ 特殊イントロ
[Statedef 219104]
Type = S
Ctrl = 0
Anim = 219100

[State 219104, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 219104, 1]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; VS. レインボーダッシュ 特殊イントロ
[Statedef 219105]
Type = S
Ctrl = 0
Anim = 219100

[State 219105, イントロ状態を維持]
Type = AssertSpecial
Trigger1 = 1
Flag = Intro

[State 219105, 1]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0

;---------------------------------------------------------------------------
; 挑発
[Statedef 195]
Type = S
Ctrl = 0
Anim = 195
VelSet = 0,0
MoveType = I
Physics = S
SprPriority = 2

[State 195, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 立ち喰らい
[Statedef 5000]
Type    = S
MoveType= H
Physics = N
VelSet = 0,0

[State 5000, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) != [3,5]
Value = IfElse((GetHitVar(GroundType) = 1),5000,5010) + GetHitVar(AnimType)

[State 5000, 2] ;Anim for HIT_BACK
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) = [3,5]
Value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
Value = 5047 + GetHitVar(AnimType) ;5051 - 4 + Type

[State 5000, 4] ;Freeze Anim
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

[State 5000, 5] ;State Type gets set to aerial if getting hit up
Type = StateTypeSet
Trigger1 = Time = 0
Trigger1 = GetHitVar(YVel) != 0 || GetHitVar(Fall)
Trigger2 = Pos Y != 0
StateType = A

[State 5000, 6]
Type = ChangeState
Trigger1 = HitShakeOver
Trigger1 = GetHitVar(YVel) = 0 && !GetHitVar(Fall)
Value = 5001 ;HITG_Slide

[State 5000, 7]
Type = ChangeState
Trigger1 = HitShakeOver
Value = 5030

[State 5000, FFB Light]
Type = ForceFeedBack
Trigger1 = Anim = 5000
Trigger2 = Anim = 5010
Persistent = 0
Time = 6
WaveForm = Square

[State 5000, FFB Medium]
Type = ForceFeedBack
Trigger1 = Anim = 5001
Trigger2 = Anim = 5011
Persistent = 0
Time = 8
WaveForm = SineSquare
Ampl = 110,-1,-.3

[State 5000, FFB Hard]
Type = ForceFeedBack
Trigger1 = Anim = 5012
Trigger2 = Anim = 5002
Trigger3 = Anim = 5030
Persistent = 0
Time = 15
WaveForm = SineSquare
Ampl = 140

;---------------------------------------------------------------------------
; 立ち喰らい後の後退
[Statedef 5001]
Type    = S
MoveType= H
Physics = S

[State 5001, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5001, 1]
Type = HitVelSet
Trigger1 = Time = 0
X = 1

[State 5001, 2]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Value = 5005 + GetHitVar(AnimType) + (GetHitVar(GroundType) = 2) * 10

[State 5001, 3] ;Stop sliding back
Type = VelMul
Trigger1 = Time >= GetHitVar(SlideTime)
X = .6

[State 5001, 4]
Type = VelSet
Trigger1 = HitOver
X = 0

[State 5001, 5]
Type = DefenceMulSet
Trigger1 = HitOver
Value = 1

[State 5001, 6]
Type = ChangeState
Trigger1 = HitOver
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; しゃがみ喰らい
[Statedef 5010]
Type    = C
MoveType= H
Physics = N
VelSet = 0,0

[State 5010, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5010, 1] ;Anim for HIT_LIGHT to HIT_HARD
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) != [3,5]
Value = 5020 + GetHitVar(AnimType)

[State 5010, 2] ;Anim for HIT_BACK
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) = [3,5]
Value = 5030

[State 5010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
Value = 5047 + GetHitVar(AnimType) ;5051 - 4 + Type

[State 5010, 4] ;Freeze Anim
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

[State 5010, 5] ;State Type gets set to aerial if getting hit up
Type = StateTypeSet
TriggerAll = Time = 0
Trigger1 = GetHitVar(YVel) != 0 || GetHitVar(Fall)
Trigger2 = Pos Y != 0
StateType = A

[State 5010, 6]
Type = ChangeState
Trigger1 = HitShakeOver
Trigger1 = GetHitVar(YVel) = 0 && !GetHitVar(Fall)
Value = 5011 ;HITC_Slide

[State 5010, 7]
Type = ChangeState
Trigger1 = HitShakeOver
Value = 5030

[State 5010, FFB Light]
Type = ForceFeedBack
Trigger1 = Anim = 5020
Persistent = 0
Time = 6
WaveForm = Square

[State 5010, FFB Medium]
Type = ForceFeedBack
Trigger1 = Anim = 5021
Persistent = 0
Time = 8
WaveForm = SineSquare
Ampl = 110,-1,-.3

[State 5010, FFB Hard]
Type = ForceFeedBack
Trigger1 = Anim = 5022
Persistent = 0
Time = 15
WaveForm = SineSquare
Ampl = 140

;---------------------------------------------------------------------------
; しゃがみ喰らい後の後退
[Statedef 5011]
Type    = C
MoveType= H
Physics = C

[State 5011, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5011, 1]
Type = HitVelSet
Trigger1 = Time = 0
X = 1

[State 5011, 2]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Value = 5025 + GetHitVar(AnimType)

[State 5011, 3] ;Stop sliding back
Type = VelMul
Trigger1 = Time >= GetHitVar(SlideTime)
X = .6

[State 5011, 4]
Type = VelSet
Trigger1 = HitOver
X = 0

[State 5011, 5]
Type = DefenceMulSet
Trigger1 = HitOver
Value = 1

[State 5011, 6]
Type = ChangeState
Trigger1 = HitOver
Value = 11
Ctrl = 1


;---------------------------------------------------------------------------
; 空中喰らい
[Statedef 5020]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0

[State 5020, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5020, 1] ;Anim for HIT_LIGHT to HIT_HARD
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) != [3,5]
Value = IfElse((GetHitVar(AirType) = 1),5000,5010) + GetHitVar(AnimType)

[State 5020, 2] ;Anim for HIT_BACK
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = GetHitVar(AnimType) = [3,5]
Value = 5030

[State 5020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = (GetHitVar(AnimType) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(AnimType)))
Value = 5047 + GetHitVar(AnimType) ;5051 - 4 + Type

[State 5020, 4] ;Freeze Anim
Type = ChangeAnim
Trigger1 = Time > 0
Value = Anim

[State 5020, 5]
Type = ChangeState
Trigger1 = HitShakeOver
Value = 5030

[State 5020, FFB Light]
Type = ForceFeedBack
Trigger1 = Anim = 5000
Trigger2 = Anim = 5010
Persistent = 0
Time = 6
WaveForm = Square

[State 5020, FFB Medium]
Type = ForceFeedBack
Trigger1 = Anim = 5001
Trigger2 = Anim = 5011
Persistent = 0
Time = 8
WaveForm = SineSquare
Ampl = 110,-1,-.3

[State 5020, FFB Hard]
Type = ForceFeedBack
Trigger1 = Anim = 5012
Trigger2 = Anim = 5002
Trigger3 = Anim = 5030
Trigger4 = Anim = [5051,5059]
Persistent = 0
Time = 15
WaveForm = SineSquare
Ampl = 140

;---------------------------------------------------------------------------
; 吹っ飛び開始
[Statedef 5030]
Type    = A
MoveType= H
Physics = N
Ctrl = 0

[State 5030, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5030, 吹っ飛びアニメ切り替え]
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = SelfAnimExist(5035)
Trigger1 = Anim != [5051,5059] ;Not if in hit up Anim
Trigger1 = Anim != 5090 ;Not if hit off Ground Anim
Trigger1 = Anim != 5035
Value = 5035

[State 5030, 1]
Type = VelAdd;Gravity
Trigger1 = 1
Y = GetHitVar(YAccel)

[State 5030, 2]
Type = HitVelSet
Trigger1 = Time = 0
X = 1
Y = 1

[State 5030, 3]
Type = ChangeState
TriggerAll = !HitFall
Trigger1 = HitOver
Trigger2 = Vel Y > 0    ;Hit Ground
Trigger2 = Pos Y >= 10  ;.
Value = 5040 ;HITA_RECOV

[State 5030, 4]
Type = ChangeState
TriggerAll = HitFall
Trigger1 = HitOver
Trigger2 = Vel Y > 0    ;Hit Ground
Trigger2 = Pos Y >= 10  ;.
Value = 5050 ;HITA_Fall

[State 5030, 5]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 5035 ;HITA_UP (transition)

;---------------------------------------------------------------------------
; 吹っ飛び（ダウン判定）
[Statedef 5035]
Type    = A
MoveType= H
Physics = N

[State 5035, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5035, 1]
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = SelfAnimExist(5035)
Trigger1 = Anim != [5051,5059] ;Not if in hit up Anim
Trigger1 = Anim != 5090 ;Not if hit off Ground Anim
Trigger1 = Anim != 5035
Value = 5035

[State 5035, 2]
Type = VelAdd
Trigger1 = 1
Y = GetHitVar(YAccel)

[State 5035, 3]
Type = ChangeState
TriggerAll = !HitFall
Trigger1 = HitOver  ;Hit is Over
Trigger2 = AnimTime = 0 ;Animation Over
Trigger3 = Vel Y > 0    ;Hit Ground
Trigger3 = Pos Y >= 10  ;.
Trigger4 = Time = 0     ;No transition Anim
Trigger4 = Anim != 5035 ;.
Value = 5040 ;HITA_RECOV

[State 5035, 4]
Type = ChangeState
TriggerAll = HitFall
Trigger1 = HitOver  ;Hit is Over
Trigger2 = AnimTime = 0 ;Anim is Over
Trigger3 = Vel Y > 0    ;Hit Ground
Trigger3 = Pos Y >= 10  ;.
Trigger4 = Time = 0     ;No transition Anim
Trigger4 = Anim != 5035 ;.
Value = 5050 ;HITA_Fall

;---------------------------------------------------------------------------
; 吹っ飛びから自動受身
[Statedef 5040]
Type    = A
MoveType= H
Physics = N

[State 5040, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5040, 1]
Type = ChangeState
Trigger1 = !Alive
Value = 5050

[State 5040, 2]
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim != 5040
Trigger2 = Time = 0
Trigger2 = Anim != 5035
Value = 5040

[State 5040, 3]
Type = CtrlSet
Trigger1 = HitOver
Value = 1

[State 5040, 4]
Type = StateTypeSet
Trigger1 = HitOver
MoveType = I

[State 5040, 5]
Type = VelAdd
Trigger1 = 1
Y = GetHitVar(YAccel)

[State 5040, 6]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52 ;JumpLAND

;---------------------------------------------------------------------------
; 吹っ飛びからダウン下降
[Statedef 5050]
Type    = A
MoveType= H
Physics = N

[State 5050, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5050, 1] ;Change Anim when done with transition
Type = ChangeAnim
Trigger1 = AnimTime = 0
Trigger1 = Anim = 5035
Trigger2 = Time = 0     ;If no transition Anim
Trigger2 = Anim != 5035
Trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
Trigger2 = Anim != 5090 ;Not if hit off Ground Anim
Value = 5050

[State 5050, 2] ;Coming down Anim
Type = ChangeAnim
Trigger1 = Anim = [5050,5059]
Trigger1 = Vel Y >= IfElse(Anim = 5050, 1, -2)
Trigger1 = SelfAnimExist(Anim + 10)
Value = Anim + 10
Persistent = 0

[State 5050, 3] ;Gravity
Type = VelAdd
Trigger1 = 1
Y = GetHitVar(YAccel)

[State 5050, 4] ;Recover near Ground
Type = ChangeState
TriggerAll = Var(59) <= 0
TriggerAll = Vel Y > 0
TriggerAll = Pos Y >= -20
TriggerAll = Alive
TriggerAll = CanRecover
Trigger1 = Command = "recovery"
Value = 5200 ;HITFall_Recover

[State 5050, 5]; Recover in mid Air
Type = ChangeState
TriggerAll = Var(59) <= 0
TriggerAll = Vel Y > -1
TriggerAll = Alive
TriggerAll = CanRecover
Trigger1 = Command = "recovery"
Value = 5210 ;HITFall_AirRecover

[State 5050, 4] ;Recover near Ground
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = Vel Y > 0
TriggerAll = Pos Y >= -20
TriggerAll = Alive
TriggerAll = CanRecover
Trigger1 = Time
Trigger1 = Var(50) % 10 < 5
Trigger1 = Random < 100 * (Time / 5)
Trigger2 = EnemyNear(Var(57)),MoveType = H
Trigger3 = EnemyNear(Var(57)),AnimTime < -80
Trigger3 = EnemyNear(Var(57)),HitDefAttr = SCA,AA,AP,AT
Trigger4 = RoundState != 2
Value = 5200 ;HITFall_Recover

[State 5050, 5]; Recover in mid Air
Type = ChangeState
TriggerAll = Var(59) > 0
TriggerAll = (Var(58) >= 5) || (Var(50) <= Var(58) * 200 && (Random + GameTime) % 1000 <= 200)
TriggerAll = NumHelper(60000)
TriggerAll = NumHelper(66666)
TriggerAll = Vel Y > -1
TriggerAll = Alive
TriggerAll = CanRecover
Trigger1 = Time
Trigger1 = Var(50) % 10 < 5
Trigger1 = Random < 100 * (Time / 5)
Trigger2 = EnemyNear(Var(57)),MoveType = H
Trigger3 = EnemyNear(Var(57)),AnimTime < -80
Trigger3 = EnemyNear(Var(57)),HitDefAttr = SCA,AA,AP,AT
Trigger4 = RoundState != 2
Value = 5210 ;HITFall_AirRecover

[State 5050, 6]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= IfElse((Anim = [5051,5059]) || (Anim = [5061,5069]), 0, 25)
Value = 5100 ;HIT_BOUNCE

;---------------------------------------------------------------------------
; 足払いで転ぶ（硬直）
[Statedef 5070]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0

[State 5070, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5070, 1]
Type = ChangeAnim 
Trigger1 = 1
Value = 5070

[State 5070, 2]
Type = ChangeState
Trigger1 = HitShakeOver
Value = 5071

[State 5070, 3]
Type = ForceFeedBack
Trigger1 = Time = 0
Time = 12
WaveForm = SineSquare
Ampl = 140

;---------------------------------------------------------------------------
; 足払いで転ぶ（硬直後）
[Statedef 5071]
Type    = A
MoveType= H
Physics = N

[State 5071, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5071, 1]
Type = HitVelSet
Trigger1 = Time = 0
X = 1
Y = 1

[State 5071, 2] ;Acceleration
Type = VelAdd
Trigger1 = 1
Y = GetHitVar(YAccel)

[State 5071, 3] ;Hit Ground
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 15
Type = ChangeState
Value = 5110

;---------------------------------------------------------------------------
; 横に倒れている時の喰らい硬直
[Statedef 5080]
Type    = L
MoveType= H
Physics = N
VelSet = 0,0

[State 5080, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5080, 1] ;Set default Anim
Type = VarSet
Trigger1 = Time = 0
sysvar(2) = IfElse (GetHitVar(YVel) = 0, 5080, 5090)

[State 5080, 2]
Type = VarAdd
Trigger1 = Time = 0
Trigger1 = (Anim = [5081,5089]) || (Anim = [5111,5119])
Trigger1 = SelfAnimExist(SysVar(2) + (Anim % 10))
sysvar(2) = Anim % 10

[State 5080, 3] ;If 5090 doesn't exist, default to 5030
Type = VarSet
Trigger1 = Time = 0
Trigger1 = SysVar(2) = 5090
Trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 5080, 3] ;Freeze
Type = ChangeAnim
Trigger1 = 1
Value = SysVar(2)

[State 5080, 4]
Type = ChangeState
Trigger1 = HitShakeOver
Trigger1 = GetHitVar(YVel) = 0
Value = 5081 ;HITL_Slide

[State 5080, 5]
Type = ChangeState
Trigger1 = HitShakeOver
Trigger1 = GetHitVar(YVel) != 0
Value = 5030 ;HITA_UP

;---------------------------------------------------------------------------
; 横に倒れている時の喰らい硬直後の後退
[Statedef 5081]
Type    = L
MoveType= H
Physics = C

[State 5081, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5081, 1]
Type = HitVelSet
Trigger1 = Time = 0
X = 1

[State 5081, 2]
Type = VelSet
Trigger1 = HitOver
X = 0

[State 5081, 3] ;Don't show hit Ground frame
Type = VarSet
Trigger1 = Time = 0
sysvar(0) = 1

[State 5081, 4]
Type = ChangeState
Trigger1 = HitOver
Value = 5110 ;HIT_LIEDOWN

;---------------------------------------------------------------------------
; 吹っ飛び後の地面に激突
[Statedef 5100]
Type    = L
MoveType= H
Physics = N

[State 5100, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5100, 1]
Type = VelSet
Trigger1 = Time = 0
Trigger1 = GetHitVar(Fall.YVel) = 0
Trigger1 = Vel X > 1
X = 1

[State 5100, EnvShake]
Type = FallEnvShake
Trigger1 = Time = 0

[State 5100, Var] ;Save Fall Velocity
Type = VarSet
Trigger1 = Time = 0
sysvar(1) = Floor(Vel Y)

[State 5100, うつ伏せダウン] ;Hit Ground Anim (Trip)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = SelfAnimExist(5101)
Trigger1 = Anim = 5070
Trigger2 = Anim = [5130,5133]
Trigger3 = Anim = 5330
Trigger4 = Anim = 5902
Trigger5 = Anim = [5950,5951]
Trigger6 = Anim = 9219
Trigger7 = Anim = [117261,117262]
Value = 5101

[State 5100, 2] ;Hit Ground Anim (normal)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != [5100,5102]
Trigger1 = Anim != [5061,5069]
Trigger2 = !SelfAnimExist(5100 + (Anim % 10))
Value = 5100

[State 5100, 3] ;Hit Ground Anim (for hit up)
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = Anim = [5061,5069]
Trigger1 = SelfAnimExist(5100 + (Anim % 10))
Value = 5100 + (Anim % 10)

[State 5100, 4]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 5100, 5]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 5100, 6] ;Reduce speed
Type = VelMul
Trigger1 = Time = 0
X = 0.75

[State 5100, 7]
Type = ChangeState
Trigger1 = Time = 0
Trigger1 = GetHitVar(Fall.YVel) = 0
Value = 5110 ;HIT_LIEDOWN

[State 5100, 8]
Type = GameMakeAnim
Trigger1 = Time = 0
Value = 60 + (SysVar(1) > 5) + (SysVar(1) > 14)
Pos = 0, 0
Under = SysVar(1) <= 14

[State 5100, 9]
Type = HitFallDamage
Trigger1 = Time = 0

[State 5100, 10]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 1

[State 5100, 11]
Type = PosFreeze
Trigger1 = 1

[State 5100, 12]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 5101

[State 5100, 13]
Type = ForceFeedBack
Trigger1 = Time = 0
WaveForm = SineSquare
Ampl = 128,-3,-.2,.005
Time = 20

;---------------------------------------------------------------------------
; 地面に激突後バウンド
[Statedef 5101]
Type    = L
MoveType= H
Physics = N

[State 5101, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5101, うつ伏せダウン] ;Coming hit Ground Anim (Trip)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = SelfAnimExist(5161)
Trigger1 = Anim = 5070
Trigger2 = Anim = [5130,5133]
Trigger3 = Anim = 5330
Trigger4 = Anim = 5902
Trigger5 = Anim = [5950,5951]
Trigger6 = Anim = 9219
Trigger7 = Anim = [117261,117262]
Value = 5161

[State 5101, 1] ;Coming hit Ground Anim (normal)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != [5160,5162]
Trigger1 = Anim != [5101,5109]
Trigger2 = !SelfAnimExist(5160 + (Anim % 10))
Value = 5160

[State 5101, 2] ;Coming hit Ground Anim (for hit up)
Type = ChangeAnim
TriggerAll = Time = 0
Trigger1 = Anim = [5101,5109]
Trigger1 = SelfAnimExist(5160 + (Anim % 10))
Value = 5160 + (Anim % 10)

[State 5101, 3]
Type = HitFallVel
Trigger1 = Time = 0

[State 5101, 4]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 5101, 5] ;Acceleration
Type = VelAdd
Trigger1 = 1
Y = .4

[State 5101, 6] ;Hit Ground
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 12
Type = ChangeState
Value = 5110

;---------------------------------------------------------------------------
; 横に倒れる
[Statedef 5110]
Type    = L
MoveType= H
Physics = N

[State 5110, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5110, EnvShake]
Type = FallEnvShake
Trigger1 = Time = 0

[State 5110, うつ伏せダウン] ;Hit Ground Anim (Trip)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = SelfAnimExist(5171)
Trigger1 = Anim = 5070
Trigger2 = Anim = [5130,5133]
Trigger3 = Anim = 5330
Trigger4 = Anim = 5902
Trigger5 = Anim = [5950,5951]
Trigger6 = Anim = 9219
Trigger7 = Anim = [117261,117262]
Value = 5171

[State 5110, 1] ;For hit up/up-diag Type (from State 5081)
Type = ChangeAnim
Persistent = 0
Trigger1 = SelfAnimExist(5110 + (Anim % 10))
Trigger1 = Anim = [5081,5089]
Value = 5110 + (Anim % 10)

[State 5110, 2] ;Hit Ground Anim (normal)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != [5170,5172]
TriggerAll = Anim != [5110,5119] ;Not already changed Anim
Trigger1 = Anim != [5161,5169]
Trigger2 = !SelfAnimExist(5170 + (Anim % 10))
Value = 5170

[State 5110, 3] ;Hit Ground Anim (for hit up)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != [5110,5119] ;Not already changed Anim
Trigger1 = Anim = [5161,5169]
Trigger1 = SelfAnimExist(5170 + (Anim % 10))
Value = 5170 + (Anim % 10)

[State 5110, 4]
Type = HitFallDamage
Trigger1 = Time = 0

[State 5110, 5]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 5110, Var] ;Get Fall Velocity
Type = VarSet
Trigger1 = Time = 0
Trigger1 = GetHitVar(Fall.YVel) != 0
sysvar(1) = Floor(Vel Y)

[State 5110, 6]
Type = PlaySnd
Trigger1 = Time = 0
Trigger1 = !SysVar(0)
Value = 2, 1

[State 5110, 7]
Type = GameMakeAnim
Trigger1 = Time = 0
Trigger1 = !SysVar(0)
Value = 60 + (SysVar(1) > 5) + (SysVar(1) > 14)
Pos = 0, 0
Under = SysVar(1) <= 14

[State 5110, 8]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 5110, 9] ;For hit up Type
Type = ChangeAnim
Persistent = 0
TriggerAll = Anim = [5171,5179]
TriggerAll = SelfAnimExist(5110 + (Anim % 10))
Trigger1 = AnimTime = 0
Trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit Ground Anim
Value = 5110 + (Anim % 10)

[State 5110, 10] ;For normal
Type = ChangeAnim
Persistent = 0
TriggerAll = Anim != [5111,5119]
Trigger1 = AnimTime = 0
Trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit Ground frame
Value = 5110

[State 5110, 11] ;If just died
Type = ChangeState
TriggerAll = !Alive
Trigger1 = AnimTime = 0
Trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit Ground frame
Trigger3 = Anim = [5110,5119]
Value = 5150

[State 5110, 12]
Type = VarSet
Trigger1 = SysVar(0)
Trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
Type = VelMul
Trigger1 = 1
X = 0.85

[State 5110, 14]
Type = ForceFeedBack
Trigger1 = Alive
Trigger1 = Time = 0
Time = 8
Ampl = 240
WaveForm = Sine

[State 5110, 15]
Type = ForceFeedBack
Trigger1 = !Alive
Trigger1 = Time = 0
Ampl = 200, 7, -.467
Time = 30
WaveForm = Sine

;---------------------------------------------------------------------------
; 起き上がる
[Statedef 5120]
Type    = L
MoveType= I
Physics = N

[State 5120, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5120, うつ伏せダウン] ;Hit Ground Anim (Trip)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = SelfAnimExist(5121)
Trigger1 = Anim = 5070
Trigger2 = Anim = [5130,5133]
Trigger3 = Anim = 5330
Trigger4 = Anim = 5902
Trigger5 = Anim = [5950,5951]
Trigger6 = Anim = 9219
Trigger7 = Anim = [117261,117262]
Value = 5121

[State 5120, 1a] ;Get up Anim (normal)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = Anim != [5120,5122]
Trigger1 = Anim != [5111,5119]
Trigger1 = Anim != [5161,5169]
Trigger1 = Anim != [5171,5179]
Trigger2 = !SelfAnimExist(5120 + (Anim % 10))
Value = 5120

[State 5120, 1b] ;Get up Anim (for hit up/diag-up)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = SelfAnimExist(5120 + (Anim % 10))
Trigger1 = Anim = [5111,5119]
Trigger2 = Anim = [5161,5169]
Trigger3 = Anim = [5171,5179]
Value = 5120 + (Anim % 10)

[State 5120, 2]
Type = VelSet
Trigger1 = Time = 0
X = 0

[State 5120, 3]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 5120, 4]
Type = HitFallSet
Trigger1 = AnimTime = 0
Value = 1

[State 5120, 5] ;Can't be thrown right after getting up
Type = NotHitBy
Trigger1 = AnimTime = 0
Value = , NT,ST,HT
Time = 4

[State 5120, 6] ;Can't be hit right after getting up (short Time)
Type = NotHitBy
Trigger1 = AnimTime = 0
Value2 = SCA,AA,AP,AT
Time = 1

[State 5120, 7]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 横に倒れる（敗北時）
[Statedef 5150]
Type    = L
MoveType= H
Physics = N
SprPriority = -3

[State 5150, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5150, うつ伏せダウン] ;Hit Ground Anim (Trip)
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = SelfAnimExist(5141)
Trigger1 = Anim = 5070
Trigger2 = Anim = [5130,5133]
Trigger3 = Anim = 5330
Trigger4 = Anim = 5902
Trigger5 = Anim = [5950,5951]
Trigger6 = Anim = 9219
Trigger7 = Anim = [117261,117262]
Value = 5141

[State 5150, 1] ;Normal Anim
Type = ChangeAnim
TriggerAll = Time = 0
TriggerAll = SelfAnimExist(5140)
TriggerAll = Anim != [5140,5159]
Trigger1 = (Anim != [5111,5119]) && (Anim != [5171,5179])
Trigger2 = !SelfAnimExist(5140 + (Anim % 10))
Value = 5140

[State 5150, 3] ;Hit up Type Anim
Type = ChangeAnim
TriggerAll = SelfAnimExist(5140 + (Anim % 10))
Trigger1 = Time = 0
Trigger1 = (Anim = [5111,5119]) || (Anim = [5171,5179])
Trigger2 = (Var(10) & 262144)
Value = 5140 + (Anim % 10)

[State 5150, 4] ;Match Over Anim
Type = ChangeAnim
Persistent = 0
TriggerAll = MatchOver = 1
Trigger1 = Anim = [5140,5149]
Trigger1 = SelfAnimExist(Anim + 10)
Trigger1 = AnimElemTime(2) < 0
Value = Anim + 10

[State 5150, 5] ;Switch to 5110 if liedead Anim does not exist
Type = ChangeAnim
TriggerAll = SelfAnimExist(5110 + (Anim % 10))
Trigger1 = Time = 0
Trigger1 = Anim != [5140,5159]
Trigger1 = Anim != [5110,5119]
Value = 5110 + (Anim % 10)

[State 5150, 6] ;Friction
Type = VelMul
Trigger1 = 1
X = 0.85

[State 5150, 7] ;Friction
Type = VelSet
Trigger1 = Vel X < .05
Persistent = 0
X = 0

[State 5150, 8]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 5150, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

;---------------------------------------------------------------------------
; 地上に近い時の受身準備
[Statedef 5200]
Type    = A
MoveType= H
Physics = N

[State 5200, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5200, 1] ;Change Anim if done with transition
Type = ChangeAnim
Trigger1 = Anim = 5035
Trigger1 = AnimTime = 0
Value = 5050

[State 5200, 2]
Type = VelAdd
Trigger1 = 1
Y = GetHitVar(YAccel)

[State 5200, 3]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 10
Value = 5201

;---------------------------------------------------------------------------
; 地上に近い時の受身
[Statedef 5201]
Type    = A
MoveType= H
Physics = N
Anim = 5200

[State 5201, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5201, 1] ;Turn if not facing opponent
Type = Turn
Trigger1 = Time = 0
Trigger1 = P2Dist X < 0

[State 5201, 2]
Type = VelSet
Trigger1 = Time = 0
X = -4
Y = 0

[State 5201, 減速]
Type = VelMul
Trigger1 = 1
X = 0.92

[State 5201, 3]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 5201, 4]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 5201, 残像]
Type = AfterImage
Trigger1 = Time = 0
Time = 2
Length = 10
PalContrast = 64,64,64
PalAdd = 0,0,0
PalMul = 1,1,1
TimeGap = 1
FrameGap = 4
Trans = Add

[State 5201, AfterImageTime]
Type = AfterImageTime
Trigger1 = 1
Time = 2

[State 5201, 着地]
Type = SelfState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; 空中受身
[Statedef 5210]
Type    = A
MoveType= I
Physics = N
Anim = 5210
Ctrl = 0

[State 5210, 分裂したヘルパーの消去]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 5210, 1]
Type = PosFreeze
Trigger1 = Time = 0
Value = 4

[State 5210, 2] ;Turn if not facing opponent
Type = Turn
Trigger1 = Time = 0
Trigger1 = P2Dist X < 0

[State 5210, 1] 
Type = VelSet
Trigger1 = Time = 0
X = -0.2
Y = -5

[State 5210, 2] ;Go up
Type = VelAdd
TriggerAll = Var(59) <= 0
Trigger1 = Time = 0
Trigger1 = Command = "holdup"
Y = -2

[State 5210, 2] ;Go down
Type = VelAdd
TriggerAll = Var(59) <= 0
Trigger1 = Time = 0
Trigger1 = Command = "holddown"
Y = 1.5

[State 5210, 2] ;Go fwd
Type = VelMul
TriggerAll = Var(59) <= 0
Trigger1 = Time = 0
Trigger1 = Command = "holdfwd"
X = 1

[State 5210, 2] ;Go back
Type = VelAdd
TriggerAll = Var(59) <= 0
Trigger1 = Time = 0
Trigger1 = Command = "holdback"
X = -1

[State 5210, 3]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 15

[State 5210, 無敵]
Type = NotHitBy
TriggerAll = PalNo = [7,12]
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 30

[State 5210, 4]
Type = CtrlSet
Trigger1 = Time = 15
Value = 1

[State 5210, 5]
Type = VelAdd;Gravity
Trigger1 = Time >= 4
Y = Const(Movement.YAccel)

[State 5210, 5] ;Land on Ground
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52 ;Jump_LAND
Ctrl = 1

;---------------------------------------------------------------------------
; コンティニュー画面
[Statedef 5500]
Type = S
Ctrl = 0
Anim = 5300
VelSet = 0,0

[State 5500, 1] ;Use continue Animation if available
Type = ChangeAnim
Trigger1 = Time = 0
Trigger1 = SelfAnimExist(5500)
Value = 5500

;---------------------------------------------------------------------------
; ラウンド切り替え時の初期化
[Statedef 5900]
Type = S

[State 5900, 1] ;Clear all int variables
Type = VarRangeSet
Trigger1 = RoundsExisted = 0
Value = 0

[State 5900, 2] ;Clear all float variables
Type = VarRangeSet
Trigger1 = RoundsExisted = 0
FValue = 0

[State 5900, フライング対策の無敵]
Type = NotHitBy
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1

;-------------------------------------------------------------------------
;---------------------[GGキャラ製作者各位]
;GGキャラ専用勝ち挑発（RAKUSYO）対応ステート
[State ];パワーゲージ50％増加
Type=PowerAdd
trigger1=roundsexisted>=1&&var(39)=1
Value=2500
persistent=0

;[State ];特殊ゲージ増加（搭載している場合）
;type=Varadd
;trigger1=roundsexisted>=1&&var(39)=1
;var(○)=○
;persistent=0

[State ];解除
type=Varset
trigger1=roundsexisted>=1&&var(39)=1
var(39)=0

;-------------------------------------------------------------------------
;---------------------[Iwakickさん]
[State 5900];Intro for special
type = ChangeState
triggerall = prevstateno != 100191
triggerall = (teammode = single && roundno=1)||teammode=turns
triggerall = !(teammode = simul)
trigger1 = enemy(0),stateno != 192
trigger1 = enemy(0),animexist(18000)
trigger1 = enemy(0),authorname = "iwakick"
trigger1 = enemy(0),name = "SilverSamurai"
value = 100191

[State 5900];Intro for special
type = ChangeState
triggerall = prevstateno != 100191
triggerall = (teammode = single && roundno=1)||teammode=turns
triggerall = !(teammode = simul)
trigger1 = enemy(0),stateno != 192
trigger1 = enemy(0),animexist(18000)
trigger1 = enemy(0),authorname = "iwakick"
trigger1 = enemy(0),name = "colossus"
value = 100191

[State 5900];Intro for special
type = ChangeState
triggerall = prevstateno != 100191
triggerall = (teammode = single && roundno=1)||teammode=turns
triggerall = !(teammode = simul)
trigger1 = enemy(0),stateno != 192
trigger1 = enemy(0),animexist(18000)
trigger1 = enemy(0),authorname = "iwakick"
trigger1 = enemy(0),name = "spiral"
value = 100191

[State 5900];Intro for special
type = ChangeState
triggerall = prevstateno != 100191
triggerall = (teammode = single && roundno=1)||teammode=turns
triggerall = !(teammode = simul)
trigger1 = enemy(0),stateno != 192
trigger1 = enemy(0),animexist(18000)
trigger1 = enemy(0),authorname = "iwakick"
trigger1 = enemy(0),name = "Vega"
value = 100191

[State 5900];Intro for special
type = ChangeState
triggerall = prevstateno != 100191
triggerall = (teammode = single && roundno=1)||teammode=turns
triggerall = !(teammode = simul)
trigger1 = enemy(0),stateno != 192 && enemy(0),stateno != 199
trigger1 = enemy(0),animexist(18000)
trigger1 = enemy(0),authorname = "iwakick"
value = 100191

;-------------------------------------------------------------------------
;---------------------[KAZさん]
[State 5900, SelfState]
Type = SelfState
TriggerAll = !NumPartner;←パートナーがいない時
TriggerAll = PrevStateNo != 19601223
TriggerAll = (TeamMode = Single && RoundNo = 1) || TeamMode = Turns
TriggerAll = !(TeamMode = Simul)
Trigger1 = NumEnemy <= 1;←相手がひとりの時
Trigger1 = Enemy(0),AuthorName = "KAZ"
Trigger1 = Enemy(0),Name = "Seikimatu Guile" || Enemy(0),Name = "SF2 Guile"
Value = 19601223;←このステートNo.は絶対に変えないでください。ガイル側が検知できなくなります。

[State 5900, SelfState]
Type = SelfState
TriggerAll = !NumPartner;←パートナーがいない時
TriggerAll = PrevStateNo != 19680301
TriggerAll = (TeamMode = Single && RoundNo = 1) || TeamMode = Turns
TriggerAll = !(TeamMode = Simul)
Trigger1 = NumEnemy <= 1;←相手がひとりの時
Trigger1 = Enemy(0),AuthorName = "KAZ"
Trigger1 = Enemy(0),Name = "Chunli_Sf3_Marvel"
Value = 19680301;←このステートNo.は絶対に変えないでください。チュンリー側が検知できなくなります。

;-------------------------------------------------------------------------
;---------------------[laiso_7さん]
[State ];サムチャイ
type=ChangeState
TriggerAll = (TeamMode = Single && RoundNo = 1) || TeamMode = Turns
TriggerAll = !(TeamMode = Simul)
trigger1=P2name="SAMCHAY"&&enemynear,authorname="laiso_7"
trigger2=numenemy>=2
trigger2=P4name="SAMCHAY"&&enemynear(1),authorname="laiso_7"
value=547

;-------------------------------------------------------------------------
[State 5900, 3] ;Intro for round 1
Type = ChangeState
Trigger1 = RoundsExisted = 0
Value = 190

