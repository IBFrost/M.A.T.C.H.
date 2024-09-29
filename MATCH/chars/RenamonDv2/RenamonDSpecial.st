;Renamon's Specials
;----------------------
;----------------------
; Air Leaf ArrowHead
[Statedef 1000]
type    = A
juggle  = 2
poweradd= 20
ctrl = 0
anim = 1000

[State 2002, DSFlare]
type = Explod
trigger1 = time = 7
anim = 1500
postype = p1
scale = 0.5,0.5
pos = 10,-60
sprpriority = 4
removetime = 11
removeongethit = 1
bindtime = -1

[State 2002, DSFlareend]
type = Explod
trigger1 = time = 18
anim = 1501
postype = p1
scale = 0.5,0.5
pos = 10,-60
sprpriority = 4
removetime = 10
removeongethit = 1
velocity = -1,-1

[State 1000, TypeSet]
type = statetypeset
trigger1 = time = 0
physics = N
movetype = A

[State 1000, Physic]
type = statetypeset
trigger1 = animelem = 4
physics = A

[State 1000, Idle]
type = statetypeset
trigger1 = time = 35
movetype = I

[State 1000, Ctrl]
type = Ctrlset
trigger1 = time = 35
value = 1



[State 1000, velDown]
type = Velset
triggerall = time = 0
trigger1 = vel y > 0
y = 1
x = 0

[State 1000, velUp]
type = Velset
triggerall = time = 0
trigger1 = vel y < 0
y = -1
x = 0

[State 1000, velJump]
type = Velset
trigger1 = animelem = 4
y = -3
x = -3

[state 2002, hitsound]
type = Playsnd
trigger1 = projhit(1000) = 1
value = s100,0 ;s30,7
channel = 1
persistent = 1

[state 2002, hitsound]
type = Playsnd
trigger1 = projguarded(1000) = 1
value = s2,0 ;s30,7
channel = 1
persistent = 1

[State 1000, 1]
type = PlaySnd
trigger1 = AnimElem = 4
value = s100, 1 ;0, 4
channel = 5

[State 1000, 2]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1002
projpriority = 1
projshadow = -1
offset = 30,-100
ID = 1000
velocity = 10,15
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 0, 0
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1000, 2]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1002
projpriority = 1
projshadow = -1
offset = -30,-100
ID = 1000
velocity = 10,15
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 5,40
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1000, 2]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1002
projpriority = 1
projshadow = -1
offset = 15,-95
ID = 1000
velocity = 10,15
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 20, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1000, 2]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1002
projpriority = 1
projshadow = -1
offset = -15,-100
ID = 1000
velocity = 10,15
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 15, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[state 1000]
type = selfstate
trigger1 = Pos Y >= 0 && Vel Y >= 0
trigger1 = animtime = 0
value = 52
ctrl = 1

;----------------------
; Ground Leaf ArrowHead
[Statedef 1003]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
ctrl = 0
velset = 0,0
anim = 1003
sprpriority = 1

[State 1003, DSFlare]
type = Explod
trigger1 = time = 4
anim = 1502
postype = p1
scale = 0.5,0.5
pos = 30,-80
sprpriority = 4
removetime = 8
removeongethit = 1
bindtime = -1

[State 1003, snd]
type = PlaySnd
trigger1 = animelem = 4
value = 100, 1
channel = 2

[state 1003, hitsound]
type = Playsnd
trigger1 = projhit(1000) = 1
value = s100,0 ;s30,7
channel = 1
persistent = 1

[state 2002, hitsound]
type = Playsnd
trigger1 = projguarded(1000) = 1
value = s2,0 ;s30,7
channel = 1
persistent = 1

[State 1003, 2]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 0,-80 ;+5, +5
velocity = 10,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 25, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1003, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 5,-75 ;+5, +5
velocity = 10,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 25, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1003, 4]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 10,-80 ;+5, +5
velocity = 10,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 25, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99



[State 1003, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------
; Ground Leaf ArrowHead(Medium)
[Statedef 1004]
type    = S
movetype= A
physics = S
juggle  = 2
poweradd= 20
ctrl = 0
velset = -2,0
anim = 1003

[State 1004, DSFlare]
type = Explod
trigger1 = time = 4
anim = 1502
postype = p1
scale = 0.5,0.5
pos = 30,-80
sprpriority = 4
removetime = 8
removeongethit = 1
bindtime = -1

[State 1004, snd]
type = PlaySnd
trigger1 = animelem = 4
value = 100, 1
channel = 2

[state 1004, hitsound]
type = Playsnd
trigger1 = projhit(1000) = 1
value = s100,0 ;s30,7
channel = 1
persistent = 1

[state 2002, hitsound]
type = Playsnd
trigger1 = projguarded(1000) = 1
value = s2,0 ;s30,7
channel = 1
persistent = 1

[State 1004, 2]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 0,-80 ;+5, +5
velocity = 12,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 25, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1004, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 5,-75 ;+5, +5
velocity = 12,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 25, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1004, 4]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 10,-80 ;+5, +5
velocity = 12,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 30, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1004, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------
; Ground Leaf ArrowHead(Strong)
[Statedef 1005]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 20
ctrl = 0
velset = -2,0
anim = 1003

[State 1005, DSFlare]
type = Explod
trigger1 = time = 4
anim = 1502
postype = p1
scale = 0.5,0.5
pos = 30,-80
sprpriority = 4
removetime = 8
removeongethit = 1
bindtime = -1

[State 1005, snd]
type = PlaySnd
trigger1 = animelem = 4
value = 100, 1
channel = 2

[state 1005, hitsound]
type = Playsnd
trigger1 = projhit(1000) = 1
value = s100,0 ;s30,7
channel = 1
persistent = 1

[state 1005, hitsound]
type = Playsnd
trigger1 = projguarded(1000) = 1
value = s2,0 ;s30,7
channel = 1
persistent = 1

[State 1003, 2]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 0,-80 ;+5, +5
velocity = 15,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 30, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1003, 3]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
projid = 1000
offset = 5,-75 ;+5, +5
velocity = 15,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 25, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1003, 4]
type = Projectile
trigger1 = AnimElem = 4
projanim = 1004
projpriority = 3
projshadow = -1
projsprpriority = 0
offset = 10,-80 ;+5, +5
velocity = 15,0
attr = S, SP
damage = 25,4
animtype = Medium
guardflag = MA
hitflag = MAFP
pausetime = 5,10
sparkno = s1511
guard.sparkno = s1515
sparkxy = 25, 10
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = -1.4,-3
air.hittime = 12
projremovetime = 99

[State 1005, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------
; Wisteria Punch (Weak)
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 2
velset = 0,0
ctrl = 0
anim = 1010
poweradd = 25
sprpriority = 2

[State 1010, veladd]
type = VelAdd
trigger1 = AnimElem = 4
x = 8

[State 1010, 1]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 65
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3
sparkno = s1507
guardsparkno = s1515
sparkxy = 0, -50
ID = 1010
nochainID = 1010
hitsound = s1,4+random%2
guardsound = s2,0
p2stateno = 225
ground.type = High
ground.slidetime = 7
ground.hittime  = 17
ground.velocity = -8,-5
airguard.velocity = -4.5,-7.5
air.type = Low
air.velocity = -4,-7.5
air.hittime = 20
fall = 1
fall.recover = 0


[State 1010, 3]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0

;----------------------
; Wisteria Punch (Medium)
[Statedef 1011]
type    = S
movetype= A
juggle  = 2
velset = 0,0
ctrl = 0
anim = 1011
poweradd = 25
sprpriority = 2

[State 1011, set1]
type = statetypeset
trigger1 = time = 0
physics = S

[State 1011, set2]
type = statetypeset
triggerall = movecontact != 1
trigger1 = animelem = 4
physics = N

[State 1011, set3]
type = statetypeset
triggerall = movecontact != 1
trigger1 = animelem = 7
physics = S

[State 1011, velset]
type = Velset
triggerall = movecontact != 1
trigger1 = AnimElem = 4
x = 8

[State 1011, veladd2]
type = Veladd
triggerall = movecontact != 1
trigger1 = (AnimElemtime(4) > 0) && (Animelemtime(10) < 3)
x = -.12

[State 1011, set3]
type = statetypeset
trigger1 = movecontact
physics = S

[State 1011, 1]
type = HitDef
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 23 = 0
trigger2 = Animelemtime(10) < 3
attr = S, SP
damage = 50, 5
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3
sparkno = s1507
guardsparkno = s1515
sparkxy = -20, -80
hitsound = s1,4+random%2
guardsound = s2,0
hitonce = 1
yaccel = .52
guardsound = 6,0
ground.type = High
ground.slidetime = 7
ground.hittime  = 17
ground.velocity = -1.5
airguard.velocity = -1.5
air.type = Low
air.velocity = -2,-5
air.hittime = 20
air.fall = 1
air.fall.recover = 0

[State 1011, 1]
type = HitDef
trigger1 = Animelemtime(11) > 0
attr = S, SP
damage = 50, 5
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3
ID = 1011
nochainID = 1011
pausetime = 5, 6
sparkno = s1507
guardsparkno = s1515
sparkxy = -20, -80
hitsound = s1,4+random%2
guardsound = s2,0
hitonce = 1
yaccel = .52
guardsound = 6,0
ground.type = High
ground.slidetime = 7
ground.hittime  = 17
ground.velocity = -8,-5
airguard.velocity = -6,-7.5
air.type = Low
air.velocity = -6,-7.5
air.hittime = 20
fall = 1
fall.recover = 0

[State 1011, 3]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0

;----------------------
; Wisteria Punch (Strong)
[Statedef 1012]
type    = S
movetype= A
juggle  = 2
velset = 0,0
ctrl = 0
anim = 1012
poweradd = 25
sprpriority = 2

[state 1012, Starter]
type = Playsnd
trigger1 = time = 0
value = s18000, 2
channel = 7

[state 1012, Damage hit]
type = Playsnd
trigger1 = movehit = 1
value = s18000, 3
channel = 7

[State 1012, P2]
type = Explod
trigger1 = MoveHit = 1
anim = 1016
postype = P2
pos = 0, 0
bindtime = -1
facing = -1
ignorehitpause = 1
supermove = 1
sprpriority = -10
removetime = -2
ownpal = 1
persistent = 0

[State 1012, set1]
type = statetypeset
trigger1 = time = 0
physics = S

[State 1012, set2]
type = statetypeset
triggerall = movecontact != 1
trigger1 = animelem = 4
physics = N

[State 1012, set3]
type = statetypeset
triggerall = movecontact != 1
trigger1 = animelem = 14
physics = S

[State 1012, velset]
type = Velset
triggerall = movecontact != 1
trigger1 = AnimElem = 4
x = 8

[State 1012, veladd2]
type = Veladd
triggerall = movecontact != 1
trigger1 = (AnimElemtime(4) > 0) && (Animelemtime(14) < 3)
x = -.2

[State 1012, set3]
type = statetypeset
trigger1 = movecontact
physics = S

[State 1012, 1]
type = HitDef
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 8 = 3
trigger2 = (Animelemtime(10) <= 3)
attr = S, SP
damage = 65, 8
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3
pausetime = 6, 6
sparkno = s1510
guardsparkno = s1515
sparkxy = -20, -80
hitsound = -1
yaccel = .52
guardsound = 6,0
ground.type = High
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -1.5
airguard.velocity = -1.5
air.type = Low
air.velocity = -2,-5
air.hittime = 24
air.fall = 1
air.fall.recover = 0
palfx.time = 35
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 1012, 1]
type = HitDef
trigger1 = Animelemtime(11) >= 0
attr = S, SP
damage = 65, 8
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3
ID = 1011
nochainID = 1011
pausetime = 5, 6
sparkno = s1510
guardsparkno = s1515
sparkxy = -20, -80
hitsound = 5, 0
hitonce = 1
yaccel = .52
guardsound = 6,0
ground.type = High
ground.slidetime = 7
ground.hittime  = 17
ground.velocity = -8,-5
airguard.velocity = -6,-8.5
air.type = Low
air.velocity = -6,-8.5
air.hittime = 20
p2stateno = 1015
fall = 1
fall.recover = 0
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 1015, ExplodFire]
type = Explod
trigger1 = animelemtime(4) = 0
anim = 1015
postype = p1
pos = 0,0
bindtime = -1
removetime = 27
vel = 0, 0
ownpal = 1
sprpriority = 10
persistent = 1
removeongethit = 1

[State 1015, Explod]
type = Explod
trigger1 = (time > 15) && (time < 32)
trigger1 = (time % 4) = 1
scale = const(size.xscale)
ID = 702
anim = 702
postype = p1
pos = -20, -40
random = 20,100
bindtime = 1
removetime = -2
vel = -3, 0
ownpal = 1
random = 20, 60
sprpriority = 2

[State 1012, 3]
type = ChangeState
trigger1 = AnimTime = 0
ctrl = 1
value = 0

;---------------------------------------
;Victim
[Statedef 1015]
type = A
movetype = H
physics = N
crtl = 0
facep2 = 1
ctrl = 0
velset = -12, -5

[state 1015]
type = nothitby
trigger1 = 1
value = SCA

[state 1015]
type = changeanim2
trigger1 = time = 0
value = 5061

[State 651, Veladd1]
type = Veladd
trigger1 = time >= 0
y = .52

[state 1015]
type = CtrlSet
trigger1 = Pos Y >= 0 && Vel Y >= 0
value = 1

[state 1015]
type = selfstate
trigger1 = Pos Y >= 0 && Vel Y >= 0
value = 5110

;----------------------
; Fox Change Void - Left
[Statedef 1020]
type    = S
movetype= I
juggle  = 2
velset = 0,0
ctrl = 0
anim = 1020
sprpriority = 2

[State 1020, Explod]
type = Explod
trigger1 = time = 10
anim = 1516
vel = 0,0
accel = 0, 0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 1,1
sprpriority = 2
ownpal = 1

[State 1020, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Leaf"
ID = 1025
stateno = 1025
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1020,1]
type = Nothitby
trigger1 = time >= 5
trigger1 = time <= 24
value = , NA, NP, SA, SP, HP

[State 1020, 2]
type = PosSet
trigger1 = time = 0
facing = ifelse(Facing = -1, -1, 1)
x = -400

[State 1020, Turn]
Type = turn
trigger1 = P2Dist x < 0
persistent = 0

[State 1020,3]
type = Changeanim
trigger1 = time = 16
value = 1021

[State 1020,Ctrl]
type = Ctrlset
trigger1 = time = 26
value = 1

[State 1020, 3]
type = ChangeState
trigger1 = Time = 32
value = 0

;----------------------
; Fox Change Void - Middle
[Statedef 1021]
type    = S
movetype= I
juggle  = 2
velset = 0,0
ctrl = 0
anim = 1020
sprpriority = 2

[State 1021, Explod]
type = Explod
trigger1 = time = 10
anim = 1516
vel = 0,0
accel = 0, 0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 1,1
sprpriority = 2
ownpal = 1

[State 1021, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Leaf"
ID = 1025
stateno = 1025
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1021,1]
type = Nothitby
trigger1 = time >= 5
trigger1 = time <= 24
value = , NA, NP, SA, SP, HP

[State 1021, 2]
type = PosSet
trigger1 = time = 15
x = 0

[State 1021, Turn]
Type = turn
trigger1 = P2Dist x < 0
persistent = 0

[State 1021,3]
type = Changeanim
trigger1 = time = 16
value = 1021

[State 1021,Ctrl]
type = Ctrlset
trigger1 = time = 26
value = 1

[State 1021, 3]
type = ChangeState
trigger1 = Time = 32
value = 0

;----------------------
; Fox Change Void - Right
[Statedef 1022]
type    = S
movetype= I
juggle  = 2
velset = 0,0
ctrl = 0
anim = 1020
sprpriority = 2

[State 1022, Explod]
type = Explod
trigger1 = time = 10
anim = 1516
vel = 0,0
accel = 0, 0
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = 1,1
sprpriority = 2
ownpal = 1

[State 1022, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Leaf"
ID = 1025
stateno = 1025
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1

[State 1022,1]
type = Nothitby
trigger1 = time >= 5
trigger1 = time <= 24
value = , NA, NP, SA, SP, HP

[State 1022, 2]
type = PosSet
trigger1 = time = 15
x = 200

[State 1022, Turn]
Type = turn
trigger1 = P2Dist x < 0
persistent = 0

[State 1022,3]
type = Changeanim
trigger1 = time = 16
value = 1021

[State 1022,Ctrl]
type = Ctrlset
trigger1 = time = 26
value = 1

[State 1022, 3]
type = ChangeState
trigger1 = Time = 32
value = 0

;----------------------------
;Leaf Helper
[Statedef 1025]
anim = 999

[State 1025]
type = Playsnd
trigger1 = time = 0
value = s1020, 0

[State 1025, Explod]
type = Explod
trigger1 = (time > 0) && (time < 40)
trigger1 = (time % 4) = 1
anim = 1025
pos = -30+random%60,-120+random%60
vel = .5,1.5
accel = 0, .5
;postype = p1  ;p2,front,back,left,right
;bindtime = 1
removetime = 15
scale = 1,1
sprpriority = 6
ownpal = 1
;persistent =

[state 1025]
type = Turn
trigger1 = Random  <= 249

[state 1025, Destroy]
type = Destroyself
trigger1 = time = 40

;----------------------
; Overhead
[Statedef 1050]
type    = S
movetype= A
physics = N
juggle  = 1
ctrl = 0
anim = 1050
poweradd = 15
sprpriority = 5

[state 1050, Set]
type = Velset
trigger1 = animelem = 4
x = 1.33

[state 1050, Set]
type = Velset
trigger1 = animelem = 13
x = 0

[State 1050, StateTypeSet1]
type = StateTypeSet
trigger1 = animelem = 4
statetype = A

[State 1050, StateTypeSet2]
type = StateTypeSet
trigger1 = animelem = 13
statetype = S

[State 1050, Sound]
type = PlaySnd
trigger1 = Time = 4
value = 7, 0
channel = 1

[State 1050, RenamonSound]
type = PlaySnd
trigger1 = Time = 12
value = 21, 0
channel = 2

[State 1050, 2]
type = HitDef
trigger1 = time = 0
attr = S, NA
damage = 25, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 3, 3
sparkno = s1505
sparkxy = 0, -30
guard.sparkno = s1515
hitsound = s1,3
guardsound = s2,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 24
ground.velocity = -2
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-3
air.hittime = 12  ;Time before opponent regains control in air

[State 1050, Ctrl]
type = Ctrlset
trigger1 = movehit = 1
value = 1

[State 1050, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
