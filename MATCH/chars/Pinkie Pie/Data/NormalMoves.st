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
Trigger1 = AnimElem = 4
Value = 0, 0
Persistent = 0
IgNoreHitPause = 1

[State 200, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 5
MoveType = I

[State 200, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 4
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
SparkXY = -15, -30
HitSound = S1, 10
GuardSound = S1, 100
Ground.Type = High  ;High,Low,Trip,Non
Air.Type = High
Ground.SlideTime = 11
Ground.HitTime = 11
Air.HitTime = 11
Guard.SlideTime = 9
Guard.HitTime = 9
Guard.CtrlTime = 9
AirGuard.HitTime = 9
AirGuard.CtrlTime = 9
Down.HitTime = 11
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
Trigger1 = AnimElem = 6
Value = 0, 20
Persistent = 0
IgNoreHitPause = 1

[State 210, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 7
MoveType = I

[State 210, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 6
Attr = S,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Medium   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 3,Hit    ;Hit,Miss,Dodge
Damage = 65, 0 + 20 * (PalNo = [7,12])
GetPower = 60, 40
GivePower = 30, 20
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -30
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
Trigger1 = AnimElem = 8
Value = 0, 2
Persistent = 0
IgNoreHitPause = 1

[State 220, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 9
MoveType = I

[State 220, 前進]
Type = VelSet
Trigger1 = AnimElem = 8
X = 3

[State 220, 前進]
Type = PosAdd
TriggerAll = Time = 0
Trigger1 = PrevStateNo = [200,499]
X = 12

[State 220, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 8
Attr = S,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
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
SparkXY = -5, -30
HitSound = S1, 15
GuardSound = S1, 100
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
;→ + 強
;-------------------------------------------------------------------------
[Statedef 225]
Type    = S
MoveType= A
Physics = S
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 225
PowerAdd = 0
SprPriority = 2
FaceP2 = 1

[State 225, 補正値計算]
Type = Null
TriggerAll = Time = 0
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(0) := 0.85 ** EnemyNear(Var(57)),GetHitVar(HitCount)
IgNoreHitPause = 1

[State 225, SE : 振り音]
Type = PlaySnd
Trigger1 = AnimElem = 8
Trigger2 = AnimElem = 13
Trigger3 = AnimElem = 15
Value = 0, 2

[State 225, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 16
MoveType = I

[State 225, 前進]
Type = VelSet
Trigger1 = AnimElem = 8
X = 3

[State 225, 前進]
Type = PosAdd
TriggerAll = Time = 0
Trigger1 = PrevStateNo = [200,499]
X = 12

[State 225, ヘルパー呼出]
Type = Helper
TriggerAll = NumHelper(6103) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Pinkie Glove"
ID = 6103
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6103
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 225, ヒット定義]
Type = HitDef
TriggerAll = Var(8) < 2
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 8
Trigger2 = AnimElem = 13
Attr = S,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = MA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 25, 0 + 10 * (PalNo = [7,12])
GetPower = 20, 15
GivePower = 10, 5
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -25, -40
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
Ground.Velocity = -1.5, 0
Guard.Velocity = -3.5
Air.Velocity = -1.5, -1.5
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -1.5, -1.5
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 0
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 36
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 225, ヒット定義]
Type = HitDef
TriggerAll = Var(8) < 2
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 15
Attr = S,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = HA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 25, 0 + 10 * (PalNo = [7,12])
GetPower = 40, 30
GivePower = 20, 15
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -25, -50
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
Ground.Velocity = -1.5, -8
Guard.Velocity = -3.5
Air.Velocity = -1.5, -8
AirGuard.Velocity = -3.5, -1.5
Down.Velocity = -1.5, -8
Ground.CornerPush.VelOff = -4
Guard.CornerPush.VelOff = -4
Air.CornerPush.VelOff = -4
AirGuard.CornerPush.VelOff = -4
Down.CornerPush.VelOff = -4
SprPriority = 1
Fall = 1
Air.Fall = 1
Fall.Recover = (PalNo != [7,12])
Fall.RecoverTime = 36
Fall.Damage = 0
ID = 200
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 225, 打ち上げ攻撃当てた回数]
Type = VarAdd
Trigger1 = AnimElem = 15, >= 0
Trigger1 = MoveHit = 1
V = 8
Value = 1
Persistent = 0
IgNoreHitPause = 1

[State 225, ステート奪取]
Type = TargetState
TriggerAll = Var(8) >= 2
Trigger1 = AnimElem = 15, >= 0
Trigger1 = MoveHit = 1
Value = 50020
Persistent = 0
IgNoreHitPause = 1

[State 225, 終了]
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
Trigger1 = AnimElem = 4
Value = 0, 0
Persistent = 0
IgNoreHitPause = 1

[State 400, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 5
MoveType = I

[State 400, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 4
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
Value = 0, 21
Persistent = 0
IgNoreHitPause = 1

[State 410, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 7
MoveType = I

[State 410, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 5
Attr = C,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = LA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Medium   ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 3,Hit    ;Hit,Miss,Dodge
Damage = 30, 0 + 10 * (PalNo = [7,12])
GetPower = 30, 20
GivePower = 15, 10
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -20
HitSound = S1, 1
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
Physics = C
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
Trigger1 = AnimElem = 2
Value = 0, 2
Persistent = 0
IgNoreHitPause = 1

[State 420, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 3
MoveType = I

[State 420, 前進]
Type = VelSet
Trigger1 = AnimElem = 2
X = 3

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
Trigger1 = AnimElemNo(0) = 2
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
SparkXY = -15, -20
HitSound = S1, 15
GuardSound = S1, 100
Ground.Type = Low   ;High,Low,Trip,Non
Air.Type = Low
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
Trigger1 = AnimElem = 6
Value = 0, 22
Persistent = 0
IgNoreHitPause = 1

[State 430, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 8
MoveType = I

[State 430, 前進]
Type = VelSet
Trigger1 = AnimElem = 4
X = 3

[State 430, 前進]
Type = PosAdd
TriggerAll = Time = 0
Trigger1 = PrevStateNo = [200,499]
X = 12

[State 430, ヘルパー呼出]
Type = Helper
TriggerAll = NumHelper(6104) = 0
Trigger1 = Time = 0
HelperType = Normal
Name = "Launcher Object"
ID = 6104
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 6104
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 0
PauseMoveTime = 0
Size.XScale = 0.5
Size.YScale = 0.5

[State 430, ヒット定義]
Type = HitDef
TriggerAll = Var(8) < 2
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = [6,7]
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
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -15, -50
HitSound = S1, 5
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
Value = 11
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
Trigger1 = AnimElem = 2
Trigger2 = AnimElem = 5
Value = 0, 0

[State 600, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 6
MoveType = I

[State 600, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
Trigger1 = AnimElem = 2
Trigger2 = AnimElem = 5
Attr = A,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = HA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Light    ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 2,Hit    ;Hit,Miss,Dodge
Damage = 25, 0 + 5 * (PalNo = [7,12])
GetPower = 20, 15
GivePower = 10, 5
PauseTime = 10, 10
Guard.PauseTime = 10, 10
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -40
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
Physics = N
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
Trigger1 = AnimElem = 5
Value = 0, 20
Persistent = 0
IgNoreHitPause = 1

[State 610, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 6
MoveType = I

[State 610, 重力]
Type = Gravity
Trigger1 = StateType = A
Trigger1 = AnimElemNo(0) != [5,8]

[State 610, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = 5
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
SparkXY = -5, -40
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

[State 610, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

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
Physics = N
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
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 5
Trigger3 = AnimElem = 7
Trigger4 = AnimElem = 9
Value = 0, 2

[State 620, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = AnimElem = 10
MoveType = I

[State 620, 失速]
Type = VelMul
Trigger1 = Time = 0
Y = 0.20

[State 620, 重力]
Type = Gravity
Trigger1 = StateType = A
Trigger1 = AnimElem = 10, > 0

[State 620, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
Trigger1 = AnimElem = 4
Trigger2 = AnimElem = 5
Trigger3 = AnimElem = 7
Trigger4 = AnimElem = 9
Attr = A,NA         ;SCA,NA,NP,NT,SA,SP,ST,HA,HP,HT
HitFlag = MAF       ;HLMAFDP+-
GuardFlag = HA      ;HLMA
AffectTeam = E      ;EBF
AnimType = Hard     ;Light,Medium,Hard,Back,Up,DiagUp,Heavy
Air.AnimType = Back
Fall.AnimType = Back
Priority = 4,Hit    ;Hit,Miss,Dodge
Damage = 25, 0 + 5 * (PalNo = [7,12])
GetPower = 20, 15
GivePower = 10, 5
PauseTime = 6, 6
Guard.PauseTime = 6, 6
SparkNo = S8000
Guard.SparkNo = S8020
SparkXY = -5, -20
HitSound = S1, 15
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
Ground.Velocity = IfElse(P2Dist X > 0,-3.5,3.5), 0
Guard.Velocity = IfElse(P2Dist X > 0,-3.5,3.5)
Air.Velocity = IfElse(P2Dist X > 0,-0.5,0.5), -1
AirGuard.Velocity = IfElse(P2Dist X > 0,-0.5,0.5), -1
Down.Velocity = IfElse(P2Dist X > 0,-0.5,0.5), -1
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

[State 620, 着地へ]
Type = ChangeState
TriggerAll = StateType = A
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 52
Ctrl = 1

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

[State 625, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = MoveContact || MoveReversed
MoveType = I

[State 625, VelAdd]
Type = VelAdd
Trigger1 = Time = 0
Y = -3

[State 625, 重力]
Type = Gravity
Trigger1 = StateType = A

[State 625, ヒット定義]
Type = HitDef
TriggerAll = RoundState <= 2
TriggerAll = EnemyNear(Var(57)),StateNo != [5040,5049]
TriggerAll = EnemyNear(Var(57)),StateNo != [50302,50303]
TriggerAll = !MoveContact && !MoveReversed
Trigger1 = AnimElemNo(0) = [4,6]
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
SparkXY = -5, -20
HitSound = S1, 15
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
Air.Velocity = -0.5, 4
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
Fall.Recover = 0
Fall.Damage = 0
ID = 600
NoChainID = 9999
Kill = 1
Guard.Kill = 1

[State 625, ステート奪取]
Type = TargetState
TriggerAll = NumTarget(600)
TriggerAll = Target(600),IsHelper = 0
TriggerAll = Target(600),StateType = A
Trigger1 = MoveHit = 1
Value = 50300
ID = 600
Persistent = 10
IgNoreHitPause = 1

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
Ctrl = 0
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
Value = IfElse(!(Var(10) & 4),225,220)

;-------------------------------------------------------------------------
;投げ : 投げ成立
;-------------------------------------------------------------------------
[Statedef 810]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 810
PowerAdd = 0

[State 810, SE]
Type = PlaySnd
Trigger1 = AnimElemTime(6) = 0
Value = 2, 0

[State 810, 振り向く]
Type = Turn
Trigger1 = (Var(10) & 4)
Trigger1 = AnimElemTime(11) = 0
Persistent = 0

[State 810, 相手振り向かせる]
Type = TargetFacing
Trigger1 = (Var(10) & 4)
Trigger1 = AnimElemTime(11) = 0
Value = -1
Persistent = 0

[State 810, 余白を作る]
Type = Width
Trigger1 = Time = 0
Edge = 50,0

[State 810, 初期化]
Type = VarSet
Trigger1 = Time = 0
V = 5
Value = 0

[State 810, VelSet]
Type = VelSet
TriggerAll = Var(5) = 0
Trigger1 = AnimElemTime(11) >= 0
X = 16
Y = 0

[State 810, VelSet]
Type = VelSet
TriggerAll = Var(5) = 0
Trigger1 = FrontEdgeBodyDist <= 0
Trigger1 = AnimElemTime(11) >= 0
Trigger1 = 1 || Var(5) := 1
X = 0
Y = -16

[State 810, VelSet]
Type = VelSet
TriggerAll = Var(5) = 1
Trigger1 = ScreenPos Y <= 20
Trigger1 = AnimElemTime(11) >= 0
Trigger1 = 1 || Var(5) := 2
X = -16
Y = 0

[State 810, VelSet]
Type = VelSet
TriggerAll = Var(5) = 2
Trigger1 = BackEdgeBodyDist <= 0
Trigger1 = AnimElemTime(11) >= 0
Trigger1 = 1 || Var(5) := 3
X = 0
Y = 16

[State 810, VelSet]
Type = VelSet
TriggerAll = Var(5) = 3
Trigger1 = Pos Y >= -20
Trigger1 = AnimElemTime(11) >= 0
Trigger1 = 1 || Var(5) := 4
X = 16
Y = 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = 1
Time = 1
ID = 800
Pos = 0, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(11) < 0
Time = 1
ID = 800
Pos = 50, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(7) >= 0
Trigger1 = AnimElemTime(8) < 0
Time = 1
ID = 800
Pos = 40, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(8) >= 0
Trigger1 = AnimElemTime(9) < 0
Time = 1
ID = 800
Pos = 30, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(9) >= 0
Trigger1 = AnimElemTime(10) < 0
Time = 1
ID = 800
Pos = 25, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(10) >= 0
Trigger1 = AnimElemTime(11) < 0
Time = 1
ID = 800
Pos = 10, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
Trigger1 = AnimElemTime(11) >= 0
Time = 1
ID = 800
Pos = 0, -40

[State 810, 掴んだ相手の位置]
Type = TargetBind
TriggerAll = Var(5) = 1
Trigger1 = AnimElemTime(11) >= 0
Time = 1
ID = 800
Pos = -40, 0

[State 810, 掴んだ相手の位置]
Type = TargetBind
TriggerAll = Var(5) = 2
Trigger1 = AnimElemTime(11) >= 0
Time = 1
ID = 800
Pos = 0, 40

[State 810, 掴んだ相手の位置]
Type = TargetBind
TriggerAll = Var(5) = 3
Trigger1 = AnimElemTime(11) >= 0
Time = 1
ID = 800
Pos = 40, 0

[State 810, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 810, AngleDraw]
Type = AngleDraw
Trigger1 = Var(5) = 1
Value = 90

[State 810, AngleDraw]
Type = AngleDraw
Trigger1 = Var(5) = 2
Value = 180

[State 810, AngleDraw]
Type = AngleDraw
Trigger1 = Var(5) = 3
Value = 270

[State 810, PosSet]
Type = PosSet
Trigger1 = Var(5) = 1
X = Pos X + FrontEdgeDist * Facing + 20 * Facing

[State 810, PosAdd]
Type = PosAdd
Trigger1 = Var(5) = 1
Y = -20
Persistent = 0

[State 810, PosSet]
Type = PosSet
Trigger1 = Var(5) = 2
Y = Pos Y - ScreenPos Y

[State 810, PosAdd]
Type = PosAdd
Trigger1 = Var(5) = 2
X = -20
Persistent = 0

[State 810, PosSet]
Type = PosSet
Trigger1 = Var(5) = 3
X = Pos X - BackEdgeDist * Facing - 20 * Facing

[State 810, PosAdd]
Type = PosAdd
Trigger1 = Var(5) = 3
Y = 20
Persistent = 0

[State 810, PosSet]
Type = PosSet
Trigger1 = Var(5) = 4
Y = 0

[State 810, PosAdd]
Type = PosAdd
Trigger1 = Var(5) = 4
X = 20
Persistent = 0

[State 811, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Var(5) = 1
Value = 824
ID = 800

[State 811, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Var(5) = 2
Value = 825
ID = 800

[State 811, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Var(5) = 3
Value = 826
ID = 800

[State 811, 掴んだ相手のステート変更]
Type = TargetState
Trigger1 = Var(5) = 4
Value = 823
ID = 800

[State 810, SE]
Type = PlaySnd
Trigger1 = AnimElemTime(11) >= 0
Trigger1 = AnimElemTime(11) % 3 = 0
Value = 100, 0

[State 810, ChangeState]
Type = ChangeState
TriggerAll = Var(5) = 4
Trigger1 = Facing = 1
Trigger1 = Pos X >= 0
Trigger2 = Facing = -1
Trigger2 = Pos X <= 0
Value = 811

;-------------------------------------------------------------------------
;投げ : 放り
;-------------------------------------------------------------------------
[Statedef 811]
Type    = S
MoveType= A
Physics = N
Juggle  = 0
VelSet = 0,0
Ctrl = 0
Anim = 811
PowerAdd = 0

[State 811, SE]
Type = PlaySnd
Trigger1 = Time = 0
Value = 0, 5

[State 811, ヒット数を増やす]
Type = HitAdd
Trigger1 = Time = 0
Value = 1

[State 811, ゲージ増加]
Type = PowerAdd
Trigger1 = Time = 0
Value = 40

[State 811, 掴んだ相手のゲージ増加]
Type = TargetPowerAdd
Trigger1 = Time = 0
Value = 20
ID = 800

[State 811, 掴んだ相手のライフ減少]
Type = TargetLifeAdd
Trigger1 = Time = 0
Value = -Floor(80 * Const(Data.Attack) / 100 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0))
ID = 800

[State 811, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo != [7,12]
Trigger1 = Time = 0
Value = 821
ID = 800

[State 811, 掴んだ相手のステート変更]
Type = TargetState
TriggerAll = PalNo = [7,12]
Trigger1 = Time = 0
Value = 822
ID = 800

[State 811, 攻撃判定の無力化]
Type = StateTypeSet
Trigger1 = Time = 1
MoveType = I

[State 811, 着地]
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

[State 820, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 820, ChangeState]
Type = ChangeState
Trigger1 = AnimTime = 0
Value = 823

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
Anim = 5050
PowerAdd = 0

[State 821, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 821, 速度]
Type = VelSet
Trigger1 = Time = 0
X = -1
Y = -6

[State 821, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

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
Anim = 5050
PowerAdd = 0

[State 822, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 822, 速度]
Type = VelSet
Trigger1 = Time = 0
X = -1
Y = -6

[State 822, 重力]
Type = VelAdd
Trigger1 = 1
Y = 0.35

[State 822, 相手のステートを返還]
Type = SelfState
Trigger1 = Vel Y > 0
Trigger1 = Pos Y >= 0
Value = 5100

;-------------------------------------------------------------------------
;ENEMY : 掴まれb
;-------------------------------------------------------------------------
[Statedef 823]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 823, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 823, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 823, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 823

[State 823, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 823, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 掴まれc
;-------------------------------------------------------------------------
[Statedef 824]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 824, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 824, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 824, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 824

[State 824, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 824, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 掴まれd
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
Value = 823

[State 825, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 825, AngleDraw]
Type = AngleDraw
Trigger1 = 1
Value = 180

[State 825, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050

;-------------------------------------------------------------------------
;ENEMY : 掴まれe
;-------------------------------------------------------------------------
[Statedef 826]
Type    = A
MoveType= H
Physics = N
VelSet = 0,0
Ctrl = 0
PowerAdd = 0

[State 826, ヘルパーを掴んでしまった場合の対策]
Type = DestroySelf
Trigger1 = IsHelper
IgNoreHitPause = 1

[State 826, 無敵]
Type = NotHitBy
Trigger1 = 1
Value = SCA,AA,AP,AT
Time = 1
Persistent = 1
IgNoreHitPause = 1

[State 826, 喰らい中のアニメ指定]
Type = ChangeAnim2
Trigger1 = Time = 0
Value = 824

[State 826, 自分をカメラから外す]
Type = ScreenBound
Trigger1 = 1
Value = 0
MoveCamera = 0,0

[State 826, AngleDraw]
Type = AngleDraw
Trigger1 = 1
Value = 180

[State 826, ステート返還]
Type = SelfState
Trigger1 = !GetHitVar(IsBound)
Value = 5050
