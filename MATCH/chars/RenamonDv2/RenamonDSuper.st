;Renamon's Supers
;----------------------
;----------------------
; Diamond Storm Special Starter from Air
[Statedef 2001]
physics = N
movetype = A
type    = A
juggle  = 0
poweradd= 0
ctrl = 0
anim = 1048
sprpriority = 1

[State 2001, DSFlare]
type = Explod
trigger1 = time = 12
anim = 1500
postype = p1
scale = 0.5,0.5
pos = 10,-60
sprpriority = 4
removetime = 24
removeongethit = 1
bindtime = -1
removeongethit = 1

[State 2002, sound]
type = Playsnd
trigger1 = time = 3
value = 20,1
channel = 2

[State 2001, screenbound]
type = Screenbound
trigger1 = time = 0
time = 46
pos = 9999, -9999
darken = 0
unhittable = 0

[State 2001, Pal]
type = PalFX
trigger1 = animelemtime(1) = 0
trigger2 = animelemtime(1) = 8
trigger3 = animelemtime(1) = 16
time = 2
add = 256,256,256
mul = 256,256,256
ownpal = 1

[State 2001, velDown]
type = Velset
triggerall = time = 0
trigger1 = vel y > 0
y = 1
x = 0

[State 2001, velUp]
type = Velset
triggerall = time = 0
trigger1 = vel y < 0
y = -1
x = 0

[State 2001, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 2002
ctrl = 0

;----------------------------------------------
; Diamond Storm Special Starter from Air
[Statedef 2001]
physics = N
movetype = A
type    = A
juggle  = 0
poweradd= 0
ctrl = 0
anim = 1048
sprpriority = 1

[State 2001, DSFlare]
type = Explod
trigger1 = time = 12
anim = 1500
postype = p1
scale = 0.5,0.5
pos = 10,-60
sprpriority = 4
removetime = 24
removeongethit = 1
bindtime = -1
removeongethit = 1

[State 2002, sound]
type = Playsnd
trigger1 = time = 3
value = 20,1
channel = 2

[State 2001, screenbound]
type = null;Screenbound
trigger1 = time = 0
time = 46
pos = 9999, -9999
darken = 0
unhittable = 0

[State 2001, Pal]
type = PalFX
trigger1 = animelemtime(1) = 0
trigger2 = animelemtime(1) = 8
trigger3 = animelemtime(1) = 16
time = 2
add = 256,256,256
mul = 256,256,256
ownpal = 1

[State 2001, velDown]
type = Velset
triggerall = time = 0
trigger1 = vel y > 0
y = 1
x = 0

[State 2001, velUp]
type = Velset
triggerall = time = 0
trigger1 = vel y < 0
y = -1
x = 0

[State 2001, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 2002
ctrl = 0

; Diamond Storm Special Starter from Air
[Statedef 2005]
physics = N
movetype = A
type    = A
juggle  = 0
poweradd= 0
ctrl = 0
anim = 1048
sprpriority = 1
velset = 0,0

[State 2001, DSFlare]
type = Explod
trigger1 = time = 12
anim = 1500
postype = p1
scale = 0.5,0.5
pos = 10,-60
sprpriority = 4
removetime = 24
removeongethit = 1
bindtime = -1
removeongethit = 1
supermovetime = 9999

[State 2002, 1]
type = SuperPause
trigger1 = time = 0
anim = s1513
time = 66
pos = 18, -76
darken = 0
unhittable = 1
movetime= 36

[State 2002, sound]
type = Playsnd
trigger1 = time = 3
value = 20,1
channel = 2

[State 2001, screenbound]
type = Screenbound
trigger1 = time = 0
time = 46
pos = 9999, -9999
darken = 0
unhittable = 0

[State 2002, Super BGWarning]
type = Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 1514
postype = left
pos = 0,0
;under = 1
sprpriority  = -2
removetime = 30
supermovetime = 9999
removeongethit = 1
bindtime = -1
velocity  = 0,0


[State 2002, Super Portrait]
type = Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2000
postype = back
pos = 0,0
sprpriority = 1
removetime = 30
supermovetime = 30
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 2001, Pal]
type = PalFX
trigger1 = animelemtime(1) = 0
trigger2 = animelemtime(1) = 8
trigger3 = animelemtime(1) = 16
time = 2
add = 256,256,256
mul = 256,256,256
ownpal = 1

[State 2001, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 2002
ctrl = 0
;----------------------
; Diamond Storm Special
[Statedef 2002]
type    = A
movetype= A
juggle  = 1
poweradd= 0
ctrl = 0
velset = -1,-1
anim = 1049
sprpriority = 2

[State 651, 1]
type = Screenbound
triggerall = prevstateno = 2000
trigger1 = animelemtime(24) <= 0
value = 1

[State 2002, 4]
type = velset
trigger1 = AnimElem = 3
x = -1
y = -2

[State 2002, 5]
type = Statetypeset
trigger1 = time = 0
physics = N

[State 2002, 5]
type = Statetypeset
trigger1 = AnimElem = 24
physics = A

[State 191, SuperBG]
type = Helper
trigger1 = time = 0
trigger1 = var(1) = 0
trigger1 = !numhelper(50000)
ID = 50000
stateno= 50000
name = "SUPERNORMAL"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 40
pausemovetime = 40
pos = 0,0

[State 2002, assertspecial]
type = assertspecial
triggerall = var(1) = 0
triggerall = anim = 1049
trigger1 = (time >= 0) && (time <= 30)
flag = noBG
flag2 = noFG
flag3 = nobardisplay
ignorehitpause = 1

[state 2002, hitsound]
type = Playsnd
trigger1 = projhit(2002) = 1
value = s30,7
channel = 1
persistent = 1

[state 2002, hitsound]
type = Playsnd
trigger1 = projguarded(2002) = 1
value = s2,0
channel = 1
persistent = 1

[State 2002, 1]
type = SuperPause
triggerall = var(1) = 0 && prevstateno != 2005
trigger1 = time = 0
anim = s1513
time = 30
pos = 18, -76
darken = 1
unhittable = 1
sound = s2000
poweradd= -1000



[State 2002, Hyperbg "Super"]
type = null;Explod
triggerall = var(1) = 0; && prevstateno != 2005
triggerall = anim = 1049
trigger1 = time >= 0;) && (time <= 30)
anim = 2001
ID = 105
postype = front
bindtime = -1
removetime = 100
removeexplod = animtime = 0
sprpriority = -3
supermovetime = 24
ownpal = 1
removeongethit = 1
bind = p1
facing = ifelse(Facing = -1, -1, 1)
persistent = 0

[State 2002, Super BGWarning]
type = null;Explod
triggerall = var(1) = 0 ;&& prevstateno !=2005
trigger1 = time = 0
anim = 1514
postype = left
pos = 0,0
;under = 1
sprpriority  = -2
removetime = 30
supermove = 30
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 2002, Super Portrait]
type = Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2000
postype = back
pos = 0,0
sprpriority = 1
removetime = 24
supermove = 30
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 2002, x]
type = RemoveExplod
trigger1 = movecontact = 0
trigger1 = time = 24
ID = 1052

;[State 2002, Whiteout]
;type = Explod
;trigger1 = projhit(2002) = 1
;anim = 2999
;postype = front
;pos = 0,0
;ontop = 1
;removetime = 1
;supermove = 1
;removeongethit = 1
;bindtime = -1
;velocity  = 0,0

[State 1000, 1]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
trigger3 = AnimElem = 12
trigger4 = AnimElem = 16
trigger5 = AnimElem = 20
trigger6 = AnimElem = 5
trigger7 = AnimElem = 9
trigger8 = AnimElem = 13
trigger9 = AnimElem = 17
trigger10 = AnimElem = 21
value = s100, 1
channel = 5

[State 1000, 1]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 10
trigger3 = AnimElem = 14
trigger4 = AnimElem = 18
trigger5 = AnimElem = 22
trigger6 = AnimElem = 7
trigger7 = AnimElem = 11
trigger8 = AnimElem = 15
trigger9 = AnimElem = 19
trigger10 = AnimElem = 23
value = s100, 1
channel = 6


[State 2002, 0]
type = Projectile
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
trigger3 = AnimElem = 12
trigger4 = AnimElem = 16
trigger5 = AnimElem = 20
projanim = 1002
projpriority = 1
projid = 1000
projshadow = -1
offset = 30,-100
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,-50-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-3
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2002, 1]
type = Projectile
trigger1 = AnimElem = 5
trigger2 = AnimElem = 9
trigger3 = AnimElem = 13
trigger4 = AnimElem = 17
trigger5 = AnimElem = 21
projanim = 1002
projpriority = 1
projshadow = -1
offset = -30,-100
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,-50-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-3
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2002, 2]
type = Projectile
trigger1 = AnimElem = 6
trigger2 = AnimElem = 10
trigger3 = AnimElem = 14
trigger4 = AnimElem = 18
trigger5 = AnimElem = 22
projanim = 1002
projpriority = 1
projshadow = -1
offset = 15,-95
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,-50-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-3
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2002, 3]
type = Projectile
trigger1 = AnimElem = 7
trigger2 = AnimElem = 11
trigger3 = AnimElem = 15
trigger4 = AnimElem = 19
trigger5 = AnimElem = 23
projanim = 1002
projpriority = 1
projshadow = -1
offset = -15,-100
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,-50-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-3
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2002, 7]
type = ChangeState
triggerall = animtime = 0
trigger1 = Pos Y >= 0
value = 50
ctrl = 1

;==============================================
;----------------------------------------------
; Digivolve to Kyuubimon Start
[Statedef 2010]
type = S
physics = S
movetype= I
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
anim = 1060
sprpriority = 5

[State 2010, Cross]
type = Explod
trigger1 = time = 15
anim = 1061
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 3
removeongethit = 1
bindtime = -1

[State 2010]
type = Nothitby
trigger1 = time >= 15
value = SCA

[State 2010]
type = Statetypeset
trigger1 = time = 15
movetype = A

[State 2010]
type = PlaySnd
trigger1 = time = 18
value = s30,8
channel = 3

[State 2100, 7]
type = ChangeState
trigger1 = time = 19
value = 2011
ctrl = 0

;----------------------
; Kyuubimon
[Statedef 2011]
physics = N
movetype= A
juggle  = 0
poweradd= 0
facep2 = 1
ctrl = 0
velset = 0,0
sprpriority = 5

[State 0, Pause]
type = Pause
trigger1 = time = 1
time = 7
movetime = 7

[State 191, SuperBG]
type = Helper
trigger1 = time = 0
trigger1 = !numhelper(50000)
ID = 50000
stateno= 50000
name = "SUPERNORMAL"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 30
pausemovetime = 30
pos = 0,0

[State 2011, Hyperbg "Super"]
type = null;Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2001
ID = 105
postype = front
bindtime = -1
removetime = 400
removeexplod = animtime = 0
under = 1
sprpriority  = -20
supermovetime = 9999
ownpal = 1
removeongethit = 1
bind = p1
facing = ifelse(Facing = -1, -1, 1)
persistent = 0

[State 2011, Knockaway]
type = HitDef
triggerall = anim = 1060
trigger1 = animelem = 12
attr = S, HA
damage = 25, 0
getpower = 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3
pausetime = 8, 8
sparkxy = 0, -85
sparkno = s1510
guard.sparkno = s1515
hitsound = s1,4
guardsound = s2,0
ground.type = High
guard.velocity = -2
airguard.velocity = -2,-1
air.type = High
p2stateno = 2016
kill = 0

[state 2011, movetype]
type = statetypeset
trigger1 = time = 13
movetype = A

[State 2011, DragonwheelA]
type = HitDef
triggerall = p2statetype = A
triggerall = anim = 1070
triggerall = (time >= 100) && (time <= 174)
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 3 = 1
attr = S, HA
damage = 26, 2
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
ID = 1070
priority = 3
pausetime = 4, 6
sparkxy = 0, -85
sparkno = s1510
guard.sparkno = s1515
hitsound = s18000,0
guardsound = s2,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3, .1
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-1
air.hittime = 12
fall = 1
fall.recover = 0
down.hittime = 24
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 2011, DragonwheelG]
type = HitDef
triggerall = p2statetype != A
triggerall = anim = 1070
triggerall = (time >= 100) && (time <= 174)
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 3 = 1
attr = S, HA
damage = 26, 2
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
ID = 1070
priority = 3
pausetime = 4, 6
sparkxy = 0, -85
sparkno = -1
guard.sparkno = s1515
hitsound = -1
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -3,0
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-2.5
air.hittime = 12
fall = 1
fall.recover = 0
down.hittime = 24
snap = 65, 0
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 2011, Dragonwheel]
type = HitDef
triggerall = anim = 1070
triggerall = (time >= 175) && (time <= 180)
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 3 = 1
attr = S, HA
damage = 20, 4
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
ID = 1070
priority = 3
pausetime = 4, 6
sparkxy = 0, -85
sparkno = -1
guard.sparkno = s1515
hitsound = -1
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4,-12
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-12
air.hittime = 12
p2stateno = 651
fall = 1
fall.recover = 0
down.bounce = 1
snap = 65,0
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 2011, Playsnd]
type = Playsnd
triggerall = anim = 1060
trigger1 = movehit = 1
value = 5, 3
channel = 1

[State 2011, Playsnd]
type = Playsnd
triggerall = anim = 1070
trigger1 = movehit = 1
value = s18000, 3
channel = 1

[State 2011, Playsnd]
type = Playsnd
triggerall = anim = 1070
trigger1 = moveguarded = 1
value = s2, 0
channel = 1

[State 2011, KnockUp]
type = Explod
triggerall = anim = 1060
trigger1 = movehit = 1
anim = 1512
postype = P2
pos = 0,0
ontop = 1
removetime = -2
supermove = 1
removeongethit = 1
velocity  = 0,0

[State 2011, Hit FX]
type = Explod
triggerall = anim = 1070
trigger1 = movehit = 1
anim = 1511
postype = P2
pos = 0,-65
removetime = -2
supermove = 1
removeongethit = 1
bindtime = -1
velocity  = 0,0
sprpriority = 20

[State 2011, Whiteout]
type = Explod
triggerall = var(1) = 0
triggerall = anim = 1070
trigger1 = movehit = 1
anim = 2999
postype = front
pos = 0,0
removetime = 2
supermove = 1
removeongethit = 1
bindtime = -1
velocity  = 0,0
sprpriority = 19

[State 2011, Blackout]
type = Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2998
scale = 1,1
postype = Left
pos = 0,0
removetime = 3
bindtime = -1
under = 1
sprpriority  = -2
supermovetime = 2
persistent = 0

[State 2011, Digivolution]
type = Explod
trigger1 = time = 0
anim = 1068
postype = p1
scale = 1,1
pos = 0,-50
facing = ifelse(Facing = -1, -1, 1)
sprpriority = 10
removetime = 120
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1
bindtime = -1

[State 2011, SuperPause]
type = SuperPause
triggerall = var(1) = 0
trigger1 = time = 0
time = 120
anim = -1
sound = -1
move = 0
darken = 0
poweradd = -1000
unhittable = 1
sprpriority = 10
;persistent =

[State 2011]
type = PlaySnd
trigger1 = time = 1
value = s30,0
channel = 2

[State 2011]
type = Nothitby
trigger1 = time <= 120
value = SCA

[State 2011, SplitUp]
type = Explod
trigger1 = time = 9
anim = 1062
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 20
removeongethit = 1
bindtime = -1

[State 2011, ComeIn]
type = Explod
trigger1 = time = 28
anim = 1063
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 5
removeongethit = 1
bindtime = -1

[State 2011, Explod Egg]
type = Explod
trigger1 = time = 28
anim = 1066
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 4
removetime = 40
removeongethit = 1
bindtime = -1

[State 2011, SparkleAnim]
type = ChangeAnim
trigger1 = time = 33
value = 1067

[State 2100, Explod "bones"]
type = Explod
trigger1 = time = 28
anim = 1064
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 40
removeongethit = 1
bindtime = -1

[State 2011, Explod "bones"]
type = Explod
trigger1 = time = 72
anim = 1065
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
vel = 0, .1
removetime = 18
removeongethit = 1

[State 2011, AtkAnim]
type = ChangeAnim
trigger1 = time = 72
value = 1070

[State 2011, Dust]
type = Explod
triggerall = anim = 1060
trigger1 = time = 2
anim = 1516
postype = p1
scale = 1,1
pos = -20,8
sprpriority = 10
removetime = -2
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1

[State 2011, P2]
type = Explod
triggerall = anim = 1070
triggerall = animelemtime(11) >= 0
triggerall = animelemtime(14) <= 5
trigger1 = movehit = 1
anim = 1072
postype = P2
pos = 0, -50
bindtime = -1
facing = -1
ignorehitpause = 1
supermove = 1
sprpriority = -3
removetime = -2
ownpal = 1
persistent = 0

[State 2011, Kicking Dust]
type = Explod
triggerall = anim = 1070
trigger1 = time = 106
trigger2 = time = 114
trigger3 = time = 122
trigger4 = time = 130
trigger5 = time = 138
trigger6 = time = 146
trigger7 = time = 154
trigger8 = time = 162
trigger9 = time = 170
trigger10 = time = 178
anim = 1517
postype = p1
scale = 1,1
pos = -20,8
sprpriority = 10
removetime = -2
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1

[State 2011, SparkleAnim]
type = ChangeAnim
trigger1 = time = 180
value = 1071

[State 2011]
type = PlaySnd
trigger1 = time = 75
value = s30,1
channel = 3

[State 2011, VelGo]
type = Velset
trigger1 = time = 100
x = 12

[State 2011, VelStop]
type = Velset
trigger1 = time = 180
x = 0

[State 2011, PalFX1]
type = PalFX
trigger1 = Time = 180
value = 256,256,256
add = 128, 128, 128
time = 10

[State 2011, PalFX2]
type = PalFX
trigger1 = Time = 190
value = 256,256,256
add = 256, 256, 256
time = 20

[State 2011, 7]
type = ChangeState
trigger1 = time = 200
value = 2015
ctrl = 0

;----------------------
; Digivolve Kyuubimon Ends
[Statedef 2015]
physics = S
movetype= I
ctrl = 0
velset = 0,0
anim = 1069
sprpriority = 2

[State 2015, PalFX1]
type = PalFX
trigger1 = Time = 0
value = 256,256,256
add = 256, 256, 256
time = 10

[State 2015, PalFX3]
type = PalFX
trigger1 = Time = 10
value = 256,256,256
add = 128, 128, 128
time = 10

[State 2015, 7]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------
;Victim
[Statedef 2016]
type = S
movetype = H
physics = N
;facep2 = 1
ctrl = 0

;--- In Air
[State 2016, Anim1]
type = ChangeAnim2
trigger1 = time = 0
value = 5061
ctrl = 0

[State 2016, Vel]
type = velset
trigger1 = time = 0
x = -3
y = -6.5

[State 2016, Vel]
type = veladd
triggerall = anim = 5061
trigger1 = 1
y = .32

;--- Landing
[State 2016, Anim2]
type = ChangeAnim2
triggerall = anim = 5061
trigger1 = Pos Y >= 0 && Vel Y >= 0
value = 5110
ctrl = 0

[State 2016, Posset]
type = posset
trigger1 = anim = 5011
trigger2 = anim = 5210
trigger3 = anim = 5300
y = 0

[state 2016, Gamemakeanim]
type = gamemakeanim
trigger1 = anim = 5011
value = 61

[State 2016, Vel]
type = velset
trigger1 = Pos Y >= 0 && Vel Y >= 0
x = 0
y = 0

[State 2016, Statetype]
type = statetypeset
trigger1 = Pos Y >= 0 && Vel Y >= 0
physics = S
persistent = 1

;--- Get Up
[State 2016, Anim3]
type = ChangeAnim
triggerall = anim = 5110
trigger1 = animtime = 0
value = 5120

;--- Dazed
[State 2016, Anim4]
type = ChangeAnim
triggerall = anim = 5120
trigger1 = animtime = 0
value = 5300

[State 2016, 6]
type = CtrlSet
trigger1 = anim = 5002
trigger2 = anim = 5012
trigger3 = anim = 5022
value = 0

[State 2016, 7]
type = SelfState
trigger1 = time = 300
value = 0
ctrl = 1

;=================================================
;Renamon Cross Over Supers
;----------------------
;----------------------
; Gargomon Attempt
[Statedef 2600]
type = S
physics = S
movetype= I
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
anim = 2600
sprpriority = 5

[State 2011]
type = PlaySnd
trigger1 = time = 19
value = s30,0
channel = 2
;volume = -200

[State 2600]
type = Helper
trigger1 = time = 0
ID = 2610
stateno= 2610
name = "Gargomon"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermove = 9999
postype = Back
pos = 0,-70

;[State 2600,Camera Sit]
;type = Helper
;trigger1 = time = 0
;stateno = 2619
;helpertype = player
;keyctrl = 0
;ignorehitpause = 1
;postype = p1
;pos = 20,0
;bindtoparent = root,pos y

[State 2600, Cross]
type = Explod
trigger1 = time = 15
anim = 1061
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 3
removeongethit = 1
bindtime = -1

[State 2600]
type = Nothitby
trigger1 = time >= 15
value = SCA

[State 2600]
type = Statetypeset
trigger1 = time = 15
movetype = A

[State 2600, 7]
type = ChangeState
trigger1 = time = 19
value = 2601
ctrl = 0

;------------------------------------
;----------------------
; Gargomon Cross Over
[Statedef 2601]
physics = N
movetype= A
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 5

[State 191, SuperBG]
type = Helper
trigger1 = time = 0
trigger1 = !numhelper(50000)
ID = 50000
stateno= 50001
name = "SUPERNORMAL"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 30
pausemovetime = 30
pos = 0,0

[State 0, AssertSpecial]
type = AssertSpecial
triggerall = var(1) = 0
trigger1 = 1
flag = noBG
flag2 = noFG
;ignorehitpause =
;persistent =

[State 2601, 1]
type = Screenbound
triggerall = P2movetype = H
trigger1 = 1
value = 0

[State 2011, Hyperbg "Super"]
type = null;Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2002
ID = 105
postype = front
bindtime = -1
removetime = 300
removeexplod = animtime = 0
under = 1
sprpriority  = -20
supermovetime = 24
ownpal = 1
removeongethit = 1
bind = p1
facing = ifelse(Facing = -1, -1, 1)
persistent = 0

[State 2601, Knockaway]
type = HitDef
triggerall = anim = 2600
trigger1 = animelem = 10
attr = S, HA
damage = 25, 0
getpower = 0
animtype = Light
guardflag = MA
hitflag = MAF
priority = 3
pausetime = 8, 8
sparkxy = 0, -85
sparkno = -1
guard.sparkno = s1515
hitsound = s2600, 6
guardsound = 6,0
ground.type = High
guard.velocity = 5
airguard.velocity = -2,-1
air.type = High
p2stateno = 2016
kill = 0

[State 2011, DragonwheelA]
type = HitDef
triggerall = p2statetype = A
triggerall = anim = 1070
triggerall = (time >= 100) && (time <= 174)
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 3 = 1
attr = S, HA
damage = 26, 4
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
ID = 1070
priority = 3
pausetime = 4, 6
sparkxy = 0, -85
sparkno = -1
guard.sparkno = s1515
hitsound = s18000,0
guardsound = s2,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -3, .1
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-1
air.hittime = 12
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 2011, DragonwheelG]
type = HitDef
triggerall = p2statetype != A
triggerall = anim = 1070
triggerall = (time >= 100) && (time <= 174)
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 3 = 1
attr = S, HA
damage = 26, 4
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
ID = 1070
priority = 3
pausetime = 4, 6
sparkxy = 0, -85
sparkno = s1510
guard.sparkno = s1515
hitsound = -1
guardsound = s2,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -3,0
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-2.5
air.hittime = 12
snap = 65, 0
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 2011, Dragonwheel]
type = HitDef
triggerall = anim = 1070
triggerall = (time >= 175) && (time <= 180)
trigger1 = !MoveContact
trigger2 = MoveContact
trigger2 = Time % 3 = 1
attr = S, HA
damage = 20, 4
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
ID = 1070
priority = 3
pausetime = 4, 6
sparkxy = 0, -85
sparkno = s1510
guard.sparkno = s1515
hitsound = -1
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = -4,-12
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-12
air.hittime = 12
p2stateno = 651
fall = 1
fall.recover = 0
snap = 65,0
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5

[State 2011, Playsnd]
type = Playsnd
triggerall = anim = 1060
trigger1 = movehit = 1
value = 5, 3
channel = 1

[State 2011, Digivolution]
type = Explod
trigger1 = time = 0
anim = 1068
postype = p1
scale = 1,1
pos = 0,-100
facing = ifelse(Facing = -1, -1, 1)
sprpriority = 20
removetime = 120
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1
bindtime = -1

[State 2011, Playsnd]
type = Playsnd
triggerall = anim = 1070
trigger1 = movehit = 1
value = s18000, 3
channel = 1

[State 2011, KnockUp]
type = Explod
triggerall = anim = 1060
trigger1 = movehit = 1
anim = 1512
postype = P2
pos = 0,0
ontop = 1
removetime = -2
supermove = 1
removeongethit = 1
velocity  = 0,0

[State 2011, Hit FX]
type = Explod
triggerall = anim = 1070
trigger1 = movehit = 1
anim = 1511
postype = P2
pos = 0,-55
removetime = -2
supermove = 1
removeongethit = 1
bindtime = -1
velocity  = 0,0
sprpriority = 20

[State 2011, Whiteout]
type = Explod
triggerall = anim = 1070
trigger1 = movehit = 1
anim = 2999
postype = front
pos = 0,0
removetime = 2
supermove = 1
removeongethit = 1
bindtime = -1
velocity  = 0,0
sprpriority = 19

[State 2011, Blackout]
type = Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2998
scale = 1,1
postype = Left
pos = 0,0
removetime = 3
bindtime = -1
under = 1
sprpriority  = -2
supermovetime = 2
persistent = 0

[State 2011, SuperPause]
type = SuperPause
triggerall = var(1) = 0
trigger1 = time = 0
time = 60
anim = -1
sound = -1
poweradd = -2000
move = 0
darken = 0
unhittable = 1
sprpriority = 10
;persistent =

[State 2011, SplitUp]
type = Explod
trigger1 = time = 9
anim = 1062
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 20
removeongethit = 1
bindtime = -1

[State 2011]
type = Nothitby
trigger1 = time <= 120
value = SCA

[State 2011, ComeIn]
type = Explod
trigger1 = time = 28
anim = 1063
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 5
removeongethit = 1
bindtime = -1

[State 2011, Explod Egg]
type = Explod
trigger1 = time = 28
anim = 1066
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 4
removetime = 40
removeongethit = 1
bindtime = -1

[State 2011, SparkleAnim]
type = ChangeAnim
trigger1 = time = 33
value = 1067

[State 2100, Explod "bones"]
type = Explod
trigger1 = time = 28
anim = 1064
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
removetime = 40
removeongethit = 1
bindtime = -1

[State 2011, Explod "bones"]
type = Explod
trigger1 = time = 72
anim = 1065
postype = p1
scale = 1,1
pos = 0,0
sprpriority = 6
vel = 0, .1
removetime = 18
removeongethit = 1

[State 2011, AtkAnim]
type = ChangeAnim
trigger1 = time = 72
value = 1070

[State 2011, Dust]
type = Explod
triggerall = anim = 1060
trigger1 = time = 2
anim = 1516
postype = p1
scale = 1,1
pos = -20,8
sprpriority = 10
removetime = -2
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1

[State 2011, Kicking Dust]
type = Explod
triggerall = anim = 1070
trigger1 = time = 106
trigger2 = time = 114
trigger3 = time = 122
trigger4 = time = 130
trigger5 = time = 138
trigger6 = time = 146
trigger7 = time = 154
trigger8 = time = 162
trigger9 = time = 170
trigger10 = time = 178
anim = 1517
postype = p1
scale = 1,1
pos = -20,8
sprpriority = 10
removetime = -2
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1

[State 2011, SparkleAnim]
type = ChangeAnim
trigger1 = time = 180
value = 1071

[State 2011]
type = PlaySnd
trigger1 = time = 75
value = s30,1
channel = 3
;volume = -100

[State 2011, VelGo]
type = Velset
trigger1 = time = 100
x = 12

[State 2011, VelStop]
type = Velset
trigger1 = time = 180
x = 0

[State 2011, PalFX1]
type = PalFX
trigger1 = Time = 180
value = 256,256,256
add = 128, 128, 128
time = 10

[State 2011, PalFX2]
type = PalFX
trigger1 = Time = 190
value = 256,256,256
add = 256, 256, 256
time = 20

[State 2011, 7]
type = ChangeState
trigger1 = time = 200
value = 2015
ctrl = 0

;----------------------
; Digivolve Kyuubimon Ends
[Statedef 2602]
physics = S
movetype= I
ctrl = 0
velset = 0,0
anim = 1069
sprpriority = 2

[State 2602, PalFX1]
type = PalFX
trigger1 = Time = 0
value = 256,256,256
add = 256, 256, 256
time = 10

[State 2602, PalFX3]
type = PalFX
trigger1 = Time = 10
value = 256,256,256
add = 128, 128, 128
time = 10

[State 2602, 7]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------
;==========Gargomon Himself
;---------------------------------------------------
[statedef 2610]
anim = 2508
movetype = I
velset = 5,0
sprpriority = 10

[state 2610]
type = velset
trigger1 = time = 0
x = Parentdist x/19
y = 2

[state 15006]
type = velAdd
trigger1 = 1
y = .13

[State 2611, ]
type = Changeanim
trigger1 = time = 19
value = 2517

[State 2011, Terriermon]
type = PlaySnd
trigger1 = time = 19
value = s2600,0
channel = 5
volume = 400

[state 2610]
type = changestate
trigger1 = time = 20
;trigger1 = animtime = 0
value = 2611

[State 2600]
type = Nothitby
trigger1 = 1
value = SCA

[state 2610,PlayerHit]
type = changestate
trigger1 = root,movetype = H
;trigger1 = animtime = 0
value = 2615

;-------------------------------
[statedef 2611]
movetype = A
velset = 0,0
sprpriority = 10

[State 2011, Terriermon]
type = PlaySnd
trigger1 = time = 1
value = s2600,1
channel = 5
volume = 400

[State 2600]
type = Nothitby
trigger1 = 1
value = SCA

[State 2011, Terriermon]
type = PlaySnd
trigger1 = time = 30
value = s2600,2
channel = 5
volume = 400

[State 2011, Terrier Blackout]
type = Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2998
scale = 1,1
postype = Left
pos = 0,0
removetime = 4
bindtime = -1
under = 1
sprpriority  = -2
supermovetime = 2
persistent = 0

[State 2011, Terrier SuperPause]
type = SuperPause
trigger1 = time = 1
time = 120
anim = -1
sound = -1
move = 0
darken = 0
unhittable = 1
sprpriority = 10
;persistent =

[State 2011, Terrier Digivolution]
type = Explod
trigger1 = time = 1
anim = 1068
scale = 1,1
pos = 0,-40
facing = ifelse(Facing = -1, -1, 1)
sprpriority = 20
removetime = 120
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1
bindtime = -1

[State 2011, Shoot]
type = HitDef
trigger1 = Animelem = 2
attr = S, HA
damage = 25, 0
getpower = 0
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 3
pausetime = 4, 6
sparkxy = 0, -45-random%20
sparkno = s1510
guard.sparkno = s1515
hitsound = s2600,6
guardsound = s2,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 12
ground.velocity = 0, .1
airguard.velocity = -2,-1
air.type = High
air.velocity = -1.4,-1
air.hittime = 12

[state 2611, Dampener]
type = attackmulset
trigger1 = numtarget >= 1
value = 0.9 ** target, gethitvar(hitcount);0.95 ** target, gethitvar(hitcount)
persistent = 0

[State 2611, Shadow]
type = null
trigger1 = time = 60
anim = 82
scale = .5,1
pos = 0,0
under = 1
sprpriority = -1
removetime = 180
removeongethit = 1
bindtime = -1

[State 2611, Bullets]
type = Explod
trigger1 = time >= 100
trigger1 = time <= 180
anim = 2604
scale = 1,1
pos = 45,-45-random%20
facing = ifelse(Facing = -1, -1, 1)
ontop = 1
sprpriority = 20
removetime = -2
supermovetime = 9999
movetime = 9999
pausetime = 9999
removeongethit = 1
bindtime = -1

[State 2011, ComeIn]
type = Explod
trigger1 = time = 3
anim = 1063
scale = 1,1
pos = 0,0
sprpriority = 11
removetime = 5
removeongethit = 1
bindtime = -1

[State 2011, Explod Egg]
type = Explod
trigger1 = time = 3
anim = 1066
scale = 1,1
pos = 0,0
sprpriority = 4
removetime = 40
removeongethit = 1
bindtime = -1

[State 2611, Sparkle]
type = Changeanim
trigger1 = time = 8
value = 2601

[State 2100, Explod "bones"]
type = Explod
trigger1 = time = 3
anim = 1064
scale = 1,1
pos = 0,0
sprpriority = 12
removetime = 52
removeongethit = 1
bindtime = -1

[State 2011, Explod "bones"]
type = Explod
trigger1 = time = 57
anim = 1065
scale = 1,1
pos = 0,0
sprpriority = 12
vel = 0, .1
removetime = 18
removeongethit = 1

[State 2611, 2]
type = Changeanim
trigger1 = time = 57
value = 2602

[State 2611, 3]
type = Changeanim
trigger1 = time = 100
value = 2603

[State 2611, 3]
type = Changeanim
trigger1 = time = 180
value = 2606

[State 2611, Pos]
type = posset
trigger1 = time = 20
y = 0

[State 2601, 1]
type = Screenbound
triggerall = P2movetype = H
trigger1 = 1
value = 1

[state 2610,7]
type = changestate
trigger1 = time = 220
value = 2615

;---------------------------------------
[statedef 2615]
anim = 2516
movetype = I

[state 15002, WinKO]
type = changestate
triggerall = time = 0
trigger1 = root,winKO
value = 15004

[State 2611]
type = velset
trigger1 = time = 1
x = -8
y = -10

[State 2600]
type = Nothitby
trigger1 = 1
value = SCA

[State 2611, KnockUp]
type = Explod
triggerall = time = 0
trigger1 = Prevstateno = 2610
trigger2 = Prevstateno = 2611
anim = 1512
pos = 0,0
ontop = 1
removetime = -2
supermove = 1
removeongethit = 1
velocity  = 0,0

[state 2615, modify]
type = modifyexplod
trigger1 = time = 0
ID = 15002
removetime = 1

[state 2615]
type = destroyself
trigger1 = time = 35

;---------------------------------------
[statedef 2619]
anim = 999
velset = 0,0
movetype = I

[state 2619]
type = width
trigger1 = 1
value = 0

[State 2600]
type = Nothitby
trigger1 = 1
value = SCA

[state 2619]
type = Posset
trigger1 = 1
x = 0
y = 0

[state 2619]
type = destroyself
trigger1 = time = 190

;------------------------------------
;----------------------
; Guilmon Cross Over Starter
[Statedef 2650]
physics = N
movetype= A
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
anim = 1047
sprpriority = 1

[State 15000]
type = Helper
trigger1 = time = 0
ID = 2660
stateno= 2660
name = "GuilmonCrossOver"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
ownpal = 1
postype = Back
pos = 0,-70

[State 2650, 0]
type = Statetypeset
trigger1 = time = 0
statetype = S

[State 2650, 1]
type = Statetypeset
trigger1 = time = 24
statetype = A

[State 2650, screenbound]
type = Screenbound
trigger1 = time = 0
time = 46
pos = 9999, -9999
darken = 0
unhittable = 0
value = 1

[State 2650, Pal]
type = PalFX
trigger1 = animelemtime(1) = 0
trigger2 = animelemtime(1) = 8
trigger3 = animelemtime(1) = 16
time = 2
add = 256,256,256
mul = 256,256,256
ownpal = 1

[State 2650, 1]
type = Velset
trigger1 = time = 28
x = -14;-6.5
y = -6.5;-1

[state 2650, 2]
type = Veladd
trigger1 = time > 28
y = .52

[State 2650, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 2651
ctrl = 0

;----------------------
; Guilmon Cross Over
[Statedef 2651]
type    = A
movetype= A
juggle  = 1
poweradd= 0
ctrl = 0
velset = -1,-1
anim = 1049
sprpriority = 2

[State 2651, 1]
type = Screenbound
trigger1 = 1
value = 1

[State 2651, 4]
type = velset
trigger1 = AnimElem = 3
x = -1
y = -2

[State 2651, 5]
type = Statetypeset
trigger1 = time = 0
physics = N

[State 2651, 5]
type = Statetypeset
trigger1 = AnimElem = 24
physics = A

[State 2651, assertspecial]
type = assertspecial
triggerall = var(1) = 0
triggerall = anim = 1049
trigger1 = (time >= 0) && (time <= 30)
flag = noBG
flag2 = noFG
flag3 = nobardisplay
ignorehitpause = 1

[state 2651, hitsound]
type = Playsnd
trigger1 = projhit(2002) = 1
value = s30,7
channel = 1
persistent = 1

[state 2651, hitsound]
type = Playsnd
trigger1 = projguarded(2002) = 1
value = s2,0
channel = 1
persistent = 1

[State 2651, 1]
type = SuperPause
triggerall = var(1) = 0
trigger1 = time = 0
anim = s1513
time = 40
pos = 18, -76
darken = 1
unhittable = 1
sound = s2000
poweradd= -2000

[State 1000, 1]
type = PlaySnd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
trigger3 = AnimElem = 12
trigger4 = AnimElem = 16
trigger5 = AnimElem = 20
trigger6 = AnimElem = 5
trigger7 = AnimElem = 9
trigger8 = AnimElem = 13
trigger9 = AnimElem = 17
trigger10 = AnimElem = 21
value = s100, 1
channel = 5

[State 1000, 1]
type = PlaySnd
trigger1 = AnimElem = 6
trigger2 = AnimElem = 10
trigger3 = AnimElem = 14
trigger4 = AnimElem = 18
trigger5 = AnimElem = 22
trigger6 = AnimElem = 7
trigger7 = AnimElem = 11
trigger8 = AnimElem = 15
trigger9 = AnimElem = 19
trigger10 = AnimElem = 23
value = s100, 1
channel = 6

[State 2661, P2]
type = Explod
trigger1 = projhit(2703) = 1
anim = 2704
postype = P2
pos = 0, -20
bindtime = -1
facing = -1
ignorehitpause = 1
supermove = 1
sprpriority = 0
removetime = -2
ownpal = 1
persistent = 0

[State 191, Super]
type = Helper
trigger1 = time = 0
trigger1 = var(1)=0
trigger1 = numhelper(50000)=0
ID = 50000
stateno= 50001
name = "SUPERNORMAL"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 40
pausemovetime = 40
pos = 0,0

[State 2651, Hyperbg "Super"]
type = null;Explod
triggerall = var(1) = 0
trigger1 = time = 0;) && (time <= 30)
anim = 2002
ID = 105
postype = front
bindtime = -1
removetime = 100
removeexplod = animtime = 0
sprpriority = -20
supermovetime = 24
ownpal = 1
removeongethit = 1
bind = p1
facing = ifelse(Facing = -1, -1, 1)
persistent = 0

[State 2651, Super BGWarning]
type = null;Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 1514
postype = left
pos = 0,0
;under = 1
sprpriority  = -2
removetime = 40
supermove = 30
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 2651, Super Ren]
type = Explod
trigger1 = time = 0
anim = 2004
postype = back
pos = 0,120
sprpriority = 20
removetime = 40
supermove = 30
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 2651, Super Guil]
type = Explod
trigger1 = time = 0
anim = 2005
postype = back
pos = 0,120
sprpriority = 20
removetime = 40
supermove = 30
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 2651, x]
type = RemoveExplod
trigger1 = movecontact = 0
trigger1 = time = 24
ID = 1052

;[State 2651, Whiteout]
;type = Explod
;trigger1 = projhit(2002) = 1
;anim = 2999
;postype = front
;pos = 0,0
;ontop = 1
;removetime = 1
;supermove = 1
;removeongethit = 1
;bindtime = -1
;velocity  = 0,0

[State 2651, 0]
type = Projectile
trigger1 = AnimElem = 4
trigger2 = AnimElem = 8
trigger3 = AnimElem = 12
trigger4 = AnimElem = 16
trigger5 = AnimElem = 20
projanim = 1002
projpriority = 1
projshadow = -1
offset = 30,-100
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,0-random%20
guard.sparkno = s1515
hitsound = -1
guard.sound=-1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-1
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2651, 1]
type = Projectile
trigger1 = AnimElem = 5
trigger2 = AnimElem = 9
trigger3 = AnimElem = 13
trigger4 = AnimElem = 17
trigger5 = AnimElem = 21
projanim = 1002
projpriority = 1
projshadow = -1
offset = -30,-100
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,0-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-1
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2651, 2]
type = Projectile
trigger1 = AnimElem = 6
trigger2 = AnimElem = 10
trigger3 = AnimElem = 14
trigger4 = AnimElem = 18
trigger5 = AnimElem = 22
projanim = 1002
projpriority = 1
projshadow = -1
offset = 15,-95
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,0-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-1
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2651, 3]
type = Projectile
trigger1 = AnimElem = 7
trigger2 = AnimElem = 11
trigger3 = AnimElem = 15
trigger4 = AnimElem = 19
trigger5 = AnimElem = 23
projanim = 1002
projpriority = 1
projshadow = -1
offset = -15,-100
ID = 2002
velocity = 30,20
attr = A, HP
damage = 25,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,0-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-1
air.hittime = 12
projremovetime = 99
fall = 1
fall.recover = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2651, 7]
type = ChangeState
triggerall = animtime = 0
trigger1 = Pos Y >= 0
value = 50
ctrl = 1

;---------------------------------------------------
;==========Guilmon Himself
;---------------------------------------------------
[statedef 2660]
anim = 2900
movetype = I
velset = 5,7
sprpriority = 5

[State 2650, sound]
type = Playsnd
trigger1 = time = 0
value = 2700, 0
channel = 6

[state 2660]
type = velset
trigger1 = pos y >= 0
x = 0
y = 0

[State 2660, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0

[state 2660]
type = changestate
trigger1 = pos y >= 0
;trigger1 = animtime = 0
value = 2661

[State 2660]
type = Nothitby
trigger1 = 1
value = SCA

[State 2650, Stop Sound]
type = StopSnd
trigger1 = root,movetype = H
channel = 6

[state 2660,PlayerHit]
type = changestate
trigger1 = root,movetype = H
;trigger1 = animtime = 0
value = 2665

;-------------------------------
[statedef 2661]
anim = 2901
movetype = A
velset = 0,0
sprpriority = 10

[State 2661, Stop Sound]
type = StopSnd
trigger1 = time = 60
channel = 6

[State 2651, 1]
type = Screenbound
trigger1 = 1
value = 0

[State 2661]
type = Nothitby
trigger1 = 1
value = SCA

[State 2661, Shadow]
type = null
trigger1 = time = 0
anim = 82
scale = 1,1
pos = 0,0
under = 1
sprpriority = 6
removetime = 89
removeongethit = 1
bindtime = -1

[State 2661, 0]
type = Projectile
triggerall = anim = 2901
trigger1 = AnimElem = 9
trigger2 = AnimElem = 13
trigger3 = AnimElem = 17
trigger4 = AnimElem = 21
projanim = 2903
projpriority = 20
projshadow = -1
offset = 48,-42
ID = 2903
velocity = 20,0
attr = A, HP
damage = 25,4
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

[state 2611, Dampener]
type = attackmulset
trigger1 = numtarget >= 1
value = 0.9 ** target, gethitvar(hitcount);0.95 ** target, gethitvar(hitcount)
persistent = 0

[state 2661, hitsound]
type = Playsnd
trigger1 = AnimElem = 9
trigger2 = AnimElem = 13
trigger3 = AnimElem = 17
trigger4 = AnimElem = 21
value = s18000,2
channel = 7
persistent = 1

[state 2661, hitsound]
type = Playsnd
trigger1 = projhit(2903) = 1
value = s18000,3
channel = 7
persistent = 1

[state 2661, hitsound]
type = Playsnd
trigger1 = projhit(2903) = 1
value = s2,0
channel = 7
persistent = 1

[state 2661,PlayerHit]
type = changestate
triggerall = time <= 40
trigger1 = root,movetype = H
;trigger1 = animtime = 0
value = 2665

[state 2661,7]
type = changestate
trigger1 = time = 100
value = 2665

;---------------------------------------
[statedef 2665]
anim = 2902
movetype = I

[State 2665, Stop Sound]
type = StopSnd
trigger1 = time = 0
channel = 6

[state 2665, turn]
type = turn
trigger1 = time = 0

[State 2665]
type = velset
trigger1 = time = 1
x = 8
y = -10

[State 2665]
type = Nothitby
trigger1 = 1
value = SCA

[State 2665, KnockUp]
type = Explod
triggerall = time = 0
trigger1 = Prevstateno = 2610
trigger2 = Prevstateno = 2611
anim = 1512
pos = 0,0
ontop = 1
removetime = -2
supermove = 1
removeongethit = 1
velocity  = 0,0

[state 2665, modify]
type = modifyexplod
trigger1 = time = 0
ID = 15002
removetime = 1

[state 2665]
type = destroyself
trigger1 = time = 35

;-------------------
;Wisteria Punch Super
[Statedef 2700]
physics = N
movetype= A
type = S
poweradd= 0
ctrl = 0
velset = 0,0
anim = 2700
sprpriority = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 34
value = S1000,2


[State 2002, 1]
type = SuperPause
triggerall = var(1) = 0
trigger1 = time = 0
anim = s1513
time = 30
pos = 4, -100
darken = 1
unhittable = 1
sound = s2000
poweradd= -1000
movetime = 30

[State 100, ps]
type = PlaySnd
trigger1 = time = 34
value = s100,2
channel = 1

[State 2002, Super Portrait]
type = Explod
triggerall = var(1) = 0
trigger1 = time = 0
anim = 2000
postype = back
pos = 0,0
sprpriority = -5
removetime = 30
supermovetime = 30
removeongethit = 1
bindtime = -1
velocity  = 0,0

[State 191, SuperBG]
type = Helper
trigger1 = time = 0
trigger1 = var(1) = 0
trigger1 = !numhelper(50000)
ID = 50000
stateno= 50000
name = "SUPERNORMAL"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 40
pausemovetime = 40
pos = 0,0

[State 0, Explod]
type = Explod
trigger1 = time = 34
anim = 2701
ID = 2701
pos = 0,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
scale = 1,1
sprpriority = 2
ownpal = 1
removeongethit = 1

[State 100, Explod]
type = Explod
trigger1 = time > 34
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
sprpriority = -1

[State 100, Explod]
type = Explod
trigger1 = time > 34
trigger1 = (time % 4) = 0
scale = const(size.xscale)
ID = 703
anim = 703
postype = p1
pos = -20, -40
random = 20,100
bindtime = 1
removetime = -2
vel = -2.8, 0
ownpal = 1
random = 20, 60
sprpriority = 2

[State 0, VelSet]
type = VelSet
trigger1 = time = 34
x = 9

[State 0, ChangeState]
type = ChangeState
trigger1 = p2bodydist X <= 60
trigger1 = time >= 37
value = 2710

[State 0, ChangeState]
type = ChangeState
trigger1 = time = 57
value = 2705

[Statedef 2705]
physics = N
movetype= A
type = S
anim = 2705

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 2701

[State 0, VelMul]
type = VelMul
trigger1 = gametime%2=1
x = .85


[State 0, VelMul]
type = Velset
trigger1 = animelem = 8
x = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1


[Statedef 2710]
physics = N
movetype= A
type = S
anim = 2710

[State 1012, 1]
type = HitDef
trigger1 = time = 0
attr = S, SP
damage = 65, 8
animtype = Heavy
guardflag = MA
hitflag = MAF
priority = 2
pausetime = 5, 6
sparkno = s1510
guard.sparkno = s1515
sparkxy = -20, -80
hitsound = s1,4
hitonce = 1
yaccel = .52
guardsound = s2,0
ground.type = High
ground.slidetime = 7
ground.hittime  = 17
ground.velocity = -6,-2
airguard.velocity = -6,-2
air.type = Low
air.velocity = -6,-2
air.hittime = 20
id = 2700
fall = 1
fall.recover = 0
palfx.time = 25
palfx.mul = 77, 249, 255 ;(int)
palfx.add = 182, 70, 100 ;(int)
palfx.sinadd= 125,125,125,5
kill = 0
guard.kill=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1000,3



[State 3350, Bind]
type=targetbind
trigger1 = movehit && numtarget(2700)
trigger1 = animelem = 7,<0
ID = 2700
pos = 64,0
ignorehitpause = 1

[State 3350, P2 State]
type=targetstate
trigger1 = movehit && numtarget(2700)
trigger1 = !(target,hitshakeover)
ID = 2700
value = 2720
ignorehitpause = 1
[State 3350, P1 State]
type=changestate
trigger1 = movehit && numtarget(2700)
value = 2711



;[State 0, Explod]
;type = Explod
;trigger1 = animelem = 2
;anim = 2702
;ID = 2702
;pos = 0,0
;postype = p1  ;p2,front,back,left,right
;bindtime = -1
;removetime = -1
;sprpriority = 2
;ownpal = 1
;removeongethit = 1

;[State 0, RemoveExplod]
;type = RemoveExplod
;trigger1 = animelem = 8
;id = 2702

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 2701

[State 0, VelMul]
type = VelMul
trigger1 = gametime%2=1
x = .85


[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

[Statedef 2711]
physics = N
movetype= A
type = S
anim = 2711
velset = 0,0

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6
statetype = A

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S100,2

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 12
trigger2 = AnimElem = 14
trigger3 = AnimElem = 16
trigger4 = AnimElem = 18
trigger5 = AnimElem = 20
trigger6 = AnimElem = 22
trigger7 = AnimElem = 24
trigger8 = animelem = 27
value = S100,1
channel = 5

[State 0, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 13
trigger2 = AnimElem = 15
trigger3 = AnimElem = 17
trigger4 = AnimElem = 19
trigger5 = AnimElem = 21
trigger6 = AnimElem = 23
trigger7 = AnimElem = 25
value = S100,1
channel = 6

[State 0, PlaySnd]
type = PlaySnd
trigger1 = projhit(2700) = 1
value = S30,7
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = projguarded(2700) = 1
value = S2,0
channel = 1

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 5
y = -5

[State 0, Width]
type= Width
trigger1 = animelem = 6,>=1 && animelem = 28,<0
edge = 84, 0


[State 0, VelAdd]
type = VelAdd
trigger1 = animelem = 6,>=1 && animelem = 9,<0
trigger2 = animelem = 28,>=0
y = .45

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 9
x = 0
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 28
x = -4
y = -6

[State 2002, 0]
type = Projectile
trigger1 = AnimElem = 13,=2
trigger2 = AnimElem = 15,=2
trigger3 = AnimElem = 17,=2
trigger4 = AnimElem = 19,=2
trigger5 = AnimElem = 21,=2
trigger6 = AnimElem = 23,=2
trigger7 = AnimElem = 25,=2
trigger8 = animelem = 27,=2
trigger9 = AnimElem = 12,=2
trigger10 = AnimElem = 14,=2
trigger11 = AnimElem = 16,=2
trigger12 = AnimElem = 18,=2
trigger13 = AnimElem = 20,=2
trigger14 = AnimElem = 22,=2
trigger15 = AnimElem = 24,=2
trigger16 = animelem = 27
projanim = 2715
projpriority = 2
projid = 1000
projshadow = -1
offset = 15,-100
ID = 2700
velocity = 20,20
attr = A, HP
damage = 15,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,0-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-3
air.hittime = 12
projremovetime = 99
air.fall = 1
air.fall.recover = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 2002, 1]
type = Projectile
trigger1 = AnimElem = 13
trigger2 = AnimElem = 15
trigger3 = AnimElem = 17
trigger4 = AnimElem = 19
trigger5 = AnimElem = 21
trigger6 = AnimElem = 23
trigger7 = AnimElem = 25
trigger8 = animelem = 27
trigger9 = AnimElem = 12
trigger10 = AnimElem = 14
trigger11 = AnimElem = 16
trigger12 = AnimElem = 18
trigger13 = AnimElem = 20
trigger14 = AnimElem = 22
trigger15 = AnimElem = 24
trigger16 = animelem = 27
projanim = 2715
projpriority = 2
projshadow = -1
offset = -15,-100
ID = 2700
velocity = 20,20
attr = A, HP
damage = 15,2
getpower = 0
animtype = Medium
guardflag = MA
hitflag = MAFPD
pausetime = 2,0
sparkno = s1511
sparkxy = 0,0-random%20
guard.sparkno = s1515
hitsound = -1
ground.slidetime = 12
ground.hittime  = 10
ground.velocity = -3
airguard.velocity = -2,-1
air.type = Low
air.velocity = 0,-3
air.hittime = 12
projremovetime = 99
air.fall = 1
air.fall.recover = 0
down.velocity = 0, 0
down.cornerpush.veloff = 0
afterimage.time = -1
afterimage.length = 5
afterimage.palbright = 0,0,0
afterimage.palcontrast = 0,0,250
afterimage.paladd =  -30,-30,-30
afterimage.palmul = .9,.9,.9
afterimage.timegap = 1
afterimage.framegap = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = animelem = 2
id = 2702

[State 0, ChangeState]
type = ChangeState
trigger1 = animelem = 27,>=0
trigger1 = pos Y >=0 && vel Y>=0
value= 2712

[Statedef 2712]
physics = N
movetype= A
type = S
anim = 2712
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 52, ps]
type = PlaySnd
trigger1 = time = 0
value = s0,7
volume = -30

[State 0, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value= 0
ctrl = 1
[Statedef 2720]
type=A
movetype=H
physics=N
velset=0,0

[State 3370, Anim]
type=changeanim
trigger1= 1
value=5030

[State 3370, End]
type=changestate
trigger1= hitshakeover
value=2721


[Statedef 2721]
type=A
movetype=H
physics=N
velset=0,0

[State 3371, Vel]
type=veladd
trigger1= 1
y= gethitvar(yaccel)
[State 3371, Vel]
type=hitvelset
trigger1= !time
x=1
y=1

[State 3371, Anim]
type=changeanim
trigger1= anim=5030 && !animtime
value=5050

[State 3371, End]
type=changestate
trigger1 = vel y>0 && pos y>=25
value=2722


[Statedef 2722]
type=L
movetype=H
physics=N
velset=0,0

[State 3372, Pos]
type=posset
trigger1=1
y=0

[State 3372, Anim]
type=changeanim
trigger1= !time
value=5100
[State 3372, Anim]
type=changeanim
trigger1= anim=5100 && !animtime
value=5170
[State 3372, Anim]
type=changeanim
trigger1= anim=5170 && !animtime
trigger2= time=16
value=5110

[State 3372, FX]
type=playsnd
trigger1= !time
value=f7,0
[State 3372, FX]
type=explod
trigger1= !time
anim=f60
postype=p1
pos=0,0
sprpriority=-3

[State 3372, End]
type=selfstate
trigger1= time>=42
value= ifelse(alive, 5120, 5150)

;------------------------------------
;----------------------------------------------
; Digivolve to Sakuyamon Start
[Statedef 4500]
type = S
physics = S
movetype= A
juggle  = 0
ctrl = 0
velset = 5,0
anim = 4500
sprpriority = 5

[State 4500, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, HT
hitflag = M-          ;Affect only ground people who are not being hit
priority = 1, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1         ;No spark
sparkxy = 40, -90
hitsound = s3,0
p1facing = 1
p2facing = 1          ;Force p2 to face KFM
p1stateno = 4501       ;On success, KFM changes to state 810
p2stateno = 4505      ;If hit, p2 changes to state 820 in KFM's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down
numhits = 0
kill = 0

[State 4500, 1]
type = SuperPause
trigger1 = time = 1
anim = s1513
time = 20
pos = 1, -101
darken = 1
unhittable = 1
sound = s2000, 0
channel = 1
poweradd= -3000

[State 4500]
type = Nothitby
trigger1 = time >= 26
value = SCA

[State 4500, 7]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;----------------------------------------------
; Biomerge to Sakuyamon
;------------------------------------
[Statedef 4501]
type = S
physics = S
movetype= I
juggle  = 0
poweradd= 0
ctrl = 0
velset = 0,0
sprpriority = 5

[State 15000]
type = VarAdd
trigger1 = time = 0
v = 46
value = 1

[State 15000]
type = VarSet
trigger1 = anim = 4504
trigger1 = animtime = 0
v = 46
value = 0

[State 191, SuperBG]
type = Helper
trigger1 = time = 0
trigger1 = var(1) = 0
trigger1 = !numhelper(50000)
ID = 50000
stateno= 50000
name = "SUPERNORMAL"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 40
pausemovetime = 40
pos = 0,0
persistent = 0

[State 806, AssertSpecial]
type = Assertspecial
trigger1 = time <= 700
flag = timerfreeze
flag2 = nobardisplay
flag3 = noBG
flag4 = noFG

[State 4501, Rika]
type = Helper
trigger1 = time = 0
ID = 4509
stateno= 4509
name = "Saku-Rika"
helpertype = normal
keyctrl = 0
ignorehitpause = 1
supermovetime = 9999
ontop = 1
pos = -250,5

[state 4501,0]  ;Turn
type = changeanim
trigger1 = time = 0
value = 4501

[State 1501, x]
type = PalFX
trigger1 = Time = 165
value = 256,256,256
add = 110, 110, 110
time = 15

[State 1501, x]
type = PalFX
trigger1 = Time = 180
value = 256,256,256
add = 165, 165, 165
time = 15

[State 1501, x]
type = PalFX
trigger1 = Time = 195
value = 256,256,256
add = 210, 210, 210
time = 15

[State 1501, x]
type = PalFX
trigger1 = Time = 210
value = 256,256,256
add = 255, 255, 255
time = 40

[State 1501, x]
type = PalFX
trigger1 = Time = 250
value = 256,256,256
add = 210, 210, 210
time = 15

[State 1501, x]
type = PalFX
trigger1 = Time = 265
value = 256,256,256
add = 165, 165, 165
time = 15

[State 1501, x]
type = PalFX
trigger1 = Time = 280
value = 256,256,256
add = 110, 110, 110
time = 15

[state 4501,1]  ;Naked
type = changeanim
triggerall = anim = 4501
trigger1 = time = 230
value = 4503

[state 4501,2]
type = changeanim
triggerall = anim = 4503
trigger1 = time = 400
value = 4504

[State -1, Posset]
type = PosSet
trigger1 = time = 0
postype = front
x = 0

[State -1, Bind]
type = TargetBind
trigger1 = time = 0
pos = 60, -1

[State 4501, After]
type = Afterimage
trigger1 = time = 0
time = 80
palcolor = 256
palinvertall = 0
palbright = 0,0,0
palcontrast = 26,142,255
palpostbright = 0,0,0
framegap = 5
;paladd = 26,142,255

[State 4501, 1]
type = SuperPause
trigger1 = time = 0
anim = -1 ;s1513
time = 100 ;20
pos = 1, -101
darken = 1
unhittable = 1
sound = s2000, 0
channel = 1
poweradd= -3000

[State 4501, Ground Glyph]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(12) = 0
anim = 4511
scale = 1,1
postype = p1
pos = 0,-3
sprpriority = 1
ownpal = 1
trans = addalpha
alpha = 128
removetime = 224

[State 4501, Ground Glyph]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(12) = 0
anim = 4511
scale = 1,1
postype = p1
pos = 0,0
sprpriority = -1
ownpal = 1
trans = addalpha
alpha = 64
removetime = 224

[State 4501, Hit]
type = Explod
trigger1 = time = 4
anim = 1510
postype = p1
scale = 1,1
pos = 60,-30
sprpriority = 6
removetime = -2
bindtime = -1

;=====================================
;==================================
[State 1501, x]
type = PalFX
triggerall = anim = 4504
trigger1 = animelemtime(28) = 70
trigger2 = animelemtime(28) = 76
trigger3 = animelemtime(28) = 86
trigger4 = animelemtime(28) = 94
trigger5 = animelemtime(28) = 102
trigger6 = animelemtime(28) = 106
trigger7 = animelemtime(28) = 110
ownpal = 1
value = 256,256,256
add = 255, 255, 255
time = 2

;Fires
[State 4501, FlameBMain]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(28) = 0
anim = 4505
scale = 1,1
postype = p1
pos = 0,-140
sprpriority = 14
removetime = 60

[State 4501, FlameB]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(28) = 0
trigger2 = animelemtime(28) = 30
trigger3 = animelemtime(28) = 60
anim = 4505
scale = 1,1
postype = p1
pos = 0,-140
vel = 3, 3
accel = 0, -.1
sprpriority = 15
removetime = 35

[State 4501, FlameRMain]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(28) = 10
anim = 4506
scale = 1,1
postype = p1
pos = 70,0
sprpriority = 14
ownpal = 1
removetime = 60

[State 4501, FlameR]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(28) = 10
trigger2 = animelemtime(28) = 40
trigger3 = animelemtime(28) = 70
anim = 4506
scale = 1,1
postype = p1
pos = 70,0
vel = -4, -3
accel = .3, .035
sprpriority = 15
ownpal = 1
removetime = 35

[State 4501, FlameGMain]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(28) = 20
anim = 4507
scale = 1,1
postype = p1
pos = -70,0
sprpriority = 15
ownpal = 1
removetime = 56

[State 4501, FlameG]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(28) = 20
trigger2 = animelemtime(28) = 50
trigger3 = animelemtime(28) = 76
anim = 4507
scale = 1,1
postype = p1
pos = -70,0
vel = 1, -1
accel = .25, -.13
sprpriority = 15
ownpal = 1
removetime = 35

[State 4501, Glyph]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(28) = 10
postype = p1
anim = 4510
scale = 1,1
pos = 110,-110
sprpriority = 2
ownpal = 1
removetime = 110

[State 4501, Atk]
type = Explod
triggerall = anim = 4504
trigger1 = animelemtime(31) = 0
postype = p1
anim = 1507
scale = 1,1
pos = 110,-110
sprpriority = 7
removetime = -2

[State 801, Hurt 1]
type = TargetLifeAdd
trigger1 = time = 680
absolute = 1
value = -625

;==================================
;=====================================

[State 1501, x]
type = PalFX
triggerall = anim != 17006
trigger1 = Time = 775
value = 256,256,256
add = 110, 110, 110
time = 5

[State 1501, x]
type = PalFX
triggerall = anim != 17006
trigger1 = Time = 780
value = 256,256,256
add = 165, 165, 165
time = 5

[State 1501, x]
type = PalFX
triggerall = anim != 17006
trigger1 = Time = 785
value = 256,256,256
add = 210, 210, 210
time = 5

[State 1501, x]
type = PalFX
triggerall = anim != 17006
trigger1 = Time = 790  ;Brightest
value = 256,256,256
add = 255, 255, 255
time = 20

[State 1501, x]
type = PalFX
triggerall = anim != 17006
trigger1 = Time = 810
value = 256,256,256
add = 210, 210, 210
time = 5

[State 1501, x]
type = PalFX
triggerall = anim != 17006
trigger1 = Time = 815
value = 256,256,256
add = 165, 165, 165
time = 5

[State 1501, x]
type = PalFX
triggerall = anim != 17006
trigger1 = Time = 820
value = 256,256,256
add = 110, 110, 110
time = 5

[State 4501, Victory!]
type = changestate
trigger1 = anim = 4504
trigger1 = animelemtime(34) = 4 && winko
value = 180
ctrl = 1

[State 4501, 7]
type = ChangeState
triggerall = P2Life > 0
trigger1 = anim = 4504
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------
;Victim
[Statedef 4505]
type = S
movetype = H
physics = N
;facep2 = 1
sprpriority = 3
ctrl = 0

[state 641, If dead]
type = selfstate
triggerall = !alive
trigger1 = Pos Y >= 0 && Vel Y >= 0
value = 5110
ctrl = 0

[State 4505]
type = Screenbound
trigger1 = time <= 600
value = 0
movecamera = 1,0

[State 4505, PosAdd]
type = PosAdd
trigger1 = time = 0
y = Const(size.mid.pos.y)

;--- In Air
[State 4505]
type = ChangeAnim2
trigger1 = time = 0
value = 4508
ctrl = 0

[State 4505]
type = velset
triggerall = anim = 4508
trigger1 = time = 0
y = -15

[State 4505]
type = veladd
triggerall = anim = 4508
trigger1 = 1
y = .32

;--- Landing
[State 4505]
type = ChangeAnim2
triggerall = anim = 4508
trigger1 = Pos Y >= 0 && Vel Y >= 0
value = 5100
ctrl = 0

[State 4505]
type = ChangeAnim2
triggerall = anim = 5100
trigger1 = animtime = 0
value = 5150
ctrl = 0

[State 4505, Posset]
type = posset
trigger1 = anim = 5100
trigger2 = anim = 5150
trigger3 = anim = 5300
y = 0

[state 4505, Gamemakeanim]
type = gamemakeanim
trigger1 = anim = 5100
value = 61

[State 2016, Vel]
type = velset
trigger1 = Pos Y >= 0 && Vel Y >= 0
x = 0
y = 0

[State 2016, Statetype]
type = statetypeset
trigger1 = Pos Y >= 0 && Vel Y >= 0
physics = S
persistent = 1

;--- Get Up
[State 2016, Anim3]
type = ChangeAnim
triggerall = anim = 5150
trigger1 = animtime = 0
value = 5120

;--- Dazed
[State 2016, Anim4]
type = ChangeAnim
triggerall = anim = 5120
trigger1 = animtime = 0
value = 5300

[State 4509, Vel]
type = velset
trigger1 = anim = 5300
trigger1 = time = 0
x = 0
y = 0

;--- Picked Up
[State 2016, Anim1]
type = ChangeAnim2
triggerall = anim = 5300
trigger1 = time = 500
value = 4509

[State 4509, Velset]
type = velset
trigger1 = anim = 4509
x = -.2
y = -.2

[State 2016, Anim4]
type = ChangeAnim
trigger1 = anim = 4509
trigger1 = time = 580
value = 5051

[State 4509, Velset]
type = velset
trigger1 = anim = 5051
x = 0
y = 0

;---------Tossed
[State 2016, Anim4]
type = ChangeAnim
triggerall = anim = 5051
trigger1 = time = 680
value = 5070

[State 4509, Vel]
type = velset
trigger1 = anim = 5070
trigger1 = time = 680
x = -20
y = -6

[State 4505]
type = veladd
triggerall = anim = 5070
trigger1 = time > 680
y = .32

[State 2016, Anim4]
type = ChangeAnim2
triggerall = anim = 5070
;trigger1 = time = 680
trigger1 = Pos Y >= 0 && Vel Y >= 0
value = 5080

[state 641]
type = changeanim2
trigger1 = anim = 5080
trigger1 = pos y >= 0
value = 5110

[State 641, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 641, VelSet]
type = VelSet
trigger1 = anim = 5110
trigger1 = pos y >= 0
x = 0
y = 0

[State 641, SelfState];Recover
type = SelfState
triggerall = Life > 0
trigger1 = anim = 5110
;trigger1 = time > 140
value = 5110

;----------------------
[Statedef 4509, Rika Success]
physics = N
anim = 197
sprpriority = 10

[state 4509]
type = changeanim
trigger1 = time = 0
value = 197

[state 4509]
type = changeanim
trigger1 = time = 57
value = 4502

[State 2001, DSFlare]
type = Explod
triggerall = anim = 4502
trigger1 = time = 67
anim = 1512
scale = 0.5,0.5
pos = 25,-100
sprpriority = 11
removetime = 234
supermovetime = 9999
bindtime = -1

[state 4509, Music]
type = playsnd
trigger1 = time = 0
value = s30,10
volume = 499
channel = 4

[state 4509, Rika "Biomerge Activate"]
type = playsnd
trigger1 = time = 60
value = s30,3
channel = 2

[state 4509, Renamon "Renamon Biomerged to..."]
type = playsnd
trigger1 = time = 160
value = s30,4
channel = 2

[state 4509, "Sakuyamon!"]
type = playsnd
trigger1 = time = 420
value = s30,5
channel = 2

[state 4509, "Spirit Strike!"]
type = playsnd
trigger1 = time = 699
value = s30,6
channel = 2

[State 4509]
type = velset
trigger1 = time = 0
x = Parentdist x/41 ;47
y = -6

[State 4509]
type = velAdd
trigger1 = time < 45
y = .258

[state 4509]
type = gamemakeanim
pausemovetime = -1
trigger1 = time = 45
pos = 0,0
sprpriority = 19
removetime = -2
value = 61

[State 4509]
type = velset
trigger1 = time = 45
x = 0
y = 0

[State 2016, Vel]
type = velset
trigger1 = anim = 4502
trigger1 = animelemtime(15) = 120
x = -.5

[State 4509]
type = destroyself
trigger1 = time = 700

