;===============================================================
;----------------------; Duo Tag Team ;-------------------------
;===============================================================
[Statedef 3000]
type = S
ctrl = 0
anim = 3000
velset = 0,0
movetype = I
physics = S
sprpriority = 2

[state 3000]
type = Varset
trigger1 = time = 0
v = 2
value = 0

[State 3000, 1]
type = VarSet
trigger1 = time = 19
v = 1
value = 1

[state 0, playsnd]
type = playsnd
trigger1 = time = 20
value = s3000,0

[state 3000, SuperPause]
type = Superpause
trigger1 = time = 20
anim = -1
darken = 0
time = 50

[State 3000, Screenbound]
type = Screenbound
trigger1 = time = 20
movecamera = 0,0
value = 20

[State 3000, Super BGWarning]
type = Explod
trigger1 = time = 0
anim = 3003
postype = left
pos = 0,0
;under = 1
bindtime = -1
removetime = 50
sprpriority = -11
supermovetime = 999
ownpal = 1
removeongethit = 1
facing = ifelse(Facing = -1, -1, 1)
persistent = 0

[State 3500, Duo Hyperbg "Guilmon"]
type = Explod
trigger1 = time = 20
anim = 3004
postype = front
bindtime = -1
removetime = 84
sprpriority = -12
supermovetime = 999
ownpal = 1
removeongethit = 1
facing = ifelse(Facing = -1, -1, 1)
persistent = 0

[State 191, Super]
type = Helper
trigger1 = time = 0
trigger1 = numhelper(50000)=0
ID = 50000
stateno= 50002
name = "SUPERNORMAL"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 40
pausemovetime = 40
pos = 0,0

[State 3000, RenamonPortrait]
type = Explod
trigger1 = time = 20
anim = 3001
postype = Left
supermovetime = 20
supermove = 1
ID = 3000
pos = -200,0
scale = .5,.5
shadow = 0
vel = 10,0
ontop = 1
removetime = 21
value = 0

[State 3000, GuilmonPortrait]
type = Explod
trigger1 = time = 20
anim = 3002
postype = Left
supermovetime = 20
supermove = 1
pos = 359,0
ID = 3000
scale = .5,.5
vel = -10,0
shadow = -1
ontop = 1
removetime = 21
value = 0

[State 3000, 1]
type = CtrlSet
trigger1 = Time = 50
value = 1

;Summon Helper
[State 3000, 0]
type = Helper
trigger1 = time = 21
name = "Timer"
postype = Back
pos = 4, -15
stateno = 3500
bindtime = -1
ownpal = 1

[State 3000]
type = Helper
trigger1 = time = 21
ID = 4000
stateno= 4001
name = "DuoGuilmon"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
postype = Back
Ownpal = 1
pos = 0,-70

[State 3000, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------
;Helper
[statedef 3500]
type = S
movetype = I
physics = N
velset = 0, 0
anim = 999

[State 3500, Duo Hyperbg "Guilmon"]
type = Explod
triggerall = root,var(1) != 0
triggerall = NumHelper(4000) != 0
trigger1 = time = 24
anim = 2003
id = 50001
postype = front
bindtime = -1
removetime = -1
sprpriority = -12
supermovetime = 24
ownpal = 1
removeongethit = 1
facing = ifelse(Facing = -1, -1, 1)
persistent = 0

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = root,var(1) = 0
id = 50001
;ignorehitpause =
;persistent =


[State 3000]
type = Poweradd
trigger1 = time = 0
value = -3000

[State 2002, Whiteout]
type = Explod
trigger1 = time = 0
anim = 2999
postype = front
pos = 0,0
ontop = 1
removetime = 1
supermove = 1
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 3500, 1]
type = Turn
trigger1 = facing = -1

[State 3500, Frame]
type = Explod
trigger1 = time = 0
anim = 3500
postype = Back
ID = 55
pos = 4, 200
bindtime = -1
removetime = -1
sprpriority = 19

[State 3500, Bar]
type = Explod
trigger1 = time = 0
ID = 56
anim = 3502
postype = Back
pos = 4, 200
bindtime = -1
removetime = -1
sprpriority = 20
ontop = 1

[State 3500, 4]
type = ModifyExplod
trigger1 = 1
ID = 56
scale = (600-parent,Var(2))/600.0,1
ontop = 1
ignorehitpause = 1

[State 3500, 5]
type = RemoveExplod
trigger1 = parent, var(2) >= 600
trigger2 = Win
trigger3 = Lose
ID = 55
ignorehitpause = 1

[State 3500, 6]
type = RemoveExplod
trigger1 = parent, var(2) >= 600
trigger2 = Win
trigger3 = Lose
ID = 56
ignorehitpause = 1

[State 3500, 7]
type = DestroySelf
triggerall = NumExplod(56) = 0
trigger1 = parent, var(2) >= 600
trigger2 = Win
trigger3 = Lose
ignorehitpause = 1

;===============================================================
;-------------------------; Guilmon ;---------------------------
;===============================================================
;-------------------------------
;----------------------
[statedef 4001, Enter]
type    = A
movetype= A
physics = N
anim = 4001
sprpriority = -10
velset = 13,3.5

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[State 4000, 1]
type = HitDef
Trigger1 = Time = 0
attr = A, NT
hitflag = MAF
guardflag = HA
priority = 1, Miss
sparkno = s1512
sparkxy = -5,-120
hitsound = s1,5
p2stateno = 4100
guard.dist = 0
fall = 1              ;
numhits = 0

[State 4001, NotHitBy]
type = Nothitby
trigger1 = 1
value = SCA
;ignorehitpause =
;persistent =


[state 4001]
type = changestate
trigger1 = pos y >= 0
value = 4000

;-----------------------------
[statedef 4000, Idle]
velset = 0,0
sprpriority = -10
facep2 = 1

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 4000, changestate]
type = changestate
trigger1 = parent,command = "holddown"
value = 4006

[state 4020, changestate]
type = changestate
trigger1 = parent,command = "Arrowheadx"
trigger2 = parent,command = "Arrowheady"
trigger3 = parent,command = "Arrowheadz"
value = 4020

[state 4010, changestate]
type = changestate
trigger1 = parent,command = "x"
trigger2 = parent,command = "y"
trigger3 = parent,command = "z"
trigger4 = parent,command = "a"
trigger5 = parent,command = "b"
trigger6 = parent,command = "c"
value = 4010

[state 4000, turn]
type = changestate
;trigger1 = p2bodydist x < 0
trigger1 = p2dist x = -1
value = 4002

[state 4000, changeanim]
type = changeanim
trigger1 = time = 0
value = 4000

[state 4000, Fwd]
type = changestate
trigger1 = p2bodydist x >= 40
value = 4003

[state 4000, Bck]
type = changestate
trigger1 = p2bodydist x <= 30
value = 4004

[state 0, Leave]
type = changestate
trigger1 = parent,var(1) = 0
value = 4099

;-----------------------------
[statedef 4002, Turn]
velset = 0,0
sprpriority = -10
anim = 4002

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 4002, idle]
type = changestate
trigger1 = animtime = 0
value = 4000

;----------------------
[statedef 4003, Move Forward]
sprpriority = -10
facep2 = 1
velset = 2.5,0

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 4020, changestate]
type = changestate
trigger1 = parent,command = "Arrowheadx"
trigger2 = parent,command = "Arrowheady"
trigger3 = parent,command = "Arrowheadz"
value = 4020

[state 4000, turn]
type = changestate
;trigger1 = p2bodydist x < 0
trigger1 = p2dist x = -1
value = 4002

[state 4000, idle]
type = changestate
trigger1 = p2dist x = 0
value = 4000

[state 4000, changeanim]
type = changeanim
trigger1 = time = 0
value = 4003

[state 4000, idle]
type = changestate
trigger1 = p2bodydist x <= 39
value = 4000

[state 0, Leave]
type = changestate
trigger1 = parent,var(1) = 0
value = 4099

;----------------------
[statedef 4004, Move Backward]
sprpriority = -10
facep2 = 1
velset = -2.5,0

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 4020, changestate]
type = changestate
trigger1 = parent,command = "Arrowheadx"
trigger2 = parent,command = "Arrowheady"
trigger3 = parent,command = "Arrowheadz"
value = 4020

[state 4000, turn]
type = changestate
trigger1 = p2dist x = -1
value = 4002

[state 4000, changeanim]
type = changeanim
trigger1 = time = 0
value = 4004

[state 4000, idle]
type = changestate
trigger1 = p2bodydist x >= 31
value = 4000

[state 0, Leave]
type = changestate
trigger1 = parent,var(1) = 0
value = 4099

;-----------------------------
[statedef 4005, Damage]
anim = 4005
movetype = H
velset = 0,0
sprpriority = -10
facep2 = 1

[State 4005, 5]
type = RemoveExplod
triggerall = var(1) = 1
trigger1 = var(2) >= 600
trigger1 = 1
trigger2 = Win
trigger3 = Lose
ID = 105
ignorehitpause = 1
persistent = 0

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
;value2 = S,NA
time = 1
;ignorehitpause =
;persistent =


[state 4007, changestate]
type = changestate
trigger1 = animtime = 0
value = 4000
;-----------------------------
[statedef 4006, Crouching]
sprpriority = -10
velset = 0,0
facep2 = 1

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 4006, changeanim]
type = changeanim
trigger1 = time = 0
value = 4006

[state 4006, changestate]
type = changestate
trigger1 = parent,command != "holddown"
value = 4007

[state 4006, changestate]
type = changestate
trigger1 = parent,command = "x"
trigger2 = parent,command = "y"
trigger3 = parent,command = "z"
trigger4 = parent,command = "a"
trigger5 = parent,command = "b"
trigger6 = parent,command = "c"
value = 4015

[state 0, Leave]
type = changestate
trigger1 = parent,var(1) = 0
value = 4099

;-----------------------------
[statedef 4007, Stand Up]
sprpriority = -10
velset = 0,0
facep2 = 1

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 4007, changeanim]
type = changeanim
trigger1 = time = 0
value = 4007

[state 4007, changestate]
type = changestate
trigger1 = animtime = 0
value = 4000

[state 0, Leave]
type = changestate
trigger1 = parent,var(1) = 0
value = 4099

;----------------------
; StandingPunch
[Statedef 4010]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 4010
poweradd = 15
sprpriority = 2

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[State 4010, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 0
channel = 1

[State 4010, 2]
type = HitDef
trigger1 = animelem = 3
attr = S, NA
damage = 25, 1
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3
nochainID = 220
pausetime = 8, 8
sparkno = s1505
sparkxy = 0, -35
guard.sparkno = s1515
hitsound = s1, 0
guardsound = s2,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -1
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-3
air.hittime = 12  ;Time before opponent regains control in air

[State 4010, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 4000
ctrl = 1

;----------------------
; StandingPunch
[Statedef 4015]
type    = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 4015
poweradd = 0
sprpriority = 2

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[State 4015, 1]
type = PlaySnd
trigger1 = Time = 2
value = 0, 0
channel = 1

[State 4015, 2]
type = HitDef
trigger1 = animelem = 2
attr = S, NA
damage = 25, 1
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3
nochainID = 220
pausetime = 8, 8
sparkno = s1505
sparkxy = 0, -35
guard.sparkno = s1515
hitsound = s1, 0
guardsound = s2,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -1
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-3
air.hittime = 12  ;Time before opponent regains control in air

[State 4015, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 4006
ctrl = 1

;----------------------
[statedef 4020, Fireball]
anim = 4020
sprpriority = -10
facep2 = 1
velset = 0,0

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[State 4020, 0]
type = Projectile
trigger1 = AnimElem = 6
projanim = 2903
projpriority = 20
projshadow = -1
offset = 48,-42
velocity = 20,0
attr = A, SP
damage = 25,4
ID = 2903
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1510
sparkxy = -1
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Heavy
air.velocity = 0,-3
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
palfx.time = 50
palfx.mul = 255, 70, 70 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[state 4020, Dampener]
type = attackmulset
trigger1 = numtarget >= 1
value = 0.9 ** target, gethitvar(hitcount);0.95 ** target, gethitvar(hitcount)
persistent = 0

[state 4020, hitsound]
type = Playsnd
trigger1 = AnimElem = 6
value = s18000,2
channel = 7
persistent = 1

[state 4020, hitsound]
type = Playsnd
trigger1 = projhit(2903) = 1
value = s18000,3
channel = 7
persistent = 1

[state 4020, changestate]
type = changestate
trigger1 = animtime = 0
value = 4000

;---------------------------------------
[statedef 4099]
sprpriority = -10
anim = 4099
movetype = I

[State 4000, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 4005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[State 4099, Stop Sound]
type = StopSnd
trigger1 = time = 0
channel = 6

[state 4099, turn]
type = turn
trigger1 = time = 0

[State 4099]
type = velset
trigger1 = time = 1
x = 8
y = -10

[State 4099]
type = Nothitby
trigger1 = 1
value = SCA

[state 4099]
type = destroyself
trigger1 = time = 35

;---------------------------------------
;Victim P2
[Statedef 4100]
ctrl = 0
physics = N
movetype = H
type    = A
sprpriority = 1
velset = 0,0

[State 4099]
type = Nothitby
trigger1 = 1
value = SCA

[state 4100, change]
type = changeanim2
trigger1 = time = 0
value = 4100

[State 4100, PosAdd]
type = PosAdd
trigger1 = time = 0
y = Const(size.mid.pos.y)

[State 4100, VelSet]
type = VelSet
trigger1 = time = 3
x = -1
y = -15

[State 4100, VelAdd]
type = VelAdd
trigger1 = time>=3
y = .45

[state 4100, changestate]
type = selfstate
trigger1 = time>= 8
trigger1 = pos Y >=0 && vel Y>= 0
value = 5100


