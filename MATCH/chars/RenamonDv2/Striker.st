;---------------------------
;Terriermon Striker
[statedef 15000, Terriermon]
type = S
physics = S
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 15000
poweradd = 0

[State 15000]
type = Helper
trigger1 = time = 15
ID = 15001
stateno= 15001
name = "TerStriker"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
postype = Back
Ownpal = 1
pos = 0,-70

[State 15000, striker]
type = VarAdd
trigger1 = time = 15
v = 58
value = -1

[state 15000]
type = changestate
trigger1 = animtime = 0
value = 0
ctrl = 1

;-------------------------------
[statedef 15001]
anim = 2508
movetype = I
velset = 5,7
sprpriority = 5

[state 15001]
type = velset
trigger1 = pos y >= 0
x = 0
y = 0

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 15005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 15001]
type = changestate
trigger1 = pos y >= 0
;trigger1 = animtime = 0
value = 15002

[state 15001,PlayerHit]
type = changestate
trigger1 = root,movetype = H
;trigger1 = animtime = 0
value = 15005
;----------------------
[statedef 15002]
anim = 2509

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 15005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 15002, snd]
type = Playsnd
trigger1 = time = 0
value = s2500,0
channel = 7

[state 15002, statetypeset1]
type = statetypeset
trigger1 = time = 0
movetype = I

[state 15002, statetypeset2]
type = statetypeset
trigger1 = time = 10
movetype = A

[state 15002]
type = changeanim
trigger1 = statetime = 10
value = 2512

[State 15002, 1]
type = HitDef
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 12 = 0
attr = S, SA
hitflag = MAF
animtype  = Medium
damage    = 40
guardflag = MA
priority = 3
pausetime = 4,6
sparkno = s1511
sparkxy = 10, floor(P2Dist Y)-65
guard.sparkno = s1515
hitsound   = s1,4
guardsound = s2,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 6
ground.velocity = -.5, -2
air.velocity = -.5,-2
air.hittime = 6
fall = 1
fall.recover = 0

[state 15002, Dampener]
type = attackmulset
trigger1 = numtarget >= 1
value = 0.9 ** target, gethitvar(hitcount);0.95 ** target, gethitvar(hitcount)
persistent = 0

[State 15002]
type = Explod
trigger1 = vel x > 0
anim = 2511
pos = 0,0
ID = 15002
scale = .5, .5
shadow = -1
bindtime = -1
sprpriority  = 5
removetime = -1
ownpal = 1
persistent = 0

[state 15002, vel]
type = velset
trigger1 = statetime = 10
x = 7.3

[state 15002, vel2]
type = velset
trigger1 = frontedgedist <= 0
x = 0

[state 15002]
type = changestate
trigger1 = frontedgedist <= 0
value = 15003

[state 15002, WinKO]
type = changestate
trigger1 = root,winKO
value = 15004

;-------------------------
[statedef 15003]
anim = 2509
movetype = I

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 15005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 15002, WinKO]
type = changestate
trigger1 = root,winKO
value = 15004

[state 15002, modify]
type = modifyexplod
trigger1 = time = 0
ID = 15002
removetime = 1

[State 15002]
type = Explod
trigger1 = time = 0
anim = 2513
pos = 0,0
scale = .5, .5
sprpriority  = 5
removetime = -2
ownpal = 1
persistent = 0

[state 15002, terriermon]
type = varset
trigger1 = time = 0
v = 57
value = 0

[state 15003]
type = velset
trigger1 = animtime = 0
x = -5

[state 15003]
type = changeanim
trigger1 = animtime = 0
value = 2510

[state 15003]
type = destroyself
trigger1 = backedgedist <= -100

;---------------------------------------
[statedef 15004, WinKO]
anim = 2514
physics = N
velset = 0,0

[state 15003]
type = changestate
trigger1 = root,stateno = 17000
value = 15006
persistent = 0

[state 15004, modify]
type = modifyexplod
trigger1 = time = 0
ID = 15002
removetime = 1

;---------------------------------------
[statedef 15005]
anim = 2516
velset = -8,-10
movetype = I

[state 15002, modify]
type = modifyexplod
trigger1 = time = 0
ID = 15002
removetime = 1

[state 15005]
type = destroyself
trigger1 = time = 35

;---------------------------------------
[statedef 15006, WinKO]
physics = N

[State 0, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 15005
time = 1
forceair = 0
;ignorehitpause =
;persistent =

[state 15003]
type = changeanim
trigger1 = time = 0
value = 2515

[state 15006]
type = velset
trigger1 = time = 0
y = -6
x = Parentdist x/80

[state 15006]
type = velAdd
trigger1 = 1
y = .122

[state 15006]
type = destroyself
trigger1 = time = 80

;------------------------------------------------------------------
;-----------===============Striker Data================------------
;------------------------------------------------------------------
[Statedef 2500]
type = A
ctrl = 0
anim = 999
velset = 0,0
movetype = I
physics = N
sprpriority = 0

[State 2500, Number5]
type = Explod
trigger1 = root,var(58) = 5
anim = 2500
postype = Back
ID = 55
scale = 1,1
pos = ifelse(Facing = -1, 18, 20), 49
bindtime = -1
ownpal = 1
removetime = 1
facing = ifelse(Facing = -1, -1, 1)
sprpriority = -5
persistent = 1

[State 2500, Number4]
type = Explod
trigger1 = root,var(58) = 4
anim = 2501
postype = Back
ID = 55
scale = 1,1
pos = ifelse(Facing = -1, 18, 20), 49
bindtime = -1
ownpal = 1
removetime = 1
facing = ifelse(Facing = -1, -1, 1)
sprpriority = -5
persistent = 1

[State 2500, Number3]
type = Explod
trigger1 = root,var(58) = 3
anim = 2502
postype = Back
ID = 55
scale = 1,1
pos = ifelse(Facing = -1, 18, 20), 49
bindtime = -1
ownpal = 1
removetime = 1
facing = ifelse(Facing = -1, -1, 1)
sprpriority = -5
persistent = 1

[State 2500, Number2]
type = Explod
trigger1 = root,var(58) = 2
anim = 2503
postype = Back
ID = 55
scale = 1,1
pos = ifelse(Facing = -1, 18, 20), 49
bindtime = -1
ownpal = 1
removetime = 1
facing = ifelse(Facing = -1, -1, 1)
sprpriority = -5
persistent = 1

[State 2500, Number1]
type = Explod
trigger1 = root,var(58) = 1
anim = 2504
postype = Back
ID = 55
scale = 1,1
pos = ifelse(Facing = -1, 18, 20), 49
bindtime = -1
ownpal = 1
removetime = 1
facing = ifelse(Facing = -1, -1, 1)
sprpriority = -5
persistent = 1

[State 2500, Number0]
type = Explod
trigger1 = root,var(58) = 0
anim = 2505
postype = Back
ID = 55
scale = 1,1
pos = ifelse(Facing = -1, 18, 20), 49
bindtime = -1
ownpal = 1
removetime = 1
facing = ifelse(Facing = -1, -1, 1)
sprpriority = -5
persistent = 1

[State 2500, Frame]
type = Explod
trigger1 = time = 0
anim = 2506
postype = Back
ID = 55
scale = 0.5,0.5
pos = ifelse(Facing = -1, 22, 5), 50
bindtime = -1
ownpal = 1
removetime = -1
sprpriority = -5

[State 2500, Image]
type = Explod
trigger1 = time = 0
anim = 2507
postype = Back
ID = 55
scale = 0.5,0.5
pos = ifelse(Facing = -1, 22, 5), 50
bindtime = -1
removetime = -1
sprpriority = -5


