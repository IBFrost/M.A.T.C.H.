[StateDef -3]

[State -3, デバッグ]
Type = DisplayToClipBoard
Trigger1 = 1
Text = "P2BodyDist X=%d,P2BodyDist Y=%d,Pos Y=%d,P2Vel X=%d,P2Vel Y=%d \n"
Params = Floor(P2BodyDist X),Ceil(P2BodyDist Y),Floor(Pos Y),Ceil(EnemyNear(Var(57)),Vel X),Ceil(EnemyNear(Var(57)),Vel Y)
IgNoreHitPause = 1

[State -3, デバッグ]
Type = AppendToClipBoard
Trigger1 = 1
Text = "Vel Y=%d,%d,%f,%f,%f"
Params = Ceil(Vel Y),Var(59),FVar(36),FVar(37),FVar(38)
IgNoreHitPause = 1

[State -3, System_Helper]
Type = Helper
TriggerAll = IsHelper = 0
TriggerAll = NumHelper(60660000 + ID) = 0
Trigger1 = Alive
Name = "System"
ID = 60660000 + ID
Pos = 0, 9999
StateNo = 60660000
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State -3, AI_Activate]
Type = Helper
TriggerAll = IsHelper = 0
TriggerAll = NumHelper(94444 + ID) = 0
TriggerAll = RoundState <= 2
TriggerAll = Alive
Trigger1 = Var(59) = 0
HelperType = Normal
Name = "AI"
StateNo = 99999
ID = 94444 + ID
Pos = 0,9999
KeyCtrl = 1
PauseMoveTime = 2147483647
SuperMoveTime = 2147483647

[State -3, Option_Helper]
Type = Helper
TriggerAll = IsHelper = 0
TriggerAll = NumHelper(99999 + ID) = 0
Trigger1 = !(Var(10) & 8)
Trigger1 = 1 || Var(10) := (Var(10) | 8)
Name = "Option"
ID = 99999 + ID
Pos = 9999, 9999
StateNo = 99999
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State -3, AI用画面端検知ヘルパー]
Type = Helper
TriggerAll = IsHelper = 0
TriggerAll = NumHelper(60000) = 0
Trigger1 = Alive
Name = "StageEdge_Search"
ID = 60000
Pos = 0,9999
PosType = P1
Facing = 1
StateNo = 60000
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State -3, AI用飛び道具探知ヘルパー]
Type = Helper
TriggerAll = IsHelper = 0
TriggerAll = NumHelper(66666) = 0
Trigger1 = Alive
Name = "Proj_Search"
StateNo = 66666
ID = 66666
Pos = 9999,9999
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647

[State -3, AI_ON]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = !IsHelper
TriggerAll = RoundState = [1,2]
Trigger1 = Command = "CPU1" || Command = "CPU2" || Command = "CPU3"
Trigger2 = Command = "CPU4" || Command = "CPU5" || Command = "CPU6"
Trigger3 = Command = "CPU7" || Command = "CPU8" || Command = "CPU9"
Trigger4 = Command = "CPU10" || Command = "CPU11" || Command = "CPU12"
Trigger5 = Command = "CPU13" || Command = "CPU14" || Command = "CPU15"
Trigger6 = Command = "CPU16" || Command = "CPU17" || Command = "CPU18"
Trigger7 = Command = "CPU19" || Command = "CPU20" || Command = "CPU21"
Trigger8 = Command = "CPU22" || Command = "CPU23" || Command = "CPU24"
Trigger9 = Command = "CPU25" || Command = "CPU26" || Command = "CPU27"
Trigger10 = Command = "CPU28" || Command = "CPU29" || Command = "CPU30"
V = 59
Value = 1
Persistent = 1
IgNoreHitPause = 1

[State -3, AI_ON]
Type = VarSet
TriggerAll = Var(59) = 0
TriggerAll = !IsHelper
TriggerAll = RoundState = [1,2]
Trigger1 = Command = "a" ^^ Command = "a2"
Trigger2 = Command = "b" ^^ Command = "b2"
Trigger3 = Command = "c" ^^ Command = "c2"
Trigger4 = Command = "x" ^^ Command = "x2"
Trigger5 = Command = "y" ^^ Command = "y2"
Trigger6 = Command = "z" ^^ Command = "z2"
Trigger7 = Command = "start" ^^ Command = "start2"
Trigger8 = Command = "fwd" ^^ Command = "fwd2"
Trigger8 = Command = "holdfwd" ^^ Command = "holdfwd2"
Trigger9 = Command = "back" ^^ Command = "back2"
Trigger9 = Command = "holdback" ^^ Command = "holdback2"
Trigger10 = Command = "up" ^^ Command = "up2"
Trigger10 = Command = "holdup" ^^ Command = "holdup2"
Trigger11 = Command = "down" ^^ Command = "down2"
Trigger11 = Command = "holddown" ^^ Command = "holddown2"
Trigger12 = IsHomeTeam
Trigger12 = TeamSide = 2 || MatchNo > 1
V = 59
Value = 1
Persistent = 1
IgNoreHitPause = 1

[State -3, コマンド暴発防止]
Type = AssertSpecial
Trigger1 = Var(59) > 0
Flag = NoStandGuard
Flag2 = NoCrouchGuard
Flag3 = NoAirGuard
IgNoreHitPause = 1

[State -3, コマンド暴発防止]
Type = AssertSpecial
Trigger1 = Var(59) > 0
Flag = NoWalk
IgNoreHitPause = 1

[State -3, 固定乱数]
Type = VarRandom
TriggerAll = Var(59) > 0
Trigger1 = StateNo < 200
Trigger1 = Time % 10 = Time > 0
Trigger2 = StateNo >= 200
Trigger2 = Time = 1
V = 50
Range = 0,999
IgNoreHitPause = 1

[State -3, リダイレクト相手取得]
Type = VarSet
TriggerAll = !IsHelper
TriggerAll = RoundState = 2
Trigger1 = NumEnemy = 1
Trigger2 = NumEnemy >= 2
V = 57
Value = 0
IgNoreHitPause = 1

[State -3, リダイレクト相手取得(タッグ戦)]
Type = VarSet
TriggerAll = !IsHelper
TriggerAll = RoundState = 2
TriggerAll = NumEnemy >= 2
TriggerAll = EnemyNear(1),Alive
TriggerAll = EnemyNear(1),Life
TriggerAll = EnemyNear(0),Alive = 0 || EnemyNear(0),Life = 0
Trigger1 = NumTarget = 0
Trigger2 = NumTarget
Trigger2 = Target,ID != EnemyNear(0),ID
V = 57
Value = 1
IgNoreHitPause = 1

[State -3, 前方端]
Type = VarSet
Trigger1 = NumHelper(60000)
V = 41
Value = Helper(60000),Var(54)
IgNoreHitPause = 1

[State -3, 後方端]
Type = VarSet
Trigger1 = NumHelper(60000)
V = 42
Value = Helper(60000),Var(55)
IgNoreHitPause = 1

[State -3, 相手画面端]
Type = VarSet
Trigger1 = NumHelper(60000)
V = 43
Value = Helper(60000),Var(56)
IgNoreHitPause = 1

[State -3, 飛び道具探知変数代入]
Type = VarSet
TriggerAll = Var(59) > 0
Trigger1 = NumHelper(66666)
V = 48
Value = Helper(66666),Var(58)
IgNoreHitPause = 1

[State -3, チーム対戦後は学習初期化]
Type = VarRangeSet
TriggerAll = TeamMode = Turns
Trigger1 = StateNo = 5900
Value = 0
First = 51
Last = 56

[State -3, 起き攻め行動乱数スイッチON]
Type = VarSet
TriggerAll = RoundState = 2
TriggerAll = EnemyNear(Var(57)),Alive
TriggerAll = EnemyNear(Var(57)),Life
TriggerAll = EnemyNear(Var(57)),StateType = L
Trigger1 = Var(47) = -2
V = 47
Value = -1

[State -3, 起き攻め行動乱数決定]
Type = VarRandom
TriggerAll = RoundState = 2
Trigger1 = Var(47) = -1
V = 47
Range = 0,999

[State -3, 起き攻め行動乱数スイッチOFF]
Type = VarSet
TriggerAll = RoundState = 2
Trigger1 = EnemyNear(Var(57)),StateType != L
V = 47
Value = -2

[State -3, 連ガ認識OFF]
Type = VarSet
Trigger1 = StateNo != [120,159]
V = 38
Value = 0

[State -3, 連ガカウント]
Type = VarAdd
Trigger1 = StateNo = 150 || StateNo = 152 || StateNo = 154
Trigger1 = Time = 1
V = 38
Value = 1

[State -3, 壁バウンドから相手復帰までOFF]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
V = 40
Value = (Var(40) | 4) - 4

[State -3, 壁バウンドから相手復帰まで]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),StateNo = 50053
V = 40
Value = (Var(40) | 4)

[State -3, 当たらないOFF]
Type = VarSet
TriggerAll = TeamMode = Turns
Trigger1 = StateNo = 5900
V = 40
Value = (Var(40) | 8 | 16) - (8 | 16)

[State -3, 立弱当たらない記憶]
Type = VarSet
TriggerAll = (Var(40) & 4)
TriggerAll = !MoveContact && MoveType = I
Trigger1 = StateNo = 200
V = 40
Value = (Var(40) | 8)

[State -3, Null当たらない記憶]
Type = Null;VarSet
TriggerAll = !MoveContact && MoveType = I
TriggerAll = StateNo = 1000 || StateNo = 1010 || StateNo = 1020 || StateNo = 1050
Trigger1 = EnemyNear(Var(57)),MoveType = H
Trigger1 = EnemyNear(Var(57)),StateNo != [120,159]
Trigger2 = EnemyNear(Var(57)),StateNo >= 200
V = 40
Value = (Var(40) | 16)

[State -3, 特殊カラー常時ゲージ保有フラグOFF]
Type = VarSet
Trigger1 = 1
V = 40
Value = (Var(40) | 128) - 128

[State -3, 特殊カラー常時ゲージ保有フラグON]
Type = VarSet
Trigger1 = PalNo = [7,8]
Trigger1 = Var(34) > 0
Trigger1 = Var(34) / 1000 % 10 > 0
Trigger2 = PalNo = [9,10]
Trigger2 = Var(34) > 0
Trigger2 = Var(34) / 100 % 10 > 0
Trigger3 = PalNo = 11
Trigger3 = Var(34) > 0
Trigger3 = Var(34) / 10 % 10 > 0
Trigger4 = PalNo = 12
Trigger4 = Var(34) > 0
Trigger4 = Var(34) % 10 > 0
V = 40
Value = (Var(40) | 128)

[State -3, めくり狙いOFF]
Type = VarSet
Trigger1 = MoveType = H
Trigger2 = StateType = L
Trigger3 = StateNo = 52
V = 40
Value = (Var(40) | 1024) - 1024

[State -3, コンボOFF]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Trigger4 = MoveType = H
Trigger5 = StateType = L
Trigger6 = StateNo = 52
V = 40
Value = (Var(40) | 2048) - 2048

[State -3, コンボON]
Type = VarSet
Trigger1 = StateNo = 430
Trigger1 = MoveHit
V = 40
Value = (Var(40) | 2048)

[State -3,処理順補正]
Type = VarSet
TriggerAll = NumEnemy
;自分非攻撃、相手攻撃
Trigger1 = MoveType != A
Trigger1 = EnemyNear(Var(57)),MoveType = A
;自分も相手も攻撃中、または自分も相手も非攻撃中で、相手の方が処理順が先の場合は以下の通り
;　自分teamside=1の時、自分が3Pかつ相手が2Pの場合
Trigger2 = TeamSide = 1
Trigger2 = !((MoveType = A) ^^ (EnemyNear(Var(57)),MoveType = A))
Trigger2 = NumPartner > 0
Trigger2 = Partner,ID < ID
Trigger2 = EnemyNear(Var(57)),ID - ID <= 1
;　自分teamside=2の時、自分が2Pかつ相手が1Pの場合
Trigger3 = TeamSide = 2
Trigger3 = !((MoveType = A) ^^ (EnemyNear(Var(57)),MoveType = A))
Trigger3 = ID - EnemyNear(Var(57)),ID >= 1 + EnemyNear(Var(57)),NumPartner
;　自分teamside=2の時、自分が4Pの場合
Trigger4 = TeamSide = 2
Trigger4 = !((MoveType = A) ^^ (EnemyNear(Var(57)),MoveType = A))
Trigger4 = NumPartner > 0
Trigger4 = Partner,ID < ID
Trigger5 = Var(40) := ((Var(40) | 2) - 2)
V = 40
Value = (Var(40) | 2)

[State -3, 重力加速度]
Type = Null
TriggerAll = NumEnemy
Trigger1 = EnemyNear(Var(57)),MoveType = H && EnemyNear(Var(57)),StateNo != [120,159]
Trigger1 = 1 || FVar(20) := EnemyNear(Var(57)),GetHitVar(YAccel)
Trigger2 = 1 || FVar(20) := EnemyNear(Var(57)),Const(MoveMent.YAccel)

[State -3,相手進行方向]
Type = Null
TriggerAll = NumEnemy
Trigger1 = 1 || FVar(21) := IfElse(Pos X <= EnemyNear(Var(57)),Pos X ^^ EnemyNear(Var(57)),Facing = 1,1,-1)

[State -3, 重力計算の下準備]
Type = Null
TriggerAll = NumEnemy
Trigger1 = 1 || Var(45) := (EnemyNear(Var(57)),GetHitVar(HitShakeTime) + EnemyNear(Var(57)),HitPauseTime)

;------------------------------------------------------------------------
;Debug
;------------------------------------------------------------------------
[State -3, デバッグモード]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = 0
FV = 39
Value = 1

[State -3, デバッグモード]
Type = CtrlSet
TriggerAll = Var(59) <= 0
TriggerAll = FVar(39) > 0
Trigger1 = StateNo = 11
Value = 1

[State -3, デバッグモード]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = MoveHit = 1
FV = 38
Value = Vel Y

[State -3, デバッグモード]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = MoveHit = 1
FV = 37
Value = Floor(Pos Y)

[State -3, デバッグモード]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = MoveHit = 1
FV = 36
Value = Floor(P2BodyDist Y)

[State -3, デバッグモード]
Type = Null;VarSet
TriggerAll = Var(59) <= 0
Trigger1 = EnemyNear(Var(57)),StateType = L
Trigger1 = EnemyNear(Var(57)),MoveType = I
V = 59
Value = 1
