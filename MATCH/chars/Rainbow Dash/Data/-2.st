[StateDef -2]


[State -2, 空中ジャンプ回数Reset]
Type = VarSet
Trigger1 = StateType != A
V = 12
Value = 0

[State -2, 1敗フラグON]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = !(TeamMode = Turns)
Trigger1 = RoundState > 2
Trigger1 = Lose
V = 40
Value = (Var(40) | 256)

[State -2, 1勝フラグON]
Type = VarSet
TriggerAll = Var(59) > 0
TriggerAll = !(TeamMode = Turns)
Trigger1 = RoundState > 2
Trigger1 = Win
V = 40
Value = (Var(40) | 512)

[State -2, レバーニュートラル検知]
Type = VarSet
TriggerAll = Var(59) <= 0
Trigger1 = Command != "holdfwd"
Trigger1 = Command != "holdback"
Trigger1 = Command != "holdup"
Trigger1 = Command != "holddown"
V = 10
Value = (Var(10) | 1) - 1
IgNoreHitPause = 1

[State -2, レバー入力検知]
Type = VarSet
TriggerAll = Var(59) <= 0
TriggerAll = StateNo = 40 || StateNo = 45
Trigger1 = Command = "holdfwd"
Trigger2 = Command = "holdback"
Trigger3 = Command = "holdup"
Trigger4 = Command = "holddown"
V = 10
Value = (Var(10) | 1)
IgNoreHitPause = 1

[State -2, KO判定OFF]
Type = VarSet
Trigger1 = Alive && Life
V = 10
Value = (Var(10) | 2) - 2

[State -2, 壁バウンド判定OFF]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
V = 10
Value = (Var(10) | 16) - 16
IgNoreHitPause = 1

[State -2, 壁バウンド判定ON]
Type = VarSet
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = EnemyNear(Var(57)),StateNo = 50053
V = 10
Value = (Var(10) | 16)
IgNoreHitPause = 1

[State -2, 地面バウンド判定OFF]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
V = 10
Value = (Var(10) | 32) - 32
IgNoreHitPause = 1

[State -2, 地面バウンド判定ON]
Type = VarSet
TriggerAll = EnemyNear(Var(57)),MoveType = H
Trigger1 = EnemyNear(Var(57)),StateNo = 50103
V = 10
Value = (Var(10) | 32)
IgNoreHitPause = 1

[State -2, ライトニングクラウドEX判定OFF]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
V = 10
Value = (Var(10) | 64) - 64
IgNoreHitPause = 1

[State -2, ライトニングクラウドEX判定ON]
Type = VarSet
TriggerAll = EnemyNear(Var(57)),MoveType = H
TriggerAll = EnemyNear(Var(57)),StateNo != [120,159]
TriggerAll = NumHelper(1355)
Trigger1 = Helper(1355),AnimElem = 60
Trigger1 = Helper(1355),Var(0) >= 2

V = 10
Value = (Var(10) | 64)
IgNoreHitPause = 1

[State -2, 踏まれたり覗かれたりの相手勝利ポーズ対応OFF]
Type = VarSet
Trigger1 = 1
V = 10
Value = (Var(10) | 262144) - 262144

[State -2, 踏まれたり覗かれたりの相手勝利ポーズ対応ON]
Type = VarSet
Trigger1 = P2Name = "JAGI"
Trigger2 = P2Name = "THOUTHER"
Trigger3 = P2Name = "Q" || P2Name = "Q-drowin" || P2Name = "Q_mx"
Trigger4 = EnemyNear,Name = "Angelia Avallone" && EnemyNear,AuthorName = "or2=3"
Trigger4 = EnemyNear,StateNo = 183
Trigger5 = EnemyNear,Name = "Angelia_Avallone" && EnemyNear,AuthorName = "M3"
Trigger5 = EnemyNear,StateNo = 184
Trigger6 = P2Name = "Nyarlathotep"
Trigger7 = EnemyNear,Name = "jam" && EnemyNear,AuthorName = "muteki"
Trigger7 = EnemyNear,StateNo = [182,183]
Trigger8 = EnemyNear,Name = "Jin Saotome" && EnemyNear,AuthorName = "hsiehtm"
Trigger8 = EnemyNear,StateNo = [182,183]
Trigger9 = EnemyNear,Name = "Jin" && EnemyNear,AuthorName = "Nobuyuki"
Trigger9 = EnemyNear,StateNo = [182,183]
Trigger10= EnemyNear,Name = "Utsuho_K" && EnemyNear,AuthorName = "Kohaku"
Trigger10= EnemyNear,StateNo = [182,183]
Trigger11= P2Name = "UMVC_Aya"
V = 10
Value = (Var(10) | 262144)

[State -2, 打ち上げ攻撃当てた回数Reset]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger1 = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = EnemyNear(Var(57)),Ctrl || EnemyNear(Var(57)),StateNo != 52 || EnemyNear(Var(57)),PrevStateNo != [5040,5049]
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
V = 8
Value = 0
IgNoreHitPause = 1

[State -2, コンボ補正値初期化]
Type = VarSet
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger1 = EnemyNear(Var(57)),StateNo != [5040,5049]
Trigger1 = EnemyNear(Var(57)),Ctrl || EnemyNear(Var(57)),StateNo != 52 || EnemyNear(Var(57)),PrevStateNo != [5040,5049]
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Trigger4 = PalNo = [7,8]
Trigger4 = Var(32) > 0
Trigger4 = Var(32) / 1000 % 10 >= 4
Trigger5 = PalNo = [9,10]
Trigger5 = Var(32) > 0
Trigger5 = Var(32) / 100 % 10 >= 4
Trigger6 = PalNo = 11
Trigger6 = Var(32) > 0
Trigger6 = Var(32) / 10 % 10 >= 4
Trigger7 = PalNo = 12
Trigger7 = Var(32) % 10 >= 4
FV = 0
Value = 1.0
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State -2, 最低ダメージ保証]
Type = VarSet
Trigger1 = FVar(0) <= 0.10
FV = 0
Value = 0.10
IgNoreHitPause = 1

[State -2, 最低ダメージ保証]
Type = VarSet
TriggerAll = FVar(0) <= 0.35
Trigger1 = StateNo = [3000,3999]
FV = 0
Value = 0.35
IgNoreHitPause = 1

[State -2, 最低ダメージ保証]
Type = VarSet
TriggerAll = FVar(0) <= 0.20
Trigger1 = PalNo = [7,8]
Trigger1 = Var(32) > 0
Trigger1 = Var(32) / 1000 % 10 = 1
Trigger2 = PalNo = [9,10]
Trigger2 = Var(32) > 0
Trigger2 = Var(32) / 100 % 10 = 1
Trigger3 = PalNo = 11
Trigger3 = Var(32) > 0
Trigger3 = Var(32) / 10 % 10 = 1
Trigger4 = PalNo = 12
Trigger4 = Var(32) % 10 = 1
FV = 0
Value = 0.20
IgNoreHitPause = 1

[State -2, 最低ダメージ保証]
Type = VarSet
TriggerAll = FVar(0) <= 0.35
Trigger1 = PalNo = [7,8]
Trigger1 = Var(32) > 0
Trigger1 = Var(32) / 1000 % 10 = 2
Trigger2 = PalNo = [9,10]
Trigger2 = Var(32) > 0
Trigger2 = Var(32) / 100 % 10 = 2
Trigger3 = PalNo = 11
Trigger3 = Var(32) > 0
Trigger3 = Var(32) / 10 % 10 = 2
Trigger4 = PalNo = 12
Trigger4 = Var(32) % 10 = 2
FV = 0
Value = 0.35
IgNoreHitPause = 1

[State -2, 最低ダメージ保証]
Type = VarSet
TriggerAll = FVar(0) <= 0.50
Trigger1 = PalNo = [7,8]
Trigger1 = Var(32) > 0
Trigger1 = Var(32) / 1000 % 10 = 3
Trigger2 = PalNo = [9,10]
Trigger2 = Var(32) > 0
Trigger2 = Var(32) / 100 % 10 = 3
Trigger3 = PalNo = 11
Trigger3 = Var(32) > 0
Trigger3 = Var(32) / 10 % 10 = 3
Trigger4 = PalNo = 12
Trigger4 = Var(32) % 10 = 3
FV = 0
Value = 0.50
IgNoreHitPause = 1

[State -2, 攻撃力補正]
Type = AttackMulSet
Trigger1 = 1
Value = 1.0 * IfElse((PalNo = [11,12]),1.5,1.0) * FVar(0)
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State -2, ターゲット落下速度補正]
Type = TargetVelAdd
TriggerAll = NumTarget
Trigger1 = Target,StateType = A
Trigger1 = Target,HitShakeOver
Trigger1 = Target,Pos Y < 0
Trigger1 = Target,StateNo = [120,159]
Y = .35
IgNoreHitPause = 1

[State -2, 暗転感知]
Type = VarAdd
TriggerAll = Var(59) > 0
TriggerAll = !IsHelper
Trigger1 = EnemyNear(Var(57)),StateType != L
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger1 = EnemyNear(Var(57)),MoveType = A || EnemyNear(Var(57)),StateNo >= 200
Trigger1 = EnemyNear(Var(57)),Time
Trigger2 = Var(49) := 0
V = 49
Value = 1
IgNoreHitPause = 1

;-------------------------------------------------------------------------
[State -2, ゲージ増加(7~8P)]
Type = PowerAdd
TriggerAll = PalNo = [7,8]
TriggerAll = RoundState = 2
Trigger1 = Var(30) > 0
Trigger1 = Var(30) / 1000 % 10 > 0
Value = Var(30) / 1000 % 10
IgNoreHitPause = 1

[State -2, ゲージ増加(9~10P)]
Type = PowerAdd
TriggerAll = PalNo = [9,10]
TriggerAll = RoundState = 2
Trigger1 = Var(30) > 0
Trigger1 = Var(30) / 100 % 10 > 0
Value = Var(30) / 100 % 10
IgNoreHitPause = 1

[State -2, ゲージ増加(11P)]
Type = PowerAdd
TriggerAll = PalNo = 11
TriggerAll = RoundState = 2
Trigger1 = Var(30) > 0
Trigger1 = Var(30) / 10 % 10 > 0
Value = Var(30) / 10 % 10
IgNoreHitPause = 1

[State -2, ゲージ増加(12P)]
Type = PowerAdd
TriggerAll = PalNo = 12
TriggerAll = RoundState = 2
Trigger1 = Var(30) > 0
Trigger1 = Var(30) % 10 > 0
Value = Var(30) % 10
IgNoreHitPause = 1

[State -2, ゲージMAX(7~8P)]
Type = PowerSet
TriggerAll = PalNo = [7,8]
Trigger1 = Var(30) > 0
Trigger1 = Var(30) / 1000 % 10 = 9
Value = PowerMax
IgNoreHitPause = 1

[State -2, ゲージMAX(9~10P)]
Type = PowerSet
TriggerAll = PalNo = [9,10]
Trigger1 = Var(30) > 0
Trigger1 = Var(30) / 100 % 10 = 9
Value = PowerMax
IgNoreHitPause = 1

[State -2, ゲージMAX(11P)]
Type = PowerSet
TriggerAll = PalNo = 11
Trigger1 = Var(30) > 0
Trigger1 = Var(30) / 10 % 10 = 9
Value = PowerMax
IgNoreHitPause = 1

[State -2, ゲージMAX(12P)]
Type = PowerSet
TriggerAll = PalNo = 12
Trigger1 = Var(30) > 0
Trigger1 = Var(30) % 10 = 9
Value = PowerMax
IgNoreHitPause = 1

;-------------------------------------------------------------------------
[State -2, 開幕ゲージ(7~8P)]
Type = PowerAdd
TriggerAll = PalNo = [7,8]
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) / 1000 % 10 > 0
Value = Var(31) / 1000 % 10 * 1000

[State -2, 開幕ゲージ(9~10P)]
Type = PowerAdd
TriggerAll = PalNo = [9,10]
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) / 100 % 10 > 0
Value = Var(31) / 100 % 10 * 1000

[State -2, 開幕ゲージ(11P)]
Type = PowerAdd
TriggerAll = PalNo = 11
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) / 10 % 10 > 0
Value = Var(31) / 10 % 10 * 1000

[State -2, 開幕ゲージ(12P)]
Type = PowerAdd
TriggerAll = PalNo = 12
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) % 10 > 0
Value = Var(31) % 10 * 1000

[State -2, 開幕ゲージMAX(7~8P)]
Type = PowerSet
TriggerAll = PalNo = [7,8]
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) / 1000 % 10 = 9
Value = PowerMax

[State -2, 開幕ゲージMAX(9~10P)]
Type = PowerSet
TriggerAll = PalNo = [9,10]
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) / 100 % 10 = 9
Value = PowerMax

[State -2, 開幕ゲージMAX(11P)]
Type = PowerSet
TriggerAll = PalNo = 11
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) / 10 % 10 = 9
Value = PowerMax

[State -2, 開幕ゲージMAX(12P)]
Type = PowerSet
TriggerAll = PalNo = 12
TriggerAll = RoundsExisted = 0
TriggerAll = Power = 0
TriggerAll = StateNo = [191,194]
TriggerAll = Time = 1
Trigger1 = Var(31) > 0
Trigger1 = Var(31) % 10 = 9
Value = PowerMax

;-------------------------------------------------------------------------
[State -2, コンボ中以外ゲージ保有(7~8P)]
Type = PowerSet
TriggerAll = PalNo = [7,8]
TriggerAll = Var(34) > 0
TriggerAll = Var(34) / 1000 % 10 > 0
TriggerAll = Power <= Var(34) / 1000 % 10 * 1000
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = Var(34) / 1000 % 10 * 1000
IgNoreHitPause = 1

[State -2, コンボ中以外ゲージ保有(9~10P)]
Type = PowerSet
TriggerAll = PalNo = [9,10]
TriggerAll = Var(34) > 0
TriggerAll = Var(34) / 100 % 10 > 0
TriggerAll = Power <= Var(34) / 100 % 10 * 1000
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = Var(34) / 100 % 10 * 1000
IgNoreHitPause = 1

[State -2, コンボ中以外ゲージ保有(11P)]
Type = PowerSet
TriggerAll = PalNo = 11
TriggerAll = Var(34) > 0
TriggerAll = Var(34) / 10 % 10 > 0
TriggerAll = Power <= Var(34) / 10 % 10 * 1000
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = Var(34) / 10 % 10 * 1000
IgNoreHitPause = 1

[State -2, コンボ中以外ゲージ保有(12P)]
Type = PowerSet
TriggerAll = PalNo = 12
TriggerAll = Var(34) > 0
TriggerAll = Var(34) % 10 > 0
TriggerAll = Power <= Var(34) % 10 * 1000
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = Var(34) % 10 * 1000
IgNoreHitPause = 1

[State -2, コンボ中以外ゲージMAX(7~8P)]
Type = PowerSet
TriggerAll = PalNo = [7,8]
TriggerAll = Var(34) > 0
TriggerAll = Var(34) / 1000 % 10 = 9
TriggerAll = Power <= PowerMax
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = PowerMax
IgNoreHitPause = 1

[State -2, コンボ中以外ゲージMAX(9~10P)]
Type = PowerSet
TriggerAll = PalNo = [9,10]
TriggerAll = Var(34) > 0
TriggerAll = Var(34) / 100 % 10 = 9
TriggerAll = Power <= PowerMax
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = PowerMax
IgNoreHitPause = 1

[State -2, コンボ中以外ゲージMAX(11P)]
Type = PowerSet
TriggerAll = PalNo = 11
TriggerAll = Var(34) > 0
TriggerAll = Var(34) / 10 % 10 = 9
TriggerAll = Power <= PowerMax
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = PowerMax
IgNoreHitPause = 1

[State -2, コンボ中以外ゲージMAX(12P)]
Type = PowerSet
TriggerAll = PalNo = 12
TriggerAll = Var(34) > 0
TriggerAll = Var(34) % 10 = 9
TriggerAll = Power <= PowerMax
Trigger1 = EnemyNear(Var(57)),MoveType != H
Trigger2 = EnemyNear(Var(57)),StateNo = [120,159]
Trigger3 = MoveGuarded
Value = PowerMax
IgNoreHitPause = 1

;-------------------------------------------------------------------------
[State -2, 強化カラー補正]
Type = VarSet
Trigger1 = PalNo = [11,12]
Trigger2 = 0 && FVar(5) := 1.0
FV = 5
Value = 100 * 100 / 150 * 0.01
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

[State -2, 一撃目補正]
Type = LifeAdd
TriggerAll = Alive && Life
TriggerAll = StateNo != [120,159]
TriggerAll = HitShakeOver = 0
TriggerAll = Var(15) - Life > 1
Trigger1 = PalNo = [11,12]
Value = Floor((Var(15) - Life) - Floor((Var(15) - Life) * (1.0 * FVar(5))))
Absolute = 1
IgNoreHitPause = 1

[State -2, 喰らい直前のライフ値記憶]
Type = VarSet
Trigger1 = 1
V = 15
Value = Life
IgNoreHitPause = 1

[State -2, 防御力補正]
Type = DefenceMulSet
TriggerAll = HitShakeOver
Trigger1 = PalNo = [11,12]
Value = 1.0 * FVar(5)

[State -2, 強化カラーオーラ]
Type = Helper
TriggerAll = PalNo = [7,12]
TriggerAll = NumHelper(10005) = 0
Trigger1 = MoveType != H
Trigger2 = StateNo = [5000,5299]
Trigger3 = StateNo = [120,159]
HelperType = Normal
Name = "P7 - P12 Effect"
ID = 10005
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

[State -2, 強化カラー光粒子]
Type = Explod
TriggerAll = PalNo = [9,12]
TriggerAll = RoundState > 0
TriggerAll = StateNo = 0 || StateNo = 5900
Trigger1 = GameTime % 40 = 0
Anim = 6000
ID = 6000
Pos = 0, -20
PosType = P1
BindTime = 1
Random = 40, 40
ReMoveTime = -2
Scale = 0.15, 0.15
SprPriority = 3
OwnPal = 1

[State -2, 強化カラー光粒子]
Type = Explod
TriggerAll = PalNo = [9,12]
TriggerAll = RoundState > 0
TriggerAll = StateNo = 0 || StateNo = 5900
Trigger1 = GameTime % 40 = 20
Anim = 6000
ID = 6000
Pos = 10, -50
PosType = P1
BindTime = 1
Random = 20, 30
ReMoveTime = -2
Scale = 0.15, 0.15
SprPriority = 3
OwnPal = 1

[State -2, 暗→明]
Type = VarSet
TriggerAll = PalNo = [11,12]
Trigger1 = Var(27) > 32
V = 10
Value = (Var(10) | 4096)
IgNoreHitPause = 1

[State -2, 明→暗]
Type = VarSet
TriggerAll = PalNo = [11,12]
Trigger1 = Var(27) < 0
V = 10
Value = (Var(10) | 4096) - 4096
IgNoreHitPause = 1

[State -2, 暗→明]
Type = VarAdd
TriggerAll = PalNo = [11,12]
Trigger1 = !(Var(10) & 4096)
V = 27
Value = 1
IgNoreHitPause = 1

[State -2, 明→暗]
Type = VarAdd
TriggerAll = PalNo = [11,12]
Trigger1 = (Var(10) & 4096)
V = 27
Value = -1
IgNoreHitPause = 1

[State -2, 点滅]
Type = PalFx
Trigger1 = PalNo = [11,12]
Time = 1
Add = Var(27),Var(27),Var(27)
Mul = 256 + Var(27),256 + Var(27),256 + Var(27)
IgNoreHitPause = 1

[State -2, 残像ヘルパー呼出]
Type = Helper
TriggerAll = PalNo = 12
TriggerAll = NumHelper(10001) = 0
Trigger1 = RoundState >= 2
Trigger2 = StateNo = 0 || StateNo = 5900
Trigger3 = StateNo = [190,194]
HelperType = Normal
Name = "AfterImage_Helper"
ID = 10001
Pos = 0, 0
PosType = P1
Facing = 1
StateNo = 10001
KeyCtrl = 0
OwnPal = 1
SuperMoveTime = 2147483647
PauseMoveTime = 2147483647
IgNoreHitPause = 1

;-------------------------------------------------------------------------
;Voice
;-------------------------------------------------------------------------

;-------------------------------------------------------------------------
[State -2, Voice : Light Attack];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = (Random + GameTime) % 3 < 2
Trigger1 = StateNo = 200
Trigger1 = AnimElem = 2
Trigger2 = StateNo = 400
Trigger2 = AnimElem = 3
Trigger3 = StateNo = 600
Trigger3 = AnimElem = 3
Value = 100000 + Var(33), 200 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Medium Attack];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 210
Trigger1 = AnimElem = 4
Trigger2 = StateNo = 410
Trigger2 = AnimElem = 4
Trigger3 = StateNo = 610
Trigger3 = AnimElem = 4
Value = 100000 + Var(33), 201 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Heavy Attack];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 220
Trigger1 = AnimElem = 6
Trigger2 = StateNo = 420
Trigger2 = AnimElem = 4
Trigger3 = StateNo = 620
Trigger3 = AnimElem = 6
Trigger4 = StateNo = 625
Trigger4 = AnimElem = 18
Value = 100000 + Var(33), 202 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Launcher];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 430
Trigger1 = AnimElem = 4
Value = 100000 + Var(33), 205
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Cannon];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 1001 || StateNo = 1101 || StateNo = 1201
Trigger1 = Time = 1
Value = 100000 + Var(33), 205
Channel = 0
Volume = 128

[State -2, Voice : Air Catch];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 1401 || StateNo = 1411 || StateNo = 1421 || StateNo = 1451
Trigger1 = Time = 1
Value = 100000 + Var(33), 1400
Channel = 0
Volume = 128

[State -2, Voice : Air Catch2];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 1402 || StateNo = 1412 || StateNo = 1422 || StateNo = 1453
Trigger1 = Time = 1
Value = 100000 + Var(33), 204
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Barrage];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3000
Trigger1 = Time = 1
Value = 100000 + Var(33), 3000
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Barrage2];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = StateNo = 3000
Trigger1 = AnimElem = 11
Trigger2 = AnimElem = 14
Trigger3 = AnimElem = 18
Trigger4 = AnimElem = 22
Trigger5 = AnimElem = 27
Trigger6 = AnimElem = 32
Trigger7 = AnimElem = 34
Trigger8 = AnimElem = 38
Value = 100000 + Var(33), 200 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Barrage3];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3000
Trigger1 = AnimElem = 43
Value = 100000 + Var(33), 205
Channel = 0
Volume = 128

[State -2, Voice : Maximum Rainbow];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3100
Trigger1 = Time = 1
Value = 100000 + Var(33), 3001
Channel = 0
Volume = 128

[State -2, Voice : Maximum Rainbow2];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3110
Trigger1 = Time = 1
Value = 100000 + Var(33), 3501
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3500
Trigger1 = Time = 1
Trigger2 = StateNo = 3610
Trigger2 = AnimElemTime(56) = 0
Value = 100000 + Var(33), 3500
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom2];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3610
Trigger1 = Time = 1
Value = 100000 + Var(33), 205
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom3];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = StateNo = 3610
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
Trigger11= AnimElemTime(47) = 0
Value = 100000 + Var(33), 200 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom4];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = StateNo = 3610
Trigger1 = AnimElemTime(52) = 0
Value = 100000 + Var(33), 202
Channel = 0
Volume = 128

[State -2, Voice : ガードキャンセル];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 750
Trigger1 = AnimElem = 5
Value = 100000 + Var(33), 205
Channel = 0
Volume = 128

[State -2, Voice : Lose];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 170
Trigger1 = Time = 1
Value = 100000 + Var(33), 170
Channel = 0
Volume = 128

[State -2, Voice : Win];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 181
Trigger1 = Time = 1
Value = 100000 + Var(33), 180 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Win2];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 182
Trigger1 = Time = 1
Value = 100000 + Var(33), 182 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, 演出時間の延長]
Type = AssertSpecial
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 181
Trigger1 = Time <= 3 * TicksPerSecond
Trigger2 = StateNo = 182
Trigger2 = Time <= 4 * TicksPerSecond
Flag = RoundNotOver

[State -2, Voice : Intro];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 191
Trigger1 = AnimElem = 24
Value = 100000 + Var(33), 190 + (Random + GameTime) % 2
Channel = 5
Volume = 128

[State -2, Voice : Intro2];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 192
Trigger1 = Time = 30
Value = 100000 + Var(33), 192
Channel = 5
Volume = 128

[State -2, Voice : Intro3];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 192
Trigger1 = AnimElem = 3
Value = 100000 + Var(33), 193 + (Random + GameTime) % 2
Channel = 5
Volume = 128

[State -2, Voice : VS. Twilight Sparkle Intro];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219100
Trigger1 = Time = 1
Value = 100000 + Var(33), 219100
Channel = 5
Volume = 128

[State -2, Voice : VS. Pinkie Pie Intro];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219101
Trigger1 = Time = 1
Value = 100000 + Var(33), 219101
Channel = 5
Volume = 128

[State -2, Voice : VS. Applejack Intro];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219102
Trigger1 = Time = 1
Value = 100000 + Var(33), 219102
Channel = 5
Volume = 128

[State -2, Voice : VS. Rarity Intro];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219103
Trigger1 = Time = 1
Value = 100000 + Var(33), 219103
Channel = 5
Volume = 128

[State -2, Voice : VS. Fluttershy Intro];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219104
Trigger1 = Time = 1
Value = 100000 + Var(33), 219104
Channel = 5
Volume = 128

[State -2, Voice : VS. Rainbow Dash Intro];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219105
Trigger1 = Time = 1
Value = 100000 + Var(33), 219105
Channel = 5
Volume = 128

[State -2, Voice : Taunt];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 195
Trigger1 = Time = 1
Value = 100000 + Var(33), 182 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Light Damage];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = (Random + GameTime) % 5 < 1
Trigger1 = GetHitVar(AnimType) = 0
Trigger1 = StateNo = 5000 || StateNo = 5010 || StateNo = 5020 || StateNo = 5070
Trigger1 = Time = 0
Value = 100000 + Var(33), 5000 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Medium Damage];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = (Random + GameTime) % 5 < 1
Trigger1 = GetHitVar(AnimType) = 1
Trigger1 = StateNo = 5000 || StateNo = 5010 || StateNo = 5020 || StateNo = 5070
Trigger1 = Time = 0
Value = 100000 + Var(33), 5000 + (Random + GameTime) % 4
Channel = 0
Volume = 128

[State -2, Voice : Heavy Damage];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = (Random + GameTime) % 5 < 1
Trigger1 = GetHitVar(AnimType) >= 2
Trigger1 = StateNo = 5000 || StateNo = 5010 || StateNo = 5020 || StateNo = 5070
Trigger1 = Time = 0
Value = 100000 + Var(33), 5000 + (Random + GameTime) % 6
Channel = 0
Volume = 128

[State -2, Voice : Fall Recovery];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive && Life
Trigger1 = StateNo = 5201 || StateNo = 5210
Trigger1 = Time = 1
Value = 100000 + Var(33), 5200
Channel = 0
Volume = 128

[State -2, Voice : K.O.];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive = 0 || Life = 0
Trigger1 = !(Var(10) & 2)
Trigger1 = 1 || Var(10) := (Var(10) | 2)
Value = 100000 + Var(33), 11 + (Random + GameTime) % 4
;Channel = 0
Volume = 128
IgNoreHitPause = 1

[State -2, ボイス乱数]
Type = VarRandom
TriggerAll = Var(33) = 1
TriggerAll = StateNo = 5150
TriggerAll = Anim = [5140,5149]
Trigger1 = AnimElemTime(2) = 0
V = 5
Range = 0,1

[State -2, 演出時間の延長]
Type = AssertSpecial
TriggerAll = Var(33) = 1
TriggerAll = StateNo = 5150
TriggerAll = !(Var(10) & 262144)
TriggerAll = Anim = [5140,5149]
Trigger1 = Var(5) = 0
Trigger1 = Time <= 4.2 * TicksPerSecond
Trigger2 = Var(5) = 1
Trigger2 = Time <= 4.5 * TicksPerSecond
Trigger3 = Var(5) = 2
Trigger3 = Time <= 3.5 * TicksPerSecond
Trigger4 = Var(5) = 3
Trigger4 = Time <= 3.5 * TicksPerSecond
Trigger5 = Var(5) = 4
Trigger5 = Time <= 3.5 * TicksPerSecond
Trigger6 = Var(5) = 5
Trigger6 = Time <= 4.0 * TicksPerSecond
Flag = RoundNotOver

[State -2, Voice : HIT_LIEDEAD];English (Friendship is Magic)
Type = PlaySnd
TriggerAll = Var(33) = 1
TriggerAll = !IsHelper
TriggerAll = Alive = 0 || Life = 0
TriggerAll = StateNo = 5150
TriggerAll = Anim = [5140,5149]
Trigger1 = AnimElemTime(2) = 0
Value = 100000 + Var(33), 5150 + Var(5)
Channel = 0

;-------------------------------------------------------------------------
[State -2, Voice : Light Attack];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = (Random + GameTime) % 3 < 2
Trigger1 = StateNo = 200
Trigger1 = AnimElem = 2
Trigger2 = StateNo = 400
Trigger2 = AnimElem = 3
Trigger3 = StateNo = 600
Trigger3 = AnimElem = 3
Value = 100000 + Var(33), 200 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Medium Attack];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 210
Trigger1 = AnimElem = 4
Trigger2 = StateNo = 410
Trigger2 = AnimElem = 4
Trigger3 = StateNo = 610
Trigger3 = AnimElem = 4
Value = 100000 + Var(33), 202 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Heavy Attack];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 220
Trigger1 = AnimElem = 6
Trigger2 = StateNo = 420
Trigger2 = AnimElem = 4
Trigger3 = StateNo = 620
Trigger3 = AnimElem = 6
Trigger4 = StateNo = 625
Trigger4 = AnimElem = 18
Value = 100000 + Var(33), 204 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Launcher];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 430
Trigger1 = AnimElem = 4
Value = 100000 + Var(33), 207
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Cannon];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 1001 || StateNo = 1101 || StateNo = 1201
Trigger1 = Time = 1
Value = 100000 + Var(33), 207
Channel = 0
Volume = 128

[State -2, Voice : Air Catch];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 1401 || StateNo = 1411 || StateNo = 1421 || StateNo = 1451
Trigger1 = Time = 1
Value = 100000 + Var(33), 1400
Channel = 0
Volume = 128

[State -2, Voice : Air Catch2];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 1422 || StateNo = 1453
Trigger1 = Time = 1
Value = 100000 + Var(33), 205
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Barrage];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3000
Trigger1 = Time = 1
Value = 100000 + Var(33), 3000
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Barrage2];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = StateNo = 3000
Trigger1 = AnimElem = 11
Trigger2 = AnimElem = 14
Trigger3 = AnimElem = 18
Trigger4 = AnimElem = 22
Trigger5 = AnimElem = 27
Trigger6 = AnimElem = 32
Trigger7 = AnimElem = 34
Trigger8 = AnimElem = 38
Value = 100000 + Var(33), 200 + (Random + GameTime) % 4
Channel = 0
Volume = 128

[State -2, Voice : Rainbow Barrage3];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3000
Trigger1 = AnimElem = 43
Value = 100000 + Var(33), 3004
Channel = 0
Volume = 128

[State -2, Voice : Maximum Rainbow];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3100
Trigger1 = Time = 1
Value = 100000 + Var(33), 3001
Channel = 0
Volume = 128

[State -2, Voice : Maximum Rainbow2];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3101
Trigger1 = Time = 30
Value = 100000 + Var(33), 3002
Channel = 0
Volume = 128

[State -2, Voice : Maximum Rainbow3];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3110
Trigger1 = Time = 1
Value = 100000 + Var(33), 3003
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3500
Trigger1 = Time = 1
Trigger2 = StateNo = 3610
Trigger2 = AnimElemTime(56) = 0
Value = 100000 + Var(33), 3500
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom2];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 3610
Trigger1 = Time = 1
Value = 100000 + Var(33), 205
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom3];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = StateNo = 3610
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
Trigger11= AnimElemTime(47) = 0
Value = 100000 + Var(33), 200 + (Random + GameTime) % 4
Channel = 0
Volume = 128

[State -2, Voice : Sonic Rainboom4];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
TriggerAll = StateNo = 3610
Trigger1 = AnimElemTime(52) = 0
Value = 100000 + Var(33), 204
Channel = 0
Volume = 128

[State -2, Voice : ガードキャンセル];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 750
Trigger1 = AnimElem = 5
Value = 100000 + Var(33), 207
Channel = 0
Volume = 128

[State -2, Voice : Lose];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 170
Trigger1 = Time = 1
Value = 100000 + Var(33), 170
Channel = 0
Volume = 128

[State -2, Voice : Win];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 181
Trigger1 = Time = 1
Value = 100000 + Var(33), 180 + (Random + GameTime) % 4
Channel = 0
Volume = 128

[State -2, Voice : Win2];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 182
Trigger1 = Time = 1
Value = 100000 + Var(33), 184
Channel = 0
Volume = 128

[State -2, 演出時間の延長]
Type = AssertSpecial
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 181
Trigger1 = Time <= 3 * TicksPerSecond
Trigger2 = StateNo = 182
Trigger2 = Time <= 3.5 * TicksPerSecond
Flag = RoundNotOver

[State -2, Voice : Intro];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 191
Trigger1 = AnimElem = 5
Value = 100000 + Var(33), 190 + (Random + GameTime) % 3
Channel = 5
Volume = 128

[State -2, Voice : Intro2];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 192
Trigger1 = Time = 30
Value = 100000 + Var(33), 193 + (Random + GameTime) % 2
Channel = 5
Volume = 128

[State -2, Voice : Intro3];Japanese
Type = Null;PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 192
Trigger1 = AnimElem = 3
Value = 100000 + Var(33), 194
Channel = 5
Volume = 128

[State -2, Voice : VS. Twilight Sparkle Intro];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219100
Trigger1 = Time = 1
Value = 100000 + Var(33), 219100
Channel = 5
Volume = 128

[State -2, Voice : VS. Pinkie Pie Intro];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219101
Trigger1 = Time = 1
Value = 100000 + Var(33), 219101
Channel = 5
Volume = 128

[State -2, Voice : VS. Applejack Intro];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219102
Trigger1 = Time = 1
Value = 100000 + Var(33), 219102
Channel = 5
Volume = 128

[State -2, Voice : VS. Rarity Intro];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219103
Trigger1 = Time = 1
Value = 100000 + Var(33), 219103
Channel = 5
Volume = 128

[State -2, Voice : VS. Fluttershy Intro];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219104
Trigger1 = Time = 1
Value = 100000 + Var(33), 219104
Channel = 5
Volume = 128

[State -2, Voice : VS. Rainbow Dash Intro];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 219105
Trigger1 = Time = 1
Value = 100000 + Var(33), 219105
Channel = 5
Volume = 128

[State -2, Voice : Taunt];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = MoveType != H
Trigger1 = StateNo = 195
Trigger1 = Time = 1
Value = 100000 + Var(33), 184
Channel = 0
Volume = 128

[State -2, Voice : Light Damage];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = (Random + GameTime) % 5 < 1
Trigger1 = GetHitVar(AnimType) = 0
Trigger1 = StateNo = 5000 || StateNo = 5010 || StateNo = 5020 || StateNo = 5070
Trigger1 = Time = 0
Value = 100000 + Var(33), 5000 + (Random + GameTime) % 2
Channel = 0
Volume = 128

[State -2, Voice : Medium Damage];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = (Random + GameTime) % 5 < 1
Trigger1 = GetHitVar(AnimType) = 1
Trigger1 = StateNo = 5000 || StateNo = 5010 || StateNo = 5020 || StateNo = 5070
Trigger1 = Time = 0
Value = 100000 + Var(33), 5000 + (Random + GameTime) % 4
Channel = 0
Volume = 128

[State -2, Voice : Heavy Damage];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
TriggerAll = (Random + GameTime) % 5 < 1
Trigger1 = GetHitVar(AnimType) >= 2
Trigger1 = StateNo = 5000 || StateNo = 5010 || StateNo = 5020 || StateNo = 5070
Trigger1 = Time = 0
Value = 100000 + Var(33), 5000 + (Random + GameTime) % 6
Channel = 0
Volume = 128

[State -2, Voice : Fall Recovery];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive && Life
Trigger1 = StateNo = 5201 || StateNo = 5210
Trigger1 = Time = 1
Value = 100000 + Var(33), 5200
Channel = 0
Volume = 128

[State -2, Voice : K.O.];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive = 0 || Life = 0
Trigger1 = !(Var(10) & 2)
Trigger1 = 1 || Var(10) := (Var(10) | 2)
Value = 100000 + Var(33), 11 + (Random + GameTime) % 5
;Channel = 0
Volume = 128
IgNoreHitPause = 1

[State -2, ボイス乱数]
Type = VarRandom
TriggerAll = Var(33) = 2
TriggerAll = StateNo = 5150
TriggerAll = Anim = [5140,5149]
Trigger1 = AnimElemTime(2) = 0
V = 5
Range = 0,2

[State -2, 演出時間の延長]
Type = AssertSpecial
TriggerAll = Var(33) = 2
TriggerAll = StateNo = 5150
TriggerAll = !(Var(10) & 262144)
TriggerAll = Anim = [5140,5149]
Trigger1 = Var(5) = 0
Trigger1 = Time <= 4.0 * TicksPerSecond
Trigger2 = Var(5) = 1
Trigger2 = Time <= 4.5 * TicksPerSecond
Trigger3 = Var(5) = 2
Trigger3 = Time <= 4.5 * TicksPerSecond
Trigger4 = Var(5) = 3
Trigger4 = Time <= 3.5 * TicksPerSecond
Trigger5 = Var(5) = 4
Trigger5 = Time <= 3.5 * TicksPerSecond
Trigger6 = Var(5) = 5
Trigger6 = Time <= 4.0 * TicksPerSecond
Flag = RoundNotOver

[State -2, Voice : HIT_LIEDEAD];Japanese
Type = PlaySnd
TriggerAll = Var(33) = 2
TriggerAll = !IsHelper
TriggerAll = Alive = 0 || Life = 0
TriggerAll = StateNo = 5150
TriggerAll = Anim = [5140,5149]
Trigger1 = AnimElemTime(2) = 0
Value = 100000 + Var(33), 5150 + Var(5)
Channel = 0

[State -2, Voice : Intro stop]
Type = StopSnd
Trigger1 = RoundState = 2
Trigger1 = PrevStateNo = 0
Trigger1 = StateNo = 0
Trigger1 = Ctrl = 0
Channel = 5

;-------------------------------------------------------------------------
;常駐ヘルパー
;-------------------------------------------------------------------------

;-------------------------------------------------------------------------
;P2NAME : 特殊演出対応
;-------------------------------------------------------------------------
;---------------------[ドロウィンさん]
;毒効果（ドロウィンアルカナ)
[state -2, 0]
type = poweradd
triggerall = enemy,authorname = "Drowin arcana"
triggerall = enemy,fvar(20) > 0
trigger1 = power > 0
value = -1
[state -2, 0]
type = lifeadd
triggerall = enemy,authorname = "Drowin arcana"
triggerall = enemy,fvar(20) > 0
trigger1 = gametime % 7 = 0
value = -1
kill = 0
[State -2,0]
type = Palfx
triggerall = enemy,authorname = "Drowin arcana"
trigger1 = enemy,fvar(20) > 0
add = 100,0,110
mul = 220,220,220
time = 5
ignorehitpause = 1

;ドロウィン「俺の名を言ってみろ」対応ステート
[State ]
type=RemoveExplod
trigger1=P2name="Drowin"&&enemynear,authorname="Drowin"&&stateno=1125&&movetype=H&&enemynear,stateno=1122&&enemynear,time=2
ID=0

[State ]
type=RemoveExplod
trigger1=P2name="Drowin"&&enemynear,authorname="Drowin"&&stateno=1125&&movetype=H&&(((enemynear,stateno=[1122,1124])||(enemynear,stateno=[1126,1127]))&&enemynear,time=2)
ID=22421

[State ]
type=explod
trigger1=P2name="Drowin"&&enemynear,authorname="Drowin"&&stateno=1125&&movetype=H&&(((enemynear,stateno=[1122,1124])||(enemynear,stateno=[1126,1127]))&&enemynear,time=2)
ID=22421
anim=ifelse(enemynear,stateno=1123||enemynear,stateno=1127,22422,ifelse(enemynear,stateno=1124,22423,22421))
postype=left
pos=280,250
scale=Const(size.xscale)*1.5,Const(size.yscale)*1.5
facing=-1
bindtime=-1
ownpal=1
sprpriority=0
removetime=-1

;-------------------------------------------------------------------------
;---------------------[SAIKEIさん]
;-----------イチコロ毒（SAIKEIユダ）
[state ]
type=lifeadd
trigger1=enemy,name="JUDA"
trigger1=enemy,authorname="SAIKEI"
trigger1=enemy,fvar(23)>0
trigger1=floor(enemy,fvar(23))%4=0
trigger1=enemy,var(0)<=0
trigger1=enemy,movetype!=h||enemy,movetype=h&&enemy,hitshakeover
value=-1
kill=0
[state ]
type=palfx
triggerall=gametime%20=0
trigger1=enemy,name="JUDA"
trigger1=enemy,authorname="SAIKEI"
trigger1=enemy,fvar(23)>0
time=8
add=255,0,0

;-------------------------------------------------------------------------
;---------------------[トキ製作者各位]
[State ];刹活孔判定
type=VarSet
triggerall=fvar(12)=0
trigger1=(enemynear,authorname="Ts"&&enemynear,var(33)!=0&&(enemynear,name="Toki"||enemynear,name="Amiba"))||(enemynear,authorname="shuu"&&enemynear,var(12)>=1&&(enemynear,name="TOKI_S"||enemynear,name="Toki Hakurei"))
trigger2=enemynear,var(12)>=1&&((enemynear,name="TOKI-(NERICYA)"&&enemynear,authorname="NERICYA")||(enemynear,name="TOKI-(NERICYA) reimu patch"&&enemynear,authorname="NERICYA+lanperu"))
trigger3=enemynear,name="Toki"&&enemynear,authorname="Drowin hokuto"&&enemynear,fvar(32)>=0.01
fvar(12)=1

[State ]
type=VarSet
triggerall=fvar(12)=1
trigger1=(enemynear,authorname="Ts"&&enemynear,var(33)=0&&(enemynear,name="Toki"||enemynear,name="Amiba"))||(enemynear,authorname="shuu"&&enemynear,var(12)=0&&(enemynear,name="TOKI_S"||enemynear,name="Toki Hakurei"))
trigger2=enemynear,var(12)=0&&((enemynear,name="TOKI-(NERICYA)"&&enemynear,authorname="NERICYA")||(enemynear,name="TOKI-(NERICYA) reimu patch"&&enemynear,authorname="NERICYA+lanperu"))
trigger3=enemynear,name="Toki"&&enemynear,authorname="Drowin hokuto"&&enemynear,fvar(32)<=0
fvar(12)=0

;-------------------------------------------------------------------------
;---------------------[ゆ～とはるさん]
;らんま1/2-爆裂乱闘篇-～共通「勝利画面」対応ステート
[State ];ポトレ
type=Explod
TriggerAll = Var(33) = 2
trigger1=numenemy
trigger1=enemy,var(56)=19921225&&enemy,authorname="YU-TOHARU"&&enemy,stateno=1200&&enemy,time=32&&(enemy,TeamMode=single ||enemy,TeamMode=turns)&&(TeamMode=single ||TeamMode=turns)&&roundstate=4&&matchover
anim=21211+ifelse(teamside=2,1,0)
bindtime=-1
postype=left
pos=enemy,var(53),0
scale=1,1
ontop=1
ownpal=1
removetime=-1

;らんま1/2-爆裂乱闘篇-～五寸釘光「勝利画面」対応ステート
[State ];セリフ（一行）
type=Explod
TriggerAll = Var(33) = 2
trigger1=numenemy
trigger1=enemy,name="GOSUNKUGI HIKARU"&&enemy,authorname="YU-TOHARU"&&enemy,stateno=1200&&enemy,time=32&&(enemy,TeamMode=single ||enemy,TeamMode=turns)&&(TeamMode=single ||TeamMode=turns)&&roundstate=4&&matchover
anim=21213
ID=21211
bindtime=-1
postype=left
pos=enemy,var(53),0
scale=1,1
ontop=1
ownpal=1
removetime=-1

;らんま1/2-爆裂乱闘篇-～パンスト太郎「勝利画面」対応ステート
[State ];セリフ（一行）
type=Explod
TriggerAll = Var(33) = 2
trigger1=numenemy
trigger1=enemy,name="PANTYHOSE TARO"&&enemy,authorname="YU-TOHARU"&&enemy,stateno=1200&&enemy,time=32&&(enemy,TeamMode=single ||enemy,TeamMode=turns)&&(TeamMode=single ||TeamMode=turns)&&roundstate=4&&matchover
anim=21214
ID=21211
bindtime=-1
postype=left
pos=enemy,var(53),0
scale=1,1
ontop=1
ownpal=1
removetime=-1

;マミヤ「さようなら」対応ステート
[state ];夜空に浮かぶ顔
type=Explod
triggerall=!numexplod(13777)&&!alive
trigger1=numenemy
trigger1=enemy,name="MAMIYA"&&enemy,authorname="YU-TOHARU"&&enemy,fvar(19)=1
trigger2=numenemy>=2
trigger2=enemy(1),name="MAMIYA"&&enemy(1),authorname="YU-TOHARU"&&enemy(1),fvar(19)=1
anim=13777
ID=13777
postype=left
pos=244,37
ownpal=1
sprpriority=-498
supermovetime=9999999999
pausemovetime=9999999999
scale=0.5,0.5
bindtime=-1
removetime=-1

[state ];夜空に浮かぶ顔枠
type=Explod
triggerall=!numexplod(13778)&&!alive
trigger1=numenemy
trigger1=enemy,name="MAMIYA"&&enemy,authorname="YU-TOHARU"&&enemy,fvar(19)=1
trigger2=numenemy>=2
trigger2=enemy(1),name="MAMIYA"&&enemy(1),authorname="YU-TOHARU"&&enemy(1),fvar(19)=1
anim=13778
ID=13778
postype=left
pos=244,37
ownpal=1
sprpriority=-499
supermovetime=9999999999
pausemovetime=9999999999
scale=0.5,0.5
bindtime=-1
removetime=-1

;右代宮縁寿 他「メタ返し＆メタ再反論」対応ステート
[state ];メタ返し＆メタ再反論～パワーゲージ消費×2
type=Poweradd
triggerall=alive&&!numexplod(19864)&&!numexplod(19865)
trigger1=numenemy&&!numpartner
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&(enemy,stateno=2910||enemy,stateno=2930)&&enemy,time=2
trigger2=numenemy&&numpartner
trigger2=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&(enemy,stateno=2910||enemy,stateno=2930)&&enemy,time=2&&(ID<Partner,ID||(ID>Partner,ID&&partner,numexplod(19864)=0&&partner,numexplod(19865)=0))
trigger3=numenemy>=2&&!numpartner
trigger3=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&(enemy(1),stateno=2910||enemy(1),stateno=2930)&&enemy(1),time=2
trigger4=numenemy>=2&&numpartner
trigger4=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&(enemy(1),stateno=2910||enemy(1),stateno=2930)&&enemy(1),time=2&&(ID<Partner,ID||(ID>Partner,ID&&partner,numexplod(19864)=0&&partner,numexplod(19865)=0))
value=IfElse(PowerMax >= 5000,-2000,IfElse(PowerMax >= 3000,-1000,IfElse(PowerMax >= 2000,-800,-400)))
ignorehitpause=1

[state ];メタ返し～ボイス
type=PlaySnd
triggerall=alive&&!numexplod(19864)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2910&&enemy,time=2
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2910&&enemy(1),time=2
value=100000 + Var(33),19864
Volume = 192
ignorehitpause=1

[state ];メタ返し～カットイン（右向き）
type=Explod
triggerall=alive&&!numexplod(19864)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2910&&enemy,time=2&&enemy,facing=-1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2910&&enemy(1),time=2&&enemy(1),facing=-1
anim=19864
ID=19864
postype=left
pos=0,240
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

[state ];メタ返し～カットイン（左向き）
type=Explod
triggerall=alive&&!numexplod(19864)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2910&&enemy,time=2&&enemy,facing=1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2910&&enemy(1),time=2&&enemy(1),facing=1
anim=19864
ID=19864
postype=right
pos=0,240
facing=-1
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

[state ];メタ再反論～ボイス
type=PlaySnd
triggerall=alive&&!numexplod(19865)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2930&&enemy,time=2
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2930&&enemy(1),time=2
value=100000 + Var(33),19865
Volume = 192
ignorehitpause=1


[state ];メタ再反論～カットイン（右向き）
type=Explod
triggerall=alive&&!numexplod(19865)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2930&&enemy,time=2&&enemy,facing=-1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2930&&enemy(1),time=2&&enemy(1),facing=-1
anim=19865
ID=19865
postype=left
pos=0,240
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

[state ];メタ再反論～カットイン（左向き）
type=Explod
triggerall=alive&&!numexplod(19865)
trigger1=numenemy
trigger1=enemy,var(56)=19861004&&enemy,Authorname="YU-TOHARU"&&enemy,stateno=2930&&enemy,time=2&&enemy,facing=1
trigger2=numenemy>=2
trigger2=enemy(1),var(56)=19861004&&enemy(1),Authorname="YU-TOHARU"&&enemy(1),stateno=2930&&enemy(1),time=2&&enemy(1),facing=1
anim=19865
ID=19865
postype=right
pos=0,240
facing=-1
scale=0.5,0.5
ownpal=1
bindtime=-1
sprpriority=50
pausemovetime=100
supermovetime=100
ignorehitpause=1

;-------------------------------------------------------------------------
;---------------------[壱鬼馬さん]
;禍忌「挑発」対応ステート
[State -2,禍忌]
type = PowerAdd
triggerall = roundstate = 2
trigger1 = numenemy
trigger1 = enemy(0),name = "Magaki" && enemy(0),authorname = "1kima"
trigger1 = enemy(0),stateno = 195 && enemy(0),statetime = 32
trigger2 = numenemy > 1
trigger2 = enemy(1),name = "Magaki" && enemy(1),authorname = "1kima"
trigger2 = enemy(1),stateno = 195 && enemy(1),statetime = 32
value = 150

;-------------------------------------------------------------------------
;---------------------[龍虎の拳キャラ製作者各位]
;龍虎の拳キャラ「挑発」対応ステート
[state ]
Type=PowerAdd
triggerall=numenemy&&alive
triggerall=enemynear,time=1&&enemynear,stateno=ifelse(enemynear,authorname="Fred",ifelse(P2name="jack"||P2name="king"||P2name="Mr Big"||P2name="Robert Garcia"||P2name="Todo"||P2name="Takuma",310,6001),ifelse(enemynear,authorname="Lord Sinistro",910,195))
trigger1=(P2name="Temjin"&&enemynear,authorname="adamskie")||(enemynear,authorname="brown"&&(P2name="Eiji_MK"||P2name="aof3_ryo"))||(P2name="John Crawley"&&enemynear,authorname="Smogon+The_None")||(P2name="S.Sinclair"&&enemynear,authorname="hiramoto")
trigger2=(P2name="Jack Turner SvK"&&enemynear,authorname="Andre Lopes, Luigi-Master")||(enemynear,authorname="Andre Lopes"&&(P2name="Jack"||P2name="Yuri"))||(P2name="lenny"&&enemynear,authorname="keyu")||(P2name="Wang"&&enemynear,authorname="oscar12345")
trigger3=(enemynear,authorname="Elecbyte"&&(P2name="Lee"||P2name="Robert"||P2name="Ryo"))||(P2name="wyler"&&(enemynear,authorname="dxwho"||enemynear,authorname="Werewood"))||(P2name="AOFking by kain the supreme"&&enemynear,authorname="kain The Supreme")
trigger4=(enemynear,authorname="mass"&&(P2name="Karman"||P2name="Sinclair"))||(P2name="Micky"&&enemynear,authorname="Lord Sinistro")||(P2name="AOF3Robert"&&enemynear,authorname="DeSouza")||(P2name="Kasumi Todo"&&enemynear,authorname="nyo")
trigger5=enemynear,authorname="Fred"&&(P2name="Eiji"||P2name="geese"||P2name="jack"||P2name="John"||P2name="king"||P2name="lee"||P2name="Micky"||P2name="Mr Big"||P2name="Mr Karate"||P2name="Ryo"||P2name="Todo"||P2name="Takuma"||P2name="Robert Garcia")
trigger6=(P2name="FUWA JIN"&&enemynear,authorname="Tin")||(P2name="Mr.BIG"&&enemynear,authorname="dorusii")||(P2name="Temjin_Arrange"&&enemynear,authorname="mage")
Value=-200
ignorehitpause=1

[state ]
Type=PowerAdd
triggerall=numenemy>=2&&alive
triggerall=enemynear(1),time=1
triggerall=enemynear(1),stateno=ifelse(enemynear(1),authorname="Fred",ifelse(P4name="jack"||P4name="king"||P4name="Mr Big"||P4name="Robert Garcia"||P4name="Todo"||P4name="Takuma",310,6001),ifelse(enemynear(1),authorname="Lord Sinistro",910,195))
trigger1=(P4name="AOFking by kain the supreme"&&enemynear(1),authorname="kain The Supreme")||(P4name="John Crawley"&&enemynear(1),authorname="Smogon+The_None")||(enemynear(1),authorname="brown"&&(P4name="Eiji_MK"||P4name="aof3_ryo"))
trigger2=(P4name="Jack Turner SvK"&&enemynear(1),authorname="Andre Lopes, Luigi-Master")||(P4name="lenny"&&enemynear(1),authorname="keyu")||(P4name="Wang"&&enemynear(1),authorname="oscar12345")||(P4name="S.Sinclair"&&enemynear(1),authorname="hiramoto")
trigger3=(enemynear(1),authorname="Elecbyte"&&(P4name="Lee"||P4name="Robert"||P4name="Ryo"))||(P4name="wyler"&&(enemynear(1),authorname="dxwho"||enemynear(1),authorname="Werewood"))||(enemynear(1),authorname="Andre Lopes"&&(P4name="Jack"||P4name="Yuri"))
trigger4=(enemynear(1),authorname="mass"&&(P4name="Karman"||P4name="Sinclair"))||(P4name="Micky"&&enemynear(1),authorname="Lord Sinistro")||(P4name="AOF3Robert"&&enemynear(1),authorname="DeSouza")||(P4name="Kasumi Todo"&&enemynear(1),authorname="nyo")
trigger5=enemynear(1),authorname="Fred"&&(P4name="Eiji"||P4name="geese"||P4name="jack"||P4name="John"||P4name="king"||P4name="lee"||P4name="Micky"||P4name="Mr Big"||P4name="Mr Karate"||P4name="Ryo"||P4name="Todo"||P4name="Takuma"||P4name="Robert Garcia")
trigger6=(P4name="FUWA JIN"&&enemynear(1),authorname="Tin")||(P4name="Temjin"&&enemynear(1),authorname="adamskie")||(P4name="Mr.BIG"&&enemynear(1),authorname="dorusii")||(P4name="Temjin_Arrange"&&enemynear(1),authorname="mage")
Value=-200
ignorehitpause=1

;-------------------------------------------------------------------------
;---------------------[GGキャラ製作者各位]
;GGキャラ「挑発＆勝ち挑発（RAKUSYO）」対応ステート
[state ]
type=Varset
triggerall=numenemy
triggerall=enemy,time=1&&(alive||(lose&&MatchOver=0&&roundstate=3&&!(enemy,wintime)))
trigger1=enemy,authorname="muteki"&&enemy,stateno=195&&(enemy,name="sol"||enemy,name="ky"||enemy,name="may"||enemy,name="millia"||enemy,name="eddie"||enemy,name="potemkin"||enemy,name="chipp"||enemy,name="baiken")
trigger2=enemy,authorname="muteki"&&enemy,stateno=195&&(enemy,name="jam"||enemy,name="AXL"||enemy,name="johnny"||enemy,name="gg_venom"||enemy,name="testament"||enemy,name="dizzy"||enemy,name="SLAYER")
trigger3=enemy,authorname="muteki"&&enemy,stateno=195&&(enemy,name="I-NO"||enemy,name="bridget"||enemy,name="A.B.A"||enemy,name="justice"||enemy,name="kliff"||enemy,name="robo-ky"||enemy,name="zappa")
trigger4=enemy,authorname="muteki"&&((enemy,stateno=195&&(enemy,name="anji"||enemy,name="osol"||enemy,name="chipp_arrange"||enemy,name="Omni-Psych Chipp"))||(enemy,name="faust"&&(enemy,stateno=[195,196])))
trigger5=enemy,authorname="MEKA"&&enemy,stateno=195&&(enemy,name="Anji Mito"||enemy,name="Ky Kiske"||enemy,name="I-NO"||enemy,name="May"||enemy,name="Chipp Zanuff"||enemy,name="Axl Low")
trigger6=enemy,authorname="ukege"&&enemy,stateno=195&&(enemy,name="ROBO-KY1"||enemy,name="ROBO-KY2"||enemy,name="OLD_ROBO-KY"||enemy,name="ROBO-KY3"||enemy,name="ROBO-JAM"||enemy,name="ROBO-SOL")
trigger7=enemy,stateno=195&&((enemy,authorname="nana"&&(enemy,name="Millia_Rage"||enemy,name="Dizzy"))||(enemy,authorname="MIMI"&&(enemy,name="ROBO-Ky"||enemy,name="ROBO-KyⅡ")))
trigger8=enemy,stateno=195&&((enemy,authorname="the k.m.d."&&(enemy,name="Johnny"||enemy,name="Evil Johnny"))||(enemy,authorname="Daimonmau"&&(enemy,name="solengrenado"||enemy,name="darkordersol")))
trigger9=enemy,stateno=195&&(enemy,authorname="Akutagawa"&&(enemy,name="order-Sol=Badguy"||enemy,name="Ky=kiske"))||(enemy,name="Sol=Badguy"&&enemy,authorname="Amachi"&&(enemy,stateno=[195,196]))
trigger10=enemy,stateno=195&&((enemy,name="Sol Badguy"&&enemy,authorname="aoao")||(enemy,name="JAM KURADOBERI"&&enemy,authorname="AOAO")||(enemy,name="SLAYER"&&enemy,authorname="Lupanda76"))
trigger11=enemy,stateno=195&&((enemy,name="potemkin"&&enemy,authorname="Tin")||(enemy,name="Omni-Psych Jam"&&enemy,authorname="Seven")||(enemy,name="ShinEddie"&&enemy,authorname="Knightmare106"))
trigger12=enemy,stateno=195&&((enemy,name="judgment"&&enemy,authorname="kishio")||(enemy,name="Captain Falcon"&&enemy,authorname="Kamekaze")||(enemy,name="kyko"&&enemy,authorname="beppu&panda"))
trigger13=(enemy,stateno=900&&enemy,authorname="EL"&&(enemy,name="BRIDGET"||enemy,name="MAY"||enemy,name="DIZZY"||enemy,name="ZAPPA"))||(enemy,name="c-wind2"&&enemy,authorname="365"&&enemy,stateno=290)
trigger14=enemy,authorname="高崎　舟"&&((enemy,name="BAIKEN"&&(enemy,stateno=4010||enemy,stateno=4012))||(enemy,name="anji mito"&&enemy,stateno=4010))
trigger15=(enemy,name="Kanna"&&enemy,authorname="mikage"&&enemy,stateno=195&&enemy,var(33)=3)||(enemy,name="Destrudo Ryu"&&enemy,authorname="Sumi"&&enemy,stateno=340&&enemy,var(50)=4)
trigger16=enemy,stateno=195&&((enemy,name="Ky=kiske"&&enemy,authorname="N.I.J")||(enemy,authorname="flowrallia"&&(enemy,name="Weiss"||enemy,name="Elsa_GG"||enemy,name="Saki_GG"||enemy,name="Heart_GG")))
trigger17=enemy,stateno=195&&((enemy,name="Dizzy By Third"&&enemy,authorname="Third")||(enemy,name="Tenshi Hinanai"&&enemy,authorname="dager"))
trigger18=enemy,stateno=10195&&((enemy,authorname="Rei"&&(enemy,name="EINS"||enemy,name="GGKY"||enemy,name="ROBO-KY_Type-P"||enemy,name="XECHS"||enemy,name="ZWEI"))||(enemy,authorname="Rei＆elm"&&enemy,name="MANUTE"))
var(39)=100-ifelse(lose&&MatchOver=0&&roundstate=3&&!(enemy,wintime),99,0)
ignorehitpause=1

[state ]
type=Varset
triggerall=numenemy>=2
triggerall=enemy(1),time=1&&(alive||(lose&&MatchOver=0&&roundstate=3&&!(enemy(1),wintime)))
trigger1=enemy(1),authorname="muteki"&&enemy(1),stateno=195&&(enemy(1),name="sol"||enemy(1),name="ky"||enemy(1),name="may"||enemy(1),name="millia"||enemy(1),name="eddie"||enemy(1),name="potemkin"||enemy(1),name="chipp"||enemy(1),name="baiken")
trigger2=enemy(1),authorname="muteki"&&enemy(1),stateno=195&&(enemy(1),name="jam"||enemy(1),name="AXL"||enemy(1),name="johnny"||enemy(1),name="gg_venom"||enemy(1),name="testament"||enemy(1),name="dizzy"||enemy(1),name="SLAYER")
trigger3=enemy(1),authorname="muteki"&&enemy(1),stateno=195&&(enemy(1),name="I-NO"||enemy(1),name="bridget"||enemy(1),name="A.B.A"||enemy(1),name="justice"||enemy(1),name="kliff"||enemy(1),name="robo-ky"||enemy(1),name="zappa")
trigger4=enemy(1),authorname="muteki"&&((enemy(1),stateno=195&&(enemy(1),name="anji"||enemy(1),name="osol"||enemy(1),name="chipp_arrange"||enemy(1),name="Omni-Psych Chipp"))||(enemy(1),name="faust"&&(enemy(1),stateno=[195,196])))
trigger5=enemy(1),authorname="MEKA"&&enemy(1),stateno=195&&(enemy(1),name="Anji Mito"||enemy(1),name="Ky Kiske"||enemy(1),name="I-NO"||enemy(1),name="May"||enemy(1),name="Chipp Zanuff"||enemy(1),name="Axl Low")
trigger6=enemy(1),authorname="ukege"&&enemy(1),stateno=195&&(enemy(1),name="ROBO-KY1"||enemy(1),name="ROBO-KY2"||enemy(1),name="OLD_ROBO-KY"||enemy(1),name="ROBO-KY3"||enemy(1),name="ROBO-JAM"||enemy(1),name="ROBO-SOL")
trigger7=enemy(1),stateno=195&&((enemy(1),authorname="nana"&&(enemy(1),name="Millia_Rage"||enemy(1),name="Dizzy"))||(enemy(1),authorname="MIMI"&&(enemy(1),name="ROBO-Ky"||enemy(1),name="ROBO-KyⅡ")))
trigger8=enemy(1),stateno=195&&((enemy(1),authorname="the k.m.d."&&(enemy(1),name="Johnny"||enemy(1),name="Evil Johnny"))||(enemy(1),authorname="Daimonmau"&&(enemy(1),name="solengrenado"||enemy(1),name="darkordersol")))
trigger9=enemy(1),stateno=195&&(enemy(1),authorname="Akutagawa"&&(enemy(1),name="order-Sol=Badguy"||enemy(1),name="Ky=kiske"))||(enemy(1),name="Sol=Badguy"&&enemy(1),authorname="Amachi"&&(enemy(1),stateno=[195,196]))
trigger10=enemy(1),stateno=195&&((enemy(1),name="Sol Badguy"&&enemy(1),authorname="aoao")||(enemy(1),name="JAM KURADOBERI"&&enemy(1),authorname="AOAO")||(enemy(1),name="SLAYER"&&enemy(1),authorname="Lupanda76"))
trigger11=enemy(1),stateno=195&&((enemy(1),name="potemkin"&&enemy(1),authorname="Tin")||(enemy(1),name="Omni-Psych Jam"&&enemy(1),authorname="Seven")||(enemy(1),name="ShinEddie"&&enemy(1),authorname="Knightmare106"))
trigger12=enemy(1),stateno=195&&((enemy(1),name="judgment"&&enemy(1),authorname="kishio")||(enemy(1),name="Captain Falcon"&&enemy(1),authorname="Kamekaze")||(enemy(1),name="kyko"&&enemy(1),authorname="beppu&panda"))
trigger13=(enemy(1),stateno=900&&enemy(1),authorname="EL"&&(enemy(1),name="BRIDGET"||enemy(1),name="MAY"||enemy(1),name="DIZZY"||enemy(1),name="ZAPPA"))||(enemy(1),name="c-wind2"&&enemy(1),authorname="365"&&enemy(1),stateno=290)
trigger14=enemy(1),authorname="高崎　舟"&&((enemy(1),name="BAIKEN"&&(enemy(1),stateno=4010||enemy(1),stateno=4012))||(enemy(1),name="anji mito"&&enemy(1),stateno=4010))
trigger15=(enemy(1),name="Kanna"&&enemy(1),authorname="mikage"&&enemy(1),stateno=195&&enemy(1),var(33)=3)||(enemy(1),name="Destrudo Ryu"&&enemy(1),authorname="Sumi"&&enemy(1),stateno=340&&enemy(1),var(50)=4)
trigger16=enemy(1),stateno=195&&((enemy(1),name="Ky=kiske"&&enemy(1),authorname="N.I.J")||(enemy(1),authorname="flowrallia"&&(enemy(1),name="Weiss"||enemy(1),name="Elsa_GG"||enemy(1),name="Saki_GG"||enemy(1),name="Heart_GG")))
trigger17=enemy(1),stateno=195&&((enemy(1),name="Dizzy By Third"&&enemy(1),authorname="Third")||(enemy(1),name="Tenshi Hinanai"&&enemy(1),authorname="dager"))
trigger18=enemy(1),stateno=10195&&((enemy(1),authorname="Rei"&&(enemy(1),name="EINS"||enemy(1),name="GGKY"||enemy(1),name="ROBO-KY_Type-P"||enemy(1),name="XECHS"||enemy(1),name="ZWEI"))||(enemy(1),authorname="Rei＆elm"&&enemy(1),name="MANUTE"))
var(39)=100-ifelse(lose&&MatchOver=0&&roundstate=3&&!(enemy,wintime),99,0)
ignorehitpause=1

[state ]
Type=PowerAdd
trigger1=var(39)=100
Value=80
ignorehitpause=1

[state ]
type=Varset
trigger1=var(39)=100
var(39)=0
ignorehitpause=1

[state ]
type=Explod
trigger1=TeamSide=2&&var(39)=1&&numexplod(31240)=0&&lose&&MatchOver=0&&roundstate=3
anim=31240
ID=31240
sprpriority=5
supermovetime=1000
pausemovetime=1000
postype=left
pos=35,181
ownpal=1
ontop=1
bindtime=-1
scale=0.5,0.5
ignorehitpause=1

[state ]
type=Explod
trigger1=TeamSide=1&&var(39)=1&&numexplod(31240)=0&&lose&&MatchOver=0&&roundstate=3
anim=31241
ID=31240
sprpriority=5
supermovetime=1000
pausemovetime=1000
postype=right
pos=-85,181
ownpal=1
ontop=1
bindtime=-1
scale=0.5,0.5
ignorehitpause=1

;-------------------------------------------------------------------------
;---------------------[北斗キャラ製作者各位]
;北斗キャラ「ヘヴィーストライク」対応ステート
[State ]
type=PlaySnd
triggerall=movetype=H
trigger1=(anim=5300&&(stateno=8701||stateno=3999||stateno=241||stateno=315||stateno=390||stateno=800||stateno=90650||stateno=325||stateno=701||stateno=66020||stateno=20050))||(anim=350&&stateno=350)||(anim=5301&&stateno=351)
trigger2=(anim=335&&stateno=4030)||(anim=5002&&(stateno=916||stateno=301))
value=100000 + Var(33),5300
channel=0
Volume = 192

[State ]
type=ChangeAnim
triggerall=movetype=H
trigger1=(anim=5300&&(stateno=8701||stateno=3999||stateno=241||stateno=315||stateno=390||stateno=800||stateno=90650||stateno=325||stateno=701||stateno=916||stateno=66020||stateno=20050))||(anim=350&&stateno=350)||(anim=5002&&stateno=916)
trigger2=anim=5301&&stateno=351
value=13771
elem=ifelse(anim=5300&&(stateno=916||stateno=66020),7,1)

;北斗キャラ「挑発」対応ステート
[state ]
type=Varset
triggerall=numenemy&&alive
trigger1=enemy,authorname="Drowin hokuto"&&((enemy,stateno=199&&((enemy,name="KENSHIRO"&&enemy,time=19)||(enemy,name="Toki"&&enemy,time=17)))||(enemy,name="amiba"&&enemy,stateno=19911&&enemy,time=1))
trigger2=enemy,authorname="Ahuron"&&enemy,stateno=199&&((enemy,name="JAGI"&&enemy,time=80)||(enemy,name="SHIN"&&enemy,time=30)||(enemy,name="Heart&Heart"&&enemy,time=24))
trigger3=enemy,authorname="Ahuron"&&enemy,stateno=199&&((enemy,name="REI"&&enemy,time=16)||(enemy,name="THOUTHER"&&enemy,time=50))
trigger4=enemy,authorname="NERICYA"&&((enemy,name="JUDA-(NERICYA)"&&enemy,stateno=195&&enemy,time=1)||(enemy,name="TOKI-(NERICYA)"&&enemy,stateno=333&&enemy,time=17))
trigger5=enemy,authorname="Ts"&&enemy,stateno=195&&((enemy,time=80&&(enemy,name="Jagi"||enemy,name="JagiMeirin"))||(enemy,time=17&&(enemy,name="Toki"||enemy,name="Amiba")))
trigger6=enemy,authorname="Tamago Kanten"&&enemy,stateno=195&&((enemy,time=40&&enemy,name="ikusan_juda")||(enemy,time=50&&(enemy,name="tenshi"||enemy,name="tenshi_rei")))
trigger7=enemy,authorname="Nachel_Arrange_By_RockMARISA"&&((enemy,name="HAKUREI"&&enemy,stateno=195&&enemy,time=35)||(enemy,name="TELETTE"&&enemy,stateno=10195&&enemy,time=15))
trigger8=enemy,authorname="shuu"&&enemy,stateno=333&&((enemy,name="TEOC REISEN"&&enemy,time=40)||(enemy,name="TOKI_S"&&enemy,time=17)||(enemy,name="Chiester410_S"&&enemy,time=1))
trigger9=(enemy,name="REIsen U Inaba"&&enemy,authorname="shuu"&&enemy,stateno=199&&enemy,time=16)||(enemy,name="Mr.HEART"&&enemy,authorname="rei"&&enemy,stateno=195&&enemy,time=24)
trigger10=enemy,authorname="KAZ"&&((enemy,name="Blue Eyes White Karin"&&enemy,time=10&&(enemy,stateno=[195,196]))||(enemy,name="Master Sakura"&&enemy,stateno=195&&enemy,time=15))
trigger11=enemy,authorname="SAIKEI"&&enemy,stateno=780&&((enemy,time=17&&(enemy,name="KENSHIRO-SAIKEI"||enemy,name="KENSHIRO"))||(enemy,name="THOUTHER"&&enemy,time=50)||(enemy,name="JUDA"&&enemy,time=1))
trigger12=enemy,authorname="simotsuki"&&enemy,stateno=195&&((enemy,name="A-Rei"&&enemy,time=16)||(enemy,name="saint-of-silver"&&enemy,time=17))
trigger13=enemy,stateno=195&&enemy,time=18&&((enemy,name="Mei"&&enemy,authorname="霊柩なき者")||(enemy,name="Hong Meirin"&&enemy,authorname="hato")||(enemy,name="RAOH"&&enemy,authorname="shikkoku"))
trigger14=enemy,stateno=195&&((enemy,time=18&&((enemy,name="RAOH ATL"&&enemy,authorname="Ataru")||(enemy,name="Raoh"&&enemy,authorname="Bat")))||(enemy,name="SHYU"&&enemy,authorname="Fixxxer"&&enemy,time=60))
trigger15=enemy,stateno=195&&enemy,time=5&&((enemy,name="zeroko"&&enemy,authorname="FenNes&5667&チユリ&エス")||(enemy,name="MegaMari"&&enemy,authorname="RockMARISA"))
trigger16=enemy,stateno=195&&((enemy,name="ikusan"&&enemy,authorname="ikusan"&&enemy,time=40)||(enemy,name="Shuh"&&enemy,authorname="Fixxxer+Ts"&&enemy,time=60))
trigger17=enemy,stateno=199&&((enemy,name="Buront"&&enemy,authorname="kunshomo"&&enemy,time=10)||(enemy,name="shin"&&enemy,authorname="konpeitou"&&enemy,time=30))
trigger18=enemy,stateno=199&&((enemy,name="KENSHIRO"&&enemy,authorname="Cameron"&&enemy,time=17)||(enemy,name="CHENSHIROU"&&enemy,authorname="seapon"&&enemy,time=19))
trigger19=enemy,time=10&&((enemy,name="KaLen"&&enemy,authorname="BluishCat"&&enemy,stateno=10195)||(enemy,name="shiki_tohno"&&enemy,authorname="チユリ&&エス"&&enemy,stateno=70195))
trigger20=(enemy,name="Hong Meilin"&&enemy,authorname="barai"&&enemy,stateno=185&&enemy,time=30)||(enemy,name="amiba"&&enemy,authorname="oki"&&enemy,stateno=19911&&enemy,time=1)
trigger21=enemy,name="Arima_Miyako"&&enemy,authorname="deretun"&&enemy,stateno=8190&&enemy,time=35
trigger22=enemy,stateno=195&&((enemy,name="MAMIYA"&&enemy,authorname="YU-TOHARU"&&enemy,time=30)||(enemy,name="Order_Sol_Fist_of_North_Star"&&enemy,authorname="flowrallia"&&enemy,time=10))
V = 10
Value = (Var(10) | 131072)
ignorehitpause=1

[state ]
type=Varset
triggerall=numenemy>=2&&alive
trigger1=enemy(1),authorname="Drowin hokuto"&&((enemy(1),stateno=199&&((enemy(1),name="KENSHIRO"&&enemy(1),time=19)||(enemy(1),name="Toki"&&enemy(1),time=17)))||(enemy(1),name="amiba"&&enemy(1),stateno=19911&&enemy(1),time=1))
trigger2=enemy(1),authorname="Ahuron"&&enemy(1),stateno=199&&((enemy(1),name="JAGI"&&enemy(1),time=80)||(enemy(1),name="SHIN"&&enemy(1),time=30)||(enemy(1),name="Heart&Heart"&&enemy(1),time=24))
trigger3=enemy(1),authorname="Ahuron"&&enemy(1),stateno=199&&((enemy(1),name="REI"&&enemy(1),time=16)||(enemy(1),name="THOUTHER"&&enemy(1),time=50))
trigger4=enemy(1),authorname="NERICYA"&&((enemy(1),name="JUDA-(NERICYA)"&&enemy(1),stateno=195&&enemy(1),time=1)||(enemy(1),name="TOKI-(NERICYA)"&&enemy(1),stateno=333&&enemy(1),time=17))
trigger5=enemy(1),authorname="Ts"&&enemy(1),stateno=195&&((enemy(1),time=80&&(enemy(1),name="Jagi"||enemy(1),name="JagiMeirin"))||(enemy(1),time=17&&(enemy(1),name="Toki"||enemy(1),name="Amiba")))
trigger6=enemy(1),authorname="Tamago Kanten"&&enemy(1),stateno=195&&((enemy(1),time=40&&enemy(1),name="ikusan_juda")||(enemy(1),time=50&&(enemy(1),name="tenshi"||enemy(1),name="tenshi_rei")))
trigger7=enemy(1),authorname="Nachel_Arrange_By_RockMARISA"&&((enemy(1),name="HAKUREI"&&enemy(1),stateno=195&&enemy(1),time=35)||(enemy(1),name="TELETTE"&&enemy(1),stateno=10195&&enemy(1),time=15))
trigger8=enemy(1),authorname="shuu"&&enemy(1),stateno=333&&((enemy(1),name="TEOC REISEN"&&enemy(1),time=40)||(enemy(1),name="TOKI_S"&&enemy(1),time=17)||(enemy(1),name="Chiester410_S"&&enemy(1),time=1))
trigger9=(enemy(1),name="REIsen U Inaba"&&enemy(1),authorname="shuu"&&enemy(1),stateno=199&&enemy(1),time=16)||(enemy(1),name="Mr.HEART"&&enemy(1),authorname="rei"&&enemy(1),stateno=195&&enemy(1),time=24)
trigger10=enemy(1),authorname="KAZ"&&((enemy(1),name="Blue Eyes White Karin"&&enemy(1),time=10&&(enemy(1),stateno=[195,196]))||(enemy(1),name="Master Sakura"&&enemy(1),stateno=195&&enemy(1),time=15))
trigger11=enemy(1),authorname="SAIKEI"&&enemy(1),stateno=780&&((enemy(1),time=17&&(enemy(1),name="KENSHIRO-SAIKEI"||enemy(1),name="KENSHIRO"))||(enemy(1),name="THOUTHER"&&enemy(1),time=50)||(enemy(1),name="JUDA"&&enemy(1),time=1))
trigger12=enemy(1),authorname="simotsuki"&&enemy(1),stateno=195&&((enemy(1),name="A-Rei"&&enemy(1),time=16)||(enemy(1),name="saint-of-silver"&&enemy(1),time=17))
trigger13=enemy(1),stateno=195&&enemy(1),time=18&&((enemy(1),name="Mei"&&enemy(1),authorname="霊柩なき者")||(enemy(1),name="Hong Meirin"&&enemy(1),authorname="hato")||(enemy(1),name="RAOH"&&enemy(1),authorname="shikkoku"))
trigger14=enemy(1),stateno=195&&((enemy(1),time=18&&((enemy(1),name="RAOH ATL"&&enemy(1),authorname="Ataru")||(enemy(1),name="Raoh"&&enemy(1),authorname="Bat")))||(enemy(1),name="SHYU"&&enemy(1),authorname="Fixxxer"&&enemy(1),time=60))
trigger15=enemy(1),stateno=195&&enemy(1),time=5&&((enemy(1),name="zeroko"&&enemy(1),authorname="FenNes&5667&チユリ&エス")||(enemy(1),name="MegaMari"&&enemy(1),authorname="RockMARISA"))
trigger16=enemy(1),stateno=195&&((enemy(1),name="ikusan"&&enemy(1),authorname="ikusan"&&enemy(1),time=40)||(enemy(1),name="Shuh"&&enemy(1),authorname="Fixxxer+Ts"&&enemy(1),time=60))
trigger17=enemy(1),stateno=199&&((enemy(1),name="Buront"&&enemy(1),authorname="kunshomo"&&enemy(1),time=10)||(enemy(1),name="shin"&&enemy(1),authorname="konpeitou"&&enemy(1),time=30))
trigger18=enemy(1),stateno=199&&((enemy(1),name="KENSHIRO"&&enemy(1),authorname="Cameron"&&enemy(1),time=17)||(enemy(1),name="CHENSHIROU"&&enemy(1),authorname="seapon"&&enemy(1),time=19))
trigger19=enemy(1),time=10&&((enemy(1),name="KaLen"&&enemy(1),authorname="BluishCat"&&enemy(1),stateno=10195)||(enemy(1),name="shiki_tohno"&&enemy(1),authorname="チユリ&&エス"&&enemy(1),stateno=70195))
trigger20=(enemy(1),name="Hong Meilin"&&enemy(1),authorname="barai"&&enemy(1),stateno=185&&enemy(1),time=30)||(enemy(1),name="amiba"&&enemy(1),authorname="oki"&&enemy(1),stateno=19911&&enemy(1),time=1)
trigger21=enemy(1),name="Arima_Miyako"&&enemy(1),authorname="deretun"&&enemy(1),stateno=8190&&enemy(1),time=35
trigger22=enemy(1),stateno=195&&((enemy(1),name="MAMIYA"&&enemy(1),authorname="YU-TOHARU"&&enemy(1),time=30)||(enemy(1),name="Order_Sol_Fist_of_North_Star"&&enemy(1),authorname="flowrallia"&&enemy(1),time=10))
V = 10
Value = (Var(10) | 131072)
ignorehitpause=1

[state ]
Type=PowerAdd
trigger1=(Var(10) & 131072)
Value=1000
ignorehitpause=1

;[state ];特殊ゲージ加算用
;type=Varadd
;trigger1=(Var(10) & 131072)
;var(○)=○
;ignorehitpause=1

[state ]
type=Varset
trigger1=(Var(10) & 131072)
V = 10
Value = (Var(10) | 131072) - 131072
ignorehitpause=1

;-------------------------------------------------------------------------
;---------------------[ニトロワキャラ製作者各位]
;ニトロワキャラ「挑発」対応ステート
[state ]
Type=PowerAdd
triggerall=numenemy&&alive
trigger1=enemy,authorname="kayui uma"&&enemy,stateno=690&&((enemy,name="mora"&&enemy,time=40)||(enemy,name="ruili"&&enemy,time=23)||(enemy,name="saya"&&enemy,time=18)||(enemy,name="henri"&&enemy,time=60))
trigger2=enemy,authorname="Juke Kisaragi"&&((enemy,stateno=195&&enemy,time=50&&(enemy,name="Ein"||enemy,name="Nitro Ignis"))||(enemy,name="Saber"&&(enemy,stateno=[195,196])&&enemy,time=45))
trigger3=enemy,stateno=195&&((enemy,name="dragon"&&enemy,authorname="kayui uma"&&enemy,time=26)||(enemy,time=95&&enemy,name="Another Blood"&&(enemy,authorname="sakuraka"||enemy,authorname="AkagiK")))
trigger4=(enemy,name="anna"&&enemy,authorname="kayui uma"&&enemy,stateno=690&&enemy,time=50)||(enemy,name="Kaigen Ishima"&&((enemy,stateno=195&&enemy,time=60)||(enemy,stateno=199&&enemy,time=20)))
trigger5=enemy,name="Taoroh"&&enemy,authorname="Elecbyte"&&enemy,stateno=195&&enemy,time=23
trigger6=enemy,authorname="YU-TOHARU"&&((enemy,name="AIHARA NATSUMI"&&enemy,stateno=197&&enemy,time=70)||(enemy,name="AL AZIF"&&enemy,stateno=195&&enemy,time=30))
Value=-45
ignorehitpause=1

[state ]
Type=PowerAdd
triggerall=numenemy>=2&&alive
trigger1=enemy(1),authorname="kayui uma"&&enemy(1),stateno=690&&((enemy(1),name="mora"&&enemy(1),time=40)||(enemy(1),name="ruili"&&enemy(1),time=23)||(enemy(1),name="saya"&&enemy(1),time=18)||(enemy(1),name="henri"&&enemy(1),time=60))
trigger2=enemy(1),authorname="Juke Kisaragi"&&((enemy(1),stateno=195&&enemy(1),time=50&&(enemy(1),name="Ein"||enemy(1),name="Nitro Ignis"))||(enemy(1),name="Saber"&&(enemy(1),stateno=[195,196])&&enemy(1),time=45))
trigger3=enemy(1),stateno=195&&((enemy(1),name="dragon"&&enemy(1),authorname="kayui uma"&&enemy(1),time=26)||(enemy(1),time=95&&enemy(1),name="Another Blood"&&(enemy(1),authorname="sakuraka"||enemy(1),authorname="AkagiK")))
trigger4=(enemy(1),name="anna"&&enemy(1),authorname="kayui uma"&&enemy(1),stateno=690&&enemy(1),time=50)||(enemy(1),name="Kaigen Ishima"&&((enemy(1),stateno=195&&enemy(1),time=60)||(enemy(1),stateno=199&&enemy(1),time=20)))
trigger5=enemy(1),name="Taoroh"&&enemy(1),authorname="Elecbyte"&&enemy(1),stateno=195&&enemy(1),time=23
trigger6=enemy(1),authorname="YU-TOHARU"&&((enemy(1),name="AIHARA NATSUMI"&&enemy(1),stateno=197&&enemy(1),time=70)||(enemy(1),name="AL AZIF"&&enemy(1),stateno=195&&enemy(1),time=30))
Value=-45
ignorehitpause=1

;-------------------------------------------------------------------------
;---------------------[586さん]
; Curse Damage for Misuzu Kamio

[State -2, LifeAdd]
type = LifeAdd
triggerall = (Enemy,TeamMode = Simul) = 0
triggerall = (TeamMode = Simul) = 0
triggerall = NumEnemy
triggerall = Enemy,AuthorName = "586"
triggerall = Enemy,Name = "Misuzu Kamio"
triggerall = Enemy,fvar(11) > 0
trigger1 = Enemy,var(13) = 1
trigger1 = GameTime % 13 = 0
trigger2 = Enemy,var(13) = 2
trigger2 = GameTime % 11 = 0
trigger3 = Enemy,var(13) = 3
trigger3 = GameTime % 8 = 0
trigger4 = Enemy,var(13) = 4
trigger4 = GameTime % 6 = 0
trigger5 = Enemy,var(13) = 5
trigger5 = GameTime % 3 = 0
value = -1
kill = 0
ignorehitpause = 1

[State -2, PalFX]
type = PalFX
triggerall = (Enemy,TeamMode = Simul) = 0
triggerall = (TeamMode = Simul) = 0
triggerall = NumEnemy
triggerall = Enemy,AuthorName = "586"
triggerall = Enemy,Name = "Misuzu Kamio"
trigger1 = Enemy,fvar(11) > 0
add = -50,150,150
time = 1
ignorehitpause = 1

;-------------------------------------------------------------------------
;---------------------[HALさん]
;獣を焦がす(黒秋葉)　相手ステータス変化
[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "tukemon&HAL" && Enemy,Name = "Akiha"
Trigger1 = Enemy,Var(56) = 1
Value = -8
Absolute = 1
Kill = 0

[State -2]
Type = PowerAdd
TriggerAll = Enemy,AuthorName = "tukemon&HAL" && Enemy,Name = "Akiha"
Trigger1 = Enemy,Var(51)%10 = 2
Trigger1 = Enemy,Var(56) = 1
Value = -33

;-------------------------------------------------------------------------
;---------------------[chikuchikugonzalezさん]
; 獣を焦がす対応
[State -2:          Life]
type       = LifeAdd
triggerall = !IsHelper                  ; 本体限定
triggerall = RoundState = 2 && Alive    ; 試合中 かつ 生きている
triggerall = StateType != A             ; 地上にいる
triggerall = GameTime % 3 = 0           ; 3Fおきに処理
triggerall = NumEnemy                   ; 敵がいる
trigger1   = Enemy(0),AuthorName = "chikuchikugonzalez" && Enemy(0),Name = "Tohno Akiha"        ; 1P (or 2P) が秋葉
trigger1   = Enemy(0),var(39) >= 0                                                              ; IDが格納されている (格納されていない場合は -1)
trigger1   = PlayerIDExist(Enemy(0),var(39))                                                    ; 格納IDのキャラクター or Helperが存在する
trigger1   = Abs(PlayerID(Enemy(0),var(39)),Pos X - Pos X) < (85 * PlayerID(Enemy(0),var(39)),const(size.xscale))       ; 相手の前後85以内
trigger2   = NumEnemy > 1                                                                       ; 相手がタッグ
trigger2   = Enemy(1),AuthorName = "chikuchikugonzalez" && Enemy(1),Name = "Tohno Akiha"        ; 3P (or 4P) が秋葉
trigger2   = Enemy(1),var(39) >= 0                                                              ; IDが格納されている
trigger2   = PlayerIDExist(Enemy(1),var(39))                                                    ; 格納IDのキャラクター or Helperが存在する
trigger2   = Abs(PlayerID(Enemy(1),var(39)),Pos X - Pos X) < (85 * PlayerID(Enemy(1),var(39)),const(size.xscale))       ; 相手の前後85以内
value      = -1
kill       = 0

[State -2:          Power]
type       = PowerAdd
triggerall = !IsHelper
triggerall = RoundState = 2 && Alive
triggerall = StateType != A
triggerall = GameTime % 2 = 0
triggerall = NumEnemy
trigger1   = Enemy(0),AuthorName = "chikuchikugonzalez" && Enemy(0),Name = "Tohno Akiha"
trigger1   = Enemy(0),var(39) >= 0
trigger1   = PlayerIDExist(Enemy(0),var(39))
trigger1   = Abs(PlayerID(Enemy(0),var(39)),Pos X - Pos X) < (85 * PlayerID(Enemy(0),var(39)),const(size.xscale))
trigger2   = NumEnemy > 1
trigger2   = Enemy(1),AuthorName = "chikuchikugonzalez" && Enemy(1),Name = "Tohno Akiha"
trigger2   = Enemy(1),var(39) >= 0
trigger2   = PlayerIDExist(Enemy(1),var(39))
trigger2   = Abs(PlayerID(Enemy(1),var(39)),Pos X - Pos X) < (85 * PlayerID(Enemy(1),var(39)),const(size.xscale))
value      = Floor(-1 * (PowerMax * 0.001))

;-------------------------------------------------------------------------
;---------------------[⑨さん]
;略奪/獣を焦がす/獣を窮める　相手用
[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Akiha_Vermilion"
Trigger1 = Enemy,Var(47) = 1
Value = -7
Absolute = 1
Kill = 0

[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Akiha_Vermilion"
Trigger1 = Enemy,Var(48) = 1 && Enemy,NumExplod(4005)
Value = -7
Absolute = 1
Kill = 0

[State -2]
Type = PowerAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Akiha_Vermilion"
Trigger1 = Enemy,Var(47) = 1
Value = -26

;---------------------------------------------------------------------------
;パウダースノウ　相手用
[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Len"
Trigger1 = Enemy,Var(47) = 1 || Enemy,Var(48) = 1
Value = -Enemy,Var(47)*4-Enemy,Var(48)*4
Absolute = 1
Kill = 0

;---------------------------------------------------------------------------
;じょうろ　相手用
[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Hisui"
Trigger1 = Enemy,Var(47) = 1
Value = -10
Absolute = 1
Kill = 0

[State -2]
Type = PowerAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Hisui"
Trigger1 = Enemy,Var(47) = 1
Value = -135

;---------------------------------------------------------------------------
;超がんばりました　相手用
[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Hisui"
Trigger1 = Enemy,Var(48) = 1
Value = IfElse(GameTime%2=0,-3,-4)
Absolute = 1
Kill = 0

;---------------------------------------------------------------------------
;ブラック・クラック　相手用
[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Warachia"
Trigger1 = Enemy,Var(47) = 1
Value = -10
Absolute = 1
Kill = 0

[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Warachia"
Trigger1 = Enemy,Var(47) = 2 || Enemy,Var(47) = 4
Value = -15
Absolute = 1
Kill = 0

[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Warachia"
Trigger1 = Enemy,Var(47) = 3
Value = -30
Absolute = 1
Kill = 0

[State -2]
Type = PowerAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Warachia"
Trigger1 = Enemy,Var(47) = 1
Value = 6

[State -2]
Type = PowerAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Warachia"
Trigger1 = Enemy,Var(47) = 2 || Enemy,Var(47) = 3 || Enemy,Var(47) = 4
Value = 15

;---------------------------------------------------------------------------
;現代医学の犠牲者です。　相手用
[State -2]
Type = LifeAdd
TriggerAll = Enemy,AuthorName = "⑨" && Enemy,Name = "Kohaku"
Trigger1 = Enemy,Var(47) = 1
Value = IfElse(GameTime%2=0,-3,-4)
Absolute = 1
Kill = 0

;-------------------------------------------------------------------------
;---------------------[水影さん]
;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;_/_/_/                 ■脱魂の儀 制御                          _/_/_/
;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;振り向き抑制
[State pos moving]
type = AssertSpecial
Triggerall = (Enemynear,Name = "Komachi Onoduka")*(Enemynear,AuthorName = "mikage_th")*(TeamMode = single)
trigger1 = (enemynear,stateno = 820)*(enemynear,anim = 823)*(enemynear,animelem = 6,13)
trigger2 = (enemynear,stateno = 821)*(enemynear,anim = 823)*(enemynear,animelem = 6,43)
flag = noautoturn

;移動
[State pos moving]
type = Posadd
Triggerall = (Enemynear,Name = "Komachi Onoduka")*(Enemynear,AuthorName = "mikage_th")*(TeamMode = single)
trigger1 = (enemynear,stateno = 820)*(enemynear,anim = 823)*(enemynear,animelem = 6,13)
trigger2 = (enemynear,stateno = 821)*(enemynear,anim = 823)*(enemynear,animelem = 6,43)
x = -ceil(enemynear,fVar(36))*facing*enemynear,facing
y = -ceil(enemynear,fVar(37))*(statetype!=L)

;statetype!=A+statetype!=Lの場合強制落下stateへ
[State pos moving]
type = Changestate
Triggerall = (Enemynear,Name = "Komachi Onoduka")*(Enemynear,AuthorName = "mikage_th")*(TeamMode = single)
Triggerall = (statetype != A)*(pos y!=0)*(statetype!=L)
trigger1 = (enemynear,stateno = 820)*(enemynear,anim = 823)*(enemynear,animelem = 6,13)
trigger2 = (enemynear,stateno = 821)*(enemynear,anim = 823)*(enemynear,animelem = 6,43)
value = 50

;--------------------------------------------------------------

;振り向き抑制
[State pos moving]
type = AssertSpecial
Triggerall = (Enemynear,Name = "Komachi Onoduka")*(Enemynear,AuthorName = "mikage_th105")*(TeamMode = single)
trigger1 = (enemynear,stateno = 820)*(enemynear,anim = 823)*(enemynear,animelem = 6,13)
trigger2 = (enemynear,stateno = 821)*(enemynear,anim = 823)*(enemynear,animelem = 6,43)
flag = noautoturn

;移動
[State pos moving]
type = Posadd
Triggerall = (Enemynear,Name = "Komachi Onoduka")*(Enemynear,AuthorName = "mikage_th105")*(TeamMode = single)
trigger1 = (enemynear,stateno = 820)*(enemynear,anim = 823)*(enemynear,animelem = 6,13)
trigger2 = (enemynear,stateno = 821)*(enemynear,anim = 823)*(enemynear,animelem = 6,43)
x = -ceil(enemynear,fVar(24))*facing*enemynear,facing
y = -ceil(enemynear,fVar(25))*(statetype!=L)

;statetype!=A+statetype!=Lの場合強制落下stateへ
[State pos moving]
type = Changestate
Triggerall = (Enemynear,Name = "Komachi Onoduka")*(Enemynear,AuthorName = "mikage_th105")*(TeamMode = single)
Triggerall = (statetype != A)*(pos y!=0)*(statetype!=L)
trigger1 = (enemynear,stateno = 820)*(enemynear,anim = 823)*(enemynear,animelem = 6,13)
trigger2 = (enemynear,stateno = 821)*(enemynear,anim = 823)*(enemynear,animelem = 6,43)
value = 50

;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;_/_/_/                 ■毒煙幕「瓦斯織物の玉」 制御                        _/_/_/
;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
[State lifeadd]
type = lifeadd
Trigger1 = numEnemy = 1
Trigger1 = Pos y > -240
Trigger1 = (Enemy(0),Name = "Reisen Udongein Inaba")*(Enemy(0),AuthorName = "mikage_th105")*(Enemy(0),fvar(21))
value = -floor(Enemy(0),fvar(21))*2
ignorehitpause = 1
absolute = 1
kill = 0

[State lifeadd]
type = lifeadd
Triggerall = numEnemy = 2
Triggerall = Pos y > -240
Trigger1 = (Enemy(0),Name = "Reisen Udongein Inaba")*(Enemy(0),AuthorName = "mikage_th105")*(Enemy(0),fvar(21))
Trigger2 = (Enemy(1),Name = "Reisen Udongein Inaba")*(Enemy(1),AuthorName = "mikage_th105")*(Enemy(1),fvar(21))
value = -floor(Enemy(0),fvar(21))*2-floor(Enemy(1),fvar(21))*2
ignorehitpause = 1
absolute = 1
kill = 0

;--------------------------------------------------------------

[State lifeadd]
type = lifeadd
Trigger1 = numEnemy = 1
Trigger1 = Pos y > -240
Trigger1 = (Enemy(0),Name = "Reisen Udongein Inaba")*(Enemy(0),AuthorName = "mikage_th")*(Enemy(0),fvar(35))
value = -floor(Enemy(0),fvar(35))*2
ignorehitpause = 1
absolute = 1
kill = 0

[State lifeadd]
type = lifeadd
Triggerall = numEnemy = 2
Triggerall = Pos y > -240
Trigger1 = (Enemy(0),Name = "Reisen Udongein Inaba")*(Enemy(0),AuthorName = "mikage_th")*(Enemy(0),fvar(35))
Trigger2 = (Enemy(1),Name = "Reisen Udongein Inaba")*(Enemy(1),AuthorName = "mikage_th")*(Enemy(1),fvar(35))
value = -floor(Enemy(0),fvar(35))*2-floor(Enemy(1),fvar(35))*2
ignorehitpause = 1
absolute = 1
kill = 0

;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;_/_/_/           ■土着神の祟り & ミシャグジさまの祟り 制御                 _/_/_/
;_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;土着神の祟り
[State lifeadd]
type = lifeadd
Trigger1 = numEnemy
Trigger1 = (Enemynear,Name = "Suwako Moriya")*(Enemynear,AuthorName = "mikage_th")*(TeamMode = single)
Trigger1 = floor((Enemynear,Var(42)%100)*0.1) = [0,1]
Trigger1 = (floor(Enemynear,fvar(38)))%1000 > 0
Trigger1 = floor(Enemynear,fvar(38)*0.001) = 2
value = floor(Enemynear,fvar(36)*(LifeMax/10000.000000))
ignorehitpause = 1
absolute = 1
kill = 0

[State ミシャグジさまの祟り]
type = lifeadd
Triggerall = numEnemy
Triggerall = (Enemynear,Name = "Suwako Moriya")*(Enemynear,AuthorName = "mikage_th")*(TeamMode = single)
trigger1 = floor(Enemynear,fvar(35)) = 1
Trigger1 = movetype = H
Trigger1 = stateno != [150,155]
trigger2 = floor(Enemynear,fvar(35)) = 2
Trigger2 = movetype = H
Trigger2 = stateno = [150,155]
value = floor(Enemynear,fvar(33))
ignorehitpause = 1
absolute = 1
kill = 0

;-------------------------------------------------------------------------
;---------------------[祇園城 奏貴さん]
;====================================================================================================
;■西行寺幽々子　霊符及び寿命相手ステート
;====================================================================================================
[State -2, LifeAdd]
Type       = LifeAdd
TriggerAll = NumEnemy           >= 1
TriggerAll = Enemy,AuthorName    = "Souki" && Enemy,Name   = "Yuyuko Saigyouji"
Trigger1   = Enemy,Var(3)        = 1       || Enemy,Var(3) = 2
Trigger1   = GameTime%6          = 0
Value      = IfElse(Enemy,Var(3) = 1, -2, -3)
Kill       = 0

;-------------------------------------------------------------------------
;---------------------[ティーフさん]
;==============================================================================
; ユグドラシル
;==============================================================================

[State -2];回復
type = LifeAdd
triggerall = NumPartner >= 1
triggerall = (Partner,Name = "Ferir" && Partner,NumHelper(3200) = 1)
triggerall = Alive
triggerall = RoundState = 2
trigger1 = ceil(GameTime%2) = 1
value = ifelse(Life <= 100,2,1)
absolute = 1
ignorehitpause = 1

;-------------------------------------------------------------------------
;---------------------[IFさん]
;のぞみんウィッシュプライヤー
[State -2]
Type = LifeAdd
Trigger1 = numpartner = 1
Trigger1 = partner,AuthorName = "IF" && partner,Name = "Nozomi Nagamine"
Trigger1 = partner,Var(44) = 1
Trigger1 = alive = 1
Value = ceil(lifemax*.9)

;-------------------------------------------------------------------------
;---------------------[dknさん]
;シャルロット「ヒールライト」対応ステート

[State -2, シャルロットのヒールライト連動：ヒールライトレベル1]
type = Lifeadd
value = Ceil(LifeMax*0.2)
triggerall = teammode = simul
triggerall = partner,name = "CharlotteSD" && partner,authorname = "dkn"
triggerall = (partner,PalNo = [1,3]) || (partner,PalNo = [8,11])
triggerall = Alive
triggerall = numpartner
triggerall = (partner,stateno = 0) && (partner,prevstateno = 3051)
trigger1 = partner,time = 2
ignorehitpause = 1

[State -2, シャルロットのヒールライト連動：ヒールライトレベル2]
type = Lifeadd
value = Ceil(LifeMax*0.3)
triggerall = teammode = simul
triggerall = Alive
triggerall = numpartner
triggerall = partner,name = "CharlotteSD" && partner,authorname = "dkn"
triggerall = partner,PalNo = [4,7]
trigger1 = (partner,stateno = 0) && (partner,prevstateno = 3051)
trigger1 = partner,time = 2
ignorehitpause = 1

;シャルロットのヒールライト連動：ヒールライトレベル3
[State -2, ]
type = Lifeadd
value = (lifemax)
triggerall = teammode = simul
triggerall = Alive
triggerall = numpartner
triggerall = partner,name = "CharlotteSD" && partner,authorname = "dkn"
triggerall = partner,PalNo = 12
trigger1 = (partner,stateno = 0) && (partner,prevstateno = 3051)
trigger1 = partner,time = 2
ignorehitpause = 1

[State -2, シャルロットのヒールライト連動：偽物]
type = Helper
triggerall = teammode = simul
triggerall = Alive
triggerall = numpartner
triggerall = partner,name = "CharlotteSD" && partner,authorname = "dkn"
triggerall = partner,numhelper(3002)
trigger1 = numhelper(19858) = 0
id = 19858
name = "charheal"
sprpriority = 1
pos = 0,0
postype = p1
stateno = 19858
helpertype = normal
supermovetime = 999999
keyctrl = 0
ownpal = 1
ignorehitpause = 1

[State -2, シャルロットのヒールライト連動：透明]
type = trans
triggerall = teammode = simul
triggerall = partner,name = "CharlotteSD" && partner,authorname = "dkn"
triggerall = Alive
triggerall = numpartner
triggerall = partner,stateno = 3001 || partner,stateno = 3051
trigger1 = partner,numhelper(3002)
trans = addalpha
alpha = -256,256
ignorehitpause = 1

[State -2, シャルロットのヒールライト連動：保険]
type = NotHitBy
triggerall = teammode = simul
triggerall = partner,name = "CharlotteSD" && partner,authorname = "dkn"
triggerall = Alive
triggerall = numpartner
trigger1 = numhelper(19858)
value = SCA
ignorehitpause = 1

;-------------------------------------------------------------------------
;---------------------[Iwakickさん]
[state a];Iwakick's_Vega_tagwin
type=Explod
trigger1=numpartner
trigger1=partner,authorname = "iwakick"
trigger1=partner,name = "Vega"
trigger1=partner,stateno = 185
trigger1=partner,time = 92
trigger1=!numexplod(100185)
ID=100185
postype=right
ownpal=1
bindtime=-1
removetime=-1
;--------------
scale = 0.5,0.5;任意
anim = 9003;任意
pos = -180,30;任意
sprpriority = 55;任意(55でベガが後方表示53でベガが前面表示)

[state a];Iwakick's_tagwin
type=Explod
trigger1=numpartner
trigger1=partner,authorname = "iwakick"
trigger1=partner,AnimExist(28000)
trigger1=partner,stateno = 185
trigger1=partner,time = 92
trigger1=!numexplod(100185)
ID=100185
postype=right
ownpal=1
bindtime=-1
removetime=-1
;--------------
scale = 0.5,0.5;任意
anim = 9003;任意
pos = -180,30;任意
sprpriority = 55;任意(55でパートナー後方表示53でパートナーが前面表示)
;--------------

;-------------------------------------------------------------------------
;---------------------[KAZさん]
; 対世紀末ガイル敗北顔表示 (1P側)
[State -2]
Type = Explod
TriggerAll = MatchOver
TriggerAll = EnemyNear,AuthorName = "KAZ"
TriggerAll = EnemyNear,Name = "Seikimatu Guile" || EnemyNear,Name = "SF2 Guile"
TriggerAll = EnemyNear,StateNo = 18000
TriggerAll = EnemyNear,Time = 30
TriggerAll = Alive = 0 || Lose
TriggerAll = TeamSide = 1
Trigger1 = !NumPartner
Trigger2 = NumPartner
Trigger2 = Partner,Name != "Seikimatu Guile" && Partner,Name != "SF2 Guile"
Trigger3 = NumPartner
Trigger3 = Partner,Name = "Seikimatu Guile" || Partner,Name = "SF2 Guile"
Trigger3 = ID < Partner,ID
Anim = 18001;←アニメ番号は任意で決めてください。
ID = 18000;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 10,164
PosType = Left
Facing = -1
SprPriority = 99995
OwnPal = 1
ReMoveTime = 1200

; 対世紀末ガイル敗北顔表示 (2P側)
[State -2]
Type = Explod
TriggerAll = MatchOver
TriggerAll = EnemyNear,AuthorName = "KAZ"
TriggerAll = EnemyNear,Name = "Seikimatu Guile" || EnemyNear,Name = "SF2 Guile"
TriggerAll = EnemyNear,StateNo = 18000
TriggerAll = EnemyNear,Time = 30
TriggerAll = Alive = 0 || Lose
TriggerAll = TeamSide = 2
Trigger1 = !NumPartner
Trigger2 = NumPartner
Trigger2 = Partner,Name != "Seikimatu Guile" && Partner,Name != "SF2 Guile"
Trigger3 = NumPartner
Trigger3 = Partner,Name = "Seikimatu Guile" || Partner,Name = "SF2 Guile"
Trigger3 = ID < Partner,ID
Anim = 18001;←アニメ番号は任意で決めてください。
ID = 18000;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -9,164
PosType = Right
Facing = 1
SprPriority = 99995
OwnPal = 1
ReMoveTime = 1200

; 対チュンリー敗北顔表示 (1P側)
[State -2]
Type = Explod
TriggerAll = MatchOver
TriggerAll = EnemyNear,AuthorName = "KAZ"
TriggerAll = EnemyNear,Name = "Chunli_Sf3_Marvel"
TriggerAll = EnemyNear,StateNo = [18100,18101]
TriggerAll = EnemyNear,Time = 30
TriggerAll = Alive = 0 || Lose
TriggerAll = TeamSide = 1
Trigger1 = !NumPartner
Trigger2 = NumPartner
Trigger2 = Partner,Name != "Chunli_Sf3_Marvel"
Trigger3 = NumPartner
Trigger3 = Partner,Name = "Chunli_Sf3_Marvel"
Trigger3 = ID < Partner,ID
Anim = 18001;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 11,164
PosType = Left
Facing = -1
SprPriority = 99995
OwnPal = 1
ReMoveTime = 1200

; 対チュンリー敗北顔表示 (2P側)
[State -2]
Type = Explod
TriggerAll = MatchOver
TriggerAll = EnemyNear,AuthorName = "KAZ"
TriggerAll = EnemyNear,Name = "Chunli_Sf3_Marvel"
TriggerAll = EnemyNear,StateNo = [18100,18101]
TriggerAll = EnemyNear,Time = 30
TriggerAll = Alive = 0 || Lose
TriggerAll = TeamSide = 2
Trigger1 = !NumPartner
Trigger2 = NumPartner
Trigger2 = Partner,Name != "Chunli_Sf3_Marvel"
Trigger3 = NumPartner
Trigger3 = Partner,Name = "Chunli_Sf3_Marvel"
Trigger3 = ID < Partner,ID
Anim = 18001;←アニメ番号は任意で決めてください。
ID = 18100;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -10,164
PosType = Right
Facing = 1
SprPriority = 99995
OwnPal = 1
ReMoveTime = 1200

;ストIII(1st･2nd) 敗北グラフィック表示(1P側)
[State -2]
Type = Explod
TriggerAll = Alive = 0 || Lose
TriggerAll = MatchOver
TriggerAll = EnemyNear,TeamSide = 1
TriggerAll = EnemyNear,Time = 29
TriggerAll = EnemyNear,AuthorName = "KAZ"
Trigger1 = EnemyNear,Name = "Ryu_Sf3_Marvel"
Trigger1 = EnemyNear,StateNo = 18000
Trigger2 = EnemyNear,Name = "Ken_Sf3_Marvel"
Trigger2 = EnemyNear,StateNo = 18000
Trigger3 = EnemyNear,Name = "Sean_Sf3_Marvel"
Trigger3 = EnemyNear,StateNo = 18000
Trigger4 = EnemyNear,Name = "Elena_Sf3_Marvel"
Trigger4 = EnemyNear,StateNo = 18000
Trigger5 = EnemyNear,Name = "Chunli_Sf3_Marvel"
Trigger5 = EnemyNear,StateNo = 18000
Trigger6 = EnemyNear,Name = "Master Sakura"
Trigger6 = EnemyNear,StateNo = 18000
Trigger7 = EnemyNear,Name = "Blue Eyes White Karin"
Trigger7 = EnemyNear,StateNo = 18001
Trigger8 = EnemyNear,Name = "Seikimatu Guile"
Trigger8 = EnemyNear,StateNo = 18100
Anim = 9410;←アニメ番号は任意で決めてください。
ID = 9400;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = 160,180+(IfElse(EnemyNear,Name="Seikimatu Guile",10,0))
PosType = Left
SprPriority = 99995
OwnPal = 1
Facing = 1
ReMoveTime = 1200
PauseMoveTime = 2147483647
SuperMoveTime = 2147483647
IgnoreHitPause = 1 

; ストIII(1st･2nd) 敗北グラフィック表示(2P側)
[State -2]
Type = Explod
TriggerAll = Alive = 0 || Lose
TriggerAll = MatchOver
TriggerAll = EnemyNear,TeamSide = 2
TriggerAll = EnemyNear,Time = 29
TriggerAll = EnemyNear,AuthorName = "KAZ"
Trigger1 = EnemyNear,Name = "Ryu_Sf3_Marvel"
Trigger1 = EnemyNear,StateNo = 18000
Trigger2 = EnemyNear,Name = "Ken_Sf3_Marvel"
Trigger2 = EnemyNear,StateNo = 18000
Trigger3 = EnemyNear,Name = "Sean_Sf3_Marvel"
Trigger3 = EnemyNear,StateNo = 18000
Trigger4 = EnemyNear,Name = "Elena_Sf3_Marvel"
Trigger4 = EnemyNear,StateNo = 18000
Trigger5 = EnemyNear,Name = "Chunli_Sf3_Marvel"
Trigger5 = EnemyNear,StateNo = 18000
Trigger6 = EnemyNear,Name = "Master Sakura"
Trigger6 = EnemyNear,StateNo = 18000
Trigger7 = EnemyNear,Name = "Blue Eyes White Karin"
Trigger7 = EnemyNear,StateNo = 18001
Trigger8 = EnemyNear,Name = "Seikimatu Guile"
Trigger8 = EnemyNear,StateNo = 18100
Anim = 9410;←アニメ番号は任意で決めてください。
ID = 9400;←アニメID番号は任意で決めてください。ただし同一IDになるように統一してください。
Pos = -160,180+(IfElse(EnemyNear,Name="Seikimatu Guile",10,0))
PosType = Right
SprPriority = 99995
OwnPal = 1
Facing = -1
ReMoveTime = 1200
PauseMoveTime = 2147483647
SuperMoveTime = 2147483647
IgnoreHitPause = 1 

;-------------------------------------------------------------------------
;---------------------[ですからーさん]
;マッスルボマーキャラ「敗北演出」対応ステート
[state ]
type=Explod
TriggerAll = Var(33) = 2
trigger1=numenemy
trigger1=!numexplod(22004)&&!alive&&lose&&roundstate=4&&matchover&&enemynear,stateno=6000&&enemynear,authorname="(^o^)"&&(enemynear,teammode=single ||enemynear,teammode=turns)
trigger1=P2name="Colt"||P2name="Astro"||P2name="Zalazof"||P2name="Taitan"||P2name="Haggar"||P2name="Saber"||P2name="wraith"||P2name="Budo"||P2name="Kimala"||P2name="Stinger"||P2name="Sheep"||P2name="Ortega"||P2name="Gomes"||P2name="Black Widow"
anim=22004
ID=22004
postype=left
pos=ifelse(teamside=1,80,240),125
facing=ifelse(teamside=1,-1,1)
ownpal=1
ontop=1
scale=0.5,0.5
bindtime=-1
removetime=-1

[state ]
type=Explod
trigger1=!numexplod(22005)&&!alive&&lose&&roundstate=4&&matchover&&numexplod(22004)
anim=22005
ID=22005
postype=left
pos=ifelse(teamside=1,80,240),125
ownpal=1
ontop=1
scale=0.5,0.5
bindtime=-1
removetime=-1

;-------------------------------------------------------------------------
;---------------------[ハロヴェリさん]
;天海春香「I Want」対応ステート
[state ]
type=ChangeAnim
trigger1=stateno=3100&&movetype=H&&anim=5300
value=76511


[state ]
type=ChangeAnim
trigger1=stateno=3100&&movetype=H&&anim=10
value=7651

[state ]
type=PlaySnd
trigger1=anim=7651&&movetype=H&&animelem=4
value=100000 + Var(33),7651
Volume = 192

;-------------------------------------------------------------------------
;---------------------[お家さん]
;アグリアスモーグリ恩恵
[State -2]
type = PalFX
triggerall = !ishelper
trigger1 = roundstate = 2
Trigger1 = numpartner = 1
Trigger1 = partner,AuthorName = "ouchi" && partner,Name = "Agrias_Oaks"
trigger1 = partner,var(25)%100 = 7
Trigger1 = alive = 1
trigger1 = partner,var(10) = 100
time = 50
add = 0,0,54
mul = 256,256,256
sinadd = 0,0,108,100
[State -2]
Type = LifeAdd
triggerall = !ishelper
trigger1 = roundstate = 2
Trigger1 = numpartner = 1
Trigger1 = partner,AuthorName = "ouchi" && partner,Name = "Agrias_Oaks"
trigger1 = partner,var(25)%100 = 7
trigger1 = partner,var(10) > 0
Trigger1 = alive = 1
Value = 1
ignorehitpause = 1

;-------------------------------------------------------------------------
;---------------------[神人豪鬼製作者各位]
;神豪鬼「禊」対応ステート
[state ]
type=ChangeAnim
triggerall=numenemy&&movetype=H&&statetype!=A
trigger1=((P2name="cvsgouki"||P2name="cvsgouki_ex")&&enemynear,authorname="Warusaki3"&&stateno=3450&&time=1)||(P2name="Shin Gouki SSF'2 Plus"&&enemynear,authorname="Guille_N_Roll"&&enemynear,stateno=3410&&(stateno=[5000,5100]))
trigger2=(P2name="Tin's S_Gouki"&&stateno=5951&&anim=5951)
value=5950

[State ]
type=selfstate
trigger1=P2name="Tin's S_Gouki"&&stateno=5951&&anim=5950&&animtime=0
value=5110

;-------------------------------------------------------------------------
;---------------------[Orochi Hermanさん]
;邪悪の化身ディオ！！「パニッシュメント」対応ステート
[state ]
type=ChangeAnim
triggerall=numenemy&&movetype=H&&statetype!=A
trigger1=P2name="Shadow DIO"&&enemynear,authorname="Orochi Herman"&&stateno=5130&&anim=5012
value=5130

[state ]
type=ChangeAnim
triggerall=numenemy&&movetype=H&&statetype!=A
trigger1=P2name="Shadow DIO"&&enemynear,authorname="Orochi Herman"&&stateno=5130&&anim=5130&&animtime=0
value=5131

[State ]
type=selfstate
trigger1=P2name="Shadow DIO"&&stateno=5130&&anim=5131&&animtime=0
value=5110

;-------------------------------------------------------------------------
;---------------------[虻蜂さん]
;天野 漂「雀刺し」対応ステート
[state ]
type=ChangeAnim
trigger1=numenemy
trigger1=enemynear,name="Hyo Amano"&&enemynear,authorname="abuhachi"&&movetype=H&&((stateno=7260&&anim=1060)||(stateno=7261&&anim=1065))
value=117261+ifelse(stateno=7261,1,0)
persistent=0

[state ]
type=selfstate
trigger1=movetype=H&&(anim=[117261,117262])&&animtime=0
value=5110

;-------------------------------------------------------------------------
;---------------------[青村さん]
;マキシマ「M11型デンジャラス・アーチ」対応ステート
[state ]
type=ChangeAnim
trigger1=numenemy
trigger1=P2name="Maxima"&&enemynear,authorname="Aomura"&&stateno=1710&&movetype=H&&time=1
value=101710

;-------------------------------------------------------------------------
;---------------------[ブラウンさん]
;リョウ・サカザキ「ＳＮＫネオジオ維新軍」対応ステート
[State ]
type=explod
trigger1=P2name="aof3_ryo"&&enemynear,authorname="brown"&&movetype=H&&stateno=3893&&anim=9999&&(enemynear,numexplod(3880)||enemynear,numexplod(3881))
ID=38800
anim=38800+ifelse(playerID(helper(103880),var(0)),var(0)=2,1,ifelse(playerID(helper(103880),var(0)),var(0)=1,2,0))
postype=left
pos=310,10
scale=1,1
facing=-1
bindtime=-1
ownpal=1
sprpriority=-94

[State ]
type=Helper
trigger1=P2name="aof3_ryo"&&enemynear,authorname="brown"&&enemynear,stateno=3810&&enemynear,time=301
helpertype=normal
name="quiz"
ID=103880
pos=0,0
postype=p1
stateno=103880

;-------------------------------------------------------------------------
;---------------------[Tsさん]
;━──────────────────────────┫Ts┣
;◆ジャギ
[State -2, 通常投げ／座標軸移動]
type       = PosAdd
triggerall = stateno = 805 && Anim = 11
triggerall = MoveType = H
trigger1   = NumEnemy <= 1 || NumEnemy >= 2
trigger1   = EnemyNear(0),Name = "JAGI" && EnemyNear(0),authorname = "Ts"
trigger1   = EnemyNear(0),stateno = 801
trigger2   = NumEnemy >= 2
trigger2   = EnemyNear(1),Name = "JAGI" && EnemyNear(1),authorname = "Ts"
trigger2   = EnemyNear(1),stateno = 801
x          = -2
y          = -27

[State -2, 通常投げ／アニメ変更]
type       = ChangeAnim
triggerall = stateno = 805 && Anim = 11
triggerall = MoveType = H && SelfAnimExist(100810)
trigger1   = NumEnemy <= 1 || NumEnemy >= 2
trigger1   = EnemyNear(0),Name = "JAGI" && EnemyNear(0),authorname = "Ts"
trigger1   = EnemyNear(0),stateno = 801
trigger2   = NumEnemy >= 2
trigger2   = EnemyNear(1),Name = "JAGI" && EnemyNear(1),authorname = "Ts"
trigger2   = EnemyNear(1),stateno = 801
value      = 100810

;-------------------------------------------------------------------------
;---------------------[ジャギ製作者各位]
[State ];ジャギ（良くできた弟～!!）判定
type=VarSet
triggerall=(root,TeamMode=single ||root,TeamMode=turns)&&(enemynear,teammode=single ||enemynear,teammode=turns)&&!(Var(10) & 65536)
trigger1=enemynear,name="JAGI"&&((enemynear,authorname="Drowin hokuto"&&enemynear,numhelper(1001)=1)||(enemynear,authorname="Ahuron"&&enemynear,numhelper(1705)=1)||(enemynear,authorname="Ts"&&enemynear,numhelper(1610)=1))
trigger2=enemynear,name="JagiMeirin"&&enemynear,authorname="Ts"&&enemynear,numhelper(1710)=1
V = 10
Value = (Var(10) | 65536)

[State ]
type=VarSet
triggerall=(root,TeamMode=single ||root,TeamMode=turns)&&(enemynear,teammode=single ||enemynear,teammode=turns)&&(Var(10) & 65536)
trigger1=enemynear,name="JAGI"&&((enemynear,authorname="Drowin hokuto"&&enemynear,numhelper(1001)=0)||(enemynear,authorname="Ahuron"&&enemynear,numhelper(1705)=0)||(enemynear,authorname="Ts"&&enemynear,numhelper(1610)=0))
trigger2=enemynear,name="JagiMeirin"&&enemynear,authorname="Ts"&&enemynear,numhelper(1710)=0
V = 10
Value = (Var(10) | 65536) - 65536

;ジャギ「おい、そこへ座れ」対応ステート
[state ]
type=AssertSpecial
trigger1=numenemy
trigger1=movetype=H&&stateno=901&&enemynear,name="JAGI"&&enemynear,Authorname="Drowin hokuto"
flag=invisible

[state ]
type=Explod
trigger1=!numexplod(100810)&&numenemy
trigger1=movetype=H&&stateno=901&&enemynear,name="JAGI"&&enemynear,Authorname="Drowin hokuto"
anim=100810
ID=100810
postype=p1
scale=0.5,0.5
pos=0,0
bindtime=-1
removetime=-1
shadow=-1

[State ]
type=RemoveExplod
trigger1=numexplod(100810)=1&&(anim!=6||stateno!=901||(stateno=901&&time=120))
ID=100810

[state ]
type=ChangeAnim
trigger1=numenemy
trigger1=movetype=H&&stateno=805&&((enemynear,name="JAGI"&&enemynear,Authorname="Ahuron"&&time>=10)||(enemynear,name="JagiMeirin"&&enemynear,Authorname="Ts"&&(time=[10,141])))
value=100810

[State ]
Type = PosSet
trigger1=numenemy
trigger1=movetype=H&&stateno=805&&((enemynear,name="JAGI"&&enemynear,Authorname="Ahuron"&&time>=10)||(enemynear,name="JagiMeirin"&&enemynear,Authorname="Ts"&&(time=[10,141])))
Trigger1 = Anim = 100810
X = EnemyNear,Pos X - Facing * 70
Y = -30

;-------------------------------------------------------------------------
;---------------------[bad darknessさん]
;デミトリ「ミッドナイトブリス」対応ステート
[state ]
type=changeanim
trigger1=numenemy
trigger1=P2name="Demitri"&&enemynear,authorname="bad darkness"&&(stateno=[2021,2026])&&movetype=H
value=9020
elem=stateno-2020

;-------------------------------------------------------------------------
;---------------------[soukenさん]
;グロスプー「こどものはらわたたべちゃった」対応ステート
[state ]
type=ChangeAnim
trigger1=numenemy
trigger1=enemynear,name="gurospooo"&&enemynear,authorname="souken"&&stateno=3121&&movetype=H&&anim!=29971
value=9020
