;--------------------------
; SYSTEM & HIT STATES.ST
;--------------------------


;---------------------------------------------------------------------------
; PREINTRO
[Statedef 190]
type   = S
ctrl   = 0
velset = 0,0

[State 191, Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 3]
type = ChangeState
trigger1 = 1
value = 191
;---------------------------------------------------------------------------
; normal intro
[Statedef 191]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 191, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = Random < 500
value = 192

[State 191, Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 191, Voice]
type = PlaySnd
trigger1 = Time = 25
value = 191,Random%4
channel = 1

[State 191, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
;---------------------------------------------------------------------------
; Jump Start
[StateDef 40]
Type    = S
Physics = S
Anim    = 40
Ctrl    = 0
SprPriority = 1
facep2  = 1

[State 40, 1]
Type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
Type = VarSet
trigger1 = command = "holdfwd"
trigger2 = AILevel && Random > (35 - AILevel*3) && PrevStateNo = [100,101]
sysvar(1) = 1

[State 40, 3]
Type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, Super Jump detection reset]
type = VarSet
trigger1 = !Time
var(1) = 0
[State 40, Super Jump]
type = VarSet
trigger1 = !Time
trigger1 = Command = "Superjump"
var(1) = 1

[State 40, 4]
Type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 4]
Type = VelSet
trigger1 = AnimTime = 0
trigger1 = Command != "holdup"
y = const(velocity.jump.y) / 2

[State 40, SuperJump]
Type = VelSet
triggerAll = AnimTime = 0
triggerAll = SysVar(1) = 1
trigger1 = PrevStateNo = [100,101] ; dash / run
trigger2 = Var(1) = 1 ; down, up
x = const(velocity.runjump.fwd.x)

[State 40, 5]
Type = ChangeState
trigger1 = AnimTime = 0
value = 50
Ctrl = 1

;---------------------------------------------------------------------------
; Dash forward
[StateDef 100]
Anim    = 100
Type    = S
Physics = S
SprPriority = 1
Ctrl    = 0

[State 100, 1]
Type = VelSet
trigger1 = !Time
x = 12

[State 100, Dust]
type = Explod
trigger1 = Time = 3
anim = 8500
trans = add
scale = 0.4,0.4
sprpriority = 5

[State 100, 2] ;Prevent run from canceling into walk
Type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
Type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 101, First step]
Type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1

[State 101, Dust]
type = Explod
trigger1 = !Time
anim = 8520
trans = add
pos = -57,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

[State 100, Run]
Type = ChangeState
triggerAll = AnimElemNo(0) >= 3
triggerAll = PrevStateNo != 1100
trigger1 = command = "holdfwd" && !AILevel
trigger2 = AILevel && P2BodyDist X > (180 - AILevel*7) && EnemyNear,MoveType != A
value = 101

[State 100, Jump]
type = ChangeState
trigger1 = !AILevel
trigger1 = Command = "holdup"
value = 40

[State 100, Land dust]
type = Explod
trigger1 = AnimElem = 4
anim = 8510
trans = add
pos = 27,0
scale = 0.15,0.15
sprpriority = -5
ownpal = 1

[State 101, End]
Type = ChangeState
trigger1 = !AnimTime
value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; Run forward
[StateDef 101]
Anim    = 101
Type    = S
Physics = S
SprPriority = 1

[State 101, Dust]
type = Explod
trigger1 = !Time
anim = 8520
trans = add
pos = 27,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

[State 101, 1]
Type = VelSet
trigger1 = Anim = 101
x = const(velocity.run.fwd.x)

[State 101, 2] ;Prevent run from canceling into walk
Type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 101, 3] ;Prevent from turning
Type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[State 101, Step]
Type = PlaySnd
triggerAll = Anim = 101
trigger1 = AnimElem = 3
trigger2 = AnimElem = 8
value = 100,0
channel = 1

[State 101, Dust]
type = Explod
trigger1 = AnimElem = 5
anim = 8500
trans = add
scale = 0.3,0.3
sprpriority = 5

[State 101, AI jump]
type = ChangeState
trigger1 = AILevel
trigger1 = EnemyNear,MoveType = A
trigger1 = EnemyNear,StateType != A
trigger1 = P2BodyDist X < 120
trigger1 = EnemyNear,Vel X > 2 || Random < (40 + AILevel*3)
trigger1 = Random < (40 + AILevel*5)
value = 40

[State 101, Stop running]
Type = ChangeAnim
triggerAll = Anim = 101
trigger1 = Command != "holdfwd"
trigger2 = AILevel && EnemyNear,StateType = A && EnemyNear,MoveType = A && P2BodyDist X < 120 && Random < (50 + AILevel*10)
value = 100
elem = 5

[State 101, Stop step]
Type = PlaySnd
triggerAll = Anim = 100
trigger1 = AnimElem = 5
value = 40,1
channel = 1
[State 101, Land dust]
type = Explod
triggerAll = Anim = 100
trigger1 = AnimElem = 5
anim = 8521
trans = add
pos = 27,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

[State 101, Jump]
type = ChangeState
trigger1 = !AILevel
trigger1 = Command = "holdup"
value = 40

[State 101, Stop sliding]
Type = VelSet
trigger1 = !AnimTime
x = 0

[State 101, End]
Type = ChangeState
trigger1 = !AnimTime
trigger1 = Anim = 100
value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; Hop backwards
[StateDef 105]
Type        = S
Physics     = S
MoveType    = I
Ctrl        = 0
Anim        = 105
SprPriority = 1

[State 105, NotHitBy]
Type = NotHitBy
trigger1 = Time < 9
value = SCA
Time = 1

[State 105, Sen - String Combo backstep]
Type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = [200, 500]
value = 105
elem = 2

[State 105, SFX]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0
persistent = 0
channel = 1
[State 105, Whoosh SFX]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 100,1
persistent = 0
channel = 2
[State 105, Backstep dust]
type = Explod
trigger1 = AnimElem = 2
anim = 8521
trans = add
pos = 18,0
scale = 0.15,0.15
sprpriority = -5
[State 105, Landing SFX]
Type = PlaySnd
trigger1 = AnimElem = 4
value = 40,1
persistent = 0
channel = 1
[State 340, Land dust]
type = Explod
trigger1 = AnimElem = 4
anim = 8510
trans = add
scale = 0.25,0.25
sprpriority = -5

[State 105, StateTypeSet]
Type = StateTypeSet
trigger1 = AnimElem = 2
StateType = A
Physics   = A

[State 105, 1]
Type = VelSet
trigger1 = AnimElem = 2
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, StateTypeSet]
Type = StateTypeSet
trigger1 = AnimElem = 4
StateType = S
Physics   = S

[State 105, PosSet]
Type = PosSet
trigger1 = AnimElemNo(0) >= 4
trigger1 = Pos Y != 0
y = 0
[State 105, VelSet]
Type = VelSet
trigger1 = AnimElemNo(0) >= 4
trigger1 = Pos Y = 0 && Vel Y != 0
y = 0

[State 105, VelSet]
Type = VelSet
trigger1 = abs(vel x) < Const(Movement.stand.friction.threshold)
x = 0

[State 105, End]
Type = ChangeState
trigger1 = !AnimTime
value = 0
Ctrl = 1

;---------------------------------------------------------------------------
; Winpose
[StateDef 180]
Type = S
Ctrl = 0

[State 180, Winpose randomizer - non-automatic]
type = ChangeState
triggerAll = !Time
trigger1 = Life / LifeMax * 100 = [20,85]
trigger2 = Life = [200,850]
value = 181+Random%3

[State 180, Winpose - automatic]
type = ChangeState
triggerAll = !Time
trigger1 = Life > 850
trigger2 = Life < 200
value = 181

[State 181, 1]
Type = AssertSpecial
trigger1 = Time < 120
flag = roundnotover
;---------------------------------------------------------------------------
; Winpose : turn back
[StateDef 181]
Type = S
Anim = 181

[State 181, 1]
Type = AssertSpecial
trigger1 = Time < 120
flag = roundnotover
;---------------------------------------------------------------------------
; Winpose : KS5HC
[StateDef 182]
Type = S
Anim = 182

; Whoosh
[State 182, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,0
channel = 2
persistent = 0
[State 182, Whoosh 2]
type = PlaySnd
trigger1 = AnimElem = 6
value = 7,2
Channel = 2
[State 182, Whoosh 3]
type = PlaySnd
trigger1 = AnimElem = 12
value = 7,5
Channel = 2
[State 182, Whoosh 4]
type = PlaySnd
trigger1 = AnimElem = 17
value = 7,1
Channel = 2
[State 182, Whoosh 5]
type = PlaySnd
trigger1 = AnimElem = 22
value = 7,7
Channel = 2

; Pos fix
[State 182, Pos fix]
type = PosAdd
trigger1 = AnimElem = 16
x = 21

[State 182, 1]
Type = AssertSpecial
trigger1 = Time < 140
flag = roundnotover
;---------------------------------------------------------------------------
; Winpose : Lingering Soul
[StateDef 183]
Type = S
Anim = 183

[State 183, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 11
value = 7,2
Channel = 2

[State 183, Slide back]
type = PosAdd
trigger1 = AnimElem = 12
x = -28

[State 181, 1]
Type = AssertSpecial
trigger1 = Time < 105
flag = roundnotover
;---------------------------------------------------------------------------
; Taunt
[StateDef 195]
Type        = S
Physics     = S
Ctrl        = 0
Anim        = 195

[State 195, CtrlSet]
Type = CtrlSet
trigger1 = Time >= 18
value = 1
persistent = 0

[State 195, End]
Type = ChangeState
trigger1 = !AnimTime
value = 0
Ctrl = 1
;-----------------------------------------------------------------

;-----------------------------------------------------------------
; Grab
;--------------------------

;--------------------------
; Grab attempt
[StateDef 800]
Anim      = 800
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 800, Direction detection]
type = VarSet
trigger1 = !AILevel
trigger1 = !Time
var(1) = IfElse(Command = "holdback", 1, 0)
[State 800, Direction detection - AI]
type = Null
triggerAll = AILevel
triggerAll = !Time
trigger1 = Var(1) := 0
trigger1 = 0
trigger2 = BackEdgeBodyDist < 40
trigger2 = Random < (500 + AILevel*50)
trigger2 = Var(1) := 1
trigger3 = BackEdgeBodyDist > 60
trigger3 = FrontEdgeBodyDist > 60
trigger3 = Random < 500
trigger3 = Var(1) := 1

[State 800, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 63086

[State 800, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NT
hitflag          = M
guardflag        = 
animtype         = Light
damage           = 0,0
pausetime        = 4,6;2,2
sparkxy          = -10,-85
hitsound         = S900,0
guardsound       = S6,0
ground.type      = High
ground.slidetime = 20
ground.hittime   = 20
guard.hittime    = 20
ground.velocity  = -1
air.velocity     = -1,-1
guard.velocity   = -1
getpower         = 40, 0
givepower        = 20, 0
p2facing         = 1
ID               = 800
sparkno = S8000
;guard.sparkno = S8000
;sparkxy = -10 + 0*(var(23):= 63),-85

[State 800, Throw limiter - disable]
type = StateTypeSet
trigger1 = Var(6)
trigger2 = P2BodyDist X > 40
movetype = I
[State 800, Throw limiter - enable]
type = StateTypeSet
trigger1 = !Var(6)
trigger2 = P2BodyDist X <= 40
movetype = A

[State 800, TargetState]
type = TargetState
trigger1 = MoveHit
trigger1 = NumTarget(800)
value = 806 + 5*Var(1)
ID = 800

[State 800, ChangeState]
type = ChangeState
trigger1 = MoveHit
trigger1 = NumTarget
trigger1 = Target,StateNo = [806,811]
value = 805 + 5*Var(1)

[State 800, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Tidal Wave
[StateDef 805]
Anim      = 805
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 805, Spr]
type = SprPriority
trigger1 = !Time
value = 1
[State 805, Spr 2]
type = SprPriority
trigger1 = AnimElemNo(0) = 7
value = 3
[State 805, Spr 3]
type = SprPriority
trigger1 = AnimElemNo(0) = 14
value = 1

[State 805, Pos 1]
type = PosAdd
trigger1 = AnimElemNo(0) = 5
x = 12
persistent = 0
[State 805, Pos 2]
type = PosAdd
trigger1 = AnimElemNo(0) = 6
x = 8
persistent = 0
[State 805, Pos 3]
type = PosAdd
trigger1 = AnimElemNo(0) = 7
x = 25
persistent = 0
[State 805, Pos 4]
type = PosAdd
trigger1 = AnimElemNo(0) = 12
x = -33
persistent = 0
[State 805, Pos 5]
type = PosAdd
trigger1 = AnimElemNo(0) = 13
x = -12
persistent = 0

[State 805, Bind 1]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) < 11
pos = 20,0
[State 805, Bind 2]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) = 11
pos = 3,-48
[State 805, Bind 3]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) = 12
pos = 9,-45
[State 805, Bind 4]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) = 13
pos = -19,-48
[State 805, Bind 5]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) = 14
pos = -36,-121
[State 805, Bind 6]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) = 15
pos = -11,-139
[State 805, Bind 7]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) = 16
pos = 47,-131
[State 805, Bind 8]
type = TargetBind
triggerAll = NumTarget
trigger1 = AnimElemNo(0) = 17
pos = 71,-88

[State 805, Crack]
type = PlaySnd
trigger1 = AnimElem = 9
value = 805,2;1;0
channel = 2
[State 805, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 11
value = 7,2
channel = 2

[State 811, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = Target,StateNo = 4001 && Target,Time = 1;5110
value = -ceil(fvar(12)*130)
persistent = 0

[State 805, Shake]
type = EnvShake
trigger1 = NumTarget
trigger1 = Target,StateNo = 4001 && Target,Time = 1;5110
time = 12
freq = 60
ampl = 6
persistent = 0

[State 805, Land impact]
type = null;Explod
trigger1 = NumTarget
trigger1 = Target,StateNo = 4001 && Target,Time = 1;5110
anim = 8530
postype = P2
scale = 0.4,0.4
sprpriority = -5

[State 805, Target]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Target,StateNo = 4001 && Target,Time = 1;5110

[State 805, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = !Time
trigger2 = !NumTarget
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Over the Shoulder Reverse
[StateDef 810]
Anim      = 810
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 810, Turn]
type = Turn
trigger1 = !Time

[State 810, Wid]
type = Width
trigger1 = 1
edge = 40,-40

[State 810, Pos fix]
type = PosAdd
trigger1 = AnimElemNo(0) = 5
x = 40
persistent = 0

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElemNo(0) = 1
pos = -35,0
[State 810, Bind 2]
type = TargetBind
trigger1 = AnimElemNo(0) = 2
pos = -37,0
[State 810, Bind 3]
type = TargetBind
trigger1 = AnimElemNo(0) = 3
pos = -29,-72
[State 810, Bind 4]
type = TargetBind
trigger1 = AnimElemNo(0) = 4
pos = 8,-78
[State 810, Bind 5]
type = TargetBind
trigger1 = AnimElemNo(0) = 5
pos = 2,-51

[State 810, Crack]
type = null;PlaySnd
trigger1 = AnimElem = 4
value = 805,1
channel = 4
[State 810, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,2
channel = 2

[State 810, Damage]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = Target,Vel Y > 0
trigger1 = Target,Pos Y >= -9
value = -ceil(fvar(12)*130)
persistent = 0

[State 810, Shake]
type = EnvShake
trigger1 = NumTarget
trigger1 = Target,StateNo = 4001 && Target,Time = 1;5110
time = 12
freq = 60
ampl = 6
persistent = 0

[State 810, Land impact]
type = null;Explod
trigger1 = NumTarget
trigger1 = Target,StateNo = 4001 && Target,Time = 1;5110
anim = 8530
postype = P2
scale = 0.4,0.4
sprpriority = -5

[State 810, Target]
type = TargetDrop
trigger1 = NumTarget
trigger1 = Target,StateNo = 4001 && Target,Time = 1;5110

[State 810, End]
type = ChangeState
trigger1 = !AnimTime
trigger2 = !Time
trigger2 = !NumTarget
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Thrown - Tidal Wave
[StateDef 806]
MoveType  = H
Type      = S
Physics   = N
Ctrl      = 0

[State 806, Anim]
Type = ChangeAnim2
trigger1 = !Time
value = 806

[State 806, Camera]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0,0

[State 806, Spr]
Type = SprPriority
trigger1 = !Time
value = 3
[State 806, Spr 2]
Type = SprPriority
trigger1 = AnimElemNo(0) = 4
value = 1
[State 806, Spr 3]
Type = SprPriority
trigger1 = AnimElemNo(0) = 9
value = 3

[State 811, Pos]
Type = PosAdd
trigger1 = !AnimTime
x = - (const(size.head.pos.y) - const(size.mid.pos.y))

[State 811, Pos]
Type = VelSet
trigger1 = !AnimTime
x = -6.5
persistent = 0

[State 806, Slam down]
Type = ChangeState;SelfState
trigger1 = !AnimTime
value = 4001;5110
;-----------------------------------------------------------------
; Thrown - Over the Shoulder Reverse
[StateDef 811]
MoveType  = H
Type      = S
Physics   = N
Ctrl      = 0

[State 811, Anim]
Type = ChangeAnim2
trigger1 = !Time
value = 811

[State 811, Turn]
Type = Turn
trigger1 = !Time

[State 811, Camera]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0,0

[State 811, Spr 1]
Type = SprPriority
trigger1 = !Time
value = 1
[State 811, Spr 2]
Type = SprPriority
trigger1 = AnimElemNo(0) = 4
value = 3

[State 811, Air]
Type = StateTypeSet
trigger1 = AnimElemNo(0) = 6
StateType = A
persistent = 0

[State 811, Vel X]
Type = VelSet
trigger1 = AnimElemNo(0) = 6
x = -2
y = 8
persistent = 0

[State 811, Accel]
Type = Gravity
trigger1 = AnimElemNo(0) = 6

[State 811, Turn]
Type = Turn
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -9

[State 811, Pos]
Type = PosAdd
trigger1 = Vel Y > 0
trigger1 = Pos Y >= -9
x = - (const(size.head.pos.y) - const(size.mid.pos.y))

[State 811, Slam down]
Type = ChangeState;SelfState
trigger1 = vel y > 0
trigger1 = pos y >= -9
value = 4001;5110
;-----------------------------------------------------------------
; Shun Ren Dan grabbed
[StateDef 1605]
MoveType  = H
Type      = S
Physics   = S
Ctrl      = 0

[State 1605, Anim2]
Type = ChangeAnim2
trigger1 = !Time
value = 1605

[State 1605, Camera]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0,0

[State 1605, Pushed]
Type = VelSet
trigger1 = AnimElem = 8
x = -5

[State 1605, Spr 1]
Type = SprPriority
trigger1 = !Time
value = 1
[State 1605, Spr 2]
Type = SprPriority
trigger1 = AnimElem = 11
value = 3

[State 1605, Down]
Type = SelfState
trigger1 = Time > 95
value = 5110
;-----------------------------------------------------------------

;-----------------------------------------------------------------
; Special system
;--------------------------

;--------------------------
; Bound states
;-------------

;-------------
; Slammed downward
[StateDef 4000]
MoveType  = H
Type      = A
Physics   = N
VelSet    = 0,0
Ctrl      = 0

[State 4000, Anim]
Type = ChangeAnim
trigger1 = HitShakeOver;1
value = 5061;IfElse(SelfAnimExist(5980) && enemyNear, AuthorName != "Warusaki3", 5980, 5012)

[State 4000, Pushed]
Type = VelSet
trigger1 = HitShakeOver
x = -1
y = 7

[State 4000, Turn]
Type = Turn
trigger1 = EnemyNear,Facing = Facing

[State 4000, Hit ground]
Type = ChangeState
trigger1 = HitShakeOver
trigger1 = Pos Y >= 0
value = 4001
;-------------
;Hitting the Ground
[StateDef 4001]
Type     = L
MoveType = H
Physics  = N

[State 4001, Anim]
Type = ChangeAnim
trigger1 = !Time
value = 5100

[State 4001, Pos]
Type = PosSet
trigger1 = Anim = 5100
y = 0

[State 4001, EnvShake]
Type = EnvShake
trigger1 = !Time
time = 14
ampl = -4

[State 4001, SFX]
Type = PlaySnd
trigger1 = !Time
value = F7,1

[State 4001, End]
Type = ChangeAnim;State
triggerAll = Anim = 5100
trigger1 = Time >= 3
trigger2 = !AnimTime
value = 5160;4002
ignorehitpause = 1
;-------------
; Bouncing Off Ground
;[StateDef 4002]
;Type     = A
;MoveType = H
;Physics  = N

;[State 4002, Anim]
;Type = ChangeAnim
;trigger1 = !Time
;value = 5160

[State 1140, Idle]
type = StateTypeSet
trigger1 = Anim = 5160
movetype = H
statetype = A
physics = N

[State 4002, PSet]
Type = PosSet
trigger1 = Anim = 5160;!Time
y = 0
persistent = 0

[State 4002, Bound VSet]
Type = VelSet
trigger1 = Anim = 5160;!Time
trigger1 = PrevStateNo = 4000
y = -10
persistent = 0
[State 4002, Bound VSet]
Type = VelSet
trigger1 = Anim = 5160;!Time
trigger1 = P2Dist X > 0
trigger1 = PrevStateNo != 4000
x = -2
persistent = 0
[State 4002, Bound VSet]
Type = VelSet
trigger1 = Anim = 5160;!Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != 4000
x = 2
persistent = 0
[State 4002, Small bound VSet]
type = VelSet
trigger1 = Anim = 5160
trigger1 = PrevStateNo = [800,815]
y = -4
persistent = 0

[State 4002, Bound VAdd]
Type = VelAdd
trigger1 = Anim = 5160
;trigger1 = PrevStateNo = 4000
y = 0.6
[State 4002, Small bound VAdd]
Type = null;VelAdd
trigger1 = Anim = 5160
trigger1 = PrevStateNo = [800,815]
y = 1

[State 4002, End]
Type = SelfState
trigger1 = Anim = 5160
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
value = 5110
;-----------------------------------------------------------------
; Wall Slam states
;-----------------

;-----------------
; Hit Pause
[StateDef 4100]
Type = A
MoveType = H
Physics = N
velset = 0, 0

[State 4100, Anim]
Type = ChangeAnim
trigger1 = 1
value = 5002

[State 4100, Turn]
type = Turn
trigger1 = !Time
trigger1 = EnemyNear,Facing = Facing

[State 4100, End]
Type = ChangeState
trigger1 = HitShakeOver
value = 4101
;-----------------
; Sent flying
[StateDef 4101]
Type     = A
MoveType = H
Physics  = N

[State 4101, Vel]
Type = null;HitVelSet
trigger1 = !Time
x = 1
y = 1
[State 4101, Vel]
Type = VelSet
trigger1 = !Time
x = -6
y = -6.5
[State 4101, Accel]
Type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 4101, Screen]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0, 1
[State 4101, Push]
Type = PlayerPush
trigger1 = 1
value = 0

[State 4101, Anim]
Type = ChangeAnim
trigger1 = !Time
value = 5030

[State 4101, Wall bounce]
Type = null;ChangeState
trigger1 = BackEdgeBodyDist <= 10 || FrontEdgeBodyDist <= 10
value = 4102

;---
[State 4101, Wall hit]
Type = ChangeAnim2
trigger1 = BackEdgeBodyDist <= 10 || FrontEdgeBodyDist <= 10
trigger1 = Anim != 4101
value = 4101
persistent = 0

[State 4101, Bounce X vel]
Type = VelSet
trigger1 = Anim = 4101
x = Floor(((6*Time)+60)/60) ; going to wall : s = d/t <=> d = s*t, rebound from wall to same distance : s' = d/t' <=> s' = s*t/t' + 60 pixels
persistent = 0

[State 4101, Turn]
Type = Turn
trigger1 = Anim = 4101
trigger1 = FrontEdgeDist < BackEdgeDist
persistent = 0

[State 4101, Pos]
Type = PosSet
trigger1 = Anim = 4101
trigger1 = FrontEdgeDist < BackEdgeDist
x = -160 * Facing
persistent = 0
[State 4101, Pos]
Type = PosFreeze
trigger1 = Anim = 4101
;trigger1 = FrontEdgeDist < BackEdgeDist

[State 4102, Push]
Type = PlayerPush
trigger1 = Anim = 4101
value = 1

[State 4102, Snd]
Type = PlaySnd
trigger1 = Anim = 4101
value = F7,0
persistent = 0
[State 4102, FX]
Type = Explod
trigger1 = Anim = 4101
Anim = F72
pos = 0, Floor(ScreenPos Y) -50
posType = Back
SprPriority = 3
persistent = 0

[State 4102, End]
Type = ChangeState
trigger1 = Anim = 4101
trigger1 = !AnimTime
value = 4103
;---

[State 4101, Hitting ground]
Type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100
;-----------------
; Hitting Wall
[StateDef 4102]
Type     = A
MoveType = H
Physics  = N

[State 4102, Turn]
Type = Turn
trigger1 = !Time
trigger1 = FrontEdgeDist < BackEdgeDist

[State 4102, Pos]
Type = PosSet
trigger1 = 1
x = -160 * Facing
[State 4102, Pos]
Type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 4102, Screen]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0, 1
[State 4102, Push]
Type = PlayerPush
trigger1 = 1
value = 1

[State 4102, Anim]
Type = ChangeAnim
trigger1 = 1
value = 5000

[State 4102, Snd]
Type = PlaySnd
trigger1 = !Time
value = F7,0
[State 4102, FX]
Type = Explod
trigger1 = !Time
Anim = F72
pos = 0, Floor(ScreenPos Y) -50
posType = Back
SprPriority = 3

[State 4102, End]
Type = ChangeState
trigger1 = Time >= 4
value = 4103
;-----------------
; Bounce
[StateDef 4103]
Type     = A
MoveType = H
Physics  = N

[State 4103, Turn]
Type = Turn
trigger1 = !Time

[State 4103, Accel]
Type = VelAdd
trigger1 = 1
y = 0.5
[State 4103, VSet]
Type = VelSet
trigger1 = !Time
;x = -2.5
y = -9

[State 4103, Anim 1]
Type = ChangeAnim
trigger1 = !Time
value = ifelse(SelfAnimExist(5051), 5051, 5030)
[State 4103, Anim 2]
Type = ChangeAnim
trigger1 = Anim = 5030 && !AnimTime
value = 5050
[State 4103, Anim 3]
Type = ChangeAnim
trigger1 = Vel Y > -3 && Anim = 5051
value = 5061

[State 4103, Screen]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0, 0

[State 4103, Push]
Type = PlayerPush
trigger1 = 1
value = 0

[State 4103, Recover]
Type = SelfState
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = Vel Y > 0 && Pos Y >= const(Movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 4103, End]
Type = SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100
;-----------------------------------------------------------------
; Collapse State
[StateDef 4150]
MoveType  = H
Type      = S
Physics   = N
Ctrl      = 0

[State 4150, Anim]
Type = ChangeAnim
trigger1 = !Time
trigger1 = SelfAnimExist(5950)
value = 5950
[State 4150, Anim2]
Type = ChangeAnim2
trigger1 = !Time
trigger1 = !SelfAnimExist(5950)
value = 5951

[State 4150, Pos]
Type = PosSet
trigger1 = !Time
y = 0
[State 4150, Vel]
Type = VelSet
trigger1 = !Time
y = 0

[State 4150, Dust]
Type = null;GameMakeAnim
trigger1 = Anim = 5951
trigger1 = AnimElem = 7
value = 60
pos = 0, 0
under = SysVar(1) <= 14
[State 4150, PlaySnd]
Type = PlaySnd
trigger1 = Anim = 5951
trigger1 = AnimElem = 7
value = f7, 0

[State 4150, End]
Type = SelfState
trigger1 = Time >= 110
value = IfElse(Alive, 5120, 5150)
;-----------------------------------------------------------------
; Cross Cancel
[StateDef 4200]
;Anim      = 4200
MoveType  = I
Type      = S
Physics   = S
Ctrl      = 0
Poweradd  = -500
; First couple of sprites of the Animation are the beginning of the landing Animation

[State 4300, GFX cancel]
type = RemoveExplod
trigger1 = NumExplod(1015)
id = 1015
ignorehitpause = 1
[State 4300, GFX cancel]
type = RemoveExplod
trigger1 = NumExplod(1025)
id = 1025
ignorehitpause = 1
[State 4300, GFX cancel]
type = RemoveExplod
trigger1 = NumExplod(1035)
id = 1035
ignorehitpause = 1

[State 4200, Pause]
Type = SuperPause
trigger1 = !Time
time = 5
Movetime = 5
Anim = -1
darken = 1

[State 4200, AfterImage]
Type = AfterImage
trigger1 = !Time
Time = 2
Timegap = 1
framegap = 10
trans = add1
length = 30
paladd = 0,0,0
palmul = .9,.9,.9
palcontrast = 120,120,120
palpostbright = 0,0,0

[State 4200, AfterImage persist]
Type = AfterImageTime
trigger1 = 1
Time = 2

; code flash and afterimage before the ChangeAnim
[State 4200, Anim]
Type = ChangeAnim
trigger1 = Time = 1
value = 4200

[State 4200, Force land]
Type = VelSet
trigger1 = !Time
y = 0
[State 4200, Force land 2]
Type = PosSet
trigger1 = !Time
y = 0

[State 4200, Slide]
Type = VelSet
trigger1 = AnimElemNo(0) = 2
x = 6.5
persistent = 0
[State 4200, Slide]
Type = PosAdd
trigger1 = AnimElemNo(0) = 2
x = 13
persistent = 0
[State 4200, Slide]
Type = PosAdd
trigger1 = AnimElemNo(0) = 5
x = 14
persistent = 0
[State 4200, Slide]
Type = PosAdd
trigger1 = AnimElemNo(0) = 6
x = 15
persistent = 0

[State 4200, Ctrl]
Type = null;CtrlSet
trigger1 = AnimElem = 3, = 3
value = 1

[State 4200, End]
Type = ChangeState
trigger1 = Anim = 4200
trigger1 = !AnimTime
value = 0
Ctrl = 1
;-----------------------------------------------------------------
; Cross Counter
[StateDef 4300]
Type     = S
MoveType = A
Physics  = S
Anim     = 710
Ctrl     = 0

[State 4300, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 40078

[State 4300, Super Pause]
type = SuperPause
trigger1 = !Time
time = 20
movetime = 20
anim = -1
sound = s6, 1

[State 4300, Power]
type = PowerAdd
trigger1 = !Time
value = -500

[State 4300, Pos 1]
type = PosAdd
trigger1 = AnimElem = 2
x = 12
[State 4300, Pos 2]
type = PosAdd
trigger1 = AnimElem = 3
x = 5

[State 4300, Spark]
type = Explod
trigger1 = AnimElem = 1
pos = 13,-80
anim = 8005
scale = 0.4,0.4
sprpriority = 5
trans = Add
supermovetime = 35
pausemovetime = 35

[State 4300, SFX]
Type = PlaySnd
trigger1 = !Time
value = 750,1;0
channel = 2
[State 4300, Whoosh]
Type = PlaySnd
trigger1 = AnimElem = 8
value = 7,2
channel = 2

[State 4300, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*130),38
pausetime        = 2,2
sparkxy          = -10,-78
hitsound         = S5,6;5
guardsound       = S6,0
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 30
guard.hittime    = 16
ground.velocity  = -3.5,-5.5
air.velocity     = -4,-7.5
guard.velocity   = -8.5
getpower         = 50, 25
givepower        = 25, 12
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
sparkno = S8000

[State 4300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Downed get-hit (getting up)
[StateDef 5120]
Type    = L
MoveType= I
Physics = N

[State 5120, 1a] ;Get up Anim (normal)
Type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim != [5111,5119]
trigger2 = !SelfAnimExist(5120 + (Anim % 10))
value = 5120

[State 5120, 1b] ;Get up Anim (for hit up/diag-up)
Type = ChangeAnim
triggerall = Time = 0
trigger1 = Anim = [5111,5119]
trigger1 = SelfAnimExist(5120 + (Anim % 10))
value = 5120 + (Anim % 10)

[State 5120, 2]
Type = VelSet
trigger1 = Time = 0
x = 0

[State 5120, 3]
Type = NotHitBy
trigger1 = 1
value = SCA
Time = 1

[State 5120, 4]
Type = HitFallSet
trigger1 = AnimTime = 0
value = 1

[State 5120, 5] ;Can not be thrown right after getting up
Type = NotHitBy
trigger1 = AnimTime = 0
value = , NT,ST,HT
Time = 18

[State 5120, 6] ;Can not be hit right after getting up (short Time)
Type = NotHitBy
trigger1 = AnimTime = 0
value2 = SCA
Time = 8

[State 5120, 7]
Type = ChangeState
trigger1 = AnimTime = 0
value = 0
Ctrl = 1
;-----------------------------------------------------------------

;-----------------------------------------------------------------
; Effect system
;--------------------------

;-------------------
; Hitspark generator
[StateDef 8000]
Type        = S
SprPriority = 5
Anim        = 8000

[State 8000, Light basic size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,StateNo = 200 || Parent,StateNo = 201
trigger2 = Parent,StateNo = 210 || Parent,StateNo = 211
trigger3 = Parent,StateNo = 400 || Parent,StateNo = 415
trigger4 = Parent,StateNo = 600 || Parent,StateNo = 615
var(1) = 1
[State 8000, Medium basic size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,StateNo = 202 || Parent,StateNo = 203
trigger2 = Parent,StateNo = 212 || Parent,StateNo = 213 || Parent,StateNo = 245
trigger3 = Parent,StateNo = 405 || Parent,StateNo = 420
trigger4 = Parent,StateNo = 605 || Parent,StateNo = 620
trigger5 = Parent,StateNo = 230 || Parent,StateNo = 232
trigger6 = Parent,StateNo = [233,236]
trigger7 = Parent,StateNo = 300 || Parent,StateNo = 310
trigger8 = Parent,StateNo = 320 || Parent,StateNo = 340 || Parent,StateNo = 360
var(1) = 2
[State 8000, Heavy basic size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,StateNo = 204 || Parent,StateNo = 205
trigger2 = Parent,StateNo = 214 || Parent,StateNo = 215
trigger3 = Parent,StateNo = 410 || Parent,StateNo = 425
trigger4 = Parent,StateNo = 610 || Parent,StateNo = 625
trigger5 = Parent,StateNo = 240 || Parent,StateNo = 251 || Parent,StateNo = 252
trigger6 = Parent,StateNo = 305 || Parent,StateNo = 330
trigger7 = Parent,StateNo = 800
var(1) = 3
[State 8000, Special size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,StateNo = [1000,1999]
trigger2 = Parent,StateNo = 2405
trigger3 = Parent,StateNo = 4300
var(1) = 4
[State 8000, Super size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,StateNo = [2000,2999]
trigger1 = Parent,StateNo != 2405
var(1) = 5
[State 8000, EED 1 size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,Anim = 2303
trigger1 = Parent,AnimElemNo(0) = [1,50]
var(1) = 3
[State 8000, EED 2 size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,Anim = 2303
trigger1 = Parent,AnimElemNo(0) = [51,73]
var(1) = 4
[State 8000, EED 2 size]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,Anim = 2303
trigger1 = Parent,AnimElemNo(0) = [74,81]
var(1) = 5
[State 8000, Mental Alertness / Power Stance / LDP]
Type = VarSet
triggerAll = !Time
trigger1 = Parent,StateNo = 1100
trigger2 = Parent,StateNo = 1400
trigger3 = Parent,StateNo = 1110 && Parent,AnimElemNo(0) < 6
var(1) = 1

[State 8000, AssertSpecial]
Type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 8000, Spark Anim]
Type = ChangeAnim
trigger1 = !Time
trigger1 = Var(1) < 5
value = 8000 + Var(1)
[State 8000, Super hit]
Type = ChangeAnim
triggerAll = !Time
trigger1 = Var(1) = 5
value = 8004
[State 8000, EED finisher]
Type = ChangeAnim
triggerAll = !Time
;trigger1 = Var(1) = 4
trigger1 = Parent,StateNo = 2405
trigger1 = Root,AnimElem = 87
value = 8004
[State 8000, Mental Alertness / Power Stance]
Type = ChangeAnim
triggerAll = !Time
trigger1 = Parent,StateNo = 1100
trigger2 = Parent,StateNo = 1400
value = 8005

[State 8000, Rotation randomization]
type = VarSet
trigger1 = !Time
var(2) = Random%60

[State 8000, Rotation]
type = AngleDraw
trigger1 = Anim = [8001,8004]
value = -20+Var(2)

[State 8000, Guard sparks]
Type = ChangeAnim
triggerAll = !Time
trigger1 = Var(1) < 5
trigger1 = Parent,MoveGuarded
;trigger2 = Root,Anim = 2400
value = 8005+Var(1)
ignorehitpause = 1
persistent = 0
[State 8000, Super block]
Type = ChangeAnim
triggerAll = !Time
trigger1 = Parent,MoveGuarded
trigger1 = Var(1) = 5
value = 8009

[State 8000, Scale - light]
Type = AngleDraw
trigger1 = Var(1) = 1
scale = 0.35,0.35;0.22,0.22
[State 8000, Scale - medium]
Type = AngleDraw
trigger1 = Var(1) = 2
scale = 0.3,0.3
[State 8000, Scale - heavy]
Type = AngleDraw
trigger1 = Var(1) = 3
scale = 0.3,0.3
[State 8000, Scale - special]
Type = AngleDraw
trigger1 = Var(1) = 4
scale = 0.25,0.25
[State 8000, Scale - super]
Type = AngleDraw
trigger1 = Var(1) = 5
scale = 0.3,0.3

[State 8000, Trans]
Type = Trans
trigger1 = 1
trans = Add

[State 8000, End]
Type = DestroySelf
trigger1 = !AnimTime
trigger2 = Time > 5 && Anim = 8000
ignorehitpause = 1
;--------------------------------
; Electric spark effect on target
[StateDef 8100]
Anim      = 8000;8100
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0

[State 8100, Target tracker type]
type = VarSet
triggerAll = !Time
trigger1 = Root,StateNo = 2000 ; DSpark
trigger2 = Root,StateNo = 2303 ; EED
var(1) = 1
ignorehitpause = 1

[State 8100, Pos]
type = VarSet
trigger1 = !Time
var(2) = Root,Var(5)+25000
ignorehitpause = 1
[State 8100, Pos PFist]
type = VarSet
trigger1 = !Time
trigger1 = Parent,StateNo = 1210
var(2) = 45000
ignorehitpause = 1

[State 8100, Lingering type]
type = PosSet
trigger1 = !Time
trigger1 = !Var(1)
x = Parent,Pos X + IfElse(P2Dist X < 0, Floor(P2Dist X / 2), IfElse(P2Dist X < Floor(Var(2)/1000), Floor(Var(2)/1000-(P2Dist X)/3), Floor(Var(2)/1000)))*Parent,Facing
y = Parent,Pos Y - Var(2)%1000
;x = Root,Pos X + IfElse(P2Dist X < 0, Floor(P2Dist X / 2), IfElse(P2Dist X < Floor(Var(2)/1000), Floor(Var(2)/1000-(P2Dist X)/3), Floor(Var(2)/1000)))*Root,Facing
;y = Root,Pos Y - Var(2)%1000
ignorehitpause = 1

[State 8100, Pos 1]
Type = PosSet
triggerAll = Var(1)
trigger1 = EnemyNear,StateType = S
trigger2 = EnemyNear,StateType = A && Vel Y <= 0
x = EnemyNear,Pos X + (EnemyNear,Const(size.mid.pos.x) * facing)
y = EnemyNear,Pos Y + EnemyNear,Const(size.mid.pos.y)
ignorehitpause = 1
[State 8100, Pos 2]
Type = PosSet
triggerAll = Var(1)
trigger1 = EnemyNear,StateType = C
x = EnemyNear,Pos X + (EnemyNear,Const(size.mid.pos.x) * facing)
y = EnemyNear,Pos Y + ceil(EnemyNear,Const(size.mid.pos.y)/2)
ignorehitpause = 1
[State 8100, Pos 3]
Type = PosSet
triggerAll = Var(1)
trigger1 = EnemyNear,StateType = L
x = EnemyNear,Pos X
y = EnemyNear,Pos Y
ignorehitpause = 1
[State 8100, Pos 3]
Type = PosSet
triggerAll = Var(1)
trigger1 = EnemyNear,StateType = A
trigger1 = Vel Y > 0
x = EnemyNear,Pos X
y = EnemyNear,Pos Y + ceil(EnemyNear,Const(size.mid.pos.y)/1.5)
ignorehitpause = 1

; Electric sparks
[State 8100, 1st spark]
type = Helper
triggerAll = EnemyNear,MoveType = H
triggerAll = EnemyNear,StateType != L
;triggerAll = Root,NumHelper(8100) < 2
triggerAll = Var(1) || Time < 20
trigger1 = (Time%2) = 1
name = "Spark"
stateno = 8500
ownpal = 1
pos = -10+Random%30,-20+Random%60
[State 8100, 2nd spark]
type = Helper
triggerAll = EnemyNear,MoveType = H
triggerAll = EnemyNear,StateType != L
;triggerAll = Root,NumHelper(8100) < 2
triggerAll = Var(1) || Time < 20
trigger1 = (Time%2) = 1
name = "Spark"
stateno = 8500
ownpal = 1
pos = -10+Random%30,-20+Random%60
[State 8100, 3rd spark]
type = Helper
triggerAll = EnemyNear,MoveType = H
triggerAll = EnemyNear,StateType != L
;triggerAll = Root,NumHelper(8100) < 2
triggerAll = Var(1) || Time < 20
trigger1 = (Time%2) = 1
name = "Spark"
stateno = 8500
ownpal = 1
pos = -10+Random%30,-20+Random%60

; Display info
[State 8100, Clipboard]
type = DisplayToClipboard
trigger1 = 1
text = "PosType : %d, pos : %d \n Jin Kazama by Byakko"
params = var(1), var(2)
ignorehitpause = 1

[State 8100, End]
Type = DestroySelf
;triggerAll = !NumHelper || Time > 30
triggerAll = Time > 30
trigger1 = EnemyNear,MoveType != H
trigger2 = EnemyNear,StateType = L
trigger3 = !Var(1) && Time >= 12
trigger4 = Parent,MoveHit=1;Root,NumHelper(8100) > 1
trigger5 = Time > 100
trigger6 = !(Root,NumTarget)
;[State 8100, End]
;Type = DestroySelf
;trigger1 = !(Root,NumTarget)
;-----------------------------------------------------------------
; Small electric spark
[StateDef 8500]
Anim      = 390
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0
SprPriority = 5

[State 8500, Anim randomizer]
type = ChangeAnim
trigger1 = !Time
value = Anim
elem = 1+Random%5

[State 8500, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 8500, Trans]
Type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 8500, Turn]
type = Turn
trigger1 = !Time
trigger1 = Random%2

[State 8500, Angle]
type = VarSet
trigger1 = !Time
trigger1 = Parent,Time = 0
var(1) = Random%360

[State 8500, Scale randomizer]
type = VarSet
trigger1 = !Time
fvar(2) = Random%5+2*(Parent,StateNo=2303)+1*(Parent,StateNo=8100)

[State 8500, Rotate]
Type = AngleDraw
trigger1 = 1
value = Var(1)
scale = 0.3+FVar(2)/10,0.3+FVar(2)/10
ignorehitpause = 1

[State 8500, Fade]
type = PalFX
trigger1 = Time >= 10
add = -32*(Time-10),-32*(Time-10),-32*(Time-10)

[State 8500, End]
Type = DestroySelf
trigger1 = Time >= 14 + Random%6
;-----------------------------------------------------------------
; Twin Lancer 2 lightning
[StateDef 238]
Anim      = 238
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0
SprPriority = 5

[State 238, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 238, Trans]
Type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 238, Rotate]
Type = AngleDraw
trigger1 = 1
value = -40
scale = 0.4,0.4
ignorehitpause = 1

; Constant ChangeAnim set to element depending on Parent's current AnimElem
[State 238, Anim]
type = null;ChangeAnim
trigger1 = Parent,AnimElem = 3
value = Anim
elem = 6

; Constant BindToParent depending on Parent's current AnimElem
[State 238, Bind 1]
type = BindToParent
trigger1 = Parent,StateNo = 232
trigger1 = Parent,AnimElemNo(0) = 1
trigger2 = Parent,Anim = 2301
trigger2 = Parent,AnimElemNo(0) = 7
trigger3 = Parent,Anim = 6070
trigger3 = Parent,AnimElemNo(0) = 38
pos = -67,-93
[State 238, Bind 2]
type = BindToParent
trigger1 = Parent,StateNo = 232
trigger1 = Parent,AnimElemNo(0) = 2
trigger2 = Parent,Anim = 2301
trigger2 = Parent,AnimElemNo(0) = 8
trigger3 = Parent,Anim = 6070
trigger3 = Parent,AnimElemNo(0) = 39
pos = -41,-104
[State 238, Bind 3]
type = BindToParent
trigger1 = Parent,StateNo = 232
trigger1 = Parent,AnimElemNo(0) = [3,5]
trigger2 = Parent,Anim = 2301
trigger2 = Parent,AnimElemNo(0) = [9,11]
trigger3 = Parent,Anim = 6070
trigger3 = Parent,AnimElemNo(0) = [40,42]
pos = 13,-102

[State 238, End]
Type = DestroySelf
trigger1 = !AnimTime
trigger2 = Parent,MoveType = H
trigger3 = Time > 40
;-----------------------------------------------------------------
; Main supercharge effect
[StateDef 2900]
Anim      = 8000
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0

[State 2900, SFX]
type = PlaySnd
trigger1 = !Time
value = 750,2
channel = 4

; First lightning : straight up 0°
; Second lightning : bottom right, 230°
; Third lightning : left, 100°
; Fourth lightning : upper right, 350°

[State 2900, EX GFX]
type = Explod
trigger1 = !Time
anim = 2911
scale = 0.4,0.4
trans = add
ownpal = 1
sprpriority = 5
bindtime = -1
supermovetime = 500

[State 2900, 1st lightning]
type = Helper
trigger1 = !Time
name = "Supercharge lightning"
stateno = 2901
ownpal = 1
supermovetime = 500
[State 2900, 2nd lightning]
type = Helper
trigger1 = Time = 1
name = "Supercharge lightning"
stateno = 2901
ownpal = 1
supermovetime = 500
[State 2900, 3rd lightning]
type = Helper
trigger1 = Time = 2
name = "Supercharge lightning"
stateno = 2901
ownpal = 1
supermovetime = 500
[State 2900, 4th lightning]
type = Helper
trigger1 = Time = 3
name = "Supercharge lightning"
stateno = 2901
ownpal = 1
supermovetime = 500
[State 2900, 5th lightning]
type = Helper
trigger1 = Time = 4
name = "Supercharge lightning"
stateno = 2901
ownpal = 1
supermovetime = 500

[State 2900, End]
Type = DestroySelf
trigger1 = Time >= 35
;-----------------------------------------------------------------
; Supercharge lightning
[StateDef 2901]
Anim      = 2900
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0
SprPriority = 5

[State 2901, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = Root,StateNo=[2100,2250]
value = 2901

[State 2901, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 2901, Trans]
Type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2901, Turn]
type = Turn
trigger1 = !Time
trigger1 = Random%2

; First lightning : straight up 0°
; Second lightning : bottom right, 230°
; Third lightning : left, 100°
; Fourth lightning : upper right, 350°

[State 2901, Angle 1]
type = VarSet
trigger1 = !Time
trigger1 = Parent,Time = 0
var(1) = -10+Random%21
[State 2901, Angle 2]
type = VarSet
trigger1 = !Time
trigger1 = Parent,Time = 1
var(1) = 220+Random%21
[State 2901, Angle 3]
type = VarSet
trigger1 = !Time
trigger1 = Parent,Time = 2
var(1) = 90+Random%21
[State 2901, Angle 4]
type = VarSet
trigger1 = !Time
trigger1 = Parent,Time = 3
var(1) = 320+Random%21
[State 2901, Angle 5]
type = VarSet
trigger1 = !Time
trigger1 = Parent,Time = 4
var(1) = 160+Random%21

[State 2901, Scale randomizer]
type = VarSet
trigger1 = !Time
fvar(2) = Random%4 - (Root,StateNo=[2100,2250])

[State 2901, Rotate]
Type = AngleDraw
trigger1 = 1
value = Var(1)
scale = 0.3+FVar(2)/10,0.4+Var(2)/10
ignorehitpause = 1

; Display info
[State 2901, Clipboard]
type = DisplayToClipboard
trigger1 = 1
text = "Angle : %d, Scale : %d \n Jin Kazama by Byakko"
params = Var(1), FVar(2)
ignorehitpause = 1

[State 2901, End]
Type = DestroySelf
trigger1 = !AnimTime
;-----------------------------------------------------------------
; Lv3 Infernal Destruction supercharge portrait
[StateDef 2910]
Anim      = 8000
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0

[State 2910, Black BG]
type = BGPalFX
trigger1 = !Time
time = 75
color = 256
mul = 0,0,0
ignorehitpause = 1

[State 2910, SFX]
type = PlaySnd
trigger1 = !Time
value = 750,2
channel = 4

[State 2910, Portrait - facing right]
type = Explod
trigger1 = !Time
trigger1 = Facing = 1
anim = 2511
sprpriority = 5
postype = left
supermovetime = 75
pausemovetime = 75
ontop = 5

[State 2910, Portrait - facing left]
type = Explod
trigger1 = !Time
trigger1 = Facing = -1
anim = 2511
sprpriority = 5
postype = right
facing = -1
supermovetime = 75
pausemovetime = 75
ontop = 5

[State 2910, End]
Type = DestroySelf
trigger1 = Time >= 35
;-----------------------------------------------------------------
; Lv3 Infernal Destruction hit sparks
[StateDef 2560]
Anim      = 8000
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0

[State 2560, Sparks - facing right]
type = Explod
trigger1 = !Time
trigger1 = Facing = 1
anim = 2560
sprpriority = 5
postype = right
facing = 1
ontop = 5
pos = 0,50
scale = 0.75,0.5

[State 2560, Sparks - facing left]
type = Explod
trigger1 = !Time
trigger1 = Facing = -1
anim = 2560
sprpriority = 5
postype = left
facing = -1
ontop = 5
pos = 0,50
scale = 0.85,0.5

[State 2560, End]
Type = DestroySelf
trigger1 = Time >= 35
;-----------------------------------------------------------------
; Red BG counter
[StateDef 8200]
Anim      = 8000
MoveType  = I
Type      = A
Physics   = N
Ctrl      = 0
SprPriority = 5

[State 8200, Red flash]
type = BGPalFX
trigger1 = 1
time = 1
color = 21*Time
add = 216-21*Time,0,0
mul = 256,21*Time,21*Time
ignorehitpause = 1

[State 8200, End]
Type = DestroySelf
trigger1 = Time >= 12
;-----------------------------------------------------------------
