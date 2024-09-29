;-| Super Attacks |-------------------------------------------------------
;-------------------------------------------------------------------------
;Rainbow Cannon : A
;-------------------------------------------------------------------------
[Statedef 1000]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = 0
SprPriority = 2

[State 1000, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1000, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1000, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 0

[State 1000, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 1

[State 1000, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1001

;-------------------------------------------------------------------------
;Rainbow Cannon
;-------------------------------------------------------------------------
[Statedef 1001]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1001
PowerAdd = 0
SprPriority = 2

[State 1001, ChangeAnim]
Type = ChangeAnim
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
Value = 1002

[State 1001, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = 6

[State 1001, VelSet]
Type = VelSet
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
X = 8

[State 1001, VelSet]
Type = VelSet
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
X = 10

[State 1001, VelSet]
Type = VelSet
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
X = 12

[State 1001, VelSet]
Type = VelSet
Trigger1 = Anim != 1001
Trigger1 = Time = 0
Y = 3

[State 1001, VelSet]
Type = VelSet
Trigger1 = Anim != 1001
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
Y = 4

[State 1001, VelSet]
Type = VelSet
Trigger1 = Anim != 1001
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
Y = 5

[State 1001, VelSet]
Type = VelSet
Trigger1 = Anim != 1001
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
Y = 6

[State 1001, AngleDraw]
Type = AngleDraw
Trigger1 = Anim != 1001
Value = 15
IgNoreHitPause = 1

[State 1001, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0
IgNoreHitPause = 1

[State 1001, SE : 振り音]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1000, 0

[State 1001, ヘルパー呼出]
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

[State 1001, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Trigger2 = PalNo = [7,12]
Trigger2 = EnemyNear(Var(57)),MoveType != H || EnemyNear(Var(57)),StateNo = [120,159]
Trigger2 = MoveContact = 9 || MoveReversed = 9
Attr = A,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 70, 20
GetPower = IfElse(Var(5) >= 3,0,60), IfElse(Var(5) >= 3,0,40)
GivePower = 30, 20
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 23
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 20
Ground.HitTime = 20
Air.HitTime = 20
Guard.SlideTime = 18
Guard.HitTime = 18
Guard.CtrlTime = 18
AirGuard.HitTime = 18
AirGuard.CtrlTime = 18
Down.HitTime = 20
YAccel = .35
Ground.Velocity = -4, -5
Guard.Velocity = -2
Air.Velocity = -4, -5
AirGuard.Velocity = -2, -5
Down.Velocity = -4, -5
Ground.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
Down.CornerPush.VelOff = 0
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = 1
Fall.RecoverTime = 30
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1001, ChangeState]
Type = ChangeState
Trigger1 = Time = 20
Trigger1 = Anim = 1001
Trigger2 = Vel Y > 0
Trigger2 = Pos Y >= 0
Value = 1005

;-------------------------------------------------------------------------
;HELPER : Rainbow Cannon
;-------------------------------------------------------------------------
[Statedef 1002]
Physics = N
Ctrl = 0
Anim = 6010
SprPriority = 0

[State 1002, ヘルパー呼出]
Type = Helper
TriggerAll = IsHelper(1002)
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 1003
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

[State 1002, ヘルパー呼出]
Type = Helper
TriggerAll = IsHelper(3612)
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 3613
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

[State 1002, 本体に追従]
Type = BindToRoot
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1001 || Root,Anim = 1201
Time = 1
Facing = 1
Pos = 50, -30

[State 1002, 本体に追従]
Type = BindToRoot
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1002 || Root,Anim = 1203
Time = 1
Facing = 1
Pos = 30, -20

[State 1002, 本体に追従]
Type = BindToRoot
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1101 || Root,Anim = 1202
Time = 1
Facing = 1
Pos = 50, -60

[State 1002, 本体に追従]
Type = BindToRoot
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1204
Time = 1
Facing = 1
Pos = 5, -100

[State 1002, 本体に追従]
Type = BindToRoot
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1205 || Root,Anim = 3501 || Root,Anim = 3612
Time = 1
Facing = 1
Pos = -5, -10

[State 1002, AngleDraw]
Type = AngleDraw
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1002 || Root,Anim = 1203
Value = -30

[State 1002, AngleDraw]
Type = AngleDraw
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1101 || Root,Anim = 1202
Value = 30

[State 1002, AngleDraw]
Type = AngleDraw
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1204
Value = 90

[State 1002, AngleDraw]
Type = AngleDraw
TriggerAll = IsHelper
Trigger1 = Root,Anim = 1205 || Root,Anim = 3501 || Root,Anim = 3612
Value = -90

[State 1002, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper(1002)
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 0
Trigger2 = Root,StateNo = 1005 || Root,StateNo = 1105
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 1002, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper(1003) || IsHelper(3613)
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 192
Trigger2 = Root,StateNo = 1005 || Root,StateNo = 1105
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 1002, 画像表示の優先度]
Type = SprPriority
TriggerAll = IsHelper(1003)
Trigger1 = Time = 0
Value = 3

[State 1002, 画像表示の優先度]
Type = SprPriority
TriggerAll = IsHelper(3613)
Trigger1 = Time = 0
Value = 4

[State 1002, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), 256
IgNoreHitPause = 1

[State 1002, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Root,MoveType = H
Trigger2 = Root,StateType = L
Trigger3 = Root,StateNo != 1001 && Root,StateNo != 1101 && Root,StateNo != 1201
;Trigger3 = Root,StateNo != 1005 && Root,StateNo != 1105
Trigger3 = Root,StateNo != 3501 && Root,StateNo != 3612
Trigger4 = Var(0) < 0

;-------------------------------------------------------------------------
[Statedef 1005]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
;Anim = 1005
PowerAdd = 0
SprPriority = 2

[State 1005, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1005, ChangeAnim]
Type = ChangeAnim
Trigger1 = Anim = 1001 || Anim = 1201
Trigger1 = Time = 0
Value = 1005

[State 1005, ChangeAnim]
Type = ChangeAnim
Trigger1 = Anim != 1005
Trigger1 = !(Anim = 1001 || Anim = 1201)
Trigger1 = Time = 0
Value = 1006

[State 1005, CtrlSet]
Type = CtrlSet
Trigger1 = PalNo = [7,12]
Value = 1

[State 1005, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Rainbow Cannon : B
;-------------------------------------------------------------------------
[Statedef 1010]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = 0
SprPriority = 2

[State 1010, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1010, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1010, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 1

[State 1010, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 1

[State 1010, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1001

;-------------------------------------------------------------------------
;Rainbow Cannon : C
;-------------------------------------------------------------------------
[Statedef 1020]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = 0
SprPriority = 2

[State 1020, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1020, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1020, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 2

[State 1020, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 1

[State 1020, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1001

;-------------------------------------------------------------------------
;Rainbow Cannon : EX
;-------------------------------------------------------------------------
[Statedef 1050]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = -500
SprPriority = 2

[State 1050, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1050, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8200
Pos = 0, -25
PosType = P1
Facing = 1
StateNo = 8200
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 1050, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1050, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 3

[State 1050, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 4

[State 1050, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1001

;-------------------------------------------------------------------------
;Rainbow Cannon (diagonal) : A
;-------------------------------------------------------------------------
[Statedef 1100]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = 0
SprPriority = 2

[State 1100, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1100, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1100, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 0

[State 1100, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 1

[State 1100, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1101

;-------------------------------------------------------------------------
;Rainbow Cannon (diagonal)
;-------------------------------------------------------------------------
[Statedef 1101]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1101
PowerAdd = 0
SprPriority = 2

[State 1101, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = 6
Y = -3

[State 1101, VelSet]
Type = VelSet
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
X = 8
Y = -4

[State 1101, VelSet]
Type = VelSet
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
X = 10
Y = -5

[State 1101, VelSet]
Type = VelSet
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
X = 12
Y = -6

[State 1101, AngleDraw]
Type = AngleDraw
Trigger1 = 1
Value = -15
IgNoreHitPause = 1

[State 1101, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0
IgNoreHitPause = 1

[State 1101, SE : 振り音]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1000, 0

[State 1101, ヘルパー呼出]
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

[State 1101, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Trigger2 = PalNo = [7,12]
Trigger2 = EnemyNear(Var(57)),MoveType != H || EnemyNear(Var(57)),StateNo = [120,159]
Trigger2 = MoveContact = 9 || MoveReversed = 9
Attr = A,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 70, 20
GetPower = IfElse(Var(5) >= 3,0,60), IfElse(Var(5) >= 3,0,40)
GivePower = 30, 20
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 23
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 20
Ground.HitTime = 20
Air.HitTime = 20
Guard.SlideTime = 18
Guard.HitTime = 18
Guard.CtrlTime = 18
AirGuard.HitTime = 18
AirGuard.CtrlTime = 18
Down.HitTime = 20
YAccel = .35
Ground.Velocity = -4, -5
Guard.Velocity = -2
Air.Velocity = -4, -5
AirGuard.Velocity = -2, -5
Down.Velocity = -4, -5
Ground.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
Down.CornerPush.VelOff = 0
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = 1
Fall.RecoverTime = 30
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1101, ChangeState]
Type = ChangeState
Trigger1 = Time = 20
Value = 1105

;-------------------------------------------------------------------------
[Statedef 1105]
Type    = A
MoveType= I
Physics = N
Juggle  = 0
Ctrl = 0
Anim = 1105
PowerAdd = 0
SprPriority = 2

[State 1105, 重力]
Type = Gravity
Trigger1 = 1

[State 1105, 失速]
Type = VelMul
Trigger1 = 1
X = 0.90

[State 1105, CtrlSet]
Type = CtrlSet
Trigger1 = PalNo = [7,12]
Value = 1

[State 1105, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

;-------------------------------------------------------------------------
;Rainbow Cannon (diagonal) : B
;-------------------------------------------------------------------------
[Statedef 1110]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = 0
SprPriority = 2

[State 1110, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1110, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1110, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 1

[State 1110, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 1

[State 1110, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1101

;-------------------------------------------------------------------------
;Rainbow Cannon (diagonal) : C
;-------------------------------------------------------------------------
[Statedef 1120]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = 0
SprPriority = 2

[State 1120, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1120, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1120, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 2

[State 1120, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 1

[State 1120, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1101

;-------------------------------------------------------------------------
;Rainbow Cannon (diagonal) : EX
;-------------------------------------------------------------------------
[Statedef 1150]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = -500
SprPriority = 2

[State 1150, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1150, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8200
Pos = 0, -25
PosType = P1
Facing = 1
StateNo = 8200
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 1150, 空中状態]
Type = StateTypeSet
Trigger1 = Pos Y < 0
Trigger1 = Time = 0
StateType = A

[State 1150, VarSet]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 3

[State 1150, 追加入力回数]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 4

[State 1150, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1101

;-------------------------------------------------------------------------
;Rainbow Cannon (前)
;-------------------------------------------------------------------------
[Statedef 1200]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1200, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1200, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1200, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1200, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1200, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1200, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1200, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Rainbow Cannon (追加入力)
;-------------------------------------------------------------------------
[Statedef 1201]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1201
PowerAdd = 0
SprPriority = 2

[State 1201, 追加入力回数消費]
Type = VarAdd
TriggerAll = Var(6) > 0
Trigger1 = Time = 0
V = 6
Value = -1

[State 1201, ChangeAnim]
Type = ChangeAnim
Trigger1 = PrevStateNo = 1210 || PrevStateNo = 1260
Trigger1 = Time = 0
Value = 1202

[State 1201, ChangeAnim]
Type = ChangeAnim
Trigger1 = PrevStateNo = 1220 || PrevStateNo = 1270
Trigger1 = Time = 0
Value = 1203

[State 1201, ChangeAnim]
Type = ChangeAnim
Trigger1 = PrevStateNo = 1230
Trigger1 = Time = 0
Value = 1204

[State 1201, ChangeAnim]
Type = ChangeAnim
Trigger1 = PrevStateNo = 1240
Trigger1 = Time = 0
Value = 1205

[State 1201, 振り向く]
Type = Turn
Trigger1 = PrevStateNo = 1250 || PrevStateNo = 1260 || PrevStateNo = 1270
Trigger1 = Time = 0

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1201
Trigger1 = Time = 0
X = 6
Y = 0

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1201
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
X = 8
Y = 0

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1201
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
X = 10
Y = 0

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1201
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
X = 12
Y = 0

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1202
Trigger1 = Time = 0
X = 6
Y = -3

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1202
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
X = 8
Y = -4

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1202
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
X = 10
Y = -5

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1202
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
X = 12
Y = -6

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1203
Trigger1 = Time = 0
X = 6
Y = 3

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1203
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
X = 8
Y = 4

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1203
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
X = 10
Y = 5

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1203
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
X = 12
Y = 6

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1204
Trigger1 = Time = 0
X = 0
Y = -3

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1204
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
X = 0
Y = -4

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1204
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
X = 0
Y = -5

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1204
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
X = 0
Y = -6

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1205
Trigger1 = Time = 0
X = 0
Y = 3

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1205
Trigger1 = Time = 0
Trigger1 = Var(5) = 1
X = 0
Y = 4

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1205
Trigger1 = Time = 0
Trigger1 = Var(5) = 2
X = 0
Y = 5

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1205
Trigger1 = Time = 0
Trigger1 = Var(5) = 3
X = 0
Y = 6

[State 1201, AngleDraw]
Type = AngleDraw
Trigger1 = Anim = 1202
Value = -15
IgNoreHitPause = 1

[State 1201, AngleDraw]
Type = AngleDraw
Trigger1 = Anim = 1203
Value = 15
IgNoreHitPause = 1

[State 1201, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0
IgNoreHitPause = 1

[State 1201, SE : 振り音]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1000, 0

[State 1201, ヘルパー呼出]
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

[State 1201, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Trigger2 = PalNo = [7,12]
Trigger2 = EnemyNear(Var(57)),MoveType != H || EnemyNear(Var(57)),StateNo = [120,159]
Trigger2 = MoveContact = 9 || MoveReversed = 9
Attr = A,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 70, 20
GetPower = IfElse(Var(5) >= 3,0,60), IfElse(Var(5) >= 3,0,40)
GivePower = 30, 20
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 23
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 20
Ground.HitTime = 20
Air.HitTime = 20
Guard.SlideTime = 18
Guard.HitTime = 18
Guard.CtrlTime = 18
AirGuard.HitTime = 18
AirGuard.CtrlTime = 18
Down.HitTime = 20
YAccel = .35
Ground.Velocity = -4, -5
Guard.Velocity = -2
Air.Velocity = -4, -5
AirGuard.Velocity = -2, -5
Down.Velocity = -4, -5
Ground.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
Down.CornerPush.VelOff = 0
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = 1
Fall.RecoverTime = 30
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1201, ChangeState]
Type = ChangeState
TriggerAll = Anim != 1203 && Anim != 1205
Trigger1 = Time = 20
Value = IfElse(Pos Y < 0,1105,1005)

[State 1201, ChangeState]
Type = ChangeState
TriggerAll = Anim = 1203 || Anim = 1205
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1005

;-------------------------------------------------------------------------
;Rainbow Cannon (前斜め上)
;-------------------------------------------------------------------------
[Statedef 1210]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1210, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1210, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1210, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1210, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1210, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1210, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1210, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Rainbow Cannon (前斜め下)
;-------------------------------------------------------------------------
[Statedef 1220]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1220, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1220, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1220, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1220, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1220, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1220, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1220, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Rainbow Cannon (上)
;-------------------------------------------------------------------------
[Statedef 1230]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1230, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1230, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1230, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1230, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1230, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1230, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1230, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Rainbow Cannon (下)
;-------------------------------------------------------------------------
[Statedef 1240]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1240, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1240, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1240, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1240, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1240, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1240, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1240, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Rainbow Cannon (後ろ)
;-------------------------------------------------------------------------
[Statedef 1250]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1250, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1250, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1250, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1250, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1250, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1250, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1250, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Rainbow Cannon (後ろ斜め上)
;-------------------------------------------------------------------------
[Statedef 1260]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1260, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1260, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1260, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1260, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1260, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1260, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1260, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Rainbow Cannon (後ろ斜め下)
;-------------------------------------------------------------------------
[Statedef 1270]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2

[State 1270, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1270, VarSet]
Type = VarSet
TriggerAll = Var(5) < 3
Trigger1 = Time = 0
V = 5
Value = 0

[State 1270, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "y"
V = 5
Value = 1

[State 1270, VarSet]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = Command = "z"
V = 5
Value = 2

[State 1270, AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Var(5) < 3
TriggerAll = Time = 0
Trigger1 = 1
V = 5
Value = 2

[State 1270, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1270, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 1201

;-------------------------------------------------------------------------
;Lightning Cloud : A
;-------------------------------------------------------------------------
[Statedef 1300]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1300
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1300, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1300, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -3
Y = -7

[State 1300, 重力]
Type = Gravity
Trigger1 = 1

[State 1300, 入力受付開始]
Type = CtrlSet
TriggerAll = PalNo = [7,12]
Trigger1 = AnimElem = 17
Value = 1

[State 1300, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Cloud"
ID = 1305
Pos = 0, -50
PosType = P1
Facing = 1
StateNo = 1305
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1300, 終了]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

;-------------------------------------------------------------------------
;HELPER : Cloud
;-------------------------------------------------------------------------
[Statedef 1305]
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 7010
SprPriority = 3

;Var(0)  = EX雲アニメループ

[State 1305, 補正値計算 : コンボ補正]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = IsHelper(1325) = 0
Trigger1 = IsHelper(1355) = 0
Trigger1 = AnimElem = 8
Trigger2 = IsHelper(1325)
Trigger2 = AnimElem = 52
Trigger3 = IsHelper(1355)
Trigger3 = Root,PalNo = [7,12]
Trigger3 = AnimElem = 8
Trigger4 = IsHelper(1355)
Trigger4 = AnimElem = 60
FV = 0
Value = 0.90 ** EnemyNear(Root,Var(57)),GetHitVar(HitCount)
Persistent = 0
IgNoreHitPause = 1

[State 1305, ChangeAnim]
Type = ChangeAnim
Trigger1 = IsHelper(1325)
Trigger1 = Time = 0
Value = 7012

[State 1305, ChangeAnim]
Type = ChangeAnim
Trigger1 = IsHelper(1355)
Trigger1 = Time = 0
Value = 7013

[State 1305, 画面内に居座るように]
Type = PosAdd
Trigger1 = Time = 0
Trigger1 = FrontEdgeBodyDist <= 0
X = FrontEdgeBodyDist

[State 1305, 画面内に居座るように]
Type = PosAdd
Trigger1 = Time = 0
Trigger1 = BackEdgeBodyDist <= 0
X = -BackEdgeBodyDist

[State 1305, 一部攻撃以外無敵]
Type = HitBy
Trigger1 = IsHelper
Value = SCA,AA,AP
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1305, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Trigger1 = Root,PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1305, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 1308
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1305, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Bolt Effect"
ID = 1306
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1306
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1305, ヘルパー呼出]
Type = Helper
Trigger1 = IsHelper(1325) = 0
Trigger1 = IsHelper(1355) = 0
Trigger1 = AnimElem = 8
HelperType = Normal
Name = "Bolt"
ID = 1307
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1307
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1305, SE]
Type = PlaySnd
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 20
Trigger2 = AnimElem = 36
Value = 1300, 1

[State 1305, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 8, > 0
Trigger1 = AnimElem = 52, < 0
Trigger1 = P2Dist X = [-25,25]
Value = Anim
Elem = 52
Persistent = 0

[State 1305, VelAdd]
Type = VelAdd
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 8, > 0
Trigger1 = P2Dist X > 15
Trigger1 = Vel X < 2.0
Trigger1 = Pos Y < -120
X = 0.15

[State 1305, VelAdd]
Type = VelAdd
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 8, > 0
Trigger1 = P2Dist X < -15
Trigger1 = Vel X > -2.0
Trigger1 = Pos Y < -120
X = -0.15

[State 1305, 失速]
Type = VelMul
TriggerAll = IsHelper(1325)
TriggerAll = AnimElem = 8, > 0
Trigger1 = P2Dist X = [-15,15]
Trigger2 = Root,RoundState >= 3
X = 0.90

[State 1305, VelSet]
Type = VelSet
TriggerAll = IsHelper(1325)
TriggerAll = AnimElem = 8, > 0
TriggerAll = Vel X = [-0.1,0.1]
Trigger1 = P2Dist X = [-15,15]
Trigger2 = Root,RoundState >= 3
X = 0

[State 1305, VelSet]
Type = VelSet
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 8, > 0
Trigger1 = Pos Y >= -120
Y = -0.15
Persistent = 0

[State 1305, 加速]
Type = VelMul
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 8, > 0
Trigger1 = Pos Y >= -120
Trigger1 = Vel Y >= -2
Y = 1.10

[State 1305, 失速]
Type = VelMul
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 8, > 0
Trigger1 = Pos Y < -120
Y = 0.90

[State 1305, VelSet]
Type = VelSet
TriggerAll = IsHelper(1325)
Trigger1 = AnimElem = 8, > 0
Trigger1 = Pos Y < -120
Trigger1 = Vel Y >= -0.1
Y = 0

[State 1305, ヘルパー呼出]
Type = Helper
Trigger1 = IsHelper(1325)
Trigger1 = AnimElem = 52
HelperType = Normal
Name = "Bolt"
ID = 1307
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1307
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1305, SE]
Type = PlaySnd
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 20
Trigger2 = AnimElem = 36
Trigger3 = AnimElem = 52
Value = 1300, 1

[State 1305, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 17, > 0
Trigger1 = AnimElem = 60, < 0
Trigger1 = P2Dist X = [-25,25]
Value = Anim
Elem = 60
Persistent = 0

[State 1305, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 69
Trigger1 = Var(0) < 2
Trigger1 = 1 || Var(0) := Var(0) + 1
Value = Anim
Elem = 60

[State 1305, VelAdd]
Type = VelAdd
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 12, > 0
Trigger1 = P2Dist X > 15
Trigger1 = Vel X < 2.0
Trigger1 = Pos Y < -120
X = 0.15

[State 1305, VelAdd]
Type = VelAdd
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 12, > 0
Trigger1 = P2Dist X < -15
Trigger1 = Vel X > -2.0
Trigger1 = Pos Y < -120
X = -0.15

[State 1305, 失速]
Type = VelMul
TriggerAll = IsHelper(1355)
TriggerAll = AnimElem = 12, > 0
Trigger1 = P2Dist X = [-15,15]
Trigger2 = Root,RoundState >= 3
X = 0.90

[State 1305, VelSet]
Type = VelSet
TriggerAll = IsHelper(1355)
TriggerAll = AnimElem = 12, > 0
TriggerAll = Vel X = [-0.1,0.1]
Trigger1 = P2Dist X = [-15,15]
Trigger2 = Root,RoundState >= 3
X = 0

[State 1305, VelSet]
Type = VelSet
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 12, > 0
Trigger1 = Pos Y >= -120
Y = -0.15
Persistent = 0

[State 1305, 加速]
Type = VelMul
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 12, > 0
Trigger1 = Pos Y >= -120
Trigger1 = Vel Y >= -2
Y = 1.10

[State 1305, 失速]
Type = VelMul
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 12, > 0
Trigger1 = Pos Y < -120
Y = 0.90

[State 1305, VelSet]
Type = VelSet
TriggerAll = IsHelper(1355)
Trigger1 = AnimElem = 12, > 0
Trigger1 = Pos Y < -120
Trigger1 = Vel Y >= -0.1
Y = 0

[State 1305, ヘルパー呼出]
Type = Helper
TriggerAll = IsHelper(1355)
Trigger1 = Root,PalNo = [7,12]
Trigger1 = AnimElem = 8
Trigger2 = AnimElem = 60
HelperType = Normal
Name = "Bolt"
ID = IfElse((Root,Var(10) & 64),1357,1356)
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1307
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1305, 消失]
Type = ChangeState
TriggerAll = IsHelper
Trigger1 = Root,RoundState >= 3
Value = 1308

[State 1305, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
;HELPER : Bolt Effect
;-------------------------------------------------------------------------
[Statedef 1306]
Physics = N
Ctrl = 0
Anim = 6011
SprPriority = 4

;Var(10)  = 親ID

[State 1306, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Parent,Anim = 7012
Trigger1 = Time = 0
Value = 6013

[State 1306, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Parent,Anim = 7013
Trigger1 = Time = 0
Value = 6014

[State 1306, 親ID]
Type = VarSet
TriggerAll = IsHelper
Trigger1 = Time = 0
V = 10
Value = Parent,ID

[State 1306, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 1306, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = PlayerIDExist(Var(10)) = 0
Trigger2 = Parent,StateNo != 1305

[State 1306, 親に追従]
Type = BindToParent
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 1306, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Parent,Anim = 7010
Trigger2 = Parent,Anim = 7012
Trigger3 = Parent,Anim = 7013
Value = Anim
Elem = Parent,AnimElemNo(0)

;-------------------------------------------------------------------------
;HELPER : Bolt
;-------------------------------------------------------------------------
[Statedef 1307]
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6012
SprPriority = 2

[State 1307, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse((Root,PalNo = [11,12]),1.5,1.0) * Root,FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 1307, 影を不可視化]
Type = AssertSpecial
Trigger1 = IsHelper
Flag = NoShadow
IgNoreHitPause = 1

[State 1307, 一部攻撃以外無敵]
Type = HitBy
Trigger1 = IsHelper
Value = SCA,AP
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1307, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Trigger1 = Root,PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1307, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 10000
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1307, 親に追従]
Type = BindToParent
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 1307, SE : 射出]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1300, 0

[State 1307, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 6
MoveType = I

[State 1307, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
TriggerAll = IsHelper(1356) = 0
TriggerAll = IsHelper(1357) = 0
TriggerAll = Root,RoundState <= 2
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = S,SP         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFP      ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 2,Hit    ;Hit,Miss,Dodge
Damage = 90, 30
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30 + P2Dist Y
HitSound = S1, 2
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 18
Ground.HitTime = 18
Air.HitTime = 18
Guard.SlideTime = 16
Guard.HitTime = 16
Guard.CtrlTime = 16
AirGuard.HitTime = 16
AirGuard.CtrlTime = 16
Down.HitTime = 18
YAccel = .35
Ground.Velocity = 0, -6
Guard.Velocity = -1.5
Air.Velocity = 0, 8
AirGuard.Velocity = -1.5, -1.5
Down.Velocity = 0, -6
Ground.CornerPush.VelOff = 0
Guard.CornerPush.VelOff = 0
Air.CornerPush.VelOff = 0
AirGuard.CornerPush.VelOff = 0
Down.CornerPush.VelOff = 0
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = (Root,PalNo != [7,12])
Fall.RecoverTime = 24
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1307, ヒット定義]
Type = HitDef
TriggerAll = IsHelper(1356) || IsHelper(1357)
TriggerAll = Root,RoundState <= 2
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = S,SP         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFP      ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 2,Hit    ;Hit,Miss,Dodge
Damage = 60, 20
GetPower = 0, 0
GivePower = 20, 15
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30 + P2Dist Y
HitSound = S1, 2
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 18
Ground.HitTime = 18
Air.HitTime = 18
Guard.SlideTime = 16
Guard.HitTime = 16
Guard.CtrlTime = 16
AirGuard.HitTime = 16
AirGuard.CtrlTime = 16
Down.HitTime = 18
YAccel = .35
Ground.Velocity = 0, 8
Guard.Velocity = -1.5
Air.Velocity = 0, 8
AirGuard.Velocity = -1.5, -1.5
Down.Velocity = 0, 8
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

[State 1307, ステート奪取]
Type = TargetState
TriggerAll = IsHelper(1356)
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit = 1
Value = 50300
ID = 1000
Persistent = 1
IgNoreHitPause = 1

[State 1307, ステート奪取]
Type = TargetState
TriggerAll = IsHelper(1357)
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit = 1
Value = 50109
ID = 1000
Persistent = 1
IgNoreHitPause = 1

[State 1307, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
;HELPER : Cloud消失
;-------------------------------------------------------------------------
[Statedef 1308]
MoveType= I
VelSet = 0,0
Anim = 7011
SprPriority = 3

[State 1308, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = -1
IgNoreHitPause = 1

[State 1308, 再起動]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = StateNo
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1308, 消失]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = AnimTime = 0

;-------------------------------------------------------------------------
;Lightning Cloud : B
;-------------------------------------------------------------------------
[Statedef 1310]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1300
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1310, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1310, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = 1.5
Y = -7

[State 1310, 重力]
Type = Gravity
Trigger1 = 1

[State 1310, 入力受付開始]
Type = CtrlSet
TriggerAll = PalNo = [7,12]
Trigger1 = AnimElem = 17
Value = 1

[State 1310, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Cloud"
ID = 1305
Pos = 60, -50
PosType = P1
Facing = 1
StateNo = 1305
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1310, 終了]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

;-------------------------------------------------------------------------
;Lightning Cloud : C
;-------------------------------------------------------------------------
[Statedef 1320]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1320
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1320, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1320, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 3
X = 20
Y = -100

[State 1320, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 4
X = -10
Y = 5

[State 1320, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 5
X = -10
Y = 20

[State 1320, PosAdd]
Type = PosAdd
Trigger1 = AnimElem = 6
X = 0
Y = 5

[State 1320, VelSet]
Type = VelSet
Trigger1 = AnimElem = 11
X = -1
Y = -5

[State 1320, 重力]
Type = Gravity
Trigger1 = AnimElem = 11, > 0

[State 1320, 入力受付開始]
Type = CtrlSet
TriggerAll = PalNo = [7,12]
Trigger1 = AnimElem = 19
Value = 1

[State 1320, ScreenBound]
Type = ScreenBound
Trigger1 = AnimElem = 7, < 0
Value = 1
MoveCamera = 1,0

[State 1320, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Cloud"
ID = 1325
Pos = 0, -50
PosType = P1
Facing = 1
StateNo = 1305
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1320, 終了]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

;-------------------------------------------------------------------------
;Lightning Cloud : EX
;-------------------------------------------------------------------------
[Statedef 1350]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1320
PowerAdd = -500
SprPriority = 2
FaceP2 = 1

[State 1350, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1350, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8200
Pos = 0, -25
PosType = P1
Facing = 1
StateNo = 8200
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 1350, ChangeAnim]
Type = ChangeAnim
TriggerAll = PalNo = [7,12]
Trigger1 = Time = 0
Value = 1300

[State 1350, 無敵]
Type = NotHitBy
TriggerAll = Time = 0
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 10

[State 1350, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 1350, PosAdd]
Type = PosAdd
TriggerAll = Anim = 1320
Trigger1 = AnimElem = 3
X = 20
Y = -100

[State 1350, PosAdd]
Type = PosAdd
TriggerAll = Anim = 1320
Trigger1 = AnimElem = 4
X = -10
Y = 5

[State 1350, PosAdd]
Type = PosAdd
TriggerAll = Anim = 1320
Trigger1 = AnimElem = 5
X = -10
Y = 20

[State 1350, PosAdd]
Type = PosAdd
TriggerAll = Anim = 1320
Trigger1 = AnimElem = 6
X = 0
Y = 5

[State 1350, VelSet]
Type = VelSet
TriggerAll = Anim = 1320
Trigger1 = AnimElem = 11
X = -1
Y = -5

[State 1350, ScreenBound]
Type = ScreenBound
TriggerAll = Anim = 1320
Trigger1 = AnimElem = 7, < 0
Value = 1
MoveCamera = 1,0

[State 1350, VelSet]
Type = VelSet
TriggerAll = Anim = 1300
Trigger1 = Time = 0
X = 3
Y = -7

[State 1350, 重力]
Type = Gravity
Trigger1 = Anim = 1300
Trigger2 = Anim = 1320
Trigger2 = AnimElem = 11, > 0

[State 1350, 入力受付開始]
Type = CtrlSet
TriggerAll = Anim = 1300
Trigger1 = AnimElem = 17
Value = 1

[State 1350, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Cloud"
ID = 1355
Pos = IfElse(Anim = 1300,80,0), -50
PosType = P1
Facing = 1
StateNo = 1305
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1350, 終了]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

;-------------------------------------------------------------------------
;Air Catch : A
;-------------------------------------------------------------------------
[Statedef 1400]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1400
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1400, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1400, 相手ガード認識範囲]
Type = AttackDist
Trigger1 = 1
Value = 0

[State 1400, 重力]
Type = Gravity
Trigger1 = StateType = A

[State 1400, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
TriggerAll = EnemyNear(Var(57)),StateNo != [150,159]
TriggerAll = EnemyNear(Var(57)),StateNo != [30,49]
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = EnemyNear(Var(57)),StateType = A || EnemyNear(Var(57)),MoveType = H
Trigger1 = AnimElemNo(0) = 1
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1400, ヒット定義]
Type = HitDef
TriggerAll = PalNo = [7,12]
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 1
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1400, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit
Value = 1405
ID = 1000
Persistent = 0
IgNoreHitPause = 1

[State 1400, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget(1000)
Trigger1 = Target(1000),StateNo = 1405
Value = 1401
Persistent = 0
IgNoreHitPause = 1

[State 1400, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

[State 1400, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;投げ : 投げ成立
;-------------------------------------------------------------------------
[Statedef 1401]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1401
PowerAdd = 0

[State 1401, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 0

[State 1401, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 20,0

[State 1401, 重力]
Type = Gravity
Trigger1 = AnimElemTime(2) >= 0

[State 1401, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 1000
Pos = 10, 0

[State 1401, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) < 0
Time = 1
ID = 1000
Pos = 20, 0

[State 1401, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) >= 0
Trigger1 = AnimElemTime(3) < 0
Time = 1
ID = 1000
Pos = 20, -30

[State 1401, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(3) >= 0
Trigger1 = AnimElemTime(4) < 0
Time = 1
ID = 1000
Pos = 20, -20

[State 1401, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(5) < 0
Time = 1
ID = 1000
Pos = 10, -10

[State 1401, ヒット数を増やす]
Type = HitAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 1401, ゲージ増加]
Type = PowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 120

[State 1401, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 60
ID = 1000

[State 1401, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(90 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 1000

[State 1401, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1406
ID = 1000

[State 1401, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1402

;-------------------------------------------------------------------------
;投げ : 放り
;-------------------------------------------------------------------------
[Statedef 1402]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1402
PowerAdd = 0

[State 1402, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 1402, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1402, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 1402, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 1402, Effect]
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

[State 1402, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 1405]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 1405, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 1405, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1405, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 1405

[State 1405, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 1405, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 投げられ
;-------------------------------------------------------------------------
[Statedef 1406]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 1406, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 1406, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 1406, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1406, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 1406, 次]
Type = ChangeState
Trigger1 = Time = 10
Value = 50302

;-------------------------------------------------------------------------
;Air Catch : B
;-------------------------------------------------------------------------
[Statedef 1410]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1410
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1410, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1410, 相手ガード認識範囲]
Type = AttackDist
Trigger1 = 1
Value = 0

[State 1410, 重力]
Type = Gravity
Trigger1 = StateType = A

[State 1410, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
TriggerAll = EnemyNear(Var(57)),StateNo != [150,159]
TriggerAll = EnemyNear(Var(57)),StateNo != [30,49]
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = EnemyNear(Var(57)),StateType = A || EnemyNear(Var(57)),MoveType = H
Trigger1 = AnimElemNo(0) = 2
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1410, ヒット定義]
Type = HitDef
TriggerAll = PalNo = [7,12]
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 2
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1410, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit
Value = 1415
ID = 1000
Persistent = 0
IgNoreHitPause = 1

[State 1410, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget(1000)
Trigger1 = Target(1000),StateNo = 1415
Value = 1411
Persistent = 0
IgNoreHitPause = 1

[State 1410, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

[State 1410, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;投げ : 投げ成立
;-------------------------------------------------------------------------
[Statedef 1411]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1411
PowerAdd = 0

[State 1411, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 0

[State 1411, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 30,0

[State 1411, 重力]
Type = Gravity
Trigger1 = AnimElemTime(2) >= 0

[State 1411, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(2) = 0
X = 2
Y = -4

[State 1411, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 1000
Pos = 10, 0

[State 1411, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) < 0
Time = 1
ID = 1000
Pos = 20, 0

[State 1411, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) >= 0
Trigger1 = AnimElemTime(3) < 0
Time = 1
ID = 1000
Pos = 10, 0

[State 1411, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(3) >= 0
Trigger1 = AnimElemTime(4) < 0
Time = 1
ID = 1000
Pos = 30, -30

[State 1411, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(5) < 0
Time = 1
ID = 1000
Pos = 20, -30

[State 1411, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(5) >= 0
Trigger1 = AnimElemTime(6) < 0
Time = 1
ID = 1000
Pos = 20, -20

[State 1411, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(6) >= 0
Trigger1 = AnimElemTime(7) < 0
Time = 1
ID = 1000
Pos = 10, -10

[State 1411, ヒット数を増やす]
Type = HitAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 1411, ゲージ増加]
Type = PowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 120

[State 1411, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 60
ID = 1000

[State 1411, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(110 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 1000

[State 1411, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1406
ID = 1000

[State 1411, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1412

;-------------------------------------------------------------------------
;投げ : 放り
;-------------------------------------------------------------------------
[Statedef 1412]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1402
PowerAdd = 0

[State 1412, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 1412, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1412, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 1412, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 1412, Effect]
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

[State 1412, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 1415]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 1415, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 1415, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1415, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 1415

[State 1415, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 1415, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;Air Catch : C
;-------------------------------------------------------------------------
[Statedef 1420]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1420
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1420, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1420, 相手ガード認識範囲]
Type = AttackDist
Trigger1 = 1
Value = 0

[State 1420, 重力]
Type = Gravity
Trigger1 = StateType = A

[State 1420, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
TriggerAll = EnemyNear(Var(57)),StateNo != [150,159]
TriggerAll = EnemyNear(Var(57)),StateNo != [30,49]
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = EnemyNear(Var(57)),StateType = A || EnemyNear(Var(57)),MoveType = H
Trigger1 = AnimElemNo(0) = 2
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1420, ヒット定義]
Type = HitDef
TriggerAll = PalNo = [7,12]
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 2
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1420, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit
Value = 1425
ID = 1000
Persistent = 0
IgNoreHitPause = 1

[State 1420, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget(1000)
Trigger1 = Target(1000),StateNo = 1425
Value = 1421
Persistent = 0
IgNoreHitPause = 1

[State 1420, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

[State 1420, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;投げ : 投げ成立
;-------------------------------------------------------------------------
[Statedef 1421]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1421
PowerAdd = 0

[State 1421, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 0

[State 1421, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 30,0

[State 1421, 重力]
Type = Gravity
Trigger1 = AnimElemTime(2) >= 0

[State 1421, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(2) = 0
X = 2
Y = -10

[State 1421, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 1000
Pos = 10, 0

[State 1421, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) < 0
Time = 1
ID = 1000
Pos = 20, 0

[State 1421, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) >= 0
Trigger1 = AnimElemTime(3) < 0
Time = 1
ID = 1000
Pos = 10, 0

[State 1421, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(3) >= 0
Trigger1 = AnimElemTime(4) < 0
Time = 1
ID = 1000
Pos = 30, -30

[State 1421, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(5) < 0
Time = 1
ID = 1000
Pos = 20, -30

[State 1421, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(5) >= 0
Trigger1 = AnimElemTime(6) < 0
Time = 1
ID = 1000
Pos = 20, -20

[State 1421, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(6) >= 0
Trigger1 = AnimElemTime(7) < 0
Time = 1
ID = 1000
Pos = 10, -10

[State 1421, ヒット数を増やす]
Type = HitAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 1421, ゲージ増加]
Type = PowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 120

[State 1421, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 60
ID = 1000

[State 1421, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(130 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 1000

[State 1421, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1406
ID = 1000

[State 1421, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1422

;-------------------------------------------------------------------------
;投げ : 放り
;-------------------------------------------------------------------------
[Statedef 1422]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1402
PowerAdd = 0

[State 1422, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 1422, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1422, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 1422, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 1422, Effect]
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

[State 1422, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 1425]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 1425, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 1425, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1425, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 1425

[State 1425, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 1425, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;Air Catch : EX
;-------------------------------------------------------------------------
[Statedef 1450]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1450
PowerAdd = -500
SprPriority = 2
FaceP2 = 1

[State 1450, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1450, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 8200
Pos = 0, -35
PosType = P1
Facing = 1
StateNo = 8200
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
Size.XScale = 1
Size.YScale = 1

[State 1450, 相手ガード認識範囲]
Type = AttackDist
Trigger1 = 1
Value = 0

[State 1450, 無敵]
Type = NotHitBy
Trigger1 = Time = 0
Value = SCA,AA,AP,AT
Time = 4

[State 1450, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

[State 1450, 重力]
Type = Gravity
Trigger1 = StateType = A

[State 1450, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
TriggerAll = EnemyNear(Var(57)),StateNo != [150,159]
TriggerAll = EnemyNear(Var(57)),StateNo != [30,49]
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = EnemyNear(Var(57)),StateType = A || EnemyNear(Var(57)),MoveType = H
Trigger1 = AnimElemNo(0) = 1
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1450, ヒット定義]
Type = HitDef
TriggerAll = PalNo = [7,12]
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 1
Attr = S,ST         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = AF        ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 3,Miss   ;Hit,Miss,Dodge
GetPower = 0, 0
GivePower = 0, 0
SparkNo = -1
YAccel = .35
SprPriority = 3
P1Facing = 1
P2Facing = 1
Guard.Dist = 0
Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
NumHits = 0

[State 1450, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit
Value = 1455
ID = 1000
Persistent = 0
IgNoreHitPause = 1

[State 1450, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget(1000)
Trigger1 = Target(1000),StateNo = 1455
Value = 1451
Persistent = 0
IgNoreHitPause = 1

[State 1450, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52

[State 1450, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;投げ : 投げ成立
;-------------------------------------------------------------------------
[Statedef 1451]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1451
PowerAdd = 0

[State 1451, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 0

[State 1451, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 30,0

[State 1451, 重力]
Type = Gravity
Trigger1 = AnimElemTime(2) >= 0

[State 1451, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(2) = 0
X = 2
Y = -10

[State 1451, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 1000
Pos = 10, 0

[State 1451, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) < 0
Time = 1
ID = 1000
Pos = 20, 0

[State 1451, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) >= 0
Trigger1 = AnimElemTime(3) < 0
Time = 1
ID = 1000
Pos = 10, 0

[State 1451, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(3) >= 0
Trigger1 = AnimElemTime(4) < 0
Time = 1
ID = 1000
Pos = 30, -30

[State 1451, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(5) < 0
Time = 1
ID = 1000
Pos = 20, -30

[State 1451, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(5) >= 0
Trigger1 = AnimElemTime(6) < 0
Time = 1
ID = 1000
Pos = 20, -20

[State 1451, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(6) >= 0
Trigger1 = AnimElemTime(7) < 0
Time = 1
ID = 1000
Pos = 10, -10

[State 1451, ヒット数を増やす]
Type = HitAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 1451, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 30
ID = 1000

[State 1451, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(70 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 1000
Kill = 0

[State 1451, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1456
ID = 1000

[State 1451, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1452

;-------------------------------------------------------------------------
;投げ : 投げ成立2
;-------------------------------------------------------------------------
[Statedef 1452]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1452
PowerAdd = 0

[State 1452, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 1452, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1452, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 1452, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 1452, Effect]
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

[State 1452, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 30,0

[State 1452, 重力]
Type = Gravity
Trigger1 = AnimElemTime(2) >= 0

[State 1452, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(2) = 0
X = 2
Y = -12

[State 1452, SE]
Type = PlaySnd
Trigger1 = AnimElemTime(6) = 0
Value = 810, 0

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 1000
Pos = 10, 0

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) >= 0
Trigger1 = AnimElemTime(3) < 0
Time = 1
ID = 1000
Pos = 10, 0

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(3) >= 0
Trigger1 = AnimElemTime(4) < 0
Time = 1
ID = 1000
Pos = 30, -30

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(5) < 0
Time = 1
ID = 1000
Pos = 20, -30

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(5) >= 0
Trigger1 = AnimElemTime(6) < 0
Time = 1
ID = 1000
Pos = 20, -20

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(6) >= 0
Trigger1 = AnimElemTime(7) < 0
Trigger2 = AnimElemTime(10) >= 0
Trigger2 = AnimElemTime(11) < 0
Trigger3 = AnimElemTime(14) >= 0
Trigger3 = AnimElemTime(15) < 0
Trigger4 = AnimElemTime(18) >= 0
Trigger4 = AnimElemTime(19) < 0
Time = 1
ID = 1000
Pos = 0, -10

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(7) >= 0
Trigger1 = AnimElemTime(8) < 0
Trigger2 = AnimElemTime(11) >= 0
Trigger2 = AnimElemTime(12) < 0
Trigger3 = AnimElemTime(15) >= 0
Trigger3 = AnimElemTime(16) < 0
Trigger4 = AnimElemTime(19) >= 0
Trigger4 = AnimElemTime(20) < 0
Time = 1
ID = 1000
Pos = -30, -30

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(8) >= 0
Trigger1 = AnimElemTime(9) < 0
Trigger2 = AnimElemTime(12) >= 0
Trigger2 = AnimElemTime(13) < 0
Trigger3 = AnimElemTime(16) >= 0
Trigger3 = AnimElemTime(17) < 0
Trigger4 = AnimElemTime(20) >= 0
Trigger4 = AnimElemTime(21) < 0
Time = 1
ID = 1000
Pos = 0, -50

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(9) >= 0
Trigger1 = AnimElemTime(10) < 0
Trigger2 = AnimElemTime(13) >= 0
Trigger2 = AnimElemTime(14) < 0
Trigger3 = AnimElemTime(17) >= 0
Trigger3 = AnimElemTime(18) < 0
Trigger4 = AnimElemTime(21) >= 0
Trigger4 = AnimElemTime(22) < 0
Time = 1
ID = 1000
Pos = 30, -30

[State 1452, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(22) >= 0
Trigger1 = AnimElemTime(23) < 0
Time = 1
ID = 1000
Pos = 10, -10

[State 1452, ヒット数を増やす]
Type = HitAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 1452, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 30
ID = 1000

[State 1452, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(90 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 1000

[State 1452, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1406
ID = 1000

[State 1452, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1453

;-------------------------------------------------------------------------
;投げ : 放り
;-------------------------------------------------------------------------
[Statedef 1453]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1402
PowerAdd = 0

[State 1453, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 1453, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1453, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 1453, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 1453, Effect]
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

[State 1453, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 1455]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 1455, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 1455, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1455, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 1455

[State 1455, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 1455, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 掴まれ2
;-------------------------------------------------------------------------
[Statedef 1456]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 1456, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 1456, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1456, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 1456

[State 1456, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 1456, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050
