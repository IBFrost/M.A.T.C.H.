;-| Normal Attacks |------------------------------------------------------
;-------------------------------------------------------------------------
;立ち弱攻撃
;-------------------------------------------------------------------------
[Statedef 200]
Type    = S
MoveType= A
Physics = S
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 200
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 200, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.75 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 200, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 2
Value = 0, 0
Persistent = 0
IgNoreHitPause = 1

[State 200, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 3
MoveType = I

[State 200, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 2
Attr = S,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Light    ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 2,Hit    ;Hit,Miss,Dodge
Damage = 40, 0 + 10 * (PalNo = [7,12])
GetPower = 40, 30
GivePower = 20, 15
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -40
HitSound = S1, 10
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 13
Ground.HitTime = 13
Air.HitTime = 13
Guard.SlideTime = 11
Guard.HitTime = 11
Guard.CtrlTime = 11
AirGuard.HitTime = 11
AirGuard.CtrlTime = 11
Down.HitTime = 13
YAccel = .35
Ground.Velocity = -4.5, 0
Guard.Velocity = -4.5
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
Fall.RecoverTime = 12
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 200, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;立ち中攻撃
;-------------------------------------------------------------------------
[Statedef 210]
Type    = S
MoveType= A
Physics = S
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 210
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 210, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.80 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 210, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 8
Value = 0, 1

[State 210, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 9
MoveType = I

[State 210, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 8
Attr = S,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Medium   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 3,Hit    ;Hit,Miss,Dodge
Damage = 35, 0 + 10 * (PalNo = [7,12])
GetPower = 30, 20
GivePower = 15, 10
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -30
HitSound = S1, 14
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 10
Ground.HitTime = 10
Air.HitTime = 10
Guard.SlideTime = 8
Guard.HitTime = 8
Guard.CtrlTime = 8
AirGuard.HitTime = 8
AirGuard.CtrlTime = 8
Down.HitTime = 10
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 24
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 210, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;立ち強攻撃
;-------------------------------------------------------------------------
[Statedef 220]
Type    = S
MoveType= A
Physics = S
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 220
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 220, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.85 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 220, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 6
Trigger2 = AnimElem = 10
Value = 0, 2

[State 220, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 11
MoveType = I

[State 220, 前進]
Type = VelSet
Trigger1 = Time = 0
X = 6

[State 220, 前進]
Type = PosAdd
TriggerAll = Time = 0
Trigger1 = PrevStateNo = [200,499]
X = 12

[State 220, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 6
Trigger2 = AnimElem = 10
Attr = S,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 40, 0 + 15 * (PalNo = [7,12])
GetPower = 40, 30
GivePower = 20, 15
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -50
HitSound = S1, 15
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 12
Ground.HitTime = 12
Air.HitTime = 12
Guard.SlideTime = 10
Guard.HitTime = 10
Guard.CtrlTime = 10
AirGuard.HitTime = 10
AirGuard.CtrlTime = 10
Down.HitTime = 12
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 24
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 220, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;しゃがみ弱攻撃
;-------------------------------------------------------------------------
[Statedef 400]
Type    = C
MoveType= A
Physics = C
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 400
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 400, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.75 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 400, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 0, 0
Persistent = 0
IgNoreHitPause = 1

[State 400, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 4
MoveType = I

[State 400, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 3
Attr = C,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = LA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Light    ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 2,Hit    ;Hit,Miss,Dodge
Damage = 35, 0 + 10 * (PalNo = [7,12])
GetPower = 40, 30
GivePower = 20, 15
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -20
HitSound = S1, 10
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 8
Ground.HitTime = 8
Air.HitTime = 8
Guard.SlideTime = 6
Guard.HitTime = 6
Guard.CtrlTime = 6
AirGuard.HitTime = 6
AirGuard.CtrlTime = 6
Down.HitTime = 8
YAccel = .35
Ground.Velocity = -4.5, 0
Guard.Velocity = -4.5
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
Fall.RecoverTime = 12
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 400, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 11
Ctrl = 1

;-------------------------------------------------------------------------
;しゃがみ中攻撃
;-------------------------------------------------------------------------
[Statedef 410]
Type    = C
MoveType= A
Physics = C
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 410
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 410, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.80 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 410, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 4
Value = 0, 1
Persistent = 0
IgNoreHitPause = 1

[State 410, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 5
MoveType = I

[State 410, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 4
Attr = C,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = LA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Medium   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 3,Hit    ;Hit,Miss,Dodge
Damage = 60, 0 + 20 * (PalNo = [7,12])
GetPower = 60, 40
GivePower = 30, 20
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 14
GuardSound = S1, 100
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
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 24
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 410, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 11
Ctrl = 1

;-------------------------------------------------------------------------
;しゃがみ強攻撃
;-------------------------------------------------------------------------
[Statedef 420]
Type    = C
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 420
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 420, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.85 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 420, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 4
Value = 0, 2
Persistent = 0
IgNoreHitPause = 1

[State 420, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 5
MoveType = I

[State 420, 前進]
Type = VelSet
Trigger1 = AnimElem = 4
X = 6

[State 420, 失速]
Type = VelMul
Trigger1 = AnimElem = 5, > 0
X = 0.80

[State 420, 前進]
Type = PosAdd
TriggerAll = Time = 0
Trigger1 = PrevStateNo = [200,499]
X = 12

[State 420, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 4
Attr = C,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = LA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 75, 0 + 25 * (PalNo = [7,12])
GetPower = 80, 60
GivePower = 40, 30
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 15
GuardSound = S1, 100
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
Ground.Velocity = -0.5, -4
Guard.Velocity = -3.5
Air.Velocity = -0.5, -4
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -4
Ground.CornerPush.VelOff = -1
Guard.CornerPush.VelOff = -1
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = 0
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 420, ステート奪取]
Type = TargetState
Trigger1 = MoveHit = 1
Value = 5072
Persistent = 0
IgNoreHitPause = 1

[State 420, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 11
Ctrl = 1

;-------------------------------------------------------------------------
;打ち上げ攻撃
;-------------------------------------------------------------------------
[Statedef 430]
Type    = C
MoveType= A
Physics = C
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 430
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 430, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.90 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 430, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 4
Value = 430, 0
Persistent = 0
IgNoreHitPause = 1

[State 430, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 5
MoveType = I

[State 430, VelSet]
Type = VelSet
Trigger1 = AnimElem = 5
X = 3
Y = -10

[State 430, StateTypeSet]
Type = StateTypeSet
Trigger1 = AnimElem = 5
StateType = A
Physics = A

[State 430, CtrlSet]
Type = CtrlSet
Trigger1 = AnimElem = 5
Value = 1

[State 430, 前進]
Type = PosAdd
TriggerAll = Time = 0
Trigger1 = PrevStateNo = [200,499]
X = 12

[State 430, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 6001
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6001
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.65
Size.YScale = 0.65

[State 430, ヒット定義]
Type = HitDef
TriggerAll = Var(8) < 2
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 4
Attr = C,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 90, 0 + 30 * (PalNo = [7,12])
GetPower = 80, 60
GivePower = 40, 30
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8010 + (Random % 8)
Guard.SparkNo = S8020
SparkXY = -25, -50
HitSound = S1, 7
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
Ground.Velocity = -0.5, -8
Guard.Velocity = -3.5
Air.Velocity = -0.5, -8
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -8
Ground.CornerPush.VelOff = -1
Guard.CornerPush.VelOff = -1
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 48
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 430, 打ち上げ攻撃当てた回数]
Type = VarAdd
Trigger1 = MoveHit = 1
V = 8
Value = 1
Persistent = 0
IgNoreHitPause = 1

[State 430, ステート奪取]
Type = TargetState
TriggerAll = Var(8) >= 2
Trigger1 = MoveHit = 1
Value = 50020
Persistent = 0
IgNoreHitPause = 1

[State 430, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 51
Ctrl = 1

;-------------------------------------------------------------------------
;ジャンプ弱攻撃
;-------------------------------------------------------------------------
[Statedef 600]
Type    = A
MoveType= A
Physics = A
Juggle  = 0
Ctrl = 0
Anim = 600
PowerAdd = 0
SprPriority = 2

[State 600, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.75 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 600, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 3
Value = 0, 0
Persistent = 0
IgNoreHitPause = 1

[State 600, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 4
MoveType = I

[State 600, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 3
Attr = A,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = HA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Light    ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 2,Hit    ;Hit,Miss,Dodge
Damage = 45, 0 + 15 * (PalNo = [7,12])
GetPower = 40, 30
GivePower = 20, 15
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 10
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
Air.Velocity = -0.5, -1
AirGuard.Velocity = -0.5, -1
Down.Velocity = -0.5, -1
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 18
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 600, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 51
Ctrl = 1

;-------------------------------------------------------------------------
;ジャンプ中攻撃
;-------------------------------------------------------------------------
[Statedef 610]
Type    = A
MoveType= A
Physics = A
Juggle  = 0
Ctrl = 0
Anim = 610
PowerAdd = 0
SprPriority = 2

[State 610, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.80 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 610, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 4
Value = 0, 1
Persistent = 0
IgNoreHitPause = 1

[State 610, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 5
MoveType = I

[State 610, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 4
Attr = A,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = HA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Medium   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 3,Hit    ;Hit,Miss,Dodge
Damage = 70, 0 + 20 * (PalNo = [7,12])
GetPower = 60, 40
GivePower = 30, 20
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -25, -40
HitSound = S1, 14
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
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 30
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 610, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 51
Ctrl = 1

;-------------------------------------------------------------------------
;ジャンプ強攻撃
;-------------------------------------------------------------------------
[Statedef 620]
Type    = A
MoveType= A
Physics = A
Juggle  = 0
Ctrl = 0
Anim = 620
PowerAdd = 0
SprPriority = 2

[State 620, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.85 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 620, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 6
Value = 430, 0
Persistent = 0
IgNoreHitPause = 1

[State 620, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 8
MoveType = I

[State 620, ヘルパー呼出]
Type = Helper
Trigger1 = Time = 0
HelperType = Normal
Name = "Effect"
ID = 6002
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6002
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.65
Size.YScale = 0.65

[State 620, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = [6,7]
Attr = A,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = HA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 85, 0 + 25 * (PalNo = [7,12])
GetPower = 80, 60
GivePower = 40, 30
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8010 + (Random % 8)
Guard.SparkNo = S8020
SparkXY = -25, -40
HitSound = S1, 7
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
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 30
Fall.Damage = 0
ID = 600
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 620, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 51
Ctrl = 1

;-------------------------------------------------------------------------
;ジャンプ↓ + 強
;-------------------------------------------------------------------------
[Statedef 625]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 625
PowerAdd = 0
SprPriority = 2

[State 625, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.85 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 625, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 18
Value = 0, 5
Persistent = 0
IgNoreHitPause = 1

[State 625, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = MoveContact || MoveReversed
MoveType = I

[State 625, VelSet]
Type = VelSet
Trigger1 = AnimElem = 18
X = 10
Y = 10

[State 625, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 18
Attr = A,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = HA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 80, 0 + 25 * (PalNo = [7,12])
GetPower = 80, 60
GivePower = 40, 30
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -25, -20
HitSound = S1, 15
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 10
Ground.HitTime = 10
Air.HitTime = 10
Guard.SlideTime = 8
Guard.HitTime = 8
Guard.CtrlTime = 8
AirGuard.HitTime = 8
AirGuard.CtrlTime = 8
Down.HitTime = 10
YAccel = .35
Ground.Velocity = -3.5, 0
Guard.Velocity = -3.5
Air.Velocity = -0.5, -1.5
AirGuard.Velocity = -0.5, -1.5
Down.Velocity = -0.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -1
AirGuard.CornerPush.VelOff = -1
Down.CornerPush.VelOff = -1
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 30
Fall.Damage = 0
ID = 600
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 625, 終了]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 626

;-------------------------------------------------------------------------
[Statedef 626]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
Ctrl = 1
Anim = 626
PowerAdd = 0
SprPriority = 2

[State 626, 停止]
Type = VelSet
Trigger1 = Time = 0
X = 0
Y = 0

[State 626, 接地]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 626, SE : 着地音]
Type = PlaySnd
Trigger1 = Time = 0
Value = 52, 0

[State 626, Effect : 着地]
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

[State 626, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;投げ
;-------------------------------------------------------------------------
[Statedef 800]
Type    = S
MoveType= A
Physics = S
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 800
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 800, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = !MoveContact && !MoveReversed
TriggerAll = EnemyNear(Var(57)),StateType != A
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
TriggerAll = EnemyNear(Var(57)),StateNo != [30,49]
Trigger1 = AnimElemNo(0) = 1
Attr = S,NT         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = M         ;HLMAFDP+-
GuardFlag =         ;HLMA
AffectTeam = E      ;EBF
Priority = 1,Miss   ;Hit,Miss,Dodge
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
ID = 800
NoChainID = 9999
NumHits = 0

[State 800, 前後判定 : 前]
Type = VarSet
Trigger1 = Time = 0
V = 10
Value = (Var(10) | 4) - 4

[State 800, 前後判定 : 後ろ]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = Time = 0
Trigger1 = Command = "holdback"
V = 10
Value = (Var(10) | 4)

[State 800, 前後判定 : AI]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = Time = 0
Trigger1 = Var(42) <= 100
V = 10
Value = (Var(10) | 4)

[State 800, ステート奪取]
Type = TargetState
TriggerAll = (Var(10) & 4)
TriggerAll = NumTarget(800)
TriggerAll = Target(800),IsHelper = 0
Trigger1 = MoveHit
Value = 825
ID = 800
Persistent = 0
IgNoreHitPause = 1

[State 800, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget(800)
Trigger1 = Target(800),StateNo = 825
Value = 815
Persistent = 0
IgNoreHitPause = 1

[State 800, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(800)
TriggerAll = Target(800),IsHelper = 0
Trigger1 = MoveHit
Value = 820
ID = 800
Persistent = 0
IgNoreHitPause = 1

[State 800, 成立ステートへ]
Type = ChangeState
TriggerAll = NumTarget(800)
Trigger1 = Target(800),StateNo = 820
Value = 810
Persistent = 0
IgNoreHitPause = 1

[State 800, 終了]
Type = ChangeState
Trigger1 = PalNo = [7,12]
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

[State 800, 終了]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 220

;-------------------------------------------------------------------------
;投げ : 投げ成立
;-------------------------------------------------------------------------
[Statedef 810]
Type    = A
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 810
PowerAdd = 0

[State 810, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 0

[State 810, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 30,0

[State 810, VelSet]
Type = VelSet
Trigger1 = Time = 0
X = 2
Y = -9

[State 810, 重力]
Type = VelAdd
Trigger1 = AnimElemTime(5) < 0
Trigger2 = AnimElemTime(17) >= 0
Y = 0.45

[State 810, SE]
Type = PlaySnd
Trigger1 = AnimElemTime(5) = 0
Value = 810, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 800
Pos = 10, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) < 0
Time = 1
ID = 800
Pos = 10, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) >= 0
Trigger1 = AnimElemTime(3) < 0
Time = 1
ID = 800
Pos = 30, -30

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(3) >= 0
Trigger1 = AnimElemTime(4) < 0
Time = 1
ID = 800
Pos = 20, -30

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(5) < 0
Time = 1
ID = 800
Pos = 20, -20

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(5) >= 0
Trigger1 = AnimElemTime(6) < 0
Trigger2 = AnimElemTime(9) >= 0
Trigger2 = AnimElemTime(10) < 0
Trigger3 = AnimElemTime(13) >= 0
Trigger3 = AnimElemTime(14) < 0
Time = 1
ID = 800
Pos = 0, -10

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(6) >= 0
Trigger1 = AnimElemTime(7) < 0
Trigger2 = AnimElemTime(10) >= 0
Trigger2 = AnimElemTime(11) < 0
Trigger3 = AnimElemTime(14) >= 0
Trigger3 = AnimElemTime(15) < 0
Time = 1
ID = 800
Pos = -30, -30

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(7) >= 0
Trigger1 = AnimElemTime(8) < 0
Trigger2 = AnimElemTime(11) >= 0
Trigger2 = AnimElemTime(12) < 0
Trigger3 = AnimElemTime(15) >= 0
Trigger3 = AnimElemTime(16) < 0
Time = 1
ID = 800
Pos = 0, -50

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(8) >= 0
Trigger1 = AnimElemTime(9) < 0
Trigger2 = AnimElemTime(12) >= 0
Trigger2 = AnimElemTime(13) < 0
Trigger3 = AnimElemTime(16) >= 0
Trigger3 = AnimElemTime(17) < 0
Time = 1
ID = 800
Pos = 30, -30

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(17) >= 0
Trigger1 = AnimElemTime(18) < 0
Time = 1
ID = 800
Pos = 10, -10

[State 810, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(5) = 0
X = 0
Y = 0

[State 810, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(17) = 0
X = 2

[State 810, ヒット数を増やす]
Type = HitAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 810, ゲージ増加]
Type = PowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 80

[State 810, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 40
ID = 800

[State 810, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(80 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 800

[State 810, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo != [7,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 821
ID = 800

[State 810, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo = [7,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 822
ID = 800

[State 810, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 811

;-------------------------------------------------------------------------
;投げ : 放り
;-------------------------------------------------------------------------
[Statedef 811]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 811
PowerAdd = 0

[State 811, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 811, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 811, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 811, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 811, Effect]
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

[State 811, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;投げ : 投げ成立(後ろ投げ)
;-------------------------------------------------------------------------
[Statedef 815]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 815
PowerAdd = 0

[State 815, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 2, 0

[State 815, 余白を作る]
Type = Width
Trigger1 = 1
Edge = 10,0

[State 815, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 800
Pos = 10, 0

[State 815, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) < 0
Time = 1
ID = 800
Pos = 20, 0

[State 815, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(2) >= 0
Trigger1 = AnimElemTime(3) < 0
Time = 1
ID = 800
Pos = 40, -90

[State 815, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(3) >= 0
Trigger1 = AnimElemTime(4) < 0
Time = 1
ID = 800
Pos = 0, -40

[State 815, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(4) >= 0
Trigger1 = AnimElemTime(5) < 0
Time = 1
ID = 800
Pos = 10, -40

[State 815, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(5) >= 0
Trigger1 = AnimElemTime(6) < 0
Time = 1
ID = 800
Pos = 10, -10

[State 815, 振り向く]
Type = Turn
Trigger1 = (Var(10) & 4)
Trigger1 = AnimElemTime(3) = 0

[State 815, 相手振り向かせる]
Type = TargetFacing
Trigger1 = (Var(10) & 4)
Trigger1 = AnimElemTime(3) = 0
Value = -1

[State 815, StateTypeSet]
Type = StateTypeSet
Trigger1 = AnimElemTime(3) = 0
StateType = A

[State 815, PosAdd]
Type = PosAdd
Trigger1 = AnimElemTime(3) = 0
X = -20
Y = -80

[State 815, VelSet]
Type = VelSet
Trigger1 = AnimElemTime(3) = 0
X = 2
Y = -4

[State 815, 重力]
Type = VelAdd
Trigger1 = StateType = A
Y = 0.45

[State 815, ヒット数を増やす]
Type = HitAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 1

[State 815, ゲージ増加]
Type = PowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 80

[State 815, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 40
ID = 800

[State 815, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = -Floor(80 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 800

[State 815, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo != [7,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 821
ID = 800

[State 815, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo = [7,12]
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 822
ID = 800

[State 815, ChangeState]
Type = ChangeState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 816

;-------------------------------------------------------------------------
;投げ : 放り
;-------------------------------------------------------------------------
[Statedef 816]
Type    = S
MoveType= I
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 816
PowerAdd = 0

[State 816, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 816, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 816, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 1, 25

[State 816, 振動]
Type = EnvShake
Trigger1 = Time = 0
Time = 10
Freq = 90
Ampl = -4
Phase = 90

[State 816, Effect]
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

[State 816, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 0
Ctrl = 1

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 820]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 820, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 820, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 820, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 820

[State 820, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 820, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 投げられ
;-------------------------------------------------------------------------
[Statedef 821]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 821, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 821, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 821, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 821, 速度]
Type = VelSet
Trigger1 = Time = 10
X = -1
Y = -4

[State 821, 重力]
Type = VelAdd
Trigger1 = Time >= 10
Y = 0.35

[State 821, 喰らい中のアニメ指定]
Type = ChangeAnim
Trigger1 = Time = 10
Value = 5050

[State 821, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1

[State 821, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 投げられb
;-------------------------------------------------------------------------
[Statedef 822]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
Anim = 5110
PowerAdd = 0

[State 822, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 822, VelSet]
Type = VelSet
Trigger1 = Time = 0
Y = 0

[State 822, PosSet]
Type = PosSet
Trigger1 = Time = 0
Y = 0

[State 822, 速度]
Type = VelSet
Trigger1 = Time = 10
X = -1
Y = -4

[State 822, 重力]
Type = VelAdd
Trigger1 = Time >= 10
Y = 0.35

[State 822, 喰らい中のアニメ指定]
Type = ChangeAnim
Trigger1 = Time = 10
Value = 5050

[State 822, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 掴まれ
;-------------------------------------------------------------------------
[Statedef 825]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 825, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 825, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 825, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 825

[State 825, 縦スクロール固定]
Type = ScreenBound
Trigger1 = 1
Value = 1
MoveCamera = 1,0
IgNoreHitPause = 1

[State 825, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050
