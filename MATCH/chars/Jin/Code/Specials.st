;--------------------------
; SPECIAL MOVES.ST
;--------------------------
;==========
; VARIABLES
;==========
; Var(0) : special cancelable
; Var(1) : string position
; Var(2) : button press detection for special moves
; Var(3) : bound limiter
; [Var(3) : 222 <=> 2xx = number of usage of Cross Cancel in the current combo, x2x = Wall Slam, xx2 = Bound Attacks]
; Var(4) : Counter Hit - 0 : none, 1 : regular counter (constant check), 2 : forced counter (after EX Power Stance or canceled Super Charge at EX level)
; Var(5) : hitspark generator X axis * 1000 + Y axis
; Var(6) : throw limiter
; FVar(10) : custom combo counter for custom combo dampener
; FVar(11) : custom combo dampener after FVar(10) >= 5
; FVar(12) : CvS2 life&power damage scaling system added to combo dampener
;--------------------------

;--------------------------
; Special Step
;--------------------------
; Special Step
[StateDef 1000]
Anim      = 1000
MoveType  = I
Type      = S
Physics   = N
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = Time < 29
value = A,AP
time = 1

[State 1000, Step]
type = PlaySnd
trigger1 = !Time
value = 40,0
channel = 1
[State 1000, SFX]
type = PlaySnd
trigger1 = Time = 3
value = 100,0
channel = 2

[State 1000, Dash]
type = VelSet
trigger1 = Time = 3
x = 9

[State 1000, Dust]
type = Explod
trigger1 = Time = 3
anim = 8520
trans = add
scale = 0.4,0.4
sprpriority = 5
ownpal = 1
[State 1000, Dust 2]
type = Explod
trigger1 = Time = 10
anim = 8500
trans = add
scale = 0.4,0.4
sprpriority = 5
ownpal = 1

[State 1000, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 1000, EX]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
triggerAll = Time < 29
triggerAll = Power >= 500
trigger1 = Command = "x" && Command = "y"
trigger2 = Command = "y" && Command = "z"
trigger3 = Command = "x" && Command = "z"
var(1) = 1070;1010
[State 1000, Backdash]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
triggerAll = Time > 2
trigger1 = Time < 29
trigger1 = Command = "holdback"
var(1) = 105
[State 1000, THF]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
triggerAll = Time > 2
trigger1 = Time < 29
trigger1 = Command = "x" || Command = "rel_x"
var(1) = 1010
[State 1000, WHF]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
triggerAll = Time > 2
trigger1 = Time < 29
trigger1 = Command = "y" || Command = "rel_y"
var(1) = 1020
[State 1000, TU]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
triggerAll = Time > 2
trigger1 = Time < 29
trigger1 = Command = "z" || Command = "rel_z"
var(1) = 1030
[State 1000, SFK]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
triggerAll = Time > 2
trigger1 = Time < 29
trigger1 = Command = "a" || Command = "rel_a"
var(1) = 1040
[State 1000, LLRK]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
triggerAll = Time > 2
trigger1 = Time < 29
trigger1 = Command = "b" || Command = "rel_b"
var(1) = 1050
[State 1000, LSK]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
triggerAll = Time > 2
trigger1 = Time < 29
trigger1 = Command = "c" || Command = "rel_c"
var(1) = 1060

[State 1000, Physics]
type = StateTypeSet
trigger1 = Time = 15
physics = S

[State 1000, Input]
type = ChangeState
trigger1 = Time = [0,29];= [4,29]
trigger1 = Var(1) = 1070
value = 1030
[State 1000, Input]
type = ChangeState
;trigger1 = Time = [2,29];= [4,29]
;trigger1 = Var(1) = [1010,1020]
trigger1 = Time = [9,29]
trigger1 = Var(1) = 105 || Var(1) = [1010,1060]
value = Var(1)

[State 1000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Thunder Hook Fist
[StateDef 1010]
Anim      = 1010
MoveType  = A
Type      = S
Physics   = S
Ctrl      = 0

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = Time < 5
value = A,AP
time = 1

[State 1010, Vel]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 1010, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 53073

[State 1010, Whoosh]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 7,1
channel = 2

[State 1010, GFX]
type = Explod
trigger1 = Time = 2
anim = 229
trans = add
scale = 0.4,0.4
sprpriority = 5
bindtime = -1
removeongethit = 1
ownpal = 1
id = 1015
[State 1010, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 7,24;7,4
channel = 4
[State 1010, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8521
trans = add
pos = 30,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1010, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*60),15
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-73
hitsound         = S5,5
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 12
ground.hittime   = 21
guard.hittime    = 16
ground.velocity  = -6.5
air.velocity     = -4,-3
guard.velocity   = -8
getpower         = 50, 25
givepower        = 25, 12
fall.recover     = 0

; Second hitdef on counter hit causes stomach stagger (longer hitstun), everything is identical
[State 1010, Hit - counter]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = Var(4)
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*60),15
pausetime        = 4,16
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-66
hitsound         = S5,7
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 12
ground.hittime   = 42
guard.hittime    = 16
ground.velocity  = -6.5
air.velocity     = -4,-3
guard.velocity   = -8
getpower         = 50, 25
givepower        = 25, 12

[State 1010, Idle]
type = StateTypeSet
trigger1 = AnimElem = 4, = 0
movetype = I

[State 1010, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Wind Hook Fist
[StateDef 1020]
Anim      = 1020
MoveType  = A
Type      = S
Physics   = S
Ctrl      = 0
Poweradd  = 12

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = Time <= 4
value = A,AP
time = 1

[State 1020, 10HC 10 Vel]
type = VelSet
triggerAll = !Time
trigger1 = PrevStateNo = 234
trigger2 = PrevStateNo = 1050
x = 4
[State 1020, 10HC 10 Pos]
type = PosAdd
triggerAll = !Time
trigger1 = PrevStateNo = 234
trigger2 = PrevStateNo = 1050
x = 15

[State 1020, Vel]
type = VelSet
trigger1 = AnimElem = 2
trigger1 = PrevStateNo != 234
trigger1 = PrevStateNo != 1050
x = 0

[State 1020, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 40078

[State 1020, Width]
type = null;Width
trigger1 = AnimElem = 3
value = 25,-18
[State 1020, Pos 1]
type = PosAdd
trigger1 = AnimElem = 3
x = 25
[State 1020, Pos 2]
type = PosAdd
trigger1 = AnimElem = 5
x = 4

[State 1020, Whoosh]
Type = PlaySnd
trigger1 = AnimElem = 4
value = 7,6;7,2
channel = 2
[State 1020, Elec whoosh]
Type = PlaySnd
trigger1 = Time = 6
value = 7,24;7,4
channel = 4
[State 1020, GFX]
type = Explod
trigger1 = Time = 6;AnimElem = 3, = 1
anim = 1025
pos = -26,-24
scale = 0.4,0.27
trans = add
ownpal = 1
bindtime = -1
sprpriority = 5
removeongethit = 1
id = 1025
[State 320, Dust]
type = Explod
trigger1 = AnimElem = 4
anim = 8521
trans = add
pos = 30,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1020, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*130),38
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,7;5
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 28
guard.hittime    = 14
ground.velocity  = -3.5,-5.5
air.velocity     = -2.5,-4
guard.velocity   = -8.5
getpower         = 50, 25
givepower        = 25, 12
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1020, Hit - after LLRK]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 1050
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*80),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,7
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 28
guard.hittime    = 14
ground.velocity  = -3.5,-5.5
air.velocity     = -2.5,-4
guard.velocity   = -8.5
getpower         = 50, 25
givepower        = 25, 12
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1020, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Thrusting Uppercut
[StateDef 1030]
Anim      = 1030
MoveType  = A
Type      = S
Physics   = S
Ctrl      = 0
Poweradd  = 25

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = Time < 9
value = A,AP
time = 1

[State 1000, NotHitBy]
type = NotHitBy
trigger1 = Time < 12
trigger1 = Var(1) = 1070
value = A,AA,AP,AT
time = 1

[State 1030, EX]
type = PowerAdd
trigger1 = !Time
trigger1 = Var(1) = 1070
value = -500
[State 1030, EX speed]
type = ChangeAnim
trigger1 = Var(1) = 1070
trigger1 = AnimElem = 1, = 2
value = Anim
elem = 2

[State 1030, Vel]
type = VelSet
trigger1 = AnimElem = 3
x = 0

[State 1030, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 39080
[State 1030, hitspark position 2]
type = VarSet
trigger1 = AnimElem = 4
var(5) = 21112

[State 1030, Whoosh]
Type = PlaySnd
trigger1 = AnimElem = 3
value = 7,6;7,2
channel = 2
[State 1030, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 7,24;7,4
channel = 4

[State 1030, PalFX]
type = PalFX
trigger1 = Var(1) = 1070
time = 1
add = floor(80 - 50*sin(2*pi*Time/10)),floor(60 - 50*sin(2*pi*Time/10)),-256

[State 1030, GFX]
type = Explod
trigger1 = Time = 3
anim = 1035
pos = -26,-15
scale = 0.4,0.4
trans = add
ownpal = 1
bindtime = -1
sprpriority = 5
removeongethit = 1
id = 1035
[State 320, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8521
trans = add
pos = 30,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1030, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*100),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-80
hitsound         = S5,5
guardsound       = S6,2
ground.type      = High
ground.slidetime = 20
ground.hittime   = 29
guard.hittime    = 7
ground.velocity  = -3.5,-6.5
air.velocity     = -2.85,-4.5
guard.velocity   = -12
getpower         = 87, 37
givepower        = 37, 17
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000
[State 1030, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = AnimElem = 4
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Up
damage           = ceil(fvar(12)*100),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-112
hitsound         = S5,5
guardsound       = S6,2
ground.type      = High
ground.slidetime = 20
ground.hittime   = 29
guard.hittime    = 7
ground.velocity  = -3.5,-6.5
air.velocity     = -2.85,-4.5
guard.velocity   = -12
getpower         = 87, 37
givepower        = 37, 17
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1030, Hit EX]
type = HitDef
trigger1 = !Time
trigger1 = Var(1) = 1070
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Up
damage           = ceil(fvar(12)*70),28
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-80
hitsound         = S5,6
guardsound       = S6,2
ground.type      = High
ground.slidetime = 27
ground.hittime   = 29
guard.hittime    = 14
ground.velocity  = -2,-10
air.velocity     = -2.85,-8
guard.velocity   = -12
getpower         = 0, 0
givepower        = 37, 17
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000
[State 1030, Hit EX]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = AnimElem = 4
trigger1 = Var(1) = 1070
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Up
damage           = ceil(fvar(12)*70),28
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-112
hitsound         = S5,6
guardsound       = S6,2
ground.type      = High
ground.slidetime = 27
ground.hittime   = 29
guard.hittime    = 14
ground.velocity  = -2,-10
air.velocity     = -2.85,-8
guard.velocity   = -12
getpower         = 0, 0
givepower        = 37, 17
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1030, Idle]
type = StateTypeSet
trigger1 = AnimElem = 5, = 0
movetype = I

[State 1030, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Spinning Flare Kick
[StateDef 1040]
Anim      = 1040
MoveType  = A
Type      = S
Physics   = S
Ctrl      = 0
Poweradd  = 37

[State 1040, Vel]
type = VelSet
trigger1 = AnimElem = 2
x = 0

[State 1040, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 15085
[State 1040, hitspark position]
type = VarSet
trigger1 = AnimElem = 7
var(5) = 31047

[State 1040, Wid 1]
type = Width
trigger1 = AnimElem = 4
value = 35,-18
[State 1040, Jump]
type = PosAdd
trigger1 = AnimElem = 4
x = 35
y = -29
[State 1040, Wid 2]
type = Width
trigger1 = AnimElem = 4
value = 22,-18
[State 1040, Jump SFX]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 1
[State 320, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8520
trans = add
pos = -35,0
scale = 0.3,0.3
sprpriority = 5
ownpal = 1

[State 1040, Speed]
type = VelSet
trigger1 = AnimElem = 4
x = 5
y = -2

[State 1040, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1140, 0
channel = 3
[State 1040, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4, = 2
value = 7,9;7,2
channel = 2

[State 1040, Air]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N
[State 1040, Gravity]
type = Gravity
trigger1 = StateType = A
[State 1040, Air]
type = StateTypeSet
trigger1 = AnimElem = 8
statetype = S
physics = S

[State 1040, Land]
type = VelSet
trigger1 = AnimElem = 8
y = 0
[State 1040, Land SFX]
type = PlaySnd
trigger1 = AnimElem = 8
value = 40,2
channel = 1
[State 1140, Land dust]
type = Explod
trigger1 = AnimElem = 8
anim = 8510
pos = 10, 0
trans = add
scale = 0.4,0.4
sprpriority = -4
ownpal = 1
[State 1140, Land impact]
type = Explod
trigger1 = AnimElem = 8
anim = 8530
pos = 10, 0
scale = 0.3,0.3
sprpriority = -5
ownpal = 1
[State 1040, Land]
type = PosSet
trigger1 = AnimElemNo(0) >= 8
trigger1 = Pos Y < 0
y = 0

[State 1040, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAFD
guardflag        = HA
animtype         = DiagUp
damage           = ceil(fvar(12)*80),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 12
ground.hittime   = 14
guard.hittime    = 7
ground.velocity  = -3.5,-3.5
air.velocity     = -2.5,4
down.velocity    = -2,-3.8
guard.velocity   = -8
down.bounce      = 1
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000
[State 1040, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = AnimElem = 7
attr             = S, SA
hitflag          = MAFD
guardflag        = HA
animtype         = DiagUp
damage           = ceil(fvar(12)*80),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 12
ground.hittime   = 14
guard.hittime    = 7
ground.velocity  = -3.5,-3.5
air.velocity     = -2.5,4
down.velocity    = -2,-3.8
guard.velocity   = -8
down.bounce      = 1
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
sparkno = S8000

[State 1040, Hit - after LLRK]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 1050
attr             = S, SA
hitflag          = MAFD
guardflag        = HA
animtype         = DiagUp
damage           = ceil(fvar(12)*50),18
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-10
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 12
ground.hittime   = 14
guard.hittime    = 7
ground.velocity  = -3.5,-3.5
air.velocity     = -2.5,4
down.velocity    = -2,-3.8
guard.velocity   = -8
down.bounce      = 1
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
sparkno = S8000
[State 1040, Hit - after LLRK]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = PrevStateNo = 1050
trigger1 = AnimElem = 7
attr             = S, SA
hitflag          = MAFD
guardflag        = HA
animtype         = DiagUp
damage           = ceil(fvar(12)*50),18
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-10
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 12
ground.hittime   = 14
guard.hittime    = 7
ground.velocity  = -3.5,-3.5
air.velocity     = -2.5,4
down.velocity    = -2,-3.8
guard.velocity   = -8
down.bounce      = 1
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
sparkno = S8000

[State 1040, Idle]
type = StateTypeSet
trigger1 = AnimElem = 9, = 0
movetype = I

[State 1040, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Lunging Low Roundhouse Kick (LLRK)
[StateDef 1050]
Anim      = 1050
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = Time < 4
value = A,AP
time = 1

[State 1050, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 65035

[State 1050, Slide]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 8

[State 1050, Voice]
type = PlaySnd
triggerAll = !(Random%2)
trigger1 = AnimElem = 2
value = 201, random%4
channel = 3
[State 1050, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,10;7,2
Channel = 2

[State 1050, Dust]
type = Explod
trigger1 = AnimElem = 2
anim = 8521
trans = add
pos = 24,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1
[State 1050, GFX]
type = Explod
trigger1 = Anim = 1050
trigger1 = AnimElem = 2, = 2
trigger2 = Anim = 1051
trigger2 = AnimElem = 3, = 2
anim = 1055
pos = 71,-27
scale = 0.4,0.4
trans = add
sprpriority = 5
bindtime = -1
ownpal = 1

[State 1050, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = L
animtype         = Back
damage           = ceil(fvar(12)*50),18
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-35
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 12
ground.hittime   = 14
guard.hittime    = 18
ground.velocity  = -2.3,-5.2
air.velocity     = -2,-3.5
guard.velocity   = -6
getpower         = 50, 25
givepower        = 25, 12
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
fall.recover     = 0
down.bounce      = 1
sparkno = S8000
; low attack

[State 1050, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0
[State 1050, SFK]
type = VarSet
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = AnimElemNo(0) < 8
trigger1 = Command = "a" || Command = "b" || Command = "c" || Command = "rel_a" || Command = "rel_c"
var(1) = 1040
[State 1050, WHF]
type = VarSet
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = AnimElemNo(0) < 8
trigger1 = Command = "x" || Command = "y" || Command = "z" || Command = "rel_x" || Command = "rel_y" || Command = "rel_z"
var(1) = 1020

[State 1050, Quick anim]
type = ChangeAnim
trigger1 = Var(1)
trigger1 = AnimElem = 6, = 2
value = Anim
elem = 7
[State 1050, Quick anim]
type = ChangeAnim
trigger1 = Var(1) = 1020
trigger1 = AnimElem = 7, = 2
value = Anim
elem = 8
[State 1050, Follow-up]
type = ChangeState
trigger1 = Var(1) = 1020
trigger1 = AnimElem = 8, >= 2
trigger2 = Var(1) = 1040
trigger2 = AnimElem = 7, >= 2
value = Var(1)

[State 1050, Idle]
type = StateTypeSet
trigger1 = AnimElem = 4, = 0
movetype = I

[State 1050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Leaping Slash Kick
[StateDef 1060]
Anim      = 1060
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 10

[State 1060, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 62079;52103

;---
[State 1140, Jump]
type = VelSet
trigger1 = AnimElem = 2;4
x = 5
y = -2
[State 1140, Jump SFX]
type = PlaySnd
trigger1 = AnimElem = 2;4
value = 40,0
channel = 1
[State 320, Dust]
type = Explod
trigger1 = AnimElem = 2;3
anim = 8520
trans = add
pos = -35,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1140, Air]
type = StateTypeSet
trigger1 = AnimElem = 2;4
statetype = A
physics = N
[State 1140, Gravity]
type = VelAdd
trigger1 = StateType = A
y = 0.2
[State 1140, Land]
type = StateTypeSet
trigger1 = AnimElem = 9
statetype = S
physics = S

[State 1140, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 7,8;7,2
channel = 2

[State 1140, Quick landing]
type = ChangeAnim
trigger1 = AnimElemNo(0) = [5,8]
trigger1 = Pos Y >= 0
value = Anim
elem = 9

[State 1140, Land Vel]
type = VelSet
trigger1 = AnimElemNo(0) >= 9
trigger1 = Vel Y != 0
x = 0
y = 0
[State 1140, Land]
type = PosSet
trigger1 = AnimElem = 9, >= 0
y = 0
[State 1140, Land SFX]
type = PlaySnd
trigger1 = AnimElem = 9
value = 40,1
channel = 1
[State 1140, Land dust]
type = Explod
trigger1 = AnimElem = 9
anim = 8510
trans = add
scale = 0.25,0.25
sprpriority = -5
ownpal = 1
;---

[State 1140, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*90),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-103
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
ground.slidetime = 14
ground.hittime   = 13
guard.hittime    = 9
ground.velocity  = -8,-4
air.velocity     = -3,-4
guard.velocity   = -10
getpower         = 30, 10
givepower        = 15, 7
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1050, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Mental Alertness
;--------------------------
; Zanshin / Zenshin
[StateDef 1100]
;Anim      = 1100
MoveType  = I
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = PrevStateNo != 1100
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 1400, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 18028

[State 1100, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo != 1100
value = 1100

[State 1100, Zanshin detection]
type = ChangeAnim
triggerAll = !Time
triggerAll = PrevStateNo != [200,900]
triggerAll = PrevStateNo != 1100
trigger1 = Command = "holdback" && !AILevel
trigger2 = AILevel
trigger2 = P2BodyDist X < 35 || Random < 400
trigger3 = AILevel
trigger3 = P2BodyDist X < 130
trigger3 = EnemyNear,StateType = A
trigger3 = EnemyNear,Vel X > 2 ; enemy jumping forward
value = 1105
; Zenshin can be entered from String Combos and the direction can be already released
; Zanshin can not come from a String Combo and the direction is definitely still held as any possible special cancel into it is instantaneous
; Before the String reset to make sure Zanshin can not come from a String Combo

[State 1100, NHB]
type = NotHitBy
trigger1 = Time <= 10
value = SCA,AA
[State 1100, Autoblock]
type = ReversalDef
trigger1 = PrevStateNo != 1100
trigger1 = Time = [11,36]
reversal.attr = SCA, NA, SA
pausetime = 4,6
sparkno   = S8000
hitsound  = S6,1
p1stateno = 1100
ignorehitpause = 1

[State 1100, String reset]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo != 1100
var(1) = 0

[State 1100, voice]
type = PlaySnd
trigger1 = AnimElem = 3, = 0
value = 1100, 0
channel = 3

[State 1100, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,2;7,3
Channel = 2

[State 1100, Slide back]
type = PosAdd
trigger1 = Anim = 1105
trigger1 = AnimElem = 5
x = -23;8

[State 1100, Slide forward 1]
type = PosAdd
trigger1 = Anim = 1100
trigger1 = AnimElem = 2
x = 4
[State 1100, Slide forward 2]
type = PosAdd
trigger1 = Anim = 1100
trigger1 = AnimElem = 3
x = 12
[State 1100, Slide forward 3]
type = PosAdd
trigger1 = Anim = 1100
trigger1 = AnimElem = 4
x = 12
[State 1100, Slide forward 4]
type = PosAdd
trigger1 = Anim = 1100
trigger1 = AnimElem = 5
x = -23
[State 1100, Slide forward 5]
type = PosAdd
trigger1 = Anim = 1100
trigger1 = AnimElem = 7
x = 14
[State 1100, Slide forward 6]
type = PosAdd
trigger1 = Anim = 1100
trigger1 = AnimElem = 8
x = 20

[State 1100, GFX]
type = Explod
trigger1 = !Time
trigger1 = !NumExplod(1106)
trigger1 = PrevStateNo != 1100
anim = 1106
scale = 0.42,0.42
trans = add
sprpriority = 5
ownpal = 1
bindtime = 36
ID = 1106
removeongethit = 1
[State 1100, Land dust]
type = Explod
trigger1 = AnimElem = 5
anim = 8510
pos = 11,0
trans = add
scale = 0.35,0.35
sprpriority = -5
ownpal = 1

[State 1100, Special Step]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = Anim = 1105 || PrevStateNo != [200,800]
trigger1 = !Var(1)
trigger1 = Command = "holdfwd" && Command = "holddown"
var(1) = 1000
[State 1100, Dash]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = Anim = 1105
trigger1 = !Var(1)
trigger1 = Command = "holdfwd"
var(1) = 100
[State 1100, LDP]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = Command = "x" ; no negative edge, need to tap
var(1) = 1110
[State 1100, SW]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = Command = "y" || Command = "rel_y"
var(1) = 1120
[State 1100, JTN]
type = null;VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = Command = "z" || Command = "rel_z"
var(1) = 1130
[State 1100, LSK]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = Command = "a" || Command = "rel_a"
var(1) = 1140
[State 1100, RS]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = Command = "b" || Command = "rel_b"
var(1) = 1150
[State 1100, S]
type = VarSet
triggerAll = !AILevel
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = Command = "c" || Command = "rel_c"
var(1) = 1160

[State 1100, follow-up]
type = ChangeState
triggerAll = Var(1)
trigger1 = Anim = 1105 && Time = [11,36]
trigger2 = Anim = 1100 && Time = [11,36];[5,30]
value = Var(1)
ctrl = Var(1) = 100

[State 1100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Left Drill Punch
[StateDef 1110]
;Anim      = 1110
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25

[State 1110, Anim]
type = ChangeAnim
triggerAll = PrevStateNo != 1110
trigger1 = !Time
value = 1110

[State 1110, 1 hit armor]
type = ReversalDef
trigger1 = PrevStateNo != 1110
trigger1 = AnimElemNo(0) < 6
reversal.attr = SCA, NA, SA
pausetime = 4,6
sparkno   = S8000
hitsound  = S6,1
p1stateno = 1110
ignorehitpause = 1

[State 1110, String reset]
type = VarSet
triggerAll = PrevStateNo != 1110
trigger1 = !Time
var(1) = 0

[State 1110, Spine Cracker]
type = VarSet
triggerAll = Time > 2
trigger1 = !Var(1)
trigger1 = AnimElemNo(0) < 9
trigger1 = Command = "y" || Command = "z"
var(1) = 1111

[State 1110, hitspark position]
type = VarSet
trigger1 = AnimElem = 6
var(5) = 56077

[State 1110, Step]
type = PlaySnd
triggerAll = PrevStateNo != 1110
trigger1 = !Time
value = 40,0
channel = 1

[State 1110, voice]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1110, 0
channel = 3
[State 1110, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 5
value = 7,6;7,2
channel = 2
[State 1110, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 4
value = 7,24;7,4
channel = 4

[State 1110, Dash]
type = null;VelSet
triggerAll = PrevStateNo != 1110
trigger1 = !Time
x = 28
[State 1110, Width]
type = null;Width
trigger1 = Time < 2
player = 45,-15
[State 1110, Pos]
type = PosAdd
trigger1 = Time = 0
x = 20
[State 1110, Pos]
type = PosAdd
trigger1 = Time = 1
x = 21
[State 1110, Width]
type = Width
trigger1 = Time = [2,4]
player = 27,-15
[State 1110, Pos]
type = PosAdd
trigger1 = AnimElem = 3
x = 26
[State 1110, Pos]
type = PosAdd
trigger1 = AnimElem = 4
x = 22
[State 1110, Pos]
type = PosAdd
trigger1 = AnimElem = 5
x = 25
[State 1110, Dust]
type = Explod
triggerAll = PrevStateNo != 1110
trigger1 = !Time
anim = 8520
trans = add
scale = 0.3,0.3
sprpriority = 5
ownpal = 1
[State 1110, Dust 2]
type = Explod
trigger1 = AnimElemTime(4) = 2
anim = 8500
trans = add
scale = 0.3,0.3
sprpriority = 5
ownpal = 1
[State 320, Dust 3]
type = Explod
trigger1 = AnimElem = 7
anim = 8521
trans = add
pos = 30,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1110, GFX]
type = RemoveExplod
triggerAll = PrevStateNo != 1110
trigger1 = !Time
trigger1 = NumExplod(1106)
ID = 1106
[State 1110, GFX]
type = Explod
triggerAll = PrevStateNo != 1110
trigger1 = !Time
anim = 1115
trans = add
scale = 0.4,0.4
sprpriority = 5
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1110, Hit]
type     = HitDef
trigger1 = AnimElem = 7
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*90),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-77
hitsound         = S5,5
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 12
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -6
air.velocity     = -3, -3
guard.velocity   = -5.5
getpower         = 100, 50
givepower        = 50, 25
ID               = 1110
fall.recover     = 0
sparkno = S8000

[State 1110, LDP]
type = ChangeState
trigger1 = Var(1)
trigger1 = AnimElem = 8, >= 3
value = var(1)

[State 1110, Idle]
type = StateTypeSet
trigger1 = AnimElem = 8
movetype = I

[State 1110, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Spine Cracker
[StateDef 1111]
Anim      = 1111
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 1111, Evil Intent 3 anim fix]
type = null;ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 230
value = 1112

[State 230, Evil Intent slide]
type = VelSet
trigger1 = !Time
trigger1 = PrevStateNo = 230
x = 4.5

[State 1111, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 1111, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 84054

[State 1111, voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1111, 0
channel = 3
[State 1111, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,7;7,3
channel = 2
[State 1111, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 7,24;7,4
channel = 4

[State 1111, Pos fix]
type = PosAdd
trigger1 = AnimElem = 9
x = 11

[State 1111, GFX]
type = Explod
trigger1 = AnimElem = 1, = 1
anim = 1314
pos = 84, -57
trans = add
scale = 0.4,0.4
sprpriority = 5
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1111, Hit]
type     = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*70),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-54
hitsound         = S5,5
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
guard.slidetime  = 19
ground.hittime   = 25
guard.hittime    = 19
ground.velocity  = -3.5,-2
air.velocity     = -3,-2
guard.velocity   = -8
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1111, Idle]
type = StateTypeSet
trigger1 = AnimElem = 4, = 0
movetype = I

[State 1111, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Swaying Willow
[StateDef 1120]
Anim      = 1120
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 1120, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 50066

[State 1120, voice]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1120, 0
channel = 3
[State 1120, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 3, = 2
value = 7,7;7,2
channel = 2
[State 1120, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 3
value = 7,24;7,4
channel = 4
[State 1120, Dust]
type = Explod
trigger1 = AnimElem = 4
anim = 8521
trans = add
pos = 42,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1120, Pos fix 1]
type = PosAdd
trigger1 = !Time
trigger2 = AnimElemNo(0) = 3
x = 8
[State 1120, Pos fix 2]
type = PosAdd
trigger1 = AnimElem = 4
x = 20

[State 1120, GFX]
type = RemoveExplod
trigger1 = !Time
trigger1 = NumExplod(1106)
ID = 1106
[State 1120, GFX]
type = Explod
trigger1 = !Time
anim = 1125
;pos = 71,-27
scale = 0.4,0.4
trans = add
scale = 0.4,0.4
sprpriority = 5
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1120, Hit]
type     = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*100),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-66
hitsound         = S5,5
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -6
air.velocity     = -4, -3
guard.velocity   = -5.5
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall.recover     = 0
sparkno = S8000

; Second hitdef on counter hit causes stomach stagger (longer hitstun), everything is identical in case of failure
[State 1120, Hit - counter]
type     = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = Var(4)
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*100),25
pausetime        = 4,16
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-66
hitsound         = S5,7
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 18
ground.hittime   = 43;25
guard.hittime    = 18
ground.velocity  = -6
air.velocity     = -4, -3
guard.velocity   = -5.5
getpower         = 100, 50
givepower        = 50, 25
fall.recover     = 0
sparkno = S8000

[State 1120, Idle]
type = StateTypeSet
trigger1 = AnimElem = 5, = 0
movetype = I

[State 1120, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Double Rising Uppercut / Joudan Tsukiage Niren
[StateDef 1130]
Anim      = 1130
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 1130, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 0

[State 1130, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 0

[State 1130, Hit]
type     = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Up
damage           = ceil(fvar(12)*60),15
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-10
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 12
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -2,-6
air.velocity     = -2,-4
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 1130, Hit 2]
type     = HitDef
trigger1 = AnimElem = 5
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*50),18
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-10
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
ground.slidetime = 12
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -3.5,-5
air.velocity     = -3.5,-6
guard.velocity   = -7.5
getpower         = 50, 25
givepower        = 25, 13
sparkno = S8000

[State 1130, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Leaping Sidekick / Shinkuu Joudan Tobigeri
[StateDef 1140]
Anim      = 1140
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 1140, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 52100

[State 1140, Width]
type = Width
trigger1 = AnimElem = 3
value = 34,-18
[State 1140, Pos]
type = PosAdd
trigger1 = AnimElem = 3
x = 34

[State 1140, Jump]
type = VelSet
trigger1 = AnimElem = 4
x = 6
y = -5.5
[State 1140, Jump SFX]
type = PlaySnd
trigger1 = AnimElem = 4
value = 40,0
channel = 1
[State 320, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8520
trans = add
pos = -35,0
scale = 0.3,0.3
sprpriority = 5
ownpal = 1

[State 1140, Air]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N
movetype = A
[State 1140, Gravity]
type = Gravity
trigger1 = StateType = A
[State 1140, Land]
type = StateTypeSet
trigger1 = AnimElem = 12
statetype = S
physics = S

[State 1140, Air-to-air invincibility]
type = NotHitBy
trigger1 = StateType = A
value = A, AA, AP

[State 1140, voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1140, 0
channel = 3
[State 1140, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,8;7,2
channel = 2
[State 1140, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 3
value = 7,24;7,4
channel = 4

[State 1140, Land Pos]
type = PosSet
trigger1 = AnimElemNo(0) >= 12
trigger1 = Pos Y != 0
y = 0
[State 1140, Land Vel]
type = VelSet
trigger1 = AnimElemNo(0) >= 12
trigger1 = Pos Y = 0
x = 0
y = 0
[State 1140, Land SFX]
type = PlaySnd
trigger1 = AnimElem = 12
value = 40,1
channel = 1
[State 1140, Land dust]
type = Explod
trigger1 = AnimElem = 12
anim = 8510
trans = add
scale = 0.25,0.25
sprpriority = -5
ownpal = 1

[State 1140, GFX]
type = RemoveExplod
trigger1 = !Time
trigger1 = NumExplod(1106)
ID = 1106
[State 1140, GFX]
type = Explod
trigger1 = !Time
anim = 1141
trans = add
scale = 0.4,0.4
sprpriority = 5
removeongethit = 1
ownpal = 1

[State 1140, Hit]
type     = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*100),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-100
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -5.5,-7.5
air.velocity     = -4,-6
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1140, Idle]
type = StateTypeSet
trigger1 = AnimElem = 8
movetype = I

[State 1140, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Right Sweep
[StateDef 1150]
Anim      = 1152;0
MoveType  = A
Type      = C
Physics   = C
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 1150, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 80005

[State 1150, Pos fix]
type = PosAdd
trigger1 = !Time
x = 24;14

[State 1150, Voice]
type = PlaySnd
trigger1 = AnimElem = 5
value = 1150, 0
channel = 3
[State 1150, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 6
value = 7,10;7,2
Channel = 2
[State 1150, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 6
value = 7,24;7,4
channel = 4

[State 1150, GFX]
type = RemoveExplod
trigger1 = !Time
trigger1 = NumExplod(1106)
ID = 1106
[State 1150, GFX]
type = Explod
trigger1 = !Time
anim = 1151
trans = add
scale = 0.4,0.4
sprpriority = 5
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1150, Hit]
type     = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = LA
animtype         = Back
damage           = ceil(fvar(12)*100),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-3
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 12
ground.hittime   = 25
guard.hittime    = 14
ground.velocity  = -3,-6.5
air.velocity     = -3, -3
guard.velocity   = -10.5
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1150, Idle]
type = StateTypeSet
trigger1 = AnimElem = 8, = 0
movetype = I

[State 1150, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;-----------------------------------------------------------------
; Stinger / Tate Geri
[StateDef 1160]
Anim      = 1160
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 1160, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 53053

[State 1160, Pos 1]
type = PosAdd
trigger1 = !Time
x = 5
[State 1160, Pos 2]
type = PosAdd
trigger1 = AnimElem = 2
x = 22
[State 1160, Pos 3]
type = PosAdd
trigger1 = AnimElem = 3
x = 22
[State 1160, Pos 4]
type = PosAdd
trigger1 = AnimElem = 6
x = -10
[State 1160, Pos 5]
type = PosAdd
trigger1 = AnimElem = 9
x = -4
[State 1160, Pos 6]
type = PosAdd
trigger1 = AnimElem = 10
x = 18

[State 1160, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4, = 3
value = 7,10
Channel = 2
persistent = 0

[State 1160, Hit]
type     = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = ceil(fvar(12)*100),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-10
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 12
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -6
air.velocity     = -2,2
guard.velocity   = -5.5
getpower         = 100, 50
givepower        = 50, 25
;fall             = 1
;fall.recover     = 0
ID               = 1160
sparkno = S8000

;[State 1160, Bound]
;type = null;TargetState
;triggerAll = Var(3)%10 < 3 ; Bound limiter
;trigger1 = NumTarget(1160)
;trigger1 = MoveHit
;trigger1 = Var(4) || Target,StateType = A
;trigger1 = Target,StateType != S && Target,StateType != C
;trigger1 = Target,StateNo != [4000,4002]
;trigger1 = Target,StateNo != [120,155]
;value = 4000

[State 1160, Idle]
type = StateTypeSet
trigger1 = AnimElem = 1160, = 7
movetype = I

[State 1160, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Penetrating Fist
;--------------------------
; Penetrating Fist / Toutetsuken
[StateDef 1200]
Anim      = 1200
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 1200, Button detection reset]
type = VarSet
trigger1 = !Time
var(2) = 0

[State 1200, EX light Button detection - light]
type = VarSet
triggerAll = !AILevel
triggerAll = !Time
triggerAll = Power >= 500
trigger1 = Command = "hold_x" && Command = "hold_y"
var(2) = 4
[State 1200, EX Button detection - medium]
type = VarSet
triggerAll = !AILevel
triggerAll = !Time
triggerAll = Power >= 500
trigger1 = Command = "hold_y" && Command = "hold_z"
var(2) = 5
[State 1200, EX Button detection - heavy]
type = VarSet
triggerAll = !AILevel
triggerAll = !Time
triggerAll = Power >= 500
trigger1 = Command = "hold_x" && Command = "hold_z"
var(2) = 6

;-------------
; AI button detection
; Condition : default
[State 1200, PF - Light]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = 1
var(2) = 1
; Condition : mid-range, enemy not airborne or not jumping forward
[State 1200, PF - Medium]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = P2BodyDist X > 140
trigger1 = EnemyNear,StateType != A || EnemyNear,Vel X <= 0
trigger1 = !NumTarget(4100)
var(2) = 2
; Condition : far, enemy not airborne or not jumping forward
[State 1200, PF - Heavy]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = P2BodyDist X > 210
trigger1 = EnemyNear,StateType != A || EnemyNear,Vel X <= 0
trigger1 = !NumTarget(4100)
var(2) = 3
; Condition : mid-range, jumping forward
[State 1200, PF - EX1]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
triggerAll = Power > 500
trigger1 = P2BodyDist X > 140
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Vel X > 0
var(2) = 4
; Condition : mid-range, jumping back
[State 1200, PF - EX2]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
triggerAll = Power > 500
trigger1 = P2BodyDist X = [140,200]
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Vel X < 0
var(2) = 5
; Condition : ... never
[State 1200, PF - EX3]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
triggerAll = Power > 500
trigger1 = 0
var(2) = 6
;-------------

[State 1200, Instant EX]
type = ChangeAnim
trigger1 = !Time
trigger1 = Var(2) >= 4
value = 1201

[State 1200, EX]
type = PowerAdd
trigger1 = !Time
trigger1 = Var(2) >= 4
value = -500

[State 1200, EX SFX]
type = PlaySnd
trigger1 = !Time
trigger1 = Var(2) = 4
value = 750,2
[State 1200, EX GFX]
type = Explod
trigger1 = Time < 5
trigger1 = Var(2) = 4
trigger1 = !NumExplod(2910)
anim = 2910
pos = -12,-61
scale = 0.4,0.4
trans = add
ownpal = 1
sprpriority = 5
id = 2910

[State 1200, normal button detection]
type = VarSet
triggerAll = !AILevel
trigger1 = !Time
trigger1 = !Var(2)
var(2) = IfElse(Command = "x" || Command = "rel_x", 1, IfElse(Command = "y" || Command = "rel_y", 2, 3))

[State 1200, EX doesn''t charge all the way]
type = ChangeAnim
trigger1 = Anim = 1201
trigger1 = AnimElem = 8, < 0
trigger1 = Time = 50;AnimElem = 5, = 2
value = Anim
elem = 8

[State 1200, Charge GFX]
type = Explod
trigger1 = Anim = [1200,1201]
trigger1 = AnimElemNo(0) = [4,7]
trigger1 = !NumExplod(1206)
anim = 1206
pos = -35,-54
scale = 0.4,0.4
trans = add
sprpriority = 5
ownpal = 1
ID = 1206
removeongethit = 1
[State 1200, Charge GFX end]
type = RemoveExplod
trigger1 = Anim = [1200,1201]
trigger1 = NumExplod(1206)
trigger1 = AnimElemNo(0) >= 8
ID = 1206
[State 1200, Shoot GFX]
type = Explod
trigger1 = Anim = [1200,1201]
trigger1 = !NumExplod(1207)
trigger1 = AnimElemNo(0) >= 8
anim = 1207
pos = -38,-62
scale = 0.4,0.4
trans = add
sprpriority = 5
ownpal = 1
ID = 1207
removeongethit = 1
[State 1200, Shoot EX GFX]
type = Explod
trigger1 = Anim = 1205
trigger1 = !NumExplod(1208)
trigger1 = AnimElem = 3
anim = 1208
pos = 0,-65
scale = 0.4,0.4
trans = add
sprpriority = 5
ownpal = 1
ID = 1208
removeongethit = 1

[State 1200, Super Charge]
type = ChangeState
triggerAll = Anim = [1200,1201]
triggerAll = AnimElemNo(0) = [4,8]
trigger1 = Time = 100
trigger2 = Time = 50
trigger2 = Var(2) >= 4
value = 2000

[State 1200, EX charge FX : EX]
type = Explod
triggerAll = Anim = [1200,1201]
trigger1 = AnimElem = 8, < 0 ; still charging
trigger1 = Var(2) < 4 ; charging from normal to EX
trigger1 = Time >= 50 ; charge time when normal becomes EX
anim = 2910
scale = 0.45,0.45
pos = -5,-74
trans = add
ownpal = 1
sprpriority = -5
removeongethit = 1
[State 1200, EX charge FX : Lightning]
type = Explod
triggerAll = Anim = [1200,1201]
trigger1 = AnimElem = 8, < 0 ; still charging
trigger1 = Var(2) < 4 ; charging from normal to EX
trigger1 = Time >= 50 ; charge time when normal becomes EX
anim = 2900
scale = 0.45,0.45
pos = -5,0
trans = add
ownpal = 1
sprpriority = 5
removeongethit = 1
[State 1200, EX charge FX : Whirlwind]
type = Explod
triggerAll = Anim = [1200,1201]
trigger1 = AnimElem = 8, < 0 ; still charging
trigger1 = Var(2) < 4 ; charging from normal to EX
trigger1 = Time >= 50 ; charge time when normal becomes EX
anim = 2915
scale = 0.45,0.45
pos = -5,0
trans = add
ownpal = 1
sprpriority = 5
removeongethit = 1
[State 1200, EX charge SFX]
type = PlaySnd
triggerAll = Anim = [1200,1201]
trigger1 = AnimElem = 8, < 0 ; still charging
trigger1 = Var(2) < 4 ; charging from normal to EX
trigger1 = Time >= 50 ; charge time when normal becomes EX
value = 1200,1
[State 1200, EX charge]
type = VarAdd
triggerAll = Anim = [1200,1201]
trigger1 = AnimElem = 8, < 0 ; still charging
trigger1 = Var(2) < 4 ; charging from normal to EX
trigger1 = Time >= 50 ; charge time when normal becomes EX
v = 2
value = 3

[State 1200, PalFX]
type = PalFX
trigger1 = Var(2) > 3
time = 1
add = floor(80 - 50*sin(2*pi*Time/10)),floor(60 - 50*sin(2*pi*Time/10)),-256

[State 1200, Release]
type = ChangeAnim
triggerAll = (Anim = 1200 && Time > 8) || (Anim = 1201 && Time >= 4)
triggerAll = AnimElem = 8, < 0 ; not already released
;triggerAll = Time > 8;12;AnimElemNo(0) >= 6; start of wind up part
trigger1 = Command != "hold_x" && Var(2)%3 = 1; light charge released
trigger2 = Command != "hold_y" && Var(2)%3 = 2; medium charge released
trigger3 = Command != "hold_z" && Var(2)%3 = 0; heavy charge released
trigger4 = AILevel && PrevStateNo = [200,600] ; AI immediate release if special canceled
value = 1200
elem = 8; skip charge to shooting
; it is possible to use qcf+x+y for immediate light EX, then release y and still charge, but not to do the same and release just x... Meh.

[State 1200, Voice]
type = PlaySnd
trigger1 = Anim = [1200,1201]
trigger1 = Var(2) < 4
trigger1 = AnimElem = 8
value = 1200,0
channel = 3
[State 1200, EX Voice]
type = PlaySnd
trigger1 = Anim = [1200,1201]
trigger1 = Var(2) >= 4
trigger1 = AnimElem = 8, = 1
value = 1205,0
channel = 3
[State 1200, Charge SFX]
type = PlaySnd
trigger1 = Anim = [1200,1201]
trigger1 = AnimElem = 4
value = 1210,0
channel = 4
[State 1200, Charge SFX stop]
type = StopSnd
trigger1 = Anim = [1200,1201]
trigger1 = AnimElem = 8
channel = 4
[State 1200, Elec whoosh]
Type = PlaySnd
trigger1 = Anim = [1200,1201]
trigger1 = AnimElem = 9
value = 7,24;7,4
channel = 4
[State 1200, Shoot dust]
type = Explod
trigger1 = Anim = [1200,1201]
trigger1 = AnimElem = 11
anim = 8520
trans = add
pos = -50,7
scale = 0.2,0.2
sprpriority = 5
ownpal = 1
[State 1200, Shoot dust EX]
type = Explod
trigger1 = Anim = 1205
trigger1 = AnimElem = 4
anim = 8520
trans = add
pos = -26,3
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1200, EX speed]
type = ChangeAnim
triggerAll = Anim = [1200,1201]
trigger1 = Var(2) >= 4
trigger1 = AnimElem = 12, = 8
value = Anim
elem = 13

[State 1200, EX shot]
type = ChangeAnim
triggerAll = Anim = [1200,1201]
trigger1 = Var(2) >= 4
trigger1 = AnimElem = 13, = 2; end of first shot
value = 1205; chain first shot into second shot, starts right after the last frame of 1st shot fully extended arm

[State 1200, Width]
type = Width
trigger1 = Anim = [1200,1201]
trigger1 = AnimElemNo(0) = [10,11]
trigger2 = Anim = 1205
trigger2 = AnimElemNo(0) = [3,4]
value = 22,-15

[State 1200, 1st Blast]
type = Helper
triggerAll = Anim = [1200,1201]
trigger1 = AnimElem = 11
trigger1 = !NumHelper(1210)
name = "Penetrating Fist first blast"
stateno = 1210
pos = IfElse((Var(2)=1||Var(2)=4||Var(2)=6), 80, IfElse((Var(2)=2||Var(2)=5), 150, 220)), -71
id = 1210
ownpal = 1

[State 1200, 2nd EX Blast]
type = Helper
trigger1 = Anim = 1205; EX second part
trigger1 = AnimElem = 4
trigger1 = !NumHelper(1220)
name = "Penetrating Fist second blast"
stateno = 1210
pos = IfElse(Var(2)=4, 150, 220), -71
id = 1220
ownpal = 1

[State 1200, Super Charge cancel]
type = ChangeState
triggerAll = !AILevel
triggerAll = Anim = [1200,1201]
triggerAll = AnimElem = 8, < 0 ; charge not released yet
triggerAll = Time >= 8 ; earliest cancelable frame
triggerAll = Command = "hold_x" || Command = "hold_y" || Command = "hold_z"
trigger1 = Command = "FF" || Command = "BB"; dash
trigger1 = Var(2) > 3 ; EX level of charge (after charging from normal to EX or also immediately from EX)
trigger1 = Var(4) := 2 ; automatic Counter Hit for the next attack, only at EX level of charge
trigger2 = Command = "FF" || Command = "BB"; repeating so the := can happen only at EX level of charge, but the dash can still be triggered even without it
value = IfElse(Command = "FF", 100, 105); dash

[State 1200, Super Charge dash cancel - AI]
type = ChangeState
triggerAll = Anim = [1200,1201]
triggerAll = AnimElem = 8, < 0 ; charge not released yet
triggerAll = Time >= 8 ; earliest cancelable frame
triggerAll = Command = "hold_x" || Command = "hold_y" || Command = "hold_z"
triggerAll = P2BodyDist X < IfElse((Var(2)=1||Var(2)=4||Var(2)=6), 55, IfElse((Var(2)=2||Var(2)=5), 130, 190)) && EnemyNear,Vel X > 0 && Random < (30 + AILevel*8); AI triggers : opp closer than the distance of first blast and moving forward and medium randomization
trigger1 = AILevel
trigger1 = Var(2) > 3 ; EX level of charge (after charging from normal to EX or also immediately from EX)
trigger1 = Var(4) := 2 ; automatic Counter Hit for the next attack, only at EX level of charge
trigger2 = AILevel; repeating so the := can happen only at EX level of charge, but the dash can still be triggered even without it
value = 100
[State 1200, Super Charge backdash cancel - AI]
type = ChangeState
triggerAll = Anim = [1200,1201]
triggerAll = AnimElem = 8, < 0 ; charge not released yet
triggerAll = Time >= 8 ; earliest cancelable frame
triggerAll = Command = "hold_x" || Command = "hold_y" || Command = "hold_z"
triggerAll = ((P2BodyDist X < 35 && P2MoveType = A) || (P2BodyDist X < IfElse((Var(2)=1||Var(2)=4||Var(2)=6), 50, 130) && EnemyNear,Vel X > 0)) && Random < (30 + AILevel*12); AI triggers : opp too close and attacking, or opp closer than the distance of first blast and moving forward, and high randomization
trigger1 = AILevel
trigger1 = Var(2) > 3 ; EX level of charge (after charging from normal to EX or also immediately from EX)
trigger1 = Var(4) := 2 ; automatic Counter Hit for the next attack, only at EX level of charge
trigger2 = AILevel; repeating so the := can happen only at EX level of charge, but the dash can still be triggered even without it
value = 105

[State 1200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Penetrating Fist blast
[StateDef 1210]
MoveType  = A
Type      = A
Physics   = N
Velset    = 0,0
Ctrl      = 0
Juggle    = 0

[State 1210, Push]
type = PlayerPush
trigger1 = 1
value = 0

[State 1210, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 20000
ignorehitpause = 1

[State 1210, connect vanish]
type = Explod
trigger1 = MoveContact || Movehit || MoveGuarded || MoveReversed || PrevStateNo = 1210
trigger2 = !AnimTime
trigger3 = !Time
trigger3 = Anim = [1210,1211]
anim = 1215
scale = 0.5,0.5
trans = add
ownpal = 1
sprpriority = 5
ID = 1215
ignorehitpause = 1
postype = p1
pos = 0,0
persistent = 0

[State 1210, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo != 1210
value = 1210
ignorehitpause = 1

[State 1210, Scale]
type = AngleDraw
trigger1 = 1
scale = 0.5,0.5
ignorehitpause = 1

[State 1210, Scale]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 1210, Spr]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

[State 1210, No shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1210, SFX]
type = PlaySnd
trigger1 = !Time
value = 1210,10;3;1
channel = 4

[State 1210, Dust]
type = Explod
trigger1 = !Time
trigger1 = !NumExplod(8510)
anim = 8510
trans = add
scale = 0.4,0.4
sprpriority = 5
pos = 0,-floor(Pos Y)
ID = 8510
ownpal = 1

[State 1210, Hitspark generator]
type = Helper
trigger1 = MoveContact = 1
trigger1 = HitPauseTime
name = "Hitspark generator"
ID = 8000
stateno = 8000;var(22)
pos = IfElse(P2Dist X < 0, Floor(P2Dist X / 2), IfElse(P2Dist X < 20, Floor(20-(P2Dist X)/3), 20)), -20
postype = p1
ownpal = 1
ignorehitpause = 1
supermovetime  = 99999999
[State 1210, Electric spark generator]
type = Helper
trigger1 = !NumHelper(8100)
trigger1 = MoveHit = 2;MoveContact = 1
trigger1 = HitPauseTime
ID = 8100
name = "Electric spark generator"
pos = 0,0
;postype = P2
Stateno = 8100
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 1210, button detection]
type = VarSet
trigger1 = !Time
var(2) = Parent,Var(2)

[State 1210, EX blast]
type = ChangeAnim
trigger1 = !Time
trigger1 = Var(2)>3
trigger1 = !NumExplod(1215)
value = 1211

[State 1210, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SP
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(parent,fvar(12)*100),25
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-0
hitsound         = S1210,11;2;S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -4.5,-4.5
air.velocity     = -3,-4
guard.velocity   = -8
getpower         = 25, 5
givepower        = 15, 7
fall             = 1
fall.recover     = 0

[State 1210, EX Hit]
type = HitDef
trigger1 = !Time && Var(2)>3
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(parent,fvar(12)*70),18
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-0
hitsound         = S1210,11;2;S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 27
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -8
air.velocity     = -5,-4
guard.velocity   = -9.5
getpower         = 25, 5
givepower        = 15, 7
fall             = 1
fall.recover     = 0

[State 1210, Electric spark generator]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumTarget
ID = 8100
name = "Electric spark generator"
postype = P2
Stateno = 8100
ownpal = 1
ignorehitpause = 1

[State 1210, NHB]
type = NotHitBy
trigger1 = 1
value = SCA,AT,AA
ignorehitpause = 1
[State 1210, HB]
type = HitBy
trigger1 = 1
value = SCA,AP
ignorehitpause = 1

[State 1210, HO]
type = HitOverride
trigger1 = 1
attr = SCA,AA,AT,AP
stateno = 1210
ignorehitpause = 1

[State 1210, End]
type = DestroySelf
trigger1 = NumExplod(1215)
trigger2 = MoveContact || MoveHit || MoveGuarded || MoveReversed || PrevStateNo = 1210
trigger3 = !AnimTime
ignorehitpause = 1
;-----------------------------------------------------------------
; Others
;--------------------------

;--------------------------
; Median Line Destruction / Seichuusen Midare Zuki
[StateDef 1300]
;Anim      = 1300
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37
Juggle    = 0

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 1300, Button detection reset]
type = VarSet
trigger1 = !Time
var(2) = 0

[State 1300, EX Button detection]
type = VarSet
triggerAll = !AILevel
triggerAll = !Time
triggerAll = Power >= 500
trigger1 = Command = "hold_x" && Command = "hold_y"
trigger2 = Command = "hold_x" && Command = "hold_z"
trigger3 = Command = "hold_y" && Command = "hold_z"
var(2) = 4

[State 1300, Button detection]
type = VarSet
triggerAll = !AILevel
trigger1 = !Time
trigger1 = !Var(2)
var(2) = IfElse(Command = "x" || Command = "rel_x", 1, IfElse(Command = "y" || Command = "rel_y", 2, 3))

;-------------
; AI button detection
; Condition : default
[State 1300, MLD - Light]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = 1
var(2) = 1
; Condition description
[State 1300, MLD - Medium]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
triggerAll = Random < 0
trigger1 = 1
var(2) = 2
; Condition : in combo, opponent very close and high randomization, or low randomization
[State 1300, MLD - Heavy]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = P2BodyDist X < (90 - AILevel*6)
trigger1 = Random < (50 + (P2MoveType=H)*(P2BodyDist X < 40)*AILevel*20)
var(2) = 3
; Condition : in combo, opponent getting hit, close and on ground, not guarding
[State 1300, MLD - EX]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = PrevStateNo = [200,700]
trigger1 = P2BodyDist X < 80
trigger1 = P2MoveType = H
trigger1 = EnemyNear,StateType != A
trigger1 = P2BodyDist X < 60
trigger1 = EnemyNear,StateNo != [150,160]
trigger1 = Random < (120 + AILevel*5)
var(2) = 4
;-------------

[State 1300, EX Power consumption]
type = PowerAdd
trigger1 = !Time
trigger1 = Var(2) = 4
value = -500

[State 1300, EX SFX]
type = PlaySnd
trigger1 = !Time
trigger1 = Var(2) = 4
value = 750,2
[State 1300, EX GFX]
type = Explod
trigger1 = !Time
trigger1 = Var(2) = 4
anim = 2910
pos = -5,-56
scale = 0.4,0.4
trans = add
ownpal = 1
sprpriority = 5
bindtime = -1
removeongethit = 1

[State 1300, EX voice]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = Var(2) = 4
value = 1301,0
channel = 3
[State 1300, voice - finish]
type = PlaySnd
trigger1 = Var(2) = 1
trigger1 = AnimElem = 9
trigger2 = Var(2) = 2
trigger2 = AnimElem = 15
trigger3 = Var(2) = 3
trigger3 = AnimElem = 16
value = 1300,0
channel = 3
[State 1300, Elec whoosh]
Type = PlaySnd
trigger1 = Anim = 1301
trigger1 = AnimElem = 10
trigger2 = Anim = 1302
trigger2 = AnimElem = 15
trigger3 = Anim = 1303
trigger3 = AnimElem = 17
value = 7,24;7,4
channel = 4

[State 1300, PalFX]
type = PalFX
trigger1 = Var(2) > 3
time = 1
add = floor(80 - 50*sin(2*pi*Time/10)),floor(60 - 50*sin(2*pi*Time/10)),-256

[State 1300, Anim fix]
type = ChangeAnim
trigger1 = !Time
value = 1300+Var(2)

[State 1300, Width]
type = null;Width
trigger1 = 1
value = 18,-15
[State 1300, Width]
type = Width
trigger1 = Anim = 1303
trigger1 = AnimElemNo(0) = 16
value = 30,-18

[State 1300, Pos fix]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 22

;--
[State 1300, Light Pos 1]
type = PosAdd
trigger1 = Anim = 1301
trigger1 = AnimElem = 9
x = 9
[State 1300, Light Pos 2]
type = PosAdd
triggerAll = Anim = 1301
trigger1 = AnimElem = 10
trigger2 = AnimElem = 14
trigger3 = AnimElem = 15
trigger4 = AnimElem = 17
x = 15
[State 1300, Light Pos 3]
type = PosAdd
trigger1 = Anim = 1301
trigger1 = AnimElem = 11
x = 7
[State 1300, Light Pos 4]
type = PosAdd
trigger1 = Anim = 1301
trigger1 = AnimElem = 16
x = 11
;--
[State 1300, Med Pos 1]
type = PosAdd
trigger1 = Anim = 1302
trigger1 = AnimElem = 13
x = 9
[State 1300, Med Pos 2]
type = PosAdd
trigger1 = Anim = 1302
trigger1 = AnimElem = 14
x = 2
[State 1300, Med Pos 3]
type = PosAdd
trigger1 = Anim = 1302
trigger1 = AnimElem = 15
x = 8
[State 1300, Med Pos 4]
type = PosAdd
trigger1 = Anim = 1302
trigger1 = AnimElem = 17
x = 8
[State 1300, Med Pos 5]
type = PosAdd
trigger1 = Anim = 1302
trigger1 = AnimElem = 19
x = 14
;--

[State 1300, Width]
type = Width
triggerAll = Anim = 1303
trigger1 = AnimElem = 15
trigger2 = AnimElem = 17
value = 30,-18
[State 1300, Hard Pos 1]
type = PosAdd
trigger1 = Anim = 1303
trigger1 = AnimElem = 15
x = 22
[State 1300, Hard Pos 2]
type = PosAdd
trigger1 = Anim = 1303
trigger1 = AnimElem = 17
x = 30

[State 1300, hitspark position - right]
type = VarSet
trigger1 = !Time
trigger2 = Anim > 1301 && AnimElem = 9
var(5) = 45071
[State 1300, hitspark position - left]
type = VarSet
trigger1 = AnimElem = 6
trigger2 = Anim = 1303 && AnimElem = 12
var(5) = 41067
[State 1300, hitspark position - light finisher]
type = VarSet
trigger1 = Anim = 1301 && AnimElem = 15
var(5) = 70073 ; to fix
[State 1300, hitspark position - medium finisher]
type = VarSet
trigger1 = Anim = 1302 && AnimElem = 15
var(5) = 59065
[State 1300, hitspark position - heavy finisher]
type = VarSet
trigger1 = Anim = 1303 && AnimElem = 15
var(5) = 72073

[State 1300, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 3, = 0
trigger2 = AnimElem = 6, = 0
trigger3 = Anim > 1301 && AnimElem = 9, = 0
trigger4 = Anim = 1303 && AnimElem = 12, = 0
value = 7,1;7,0
channel = 1

[State 1300, Whoosh finish]
type = PlaySnd
trigger1 = Anim = 1301 && AnimElem = 10
trigger2 = Anim = 1302 && AnimElem = 16
trigger3 = Anim = 1303 && AnimElem = 15
value = 7,11;7,2
channel = 1

[State 1300, GFX right]
type = Explod
trigger1 = AnimElem = 4
trigger2 = Anim > 1301
trigger2 = Animelem = 10
anim = 1310
pos = 47,-71
trans = add
scale = 0.5,0.5
sprpriority = 5
ownpal = 1
[State 1300, GFX left]
type = Explod
trigger1 = AnimElem = 7
trigger2 = Anim = 1303
trigger2 = AnimElem = 13
anim = 1310
pos = 43,-67
trans = add
scale = 0.5,0.5
sprpriority = 5
ownpal = 1

[State 1300, GFX end light]
type = Explod
trigger1 = Anim = 1301
trigger1 = AnimElem = 9, = 2
anim = 1314
pos = 64,-73
trans = add
scale = 0.4,0.4
sprpriority = 5
ownpal = 1
bindtime = -1
[State 1300, GFX end medium]
type = Explod
trigger1 = Anim = 1302
trigger1 = AnimElem = 15
anim = 1314
pos = 58,-65
trans = add
scale = 0.4,0.4
sprpriority = 5
ownpal = 1
bindtime = -1
[State 1300, GFX end hard]
type = Explod
trigger1 = Anim = 1303
trigger1 = AnimElem = 18
anim = 1314
pos = 73,-71
trans = add
scale = 0.4,0.4
sprpriority = 5
ownpal = 1
bindtime = -1

[State 240, Dust end light]
type = Explod
trigger1 = Anim = 1301
trigger1 = AnimElem = 10
anim = 8521
trans = add
pos = 56,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1
[State 330, Dust end medium]
type = Explod
trigger1 = Anim = 1302
trigger1 = AnimElem = 16
anim = 8521
trans = add
pos = 45,7
scale = 0.2,0.2
sprpriority = 5
ownpal = 1
[State 320, Dust end heavy]
type = Explod
trigger1 = Anim = 1303
trigger1 = AnimElem = 18
anim = 8521
trans = add
pos = 40,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1300, first hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*50),5
pausetime        = 2,4
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-71
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
ground.slidetime = 20
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = -1.5
air.velocity     = -1, -1
guard.velocity   = -2
getpower         = 25,12
givepower        = 12, 7
fall.recover     = 0
sparkno = S8000
[State 1300, first hit - EX]
type = HitDef
trigger1 = !Time
trigger1 = Var(2) >= 4
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*50),5
pausetime        = 2,4
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-71
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
ground.slidetime = 20
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = -1.5
air.velocity     = -1, -1
guard.velocity   = -2
getpower         = 0,0
givepower        = 12, 7
fall.recover     = 0
sparkno = S8000

[State 1300, Hits 2, 4]
type = HitDef
trigger1 = AnimElem = 5
trigger2 = Anim = 1303 && AnimElem = 11
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*20),2
pausetime        = 2,4
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-67
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 20
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = 1.5
air.velocity     = 1, -1
guard.velocity   = -2
getpower         = 25,12
givepower        = 12, 7
fall.recover     = 0
sparkno = S8000
[State 1300, Hits 2 - EX]
type = HitDef
triggerAll = Var(2) >= 4
trigger1 = AnimElem = 5
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*20),2
pausetime        = 2,4
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-67
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 20
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = 1.5
air.velocity     = 1, -1
guard.velocity   = -2
getpower         = 0,0
givepower        = 12, 7
fall.recover     = 0
sparkno = S8000

[State 1300, Hit 3]
type = HitDef
trigger1 = Anim > 1301 && AnimElem = 8
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*20),2
pausetime        = 2,4
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-71
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
ground.slidetime = 20
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = -1.5
air.velocity     = -1, -1
guard.velocity   = -2
getpower         = 25,12
givepower        = 12, 7
fall.recover     = 0
sparkno = S8000
[State 1300, Hit 3 - EX]
type = HitDef
triggerAll = Var(2) >= 4
trigger1 = Anim > 1301 && AnimElem = 8
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*20),2
pausetime        = 2,4
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-71
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
ground.slidetime = 20
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = -1.5
air.velocity     = -1, -1
guard.velocity   = -2
getpower         = 0,0
givepower        = 12, 7
fall.recover     = 0
sparkno = S8000

[State 1300, Hit light finish]
type = HitDef
trigger1 = AnimElem = 10
trigger1 = Anim = 1301
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*60),6
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-73
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -3.5,-5
air.velocity     = -2,-3
guard.velocity   = -8.5
getpower         = 75,30
givepower        = 30, 10
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1300, Hit medium finish]
type = HitDef
triggerAll = AnimElem = 17
trigger1 = Anim = 1302
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*60),6
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-65
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -4,-5
air.velocity     = -3,-5
guard.velocity   = -9.5
getpower         = 62,25
givepower        = 25, 10
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1300, Hit hard finish]
type = HitDef
trigger1 = Anim = 1303
trigger1 = AnimElem = 15
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*60),6
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-73
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -5,-5
air.velocity     = -4,-5
guard.velocity   = -10.5
getpower         = 25,12
givepower        = 12, 7
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1300, EX end for Wall Slam detection]
type = ChangeState
trigger1 = Anim = 1304
trigger1 = AnimElemNo(0) = 12
value = 1301

[State 1300, Idle]
type = StateTypeSet
trigger1 = Anim = 1302
trigger1 = AnimElem = 18, = 0
movetype = I

[State 1300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;--------------------------
; Median Line Destruction EX finisher
; separate state so Wall Slam can be detected
[StateDef 1301]
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 0

[State 1301, PalFX]
type = PalFX
trigger1 = Var(2) > 3
time = 1
add = floor(80 - 50*sin(2*pi*Time/10)),floor(60 - 50*sin(2*pi*Time/10)),-256

[State 330, Med Pos 1]
type = PosAdd
trigger1 = AnimElem = 13
x = 9
[State 330, Med Pos 2]
type = PosAdd
trigger1 = AnimElem = 14
x = 2
[State 330, Med Pos 3]
type = PosAdd
trigger1 = AnimElem = 15
x = 8
[State 330, Med Pos 4]
type = PosAdd
trigger1 = AnimElem = 17
x = 8
[State 330, Med Pos 5]
type = PosAdd
trigger1 = AnimElem = 19
x = 14

[State 1300, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 59065

[State 1300, Whoosh finish]
type = PlaySnd
trigger1 = Anim = 1304 && AnimElem = 16
value = 7,11;7,2
channel = 1
[State 1300, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 15
value = 7,24;7,4
channel = 4

[State 1301, GFX]
type = Explod
trigger1 = AnimElem = 14, = 2
anim = 1315
pos = 75,-64
scale = 0.45,0.45
trans = add
sprpriority = 5
ownpal = 1
[State 330, Dust EX medium]
type = Explod
trigger1 = Anim = 1304
trigger1 = AnimElem = 16
anim = 8521
trans = add
pos = 45,7
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1300, Hit EX finish]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*60),6
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-65
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 25
guard.hittime    = 18
ground.velocity  = -6,-6.5
air.velocity     = -2,-5
guard.velocity   = -12
getpower         = 0,0
givepower        = 30, 10
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
ID               = 4100
sparkno = S8000

[State 1300, Idle]
type = StateTypeSet
trigger1 = AnimElem = 18, = 0
movetype = I

[State 1300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Power Stance / Sanchin
[StateDef 1400]
;Anim      = 1400
MoveType  = I
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = PrevStateNo != 1400
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 1400, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 13068

[State 1400, EX Button detection]
type = VarSet
triggerAll = !AILevel
triggerAll = !Time
triggerAll = Power >= 500
triggerAll = PrevStateNo != 1400
trigger1 = Var(2) := 0
trigger2 = Command = "hold_a" && Command = "hold_b"
trigger3 = Command = "hold_a" && Command = "hold_c"
trigger4 = Command = "hold_b" && Command = "hold_c"
var(2) = 4

[State 1400, EX Power consumption]
type = PowerAdd
trigger1 = !Time
trigger1 = Var(2) = 4
trigger1 = Var(4) := 2 ; automatic Counter Hit on next attack
trigger1 = PrevStateNo != 1400
value = -500

[State 1400, EX SFX]
type = PlaySnd
trigger1 = !Time
trigger1 = Var(2) = 4
trigger1 = PrevStateNo != 1400
value = 750,2
[State 1400, EX GFX]
type = Explod
trigger1 = !Time
trigger1 = Var(2) = 4
trigger1 = PrevStateNo != 1400
anim = 2910
pos = 0,-70
scale = 0.4,0.4
trans = add
ownpal = 1
sprpriority = 5

[State 1400, Button detection]
type = VarSet
triggerAll = !AILevel
trigger1 = !Time
trigger1 = !Var(2)
trigger1 = PrevStateNo != 1400
var(2) = IfElse(Command = "a" || Command = "rel_a", 1, IfElse(Command = "b" || Command = "rel_b", 2, 3))

[State 1400, Button detection - AI]
type = VarSet
triggerAll = AILevel
trigger1 = !Time
trigger1 = !Var(2)
trigger1 = PrevStateNo != 1400
var(2) = IfElse((Random<120 && Power>=500),4,1+Random%3)

[State 1400, Anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo != 1400
trigger1 = Anim != [1400,1405]
value = 1400+Var(2)

[State 1400, PalFX]
type = PalFX
trigger1 = Var(2) = 4
time = 1
add = floor(80 - 50*sin(2*pi*Time/10)),floor(60 - 50*sin(2*pi*Time/10)),-256

[State 1400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = Var(2) < 4
value = 1400,0
channel = 3
[State 1400, EX Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = Var(2) = 4
value = 1405,0
channel = 3

[State 1400, Autoblock]
type = null;HitOverride
trigger1 = Var(2) = 1
trigger1 = Time = [3,13]
trigger2 = Var(2) = 2
trigger2 = Time = [3,18]
trigger3 = Var(2) = 3
trigger3 = Time = [3,33]
trigger4 = Var(2) = 4
trigger4 = Time = [0,26]
attr = SCA, NA, SA, HA, NP, SP, HP
stateno = 1400

[State 1400, Autoblock]
type = ReversalDef
trigger1 = Var(2) = 1
trigger1 = Time = [3,13]
trigger2 = Var(2) = 2
trigger2 = Time = [3,18]
trigger3 = Var(2) = 3
trigger3 = Time = [3,33]
trigger4 = Var(2) = 4
trigger4 = Time = [0,26]
reversal.attr = SCA, NA, SA, NP, SP
pausetime = 4,6
sparkno   = S8000
hitsound  = S6,1
p1stateno = 1400
ignorehitpause = 1

; Electric sparks
[State 1400, 1st right spark]
type = Helper
trigger1 = AnimElem = 2
trigger2 = Anim = 1403
trigger2 = AnimElem = 4, = 4
trigger3 = Anim = 1403
trigger3 = AnimElem = 4, = 17
name = "Spark"
stateno = 8500
ownpal = 1
pos = -16,-95
[State 1400, 1st right spark b]
type = Helper
trigger1 = AnimElem = 4, = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = -13,-82
[State 1400, 2nd right spark]
type = Helper
trigger1 = AnimElem = 5
name = "Spark"
stateno = 8500
ownpal = 1
pos = -27,-76
[State 1400, 3rd right spark]
type = Helper
trigger1 = AnimElem = 6
name = "Spark"
stateno = 8500
ownpal = 1
pos = -27,-54
[State 1400, 4th right spark]
type = Helper
trigger1 = AnimElem = 7
name = "Spark"
stateno = 8500
ownpal = 1
pos = -6,-66
[State 1400, 5th right spark]
type = Helper
trigger1 = AnimElem = 8
name = "Spark"
stateno = 8500
ownpal = 1
pos = -6,-82

[State 1400, 1st left spark]
type = Helper
trigger1 = AnimElem = 2
trigger2 = Anim = 1403
trigger2 = AnimElem = 4, = 4
trigger3 = Anim = 1403
trigger3 = AnimElem = 4, = 17
name = "Spark"
stateno = 8500
ownpal = 1
pos = 24,-93
[State 1400, 1st left spark b]
type = Helper
trigger1 = AnimElem = 4, = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = 21,-76
[State 1400, 2nd left spark]
type = Helper
trigger1 = AnimElem = 5
name = "Spark"
stateno = 8500
ownpal = 1
pos = 23,-97
[State 1400, 3rd left spark]
type = Helper
trigger1 = AnimElem = 6
name = "Spark"
stateno = 8500
ownpal = 1
pos = 3,-121
[State 1400, 4th left spark]
type = Helper
trigger1 = AnimElem = 7
name = "Spark"
stateno = 8500
ownpal = 1
pos = -14,-109
[State 1400, 5th left spark]
type = Helper
trigger1 = AnimElem = 8
name = "Spark"
stateno = 8500
ownpal = 1
pos = -14,-92

[State 1400, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Double Lift Kick
[StateDef 1500]
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37
juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 1500, EX Button detection]
type = VarSet
triggerAll = !AILevel
triggerAll = !Time
triggerAll = Power >= 500
trigger1 = Var(2) := 0
trigger2 = Command = "hold_a" && Command = "hold_b"
trigger3 = Command = "hold_a" && Command = "hold_c"
trigger4 = Command = "hold_b" && Command = "hold_c"
var(2) = 4

;-------------
; AI button detection
; Condition : default
[State 1500, DLK - Heavy]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = 1
var(2) = 3
; Condition : enemy on the ground, close, not getting hit (priority to Heavy)
[State 1500, DLK - Light]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = P2BodyDist X < 45
trigger1 = EnemyNear,StateType != A
trigger1 = P2MoveType != H
var(2) = 1
; Condition : under mid-range, in the air, moving forward, not getting hit (priority to Heavy)
[State 1500, DLK - Medium]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
trigger1 = P2BodyDist X < 80
trigger1 = EnemyNear,StateType = A
trigger1 = EnemyNear,Vel X > 0
trigger1 = P2MoveType != H || Random < 280
var(2) = 2
; Condition : enemy attacking
[State 1500, DLK - EX]
type = VarSet
triggerAll = AILevel
triggerAll = Time = 0
triggerAll = Power >= 500
trigger1 = P2MoveType = A
var(2) = 4
;--------------------------

[State 1500, EX Power consumption]
type = PowerAdd
trigger1 = !Time
trigger1 = Var(2) = 4
value = -500

[State 1500, EX SFX]
type = PlaySnd
trigger1 = !Time
trigger1 = Var(2) = 4
value = 750,2
[State 1500, EX GFX]
type = Explod
trigger1 = !Time
trigger1 = Var(2) = 4
anim = 2910
pos = 20,-65
scale = 0.4,0.4
trans = add
ownpal = 1
sprpriority = 5

[State 1400, PalFX]
type = PalFX
trigger1 = Var(2) = 4
time = 1
add = floor(80 - 50*sin(2*pi*Time/10)),floor(60 - 50*sin(2*pi*Time/10)),-256

[State 1500, Button detection]
type = VarSet
triggerAll = !AILevel
trigger1 = !Time
trigger1 = !Var(2)
var(2) = IfElse(Command = "a" || Command = "rel_a", 1, IfElse(Command = "b" || Command = "rel_b", 2, 3))
[State 1500, Default button detection]
type = VarSet
trigger1 = !Time
trigger1 = !Var(2)
var(2) = 1

[State 1500, Anim]
type = ChangeAnim
trigger1 = !Time
value = 1500 + Var(2)

[State 1500, NHB]
type = NotHitBy
trigger1 = Var(2) = 4
value = SCA

[State 1500, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 46062
[State 1500, hitspark position 2 - light]
type = VarSet
trigger1 = Var(2) = 1
trigger1 = AnimElem = 6
var(5) = 46100
[State 1500, hitspark position 2]
type = VarSet
trigger1 = Var(2) > 1
trigger1 = AnimElem = 6
var(5) = 46105

[State 1500, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1500,0
channel = 3
[State 1500, Jump SFX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 1
[State 1500, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8520
trans = add
pos = -5,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 1500, Whoosh 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 7,3;7,1
channel = 2
[State 1500, Whoosh 2]
type = PlaySnd
trigger1 = AnimElem = 7
value = 7,7;7,2
channel = 2

[State 1500, Land SFX]
type = PlaySnd
trigger1 = AnimElemNo(0) = (11 + (Var(2)>2))
value = 40,1
channel = 1
persistent = 0
[State 1500, Land dust]
type = Explod
trigger1 = AnimElemNo(0) = (11 + (Var(2)>2))
anim = 8510
trans = add
scale = 0.25,0.25
sprpriority = -5
ownpal = 1

[State 1500, Pos]
type = PosAdd
trigger1 = AnimElem = 2
x = 20

; Pos movements
;--
[State 1500, Pos]
type = PosAdd
trigger1 = AnimElem = 4
x = 9
[State 1500, Pos]
type = PosAdd
trigger1 = AnimElem = 5
x = 2
[State 1500, Pos]
type = PosAdd
trigger1 = AnimElem = 6
x = 4
[State 1500, Pos]
type = PosAdd
trigger1 = Var(2) = 1
trigger1 = AnimElem = 7
x = 2
[State 1500, Pos]
type = PosAdd
trigger1 = Var(2) > 1
trigger1 = AnimElem = 7
x = 4
[State 1500, Pos]
type = PosAdd
trigger1 = AnimElem = 7, = 2
x = 3
[State 1500, Pos]
type = PosAdd
trigger1 = AnimElem = 8
trigger1 = Var(2) = 1
x = 3
[State 1500, Pos]
type = PosAdd
trigger1 = AnimElem = 8
trigger1 = Var(2) > 1
x = 7
; H pos movements
;--
[State 1500, Pos]
type = PosAdd
trigger1 = Var(2) = 3; > 2
trigger1 = AnimElem = 7
y = -7
[State 1500, Pos]
type = PosAdd
trigger1 = Var(2) = 3; > 2
trigger1 = AnimElem = 8
y = -4
;--

; Light vels movements
;--
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 1
y = -2.5
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 1
x = 1
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 8
trigger1 = Var(2) = 1
x = 1.5
[State 1500, Gravity - fake 1]
type = VelMul
trigger1 = AnimElemNo(0) = [4,7]
trigger1 = Var(2) = 1
y = 0.85
[State 1500, Gravity]
type = Gravity
trigger1 = AnimElemNo(0) = [8,10]
trigger1 = Var(2) = 1
;--


; M vels movements
;--
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 2
y = -2.8
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 2
x = 1.8
[State 1500, Gravity - fake 1]
type = VelMul
trigger1 = AnimElemNo(0) = [4,8]
trigger1 = Var(2) = 2
y = 0.92
[State 1500, Gravity]
type = Gravity
trigger1 = AnimElemNo(0) = [9,10]
trigger1 = Var(2) = 2
;--

; H vels movements
;--
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 3
y = -4.5
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 3
x = 1
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 8
trigger1 = Var(2) = 3
x = 1.4
[State 1500, Gravity - fake 1]
type = VelMul
trigger1 = AnimElemNo(0) = [4,8]
trigger1 = Var(2) = 3
y = 0.9
[State 1500, Gravity]
type = Gravity
trigger1 = AnimElemNo(0) = [9,10]
trigger1 = Var(2) = 3
;--

; EX vels movements
;--
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 4
y = -4.5
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 4
trigger1 = Var(2) = 4
x = 1.3
[State 1500, Vel]
type = VelSet
trigger1 = AnimElem = 8
trigger1 = Var(2) = 4
x = 1.8
[State 1500, Gravity - fake 1]
type = VelMul
trigger1 = AnimElemNo(0) = [4,8]
trigger1 = Var(2) = 4
y = 0.9
[State 1500, Gravity]
type = Gravity
trigger1 = AnimElemNo(0) = [9,10]
trigger1 = Var(2) = 4
;--

[State 1500, Boost]
type = PosAdd
trigger1 = Var(2) > 2
trigger1 = AnimElem = 4
y = -10
[State 1500, Boost]
type = PosAdd
trigger1 = Var(2) = 4
trigger1 = AnimElem = 4
y = -5

[State 1500, Air]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

; Landing
;--
[State 1500, Land]
type = StateTypeSet
trigger1 = AnimElemNo(0) = (11 + (Var(2)>2))
statetype = S
physics = S
persistent = 0
[State 1500, Land vel]
type = VelSet
trigger1 = AnimElemNo(0) = (11 + (Var(2)>2))
x = 0
y = 0
persistent = 0
[State 1500, Land]
type = PosSet
trigger1 = AnimElemNo(0) >= (11 + (Var(2)>2))
trigger1 = Pos Y != 0
y = 0
;--

[State 1500, Light hit 1]
type = HitDef
trigger1 = !Time
trigger1 = Var(2) = 1
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-62
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
ground.slidetime = 12
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -1.5
air.velocity     = -3,-6
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
forcestand       = 1
fall.recover     = 0
sparkno = S8000

[State 1500, Light hit 2]
type = HitDef
trigger1 = AnimElem = 5
trigger1 = Var(2) = 1
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*40),4
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-100
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
ground.slidetime = 14
guard.slidetime  = 17
ground.hittime   = 14
guard.hittime    = 17
ground.velocity  = -5.5
air.velocity     = -3,-4
air.cornerpush.veloff = -24
guard.velocity   = -7
getpower         = 50, 25
givepower        = 25, 13
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
forcestand       = 1
fall.recover     = 0
sparkno = S8000

[State 1500, Medium hit 1]
type = HitDef
trigger1 = !Time
trigger1 = Var(2) = 2
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Up
damage           = ceil(fvar(12)*50),5
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-62
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
ground.slidetime = 14
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -1.5,-5
air.velocity     = -4,-3
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
forcestand       = 1
fall.recover     = 0
sparkno = S8000

[State 1500, Medium hit 2]
type = HitDef
trigger1 = AnimElem = 5
trigger1 = Var(2) = 2
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*60),6
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-112
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
ground.slidetime = 16
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -4,-3
air.velocity     = -4,-4
air.cornerpush.veloff = -24
guard.velocity   = -7
getpower         = 50, 25
givepower        = 25, 13
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1500, Hard hit 1]
type = HitDef
trigger1 = !Time
trigger1 = Var(2) = 3
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*50),5
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-62
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
ground.slidetime = 14
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -1.5,-6.5
air.velocity     = -4,-5.5
guard.velocity   = -7.5
getpower         = 50, 25
givepower        = 25, 12
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1500, Hard hit 2]
type = HitDef
trigger1 = AnimElem = 5
trigger1 = Var(2) = 3
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*60),6
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-112
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
ground.slidetime = 16
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -4.5,-7
air.velocity     = -4,-5
air.cornerpush.veloff = -24
guard.velocity   = -7.5
getpower         = 50, 25
givepower        = 25, 13
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1500, EX hit 1]
type = HitDef
trigger1 = !Time
trigger1 = Var(2) = 4
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*50),5
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-62
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -1.5,-6.5
air.velocity     = -4,-6.5
guard.velocity   = -7.5
getpower         = 0, 0
givepower        = 25, 12
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1500, EX hit 2]
type = HitDef
trigger1 = AnimElem = 5
trigger1 = Var(2) = 4
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*60),6
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-112
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -4.5,-7
air.velocity     = -4,-7
air.cornerpush.veloff = -24
guard.velocity   = -7.5
getpower         = 0, 0
givepower        = 25, 13
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1500, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Shun Ren Dan
[StateDef 1600]
Anim      = 1600
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 37

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 1600, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 63085

[State 1600, Grab]
type = HitDef
trigger1 = AnimElem = 3
attr             = S, ST
hitflag          = M
guardflag        = M
animtype         = Light
damage           = 0,0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S900,0
guardsound       = S6,2
ground.type      = High
ground.slidetime = 20
ground.hittime   = 18
guard.hittime    = 18
ground.velocity  = -1
air.velocity     = -1,-1
guard.velocity   = -1
getpower         = 87, 0
givepower        = 37, 0
ID               = 1600
numhits          = 0
p2facing         = 1
sparkno = S8000

[State 1600, Throw limiter - disable]
type = StateTypeSet
triggerAll = MoveType != I
trigger1 = Var(6) > 1
trigger1 = Anim = 1600
movetype = I
[State 1600, Throw limiter - enable]
type = StateTypeSet
triggerAll = MoveType != A
trigger1 = Var(6) < 2
trigger2 = Anim = 1601
movetype = A

[State 1600, Anim]
type = ChangeAnim
trigger1 = MoveHit = 1
trigger1 = NumTarget(1600)
value = 1601
persistent = 0

[State 1600, TargetState]
type = TargetState
trigger1 = MoveHit
trigger1 = NumTarget(1600)
trigger1 = Anim = 1601
value = 1605
persistent = 0
ignorehitpause = 1

[State 1600, Bind]
type = TargetBind
trigger1 = NumTarget(1600)
trigger1 = Anim = 1601
trigger1 = Target,Anim = 1605
trigger1 = Target,AnimElemNo(0) < 8
pos = 40,0

[State 1600, Hits]
type = HitAdd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 5
trigger2 = AnimElem = 11
trigger3 = AnimElem = 15
value = 1

[State 1600, Hitspark 1]
type = Explod
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 5
anim = 8003
scale = 0.24,0.24
sprpriority = 5
trans = add
pos = 25,-78
ownpal = 1
[State 1600, Hitspark 2]
type = Explod
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 11
anim = 8003
scale = 0.22,0.22
sprpriority = 5
trans = add
pos = 48,-85
ownpal = 1
[State 1600, Hitspark 3]
type = Explod
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 15
anim = 8003
scale = 0.3,0.3
sprpriority = 5
trans = add
pos = 76,-35
ownpal = 1

[State 1600, Whoosh]
type = PlaySnd
triggerAll = Anim = 1600
trigger1 = AnimElem = 2
value = 7,0
channel = 2
[State 1600, Miss voice]
type = PlaySnd
triggerAll = Anim = 1600
trigger1 = AnimElem = 4
value = 801,0
channel = 3

[State 1600, Voice]
type = PlaySnd
trigger1 = Anim = 1601
trigger1 = AnimElem = 4
value = 1600,0
channel = 3

[State 1600, Whoosh 1]
type = PlaySnd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 4
value = 7,3;7,0
channel = 2
[State 1600, Whoosh 2]
type = PlaySnd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 10
value = 7,1;7,0
channel = 2
[State 1600, Whoosh 3]
type = PlaySnd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 14
value = 7,7;7,1
channel = 2
[State 1600, Whoosh final]
type = PlaySnd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 21
value = 7,11;7,2
channel = 2

[State 1600, Hitsounds]
type = PlaySnd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 11
value = 5,0
channel = 4
[State 1600, Hitsounds]
type = PlaySnd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 5
trigger2 = AnimElem = 15
value = 5,1
channel = 4

[State 1600, Damage 1]
type = TargetLifeAdd
triggerAll = NumTarget(1600)
triggerAll = Anim = 1601
trigger1 = AnimElem = 5
trigger2 = AnimElem = 11
trigger3 = AnimElem = 15
value = -ceil(fvar(12)*30)
kill = 0
[State 1600, Damage 2]
type = null;TargetLifeAdd
trigger1 = NumTarget(1600)
trigger1 = AnimElem = 22
trigger1 = Anim = 1601
value = -ceil(fvar(12)*60)

[State 1600, hitspark position]
type = VarSet
trigger1 = AnimElem = 22
var(5) = 74098

[State 1600, Pos]
type = PosAdd
trigger1 = AnimElem = 29
x = -29

[State 1600, Hit]
type = HitDef
trigger1 = NumTarget(1600)
trigger1 = AnimElem = 22
trigger1 = Anim = 1601
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-98
hitsound         = S5,3
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 16
ground.hittime   = 20
guard.hittime    = 16
ground.velocity  = -2,-4.5
air.velocity     = -4, -4.5
guard.velocity   = -4.5
getpower         = 50, 0
givepower        = 25, 0
chainID          = 1600
ID               = 1601
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 1600, Shake]
type = EnvShake
trigger1 = NumTarget(1601)
trigger1 = Anim = 1601
trigger1 = Target,StateNo = 5110 && Target,Time = 1
time = 12
freq = 60
ampl = 4
persistent = 0

[State 1600, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
