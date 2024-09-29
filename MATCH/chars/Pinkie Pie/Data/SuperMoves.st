;-| Super Attacks |-------------------------------------------------------
;-------------------------------------------------------------------------
;Party Cannon : A
;-------------------------------------------------------------------------
[Statedef 1000]

[State 1000, 実行]
Type = ChangeState
Trigger1 = 1
Value = 1001

;-------------------------------------------------------------------------
;Party Cannon
;-------------------------------------------------------------------------
[Statedef 1001]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1000
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1001, 無敵]
Type = NotHitBy
TriggerAll = Time = 0
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 30

[State 1001, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1001, 乱数]
Type = VarRandom
Trigger1 = Time = 0
Trigger2 = PalNo = [7,12]
Trigger2 = AnimElem = 10, = 2
Trigger3 = PalNo = [7,12]
Trigger3 = AnimElem = 10, = 4
V = 5
Range = 0,999

[State 1001, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 10
Value = 0, 22
Persistent = 0
IgNoreHitPause = 1

[State 1001, ヘルパー呼出]
Type = Helper
TriggerAll = PrevStateNo = 1000
TriggerAll = NumHelper(6106) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Cannon Object"
ID = 6106
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6106
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1001, ヘルパー呼出]
Type = Helper
TriggerAll = PrevStateNo = 1010 || PrevStateNo = 1020
TriggerAll = NumHelper(6107) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Cannon Object"
ID = 6107
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6107
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

;Helper(1005) = 洋ナシ
;Helper(1006) = 植木鉢
;Helper(1007) = カップケーキ
;Helper(1008) = プレゼント
;Helper(1009) = ガミー
;Helper(1010) = ラバーチキン

[State 1001, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 10
Trigger2 = PalNo = [7,12]
Trigger2 = AnimElem = 10, = 2
Trigger3 = PalNo = [7,12]
Trigger3 = AnimElem = 10, = 4
HelperType = Normal
Name = "Helper"
ID = IfElse(Var(5) < 200 && !NumHelper(1009),1009,IfElse(Var(5) < 250 && !NumHelper(1010),1010,IfElse(Var(5) < 400,1005,IfElse(Var(5) < 550,1007,IfElse(Var(5) < 750,1006,1008)))))
Pos = 30, -20
PosType = P1
Facing = 1
StateNo = 1005
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
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 5
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 80, 25
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 23
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 28
Ground.HitTime = 28
Air.HitTime = 28
Guard.SlideTime = 26
Guard.HitTime = 26
Guard.CtrlTime = 26
AirGuard.HitTime = 26
AirGuard.CtrlTime = 26
Down.HitTime = 28
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -3.5, -1.5
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -3.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1001, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;HELPER : パーティキャノン中身
;-------------------------------------------------------------------------
[Statedef 1005];射出
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6109
SprPriority = 5

;Var(1)  = EX使用フラグ

[State 1005, VarSet]
Type = VarSet
TriggerAll = IsHelper
TriggerAll = Root,StateNo = 1050
Trigger1 = Time = 0
V = 1
Value = 1

[State 1005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1006)
Trigger1 = Time = 0
Value = 6112

[State 1005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1007)
Trigger1 = Time = 0
Value = 6115

[State 1005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1008)
Trigger1 = Time = 0
Value = 6117

[State 1005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1009)
Trigger1 = Time = 0
Value = 6123

[State 1005, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1010)
Trigger1 = Time = 0
Value = 6125

[State 1005, 補正値計算 : コンボ補正]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.90 ** EnemyNear(Root,Var(57)),GetHitVar(HitCount)
Persistent = 0
IgNoreHitPause = 1

[State 1005, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse((Root,PalNo = [11,12]),1.5,1.0) * Root,FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 1005, 一部攻撃以外無敵]
Type = HitBy
Trigger1 = IsHelper
Value = SCA,AA,AP
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1005, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Trigger1 = Root,PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1005, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 1006
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1005, 発射]
Type = VelSet
TriggerAll = IsHelper
TriggerAll = Time = 0
Trigger1 = Root,PrevStateNo = 1000
Trigger2 = Root,StateNo = 1050
X = 10
Y = -5

[State 1005, 発射]
Type = VelSet
TriggerAll = IsHelper
TriggerAll = Time = 0
Trigger1 = Root,PrevStateNo = 1010
X = 7
Y = -8

[State 1005, 発射]
Type = VelSet
TriggerAll = IsHelper
TriggerAll = Time = 0
Trigger1 = Root,PrevStateNo = 1020
X = 5
Y = -10

[State 1005, 発射]
Type = VelSet
TriggerAll = IsHelper(1009)
Trigger1 = Time = 0
X = 1
Y = -5

[State 1005, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 1005, 回転]
Type = AngleDraw
Trigger1 = IsHelper(1007)
Value = -Time * 30 % 360

[State 1005, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
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
Damage = 80, 30
GetPower = IfElse(Var(1),0,120), IfElse(Var(1),0,80)
GivePower = 60, 40
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 4
GuardSound = S1, 111
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
Ground.Velocity = -3.5, 0
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
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1005, ヒット定義]
Type = HitDef
TriggerAll = IsHelper(1006)
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
GetPower = IfElse(Var(1),0,60), IfElse(Var(1),0,40)
GivePower = 30, 20
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 2
GuardSound = S1, 100
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
Ground.Velocity = -3.5, 0
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
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1005, ヒット定義]
Type = HitDef
TriggerAll = IsHelper(1010)
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
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 0, 0
GetPower = IfElse(Var(1),500,1000), IfElse(Var(1),400,800)
GivePower = 250, 200
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 3
GuardSound = S1, 110
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 1
Ground.HitTime = 1
Air.HitTime = 1
Guard.SlideTime = 1
Guard.HitTime = 1
Guard.CtrlTime = 1
AirGuard.HitTime = 1
AirGuard.CtrlTime = 1
Down.HitTime = 1
YAccel = .35
Ground.Velocity = -3.5, 0
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
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1005, 終了]
Type = ChangeState
Trigger1 = MoveContact || MoveReversed
Value = 1006

[State 1005, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1007

[State 1005, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = ScreenPos X != [0,319]
Trigger2 = ScreenPos Y != [0,239]

;-------------------------------------------------------------------------
[Statedef 1006];ぶつかる
MoveType= I
Physics = N
Juggle  = 0
VelSet = -1,-7
Ctrl = 0
Anim = 6110

[State 1006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1006)
Trigger1 = Time = 0
Value = 6113

[State 1006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1007)
Trigger1 = Time = 0
Value = 6115

[State 1006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1008)
Trigger1 = Time = 0
Value = 6118

[State 1006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1009)
Trigger1 = Time = 0
Value = 6124

[State 1006, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1010)
Trigger1 = Time = 0
Value = 6126

[State 1006, VelSet]
Type = VelSet
TriggerAll = IsHelper(1006)
Trigger1 = Time = 0
X = 1
Y = -10

[State 1006, VelSet]
Type = VelSet
TriggerAll = IsHelper(1006)
TriggerAll = PrevStateNo = 1006
Trigger1 = Time = 0
Y = -7

[State 1006, 攻撃状態]
Type = StateTypeSet
TriggerAll = IsHelper(1006)
TriggerAll = PrevStateNo != 1006
Trigger1 = Time = 0
MoveType = A

[State 1006, 補正値計算 : コンボ補正]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.90 ** EnemyNear(Root,Var(57)),GetHitVar(HitCount)
Persistent = 0
IgNoreHitPause = 1

[State 1006, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse((Root,PalNo = [11,12]),1.5,1.0) * Root,FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 1006, ヒット定義]
Type = HitDef
TriggerAll = IsHelper(1006)
TriggerAll = MoveType = A
TriggerAll = Root,RoundState <= 2
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Trigger1 = Vel Y > 0
Attr = S,SP         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAFP      ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 2,Hit    ;Hit,Miss,Dodge
Damage = 60, 20
GetPower = IfElse(Var(1),0,60), IfElse(Var(1),0,40)
GivePower = 30, 20
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 2
GuardSound = S1, 100
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
Ground.Velocity = -3.5, 0
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
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1006, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1006, 一部攻撃以外無敵]
Type = HitBy
Trigger1 = IsHelper(1006)
Value = SCA,AA,AP
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1006, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Trigger1 = Root,PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1006, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper(1006)
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 1006
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1006, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 10000
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1006, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.45

[State 1006, 終了]
Type = ChangeState
Trigger1 = MoveContact || MoveReversed
Value = 1006

[State 1006, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1007

;-------------------------------------------------------------------------
[Statedef 1007];地面に落ちる
MoveType= I
Physics = S
Juggle  = 0
;VelSet = 0,0
Ctrl = 0
Anim = 6111

[State 1007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1006)
Trigger1 = Time = 0
Value = 6114

[State 1007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1007)
Trigger1 = Time = 0
Value = 6116

[State 1007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1008)
Trigger1 = Time = 0
Value = 6119

[State 1007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1009)
Trigger1 = Time = 0
Value = 6124

[State 1007, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper(1010)
Trigger1 = Time = 0
Value = 6127

[State 1007, 停止]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 1007, 接地]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1007, 画面内に居座るように]
Type = PosAdd
TriggerAll = IsHelper(1008)
Trigger1 = FrontEdgeBodyDist <= 0
X = FrontEdgeBodyDist

[State 1007, 画面内に居座るように]
Type = PosAdd
TriggerAll = IsHelper(1008)
Trigger1 = BackEdgeBodyDist <= 0
X = -BackEdgeBodyDist

[State 1007, VelSet]
Type = VelSet
Trigger1 = IsHelper(1009)
X = 1

[State 1007, 攻撃状態]
Type = StateTypeSet
TriggerAll = IsHelper(1009)
Trigger1 = Time = 0
MoveType = A

[State 1007, 補正値計算 : コンボ補正]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.90 ** EnemyNear(Root,Var(57)),GetHitVar(HitCount)
Persistent = 0
IgNoreHitPause = 1

[State 1007, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse((Root,PalNo = [11,12]),1.5,1.0) * Root,FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State 1007, 攻撃終了]
Type = StateTypeSet
Trigger1 = MoveContact || MoveReversed
MoveType = I

[State 1007, 無敵]
Type = NotHitBy
Trigger1 = IsHelper
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 1007, 飛び道具消失へ]
Type = HitOverRide
Trigger1 = IsHelper
Attr = SCA,AA,AP,AT
Slot = 0
StateNo = 10000
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1007, ヒット定義]
Type = HitDef
TriggerAll = IsHelper(1009)
TriggerAll = MoveType = A
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
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 60, 20
GetPower = IfElse(Var(1),0,60), IfElse(Var(1),0,40)
GivePower = 30, 20
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8010 + (Random % 8)
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 6
GuardSound = S1, 110
Ground.Type = Low   ;High,Low,Trip,Non
Air.Type = Low
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
Ground.Velocity = -0.5, -1.5
Guard.Velocity = -0.5
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
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

[State 1007, SE]
Type = PlaySnd
TriggerAll = IsHelper(1005) || IsHelper(1007)
Trigger1 = Root,StateType != A
Trigger1 = Root,StateType != L
Trigger1 = RootDist X = [-16,16]
Value = 0, 21
Persistent = 0
IgNoreHitPause = 1

[State 1007, 終了]
Type = ChangeState
TriggerAll = IsHelper(1005) || IsHelper(1007)
Trigger1 = Root,StateType != A
Trigger1 = Root,StateType != L
Trigger1 = RootDist X = [-16,16]
Value = 10000
Persistent = 0
IgNoreHitPause = 1

[State 1007, ヘルパー消去]
Type = ChangeState
Trigger1 = IsHelper(1008)
Trigger1 = Root,StateNo = 1221
Value = 1225

[State 1007, ヘルパー消去]
Type = ChangeState
Trigger1 = IsHelper(1008) = 0
Trigger1 = IsHelper(1009) = 0
Trigger1 = Time = 300
Trigger2 = IsHelper(1008)
Trigger2 = Time = 1200
Trigger3 = IsHelper(1009)
Trigger3 = ScreenPos X != [0,319]
Value = 1008

[State 1007, ヘルパー消去]
Type = ChangeState
Trigger1 = IsHelper(1008)
Trigger1 = NumHelper(1008) > 1
Trigger1 = Helper(1008),StateNo != 1008
Value = 1008

;-------------------------------------------------------------------------
[Statedef 1008];フェードアウト消失
MoveType= I
Physics = N
VelSet = 0,0
Ctrl = 0

[State 1008, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 0
Trigger2 = Time >= 1
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 1008, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)

[State 1008, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Var(0) >= 256

;-------------------------------------------------------------------------
;Party Cannon : B
;-------------------------------------------------------------------------
[Statedef 1010]

[State 1010, 実行]
Type = ChangeState
Trigger1 = 1
Value = 1001

;-------------------------------------------------------------------------
;Party Cannon : C
;-------------------------------------------------------------------------
[Statedef 1020]

[State 1020, 実行]
Type = ChangeState
Trigger1 = 1
Value = 1001

;-------------------------------------------------------------------------
;Party Cannon : EX
;-------------------------------------------------------------------------
[Statedef 1050]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1050
PowerAdd = -500
SprPriority = 2
FaceP2 = 1

[State 1050, 無敵]
Type = NotHitBy
TriggerAll = Time = 0
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 30

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

[State 1050, ChangeAnim]
Type = ChangeAnim
Trigger1 = AnimElem = 15
Trigger1 = Var(6) < 2
Trigger1 = 1 || Var(6) := Var(6) + 1
Value = Anim
Elem = 10

[State 1050, 乱数]
Type = VarRandom
Trigger1 = Time = 0
Trigger2 = AnimElem = 10, = 1
Trigger3 = PalNo = [7,12]
Trigger3 = AnimElem = 10, = 2
V = 5
Range = 0,999

[State 1050, 初期化]
Type = VarSet
Trigger1 = Time = 0
V = 6
Value = 0

[State 1050, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 10
Value = 0, 22

[State 1050, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 10
Value = 1050, 0
Channel = 1

[State 1050, ヘルパー呼出]
Type = Helper
TriggerAll = NumHelper(6106) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Cannon Object"
ID = 6106
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6106
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

;Helper(1005) = 洋ナシ
;Helper(1006) = 植木鉢
;Helper(1007) = カップケーキ
;Helper(1008) = プレゼント
;Helper(1009) = ガミー
;Helper(1010) = ラバーチキン

[State 1050, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 10
Trigger2 = PalNo = [7,12]
Trigger2 = AnimElem = 10, = 2
HelperType = Normal
Name = "Helper"
ID = IfElse(Var(5) < 200 && !NumHelper(1009),1009,IfElse(Var(5) < 250 && !NumHelper(1010),1010,IfElse(Var(5) < 400,1005,IfElse(Var(5) < 550,1007,IfElse(Var(5) < 750,1006,1008)))))
Pos = 30, -20
PosType = P1
Facing = 1
StateNo = 1005
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1050, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 5
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 80, 25
GetPower = 0, 0
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 23
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 28
Ground.HitTime = 28
Air.HitTime = 28
Guard.SlideTime = 26
Guard.HitTime = 26
Guard.CtrlTime = 26
AirGuard.HitTime = 26
AirGuard.CtrlTime = 26
Down.HitTime = 28
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -3.5, -1.5
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -3.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1050, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Cartwheel : A
;-------------------------------------------------------------------------
[Statedef 1100]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1100
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1100, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1100, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 1100, 0

[State 1100, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 6
MoveType = I

[State 1100, VelSet]
Type = VelSet
Trigger1 = AnimElem = 3
X = 2

[State 1100, 失速]
Type = VelMul
Trigger1 = AnimElem = 6, > 0
X = 0.80

[State 1100, 前進]
Type = PosAdd
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 4
Trigger3 = AnimElem = 5, = -1
Trigger4 = AnimElem = 5
Trigger5 = AnimElem = 5, = 1
X = 12

[State 1100, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 6130
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6130
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.65
Size.YScale = 0.65

[State 1100, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = AnimElemNo(0) = 5
Trigger1 = !MoveContact && !MoveReversed
Trigger2 = PalNo = [7,12]
Trigger2 = EnemyNear(Var(57)),MoveType != H || EnemyNear(Var(57)),StateNo = [120,159]
Trigger2 = MoveContact = 2 || MoveReversed = 2
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 100, 10
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8010 + (Random % 8)
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 7
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 25
Ground.HitTime = 25
Air.HitTime = 25
Guard.SlideTime = 23
Guard.HitTime = 23
Guard.CtrlTime = 23
AirGuard.HitTime = 23
AirGuard.CtrlTime = 23
Down.HitTime = 25
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -3.5, -1.5
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -3.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 18
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1100, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Cartwheel : B
;-------------------------------------------------------------------------
[Statedef 1110]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1110
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1110, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1110, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 1100, 0

[State 1110, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 6
MoveType = I

[State 1110, VelSet]
Type = VelSet
Trigger1 = AnimElem = 3
X = 4

[State 1110, 失速]
Type = VelMul
Trigger1 = AnimElem = 6, > 0
X = 0.80

[State 1110, 前進]
Type = PosAdd
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 4
Trigger3 = AnimElem = 5, = -1
Trigger4 = AnimElem = 5
Trigger5 = AnimElem = 5, = 1
X = 12

[State 1110, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 6130
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6130
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.65
Size.YScale = 0.65

[State 1110, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = AnimElemNo(0) = 5
Trigger1 = !MoveContact && !MoveReversed
Trigger2 = PalNo = [7,12]
Trigger2 = EnemyNear(Var(57)),MoveType != H || EnemyNear(Var(57)),StateNo = [120,159]
Trigger2 = MoveContact = 2 || MoveReversed = 2
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 110, 15
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8010 + (Random % 8)
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 7
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 25
Ground.HitTime = 25
Air.HitTime = 25
Guard.SlideTime = 23
Guard.HitTime = 23
Guard.CtrlTime = 23
AirGuard.HitTime = 23
AirGuard.CtrlTime = 23
Down.HitTime = 25
YAccel = .35
Ground.Velocity = -3.5, -4
Guard.Velocity = -3.5
Air.Velocity = -3.5, -4
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -3.5, -4
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 18
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1110, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Cartwheel : C
;-------------------------------------------------------------------------
[Statedef 1120]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1120
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1120, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1120, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 1100, 0

[State 1120, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 6
MoveType = I

[State 1120, VelSet]
Type = VelSet
Trigger1 = AnimElem = 3
X = 6

[State 1120, 失速]
Type = VelMul
Trigger1 = AnimElem = 6, > 0
X = 0.80

[State 1120, 前進]
Type = PosAdd
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 4
Trigger3 = AnimElem = 5, = -1
Trigger4 = AnimElem = 5
Trigger5 = AnimElem = 5, = 1
X = 12

[State 1120, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 6130
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6130
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.65
Size.YScale = 0.65

[State 1120, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = AnimElemNo(0) = 5
Trigger1 = !MoveContact && !MoveReversed
Trigger2 = PalNo = [7,12]
Trigger2 = EnemyNear(Var(57)),MoveType != H || EnemyNear(Var(57)),StateNo = [120,159]
Trigger2 = MoveContact = 2 || MoveReversed = 2
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 120, 20
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8010 + (Random % 8)
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 7
GuardSound = S1, 111
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 25
Ground.HitTime = 25
Air.HitTime = 25
Guard.SlideTime = 23
Guard.HitTime = 23
Guard.CtrlTime = 23
AirGuard.HitTime = 23
AirGuard.CtrlTime = 23
Down.HitTime = 25
YAccel = .35
Ground.Velocity = 0, 4
Guard.Velocity = -3.5
Air.Velocity = -3.5, -4
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -3.5, -4
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 18
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1120, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
TriggerAll = Target(1000),StateType != A
TriggerAll = Target(1000),StateType != L
Trigger1 = MoveHit = 1
Value = IfElse((Var(10) & 32),50109,50100)
ID = 1000
Persistent = 10
IgNoreHitPause = 1

[State 1120, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Cartwheel : EX
;-------------------------------------------------------------------------
[Statedef 1150]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1150
PowerAdd = -500
SprPriority = 2
FaceP2 = 1

[State 1150, 無敵]
Type = NotHitBy
TriggerAll = Time = 0
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 20

[State 1150, 無敵]
Type = NotHitBy
Trigger1 = PalNo = 12
Value = SCA,AA,AP,AT
Time = 1

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

[State 1150, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 13
Value = 1100, 0

[State 1150, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 16
MoveType = I

[State 1150, VelSet]
Type = VelSet
Trigger1 = AnimElem = 3
X = 6

[State 1150, 失速]
Type = VelMul
Trigger1 = AnimElem = 16, > 0
X = 0.80

[State 1150, 前進]
Type = PosAdd
Trigger1 = AnimElem = 3
Trigger2 = AnimElem = 4
Trigger3 = AnimElem = 5, = -1
Trigger4 = AnimElem = 5
Trigger5 = AnimElem = 5, = 1
Trigger6 = AnimElem = 13
Trigger7 = AnimElem = 14
Trigger8 = AnimElem = 15, = -1
Trigger9 = AnimElem = 15
Trigger10= AnimElem = 15, = 1
X = 12

[State 1150, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 6131
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6131
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.65
Size.YScale = 0.65

[State 1150, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 5
Trigger2 = AnimElem = 15
Trigger3 = PalNo = [7,12]
Trigger3 = EnemyNear(Var(57)),MoveType != H || EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveContact = 1 || MoveReversed = 1
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 5,Hit    ;Hit,Miss,Dodge
Damage = 75, 15
GetPower = 0, 0
GivePower = 30, 20
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8010 + (Random % 8)
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 7
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
Ground.Velocity = 0, 4
Guard.Velocity = -3.5
Air.Velocity = 0, 4
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = 0, 4
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 18
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1150, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit = 1
Trigger1 = AnimElem = 15, < 0
Value = 50300
ID = 1000
Persistent = 10
IgNoreHitPause = 1

[State 1150, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit = 1
Trigger1 = AnimElem = 15, >= 0
Value = IfElse((Var(10) & 32),50109,50100)
ID = 1000
Persistent = 10
IgNoreHitPause = 1

[State 1150, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Be Right Back! : A
;-------------------------------------------------------------------------
[Statedef 1200]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1200, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1200, 無敵]
Type = NotHitBy
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1

[State 1200, 振り向く]
Type = Turn
Trigger1 = Time = 0

[State 1200, VelSet]
Type = VelSet
Trigger1 = AnimElem = 4
X = 16

[State 1200, Effect]
Type = Explod
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(4) % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 3

[State 1200, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 1200, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1200, 次]
Type = ChangeState
Trigger1 = Time = 50
Value = 1201

;-------------------------------------------------------------------------
[Statedef 1201]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1201
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1201, 座標]
Type = PosSet
Trigger1 = Time = 0
X = Pos X - ScreenPos X

[State 1201, 振り向く]
Type = Turn
Trigger1 = P2Dist X < 0
Trigger1 = Time = 0

[State 1201, VelSet]
Type = VelSet
Trigger1 = AnimElem = 1
X = 12

[State 1201, Effect]
Type = Explod
Trigger1 = Anim != 1202
Trigger1 = Time % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 3

[State 1201, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 1201, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1201, 攻撃終了]
Type = StateTypeSet
Trigger1 = MoveContact || MoveReversed
Trigger2 = Anim = 1202
MoveType = I

[State 1201, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 100, 30
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 15
GuardSound = S1, 111
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
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 42
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1201, ChangeAnim]
Type = ChangeAnim
TriggerAll = Anim != 1202
Trigger1 = Pos X >= 0
Value = 1202

[State 1201, VelSet]
Type = VelSet
Trigger1 = Anim = 1202
X = 0

[State 1201, 終了]
Type = ChangeState
Trigger1 = Anim = 1202
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Be Right Back! : B
;-------------------------------------------------------------------------
[Statedef 1210]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1210, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1210, 無敵]
Type = NotHitBy
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1

[State 1210, 振り向く]
Type = Turn
Trigger1 = Time = 0

[State 1210, VelSet]
Type = VelSet
Trigger1 = AnimElem = 4
X = 16

[State 1210, Effect]
Type = Explod
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(4) % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 3

[State 1210, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 1210, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1210, 次]
Type = ChangeState
Trigger1 = Time = 50
Value = 1211

;-------------------------------------------------------------------------
[Statedef 1211]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1201
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1211, 座標]
Type = PosSet
Trigger1 = Time = 0
X = Pos X - ScreenPos X + 320

[State 1211, 振り向く]
Type = Turn
Trigger1 = P2Dist X < 0
Trigger1 = Time = 0

[State 1211, VelSet]
Type = VelSet
Trigger1 = AnimElem = 1
X = 12

[State 1211, Effect]
Type = Explod
Trigger1 = Anim != 1202
Trigger1 = Time % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 3

[State 1211, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 1211, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1211, 攻撃終了]
Type = StateTypeSet
Trigger1 = MoveContact || MoveReversed
Trigger2 = Anim = 1202
MoveType = I

[State 1211, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 100, 30
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 15
GuardSound = S1, 111
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
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 42
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1211, ChangeAnim]
Type = ChangeAnim
TriggerAll = Anim != 1202
Trigger1 = Pos X <= 0
Value = 1202

[State 1211, VelSet]
Type = VelSet
Trigger1 = Anim = 1202
X = 0

[State 1211, 終了]
Type = ChangeState
Trigger1 = Anim = 1202
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;Be Right Back! : C
;-------------------------------------------------------------------------
[Statedef 1220]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1220, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1220, 無敵]
Type = NotHitBy
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1

[State 1220, 振り向く]
Type = Turn
Trigger1 = Time = 0

[State 1220, VelSet]
Type = VelSet
Trigger1 = AnimElem = 4
X = 16

[State 1220, Effect]
Type = Explod
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(4) % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 3

[State 1220, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 1220, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1220, 次]
Type = ChangeState
Trigger1 = Time = 50
Value = 1221

;-------------------------------------------------------------------------
[Statedef 1221]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1221
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1221, 座標]
Type = PosSet
Trigger1 = Time = 0
X = 0

[State 1221, 座標]
Type = PosSet
TriggerAll = NumHelper(1008)
Trigger1 = Helper(1008),StateNo = 1007
Trigger1 = Time = 0
X = Helper(1008),Pos X

[State 1221, 振り向く]
Type = Turn
Trigger1 = P2Dist X < 0
Trigger1 = Time = 0

[State 1221, 重力]
Type = VelAdd
Trigger1 = AnimElem = 3, > 0
Trigger1 = StateType = A
Y = 0.50

[State 1221, VelSet]
Type = VelSet
Trigger1 = AnimElem = 3
Y = -8

[State 1221, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 0, 22
Persistent = 0
IgNoreHitPause = 1

[State 1221, ScreenBound]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0

[State 1221, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1221, CtrlSet]
Type = Null;CtrlSet
Trigger1 = AnimElem = 9
Value = 1

[State 1221, ヘルパー呼出]
Type = Helper
TriggerAll = NumHelper(1008) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 1225
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1225
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1221, 攻撃終了]
Type = StateTypeSet
Trigger1 = MoveContact || MoveReversed
MoveType = I

[State 1221, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 100, 30
GetPower = 120, 80
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 15
GuardSound = S1, 111
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
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1221, 終了]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

;-------------------------------------------------------------------------
;HELPER : プレゼント
;-------------------------------------------------------------------------
[Statedef 1225]
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6120
SprPriority = 1

[State 1225, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 4
HelperType = Normal
Name = "Helper"
ID = 1226
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1226
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1225, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Helper"
ID = 1227
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1227
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1225, ヘルパー消去]
Type = ChangeState
Trigger1 = Time = 60
Value = 1008

;-------------------------------------------------------------------------
[Statedef 1226]
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6121
SprPriority = 1

[State 1226, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 1226, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -2
Y = -8

[State 1226, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 30
Trigger1 = 1 || Var(0) := 0
Trigger2 = Time >= 31
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 1226, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)

[State 1226, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Var(0) >= 256

;-------------------------------------------------------------------------
[Statedef 1227]
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6122
SprPriority = 3

;Var(10)  = 親ID

[State 1227, 親ID]
Type = VarSet
TriggerAll = IsHelper
Trigger1 = Time = 0
V = 10
Value = Parent,ID

[State 1227, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = PlayerIDExist(Var(10)) = 0

[State 1227, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = -1

[State 1227, 親に追従]
Type = BindToParent
Trigger1 = IsHelper
Time = 1
Facing = 1
Pos = 0, 0

[State 1227, ChangeAnim]
Type = ChangeAnim
TriggerAll = IsHelper
Trigger1 = Parent,Anim = 6120
Value = Anim
Elem = Parent,AnimElemNo(0)

;-------------------------------------------------------------------------
;Be Right Back! : EX
;-------------------------------------------------------------------------
[Statedef 1250]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1200
PowerAdd = -500
SprPriority = 2
FaceP2 = 1

[State 1250, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1250, 無敵]
Type = NotHitBy
Trigger1 = PalNo = [7,12]
Value = SCA,AA,AP,AT
Time = 1

[State 1250, ヘルパー呼出]
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

[State 1250, 振り向く]
Type = Turn
Trigger1 = Time = 0

[State 1250, VelSet]
Type = VelSet
Trigger1 = AnimElem = 4
X = 16

[State 1250, Effect]
Type = Explod
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(4) % 3 = 0
Anim = 6129
ID = 6129
Pos = 0, 0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = 3

[State 1250, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 1250, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1250, 次]
Type = ChangeState
Trigger1 = Time = 50
Value = 1251

;-------------------------------------------------------------------------
[Statedef 1251]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1251
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 1251, 座標]
Type = PosSet
Trigger1 = Time = 0
X = EnemyNear(Var(57)),Pos X
Y = Pos Y - ScreenPos Y - 20

[State 1251, 振り向く]
Type = Turn
Trigger1 = P2Dist X < 0
Trigger1 = Time = 0

[State 1251, 座標]
Type = PosAdd
TriggerAll = Time = 0
Trigger1 = TeamSide = 1
Trigger1 = Facing = -1
Trigger2 = TeamSide = 2
Trigger2 = Facing = 1
X = -1

[State 1251, 重力]
Type = VelAdd
Trigger1 = StateType = A
Y = 0.50

[State 1251, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 12

[State 1251, ScreenBound]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0

[State 1251, ぶつかり判定の消失]
Type = PlayerPush
Trigger1 = 1
Value = 0

[State 1251, 攻撃終了]
Type = StateTypeSet
Trigger1 = MoveContact || MoveReversed
MoveType = I

[State 1251, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = !MoveContact && !MoveReversed
Attr = S,SA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 100, 30
GetPower = 0, 0
GivePower = 60, 40
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -30
HitSound = S1, 15
GuardSound = S1, 111
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
Ground.Velocity = 0, 8
Guard.Velocity = -3.5
Air.Velocity = 0, 8
AirGuard.Velocity = -3.5, -1.5
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

[State 1251, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(1000)
TriggerAll = Target(1000),IsHelper = 0
Trigger1 = MoveHit = 1
Value = 50300
ID = 1000
Persistent = 10
IgNoreHitPause = 1

[State 1251, 終了]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1252

;-------------------------------------------------------------------------
[Statedef 1252]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
Ctrl = 1
Anim = 626
PowerAdd = 0
SprPriority = 2

[State 1252, 停止]
Type = VelSet
Trigger1 = Time = 0
X = 0
Y = 0

[State 1252, 接地]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1252, SE : 着地音]
Type = PlaySnd
Trigger1 = Time = 0
Value = 52, 0

[State 1252, Effect]
Type = Explod
Trigger1 = Time = 0
Anim = 7200
ID = 7200
Pos = 0,0
PosType = P1
BindTime = 1
ReMoveTime = -2
Scale = 0.5, 0.5
SprPriority = -2
OwnPal = 1

[State 1252, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;パイ投げ : A
;-------------------------------------------------------------------------
[Statedef 1300]

[State 1300, 実行]
Type = ChangeState
Trigger1 = 1
Value = 1301

;-------------------------------------------------------------------------
;パイ投げ
;-------------------------------------------------------------------------
[Statedef 1301]
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

[State 1301, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 1301, 重力]
Type = Gravity
Trigger1 = StateType = A
Trigger1 = AnimElem = 7, > 0

[State 1301, VelSet]
Type = VelSet
Trigger1 = AnimElem = 7
X = -0.5
Y = -2

[State 1301, ヘルパー呼出]
Type = Helper
TriggerAll = NumHelper(6132) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Pie"
ID = 6132
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6132
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1301, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 7
HelperType = Normal
Name = "HitDef"
ID = IfElse(PrevStateNo = 1300,1305,IfElse(PrevStateNo = 1310,1315,1325))
Pos = 20, -35
PosType = P1
Facing = 1
StateNo = 1305
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1301, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

[State 1301, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1

;-------------------------------------------------------------------------
;HELPER : パイ
;-------------------------------------------------------------------------
[Statedef 1305]
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6133
SprPriority = 3

[State 1305, 補正値計算 : コンボ補正]
Type = ParentVarSet
TriggerAll = IsHelper
TriggerAll = EnemyNear(Root,Var(57)),MoveType = H
TriggerAll = EnemyNear(Root,Var(57)),StateNo != [120,159]
Trigger1 = Time = 0
FV = 0
Value = 0.90 ** EnemyNear(Root,Var(57)),GetHitVar(HitCount)
Persistent = 0
IgNoreHitPause = 1

[State 1305, 攻撃力補正]
Type = AttackMulSet
Trigger1 = IsHelper
Value = 1.0 * IfElse((Root,PalNo = [11,12]),1.5,1.0) * Root,FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

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
StateNo = 1306
Time = 1
ForceAir = 0
IgNoreHitPause = 1

[State 1305, 発射]
Type = VelSet
TriggerAll = IsHelper(1305) || IsHelper(1355)
Trigger1 = Time = 0
X = 10
Y = 5

[State 1305, 発射]
Type = VelSet
TriggerAll = IsHelper(1315)
Trigger1 = Time = 0
X = 8
Y = 7

[State 1305, 発射]
Type = VelSet
TriggerAll = IsHelper(1325)
Trigger1 = Time = 0
X = 6
Y = 9

[State 1305, AngleDraw]
Type = AngleDraw
Trigger1 = IsHelper(1315)
Value = -10

[State 1305, AngleDraw]
Type = AngleDraw
Trigger1 = IsHelper(1325)
Value = -20

[State 1305, 重力]
Type = Null;VelAdd
Trigger1 = 1
Y = 0.15

[State 1305, ヒット定義]
Type = HitDef
TriggerAll = IsHelper
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
SparkXY = -5, -20
HitSound = S1, 4
GuardSound = S1, 111
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
Ground.Velocity = -3.5, 0
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
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1305, ヒット定義]
Type = HitDef
TriggerAll = IsHelper(1355)
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
Damage = 70, 20
GetPower = 0, 0
GivePower = 20, 15
PauseTime = 1, 1
Guard.PauseTime = 1, 1
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 4
GuardSound = S1, 111
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
Ground.Velocity = -3.5, 0
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
Fall = 0
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 1000
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 1305, 終了]
Type = ChangeState
Trigger1 = MoveContact || MoveReversed
Value = 1306

[State 1305, 着地へ]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1307

[State 1305, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = ScreenPos X != [0,319]
Trigger2 = ScreenPos Y != [0,239]

;-------------------------------------------------------------------------
[Statedef 1306]
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6134

[State 1306, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Pie"
ID = 1308
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1308
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1306, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.25

[State 1306, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = -1
Y = -3

[State 1306, VelSet]
Type = VelSet
Trigger1 = Pos Y >= 0
X = 0
Y = 0

[State 1306, 接地]
Type = PosSet
Trigger1 = Pos Y >= 0
Y = 0

[State 1306, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 30
Trigger1 = 1 || Var(0) := 0
Trigger2 = Time >= 31
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 1306, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)

[State 1306, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Var(0) >= 256

;-------------------------------------------------------------------------
[Statedef 1307]
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 6134

[State 1307, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Pie"
ID = 1308
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 1308
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1307, 接地]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 1307, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 30
Trigger1 = 1 || Var(0) := 0
Trigger2 = Time >= 31
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 1307, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)

[State 1307, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Var(0) >= 256

;-------------------------------------------------------------------------
[Statedef 1308]
MoveType= I
Physics = N
Juggle  = 0
VelSet = 4,1
Ctrl = 0
Anim = 6135
SprPriority = 3

[State 1308, 失速]
Type = VelMul
Trigger1 = 1
X = 0.90
Y = 0.90

[State 1308, 変数 : 透過の移り変わり]
Type = Null
TriggerAll = IsHelper
Trigger1 = Time = 0
Trigger1 = 1 || Var(0) := 0
Trigger2 = Time >= 1
Trigger2 = 1 || Var(0) := Var(0) + 16

[State 1308, 透過]
Type = Trans
Trigger1 = IsHelper
Trans = AddAlpha
Alpha = 256 - Var(0), Var(0)

[State 1308, ヘルパー消去]
Type = DestroySelf
TriggerAll = IsHelper
Trigger1 = Var(0) >= 256

;-------------------------------------------------------------------------
;パイ投げ : B
;-------------------------------------------------------------------------
[Statedef 1310]

[State 1310, 実行]
Type = ChangeState
Trigger1 = 1
Value = 1301

;-------------------------------------------------------------------------
;パイ投げ : C
;-------------------------------------------------------------------------
[Statedef 1320]

[State 1320, 実行]
Type = ChangeState
Trigger1 = 1
Value = 1301

;-------------------------------------------------------------------------
;パイ投げ : EX
;-------------------------------------------------------------------------
[Statedef 1350]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 1300
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

[State 1350, 初期化]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 0

[State 1350, ChangeAnim]
Type = ChangeAnim
Trigger1 = AnimElem = 7, = 1
Trigger1 = Var(5) < 2
Trigger1 = 1 || Var(5) := Var(5) + 1
Value = Anim
Elem = 2

[State 1350, 重力]
Type = Gravity
TriggerAll = StateType = A
Trigger1 = AnimElem = 7, > 0
Trigger2 = Var(5) > 0

[State 1350, VelSet]
Type = VelSet
Trigger1 = AnimElem = 7
X = -0.5
Y = -4

[State 1350, ヘルパー呼出]
Type = Helper
TriggerAll = NumHelper(6132) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Pie"
ID = 6132
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6132
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1350, ヘルパー呼出]
Type = Helper
Trigger1 = AnimElem = 7
HelperType = Normal
Name = "HitDef"
ID = 1355
Pos = 20, -35
PosType = P1
Facing = 1
StateNo = 1305
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 1350, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

[State 1350, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = (StateType = A) * 51
Ctrl = 1
