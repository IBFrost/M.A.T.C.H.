;--------------------------
; SUPERS.ST
;--------------------------
;==========
; VARIABLES
;==========
; Var(0) : special cancelable
; Var(1) : string position
; Var(2) : button press detection for special moves
; Var(3) : bound limiter
; Var(4) : Counter Hit - 0 : none, 1 : regular counter (constant check), 2 : forced counter (after EX Power Stance or canceled Super Charge at EX level)
; Var(5) : hitspark generator X axis * 1000 + Y axis
; Var(6) : throw limiter
; FVar(10) : custom combo counter for custom combo dampener
; FVar(11) : custom combo dampener after FVar(10) >= 5
; FVar(12) : CvS2 life&power damage scaling system added to combo dampener
;--------------------------

;--------------------------
; Devil Spark
;--------------------------

;--------------------------
; Devil Spark
[StateDef 2000]
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 10

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 2000, Anim 1]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevstateNo != 1200
value = 2000

[State 2000, Superpause]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo = 1200
var(9) = 32
[State 2000, SuperPause]
type = VarSet
trigger1 = !Time
trigger1 = PrevStateNo != 1200
var(9) = 33
[State 2000, SuperPause - 1]
type = SuperPause
trigger1 = !Time
trigger1 = PrevStateNo = 1200
time = 35
anim = -1
p2defmul = 1
[State 2000, SuperPause - 2]
type = SuperPause
trigger1 = Time = 1
trigger1 = PrevStateNo != 1200
time = 35
movetime = 35
anim = -1
p2defmul = 1
[State 2000, Supercharge]
type = Helper
trigger1 = !Time
name = "Supercharge"
stateno = 2900
pos = -39,-58
id = 2901
ownpal = 1
supermovetime = 500

[State 2000, Anim - super charge]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevstateNo = 1200
value = 2000
elem = 7

[State 2000, Super charge SFX]
type = PlaySnd
trigger1 = !Time
trigger1 = PrevstateNo = 1200
value = 1200,2

[State 2000, Power]
type = PowerAdd
trigger1 = Time = 1
trigger1 = PrevStateNo != 1200
value = -1000

[State 2000, Charge GFX too fast]
type = RemoveExplod
trigger1 = Anim = 2000
trigger1 = AnimElemNo(0) < 8
trigger1 = NumExplod(1207)
ID = 1207

[State 2000, Power charge]
type = Explod
trigger1 = PrevStateNo != 1200
trigger1 = Anim = 2000
trigger1 = AnimElem = 4
anim = 1206
ID = 1206
scale = 0.4,0.4
pos = -35,-50
trans = add
sprpriority = 5
supermovetime = 35

[State 2000, Charge end]
type = RemoveExplod
trigger1 = AnimElem = 8
trigger1 = NumExplod(1206)
ID = 1206

[State 2000, Shoot GFX]
type = Explod
triggerAll = !NumExplod(1207)
trigger1 = Anim = 1200 || Anim = 2000
trigger1 = AnimElem = 8, = 7;AnimElemNo(0) = 8
anim = 1207
pos = -27,-60
scale = 0.4,0.4
trans = add
sprpriority = 5
ownpal = 1
ID = 1207
ignorehitpause = 1
supermovetime = 50
[State 2000, Shoot GFX remove]
type = RemoveExplod
triggerAll = Anim = 2000
trigger1 = AnimElem = 11
trigger1 = NumExplod(1207)
ID = 1207
[State 2000, Shoot EX GFX - left]
type = Explod
triggerAll = Anim = 2005
trigger1 = AnimElem = 6
trigger2 = AnimElem = 15
anim = 1208
pos = -38,-64
scale = 0.4,0.4
trans = add
sprpriority = 5
ownpal = 1
ignorehitpause = 1
supermovetime = 50
[State 2000, Shoot EX GFX - right]
type = Explod
triggerAll = Anim = 2005
trigger1 = AnimElem = 1, = 1
trigger2 = AnimElem = 10
trigger3 = AnimElem = 21
anim = 1208
pos = -12,-65
scale = 0.4,0.4
trans = add
sprpriority = 5
ownpal = 1
ignorehitpause = 1
supermovetime = 50

[State 2000, Button detection reset]
type = VarSet
trigger1 = !Time
var(2) = 0

[State 2000, Voice]
type = PlaySnd
trigger1 = Anim = 2000
trigger1 = Var(2) < 4
trigger1 = AnimElem = 4
value = 2000,1
channel = 3
[State 2000, Charge SFX]
type = PlaySnd
trigger1 = Anim = 2000
trigger1 = Var(2) < 4
trigger1 = AnimElem = 4
value = 1210,0
channel = 4
[State 2000, Elec whoosh]
Type = PlaySnd
trigger1 = Anim = 2000
trigger1 = AnimElem = 9
value = 7,24
channel = 4

[State 2000, NHB]
type = NotHitBy
trigger1 = Anim = 2000
trigger1 = AnimElem = 12, < 0
trigger2 = Anim = 2005
trigger2 = AnimElemNo(0) < 24
trigger3 = Anim = 2000
trigger3 = NumHelper(2010)
trigger3 = Helper(2010),StateNo = 2020
value = SCA, AA, AP, AT

[State 2000, 1st Blast]
type = Helper
triggerAll = Anim = 2000
trigger1 = AnimElem = 11
trigger1 = !NumHelper(2010)
name = "Devil Spark first blast"
stateno = 2010
pos = 115, -71;42, -71
id = 2010
ownpal = 1

[State 2000, Success]
type = ChangeAnim
trigger1 = Anim = 2000
trigger1 = AnimElemNo(0) = 12
trigger1 = NumHelper(2010)
trigger1 = Helper(2010),StateNo = 2020
value = 2000
elem = 13
[State 2000, Success]
type = ChangeAnim
trigger1 = Anim = 2000
trigger1 = AnimElemNo(0) >= 14
trigger1 = NumHelper(2010)
trigger1 = Helper(2010),StateNo = 2020
value = 2005

[State 1600, Voice]
type = PlaySnd
trigger1 = Anim = 2005
trigger1 = AnimElem = 4
value = 2000,2
channel = 3

[State 806, Camera]
type = null;ScreenBound
trigger1 = Anim = 2005
value = 1
movecamera = 0,0

[State 2000, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;--------------------------
; Devil Spark - effect 1
[StateDef 2010]
MoveType  = A
Type      = A
Physics   = N
Velset    = 9,0
Ctrl      = 0
Juggle    = 0

[State 2010, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = Anim != 2010;1210
value = 2010;1210
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

[State 2010, HOR]
type = HitOverride
trigger1 = 1
stateno = 2010
attr = SCA,AA,AT,AP
ignorehitpause = 1

[State 2010, Scale]
type = AngleDraw
trigger1 = AnimElem = 1
scale = 1.2,0.7
ignorehitpause = 1
[State 2010, Scale]
type = AngleDraw
trigger1 = Time = [1,6]
scale = 1.2 - Time/30.0,0.7 + Time/20.0
ignorehitpause = 1

[State 2010, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2010, Spr]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

[State 2010, No shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2010, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 20000

[State 2010, SFX]
type = PlaySnd
trigger1 = !Time
value = 1210,10
channel = 4

[State 2010, GFX]
type = Explod
trigger1 = !Time
anim = 2009
pos = -45,0
scale = 0.6,0.6
trans = add
sprpriority = 5
ownpal = 1

[State 2010, Hitspark generator v0.2]
type = Helper
trigger1 = MoveContact = 1
trigger1 = HitPauseTime
trigger1 = PrevStateNo != 2010
name = "Hitspark generator"
ID = 8000
stateno = 8000
pos = IfElse(P2Dist X < 0, Floor(P2Dist X / 2), IfElse(P2Dist X < 20, Floor(20-(P2Dist X)/3), 20)), 0
postype = p1
ownpal = 1
ignorehitpause = 1
supermovetime  = 99999999
persistent = 0

[State 2010, Hit]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo != 2010
attr             = S, HP
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(parent,fvar(12)*20),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-0
hitsound         = S1210,11
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 27
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -3
air.velocity     = -5,-3
guard.velocity   = -9.5
getpower         = 25, 5
givepower        = 15, 7
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
palfx.color      = 256
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 120
forcestand       = 1
persistent = 0

[State 2010, Electric spark generator]
type = Helper
trigger1 = MoveHit = 1
trigger1 = NumTarget
ID = 8100
name = "Electric spark generator"
postype = P2
Stateno = 8100
ownpal = 1
ignorehitpause = 1
persistent = 0

[State 2010, Success - target]
type = TargetState
trigger1 = MoveHit
trigger1 = NumTarget
trigger1 = Parent,StateNo = 2000
value = 2050
ignorehitpause = 1

[State 2010, Success]
type = ChangeState
trigger1 = MoveHit
trigger1 = NumTarget
trigger1 = Parent,MoveType != H
value = 2020
ignorehitpause = 1
 
[State 2010, connect vanish]
type = Explod
triggerAll = AnimElemNo(0) > 1
trigger1 = MoveContact || MoveHit || MoveGuarded
trigger2 = FrontEdgeDist < -20
trigger3 = BackEdgeDist < -20
trigger4 = PrevStateNo = 2010
trigger5 = Parent,StateNo != 2000
anim = 2011
trans = add
ownpal = 1
sprpriority = 5
ID = 2011
ignorehitpause = 1
persistent = 0

[State 2010, End]
type = DestroySelf
trigger1 = NumExplod(2011)
trigger2 = MoveContact || MoveHit || MoveGuarded || MoveReversed || PrevStateNo = 2010
ignorehitpause = 1
;--------------------------
; Devil Spark - effect 2
[StateDef 2020]
Anim      = 2020
MoveType  = A
Type      = A
Physics   = N
Velset    = 0,0
Ctrl      = 0
Juggle    = 0

[State 2020, Bind]
type = PosSet
trigger1 = NumTarget
x = Target,Pos X
y = Target,Pos Y + Target,Const(size.mid.pos.y)
ignorehitpause = 1

[State 2020, Dust]
type = Explod
trigger1 = !Time
trigger2 = Time = 95
anim = 8510
trans = add
scale = 0.4,0.4
sprpriority = 5
pos = 0,-floor(Pos Y)
ID = 8510
ignorehitpause = 1

[State 2020, Rapid-fire bursts size]
type = VarRandom
triggerAll = Parent,Anim = 2005
trigger1 = Parent,AnimElem = 2, = 1
trigger2 = Parent,AnimElem = 7
trigger3 = Parent,AnimElem = 11
trigger4 = Parent,AnimElem = 16
v = 1
range = 0,3
ignorehitpause = 1
[State 2020, quick pre-finish bursts size]
type = VarRandom
trigger1 = Parent,Anim = 2005 && Parent,AnimElem = 22
trigger2 = Time = 82
trigger3 = Time = 85
trigger4 = Time = 88
v = 1
range = 0,6
ignorehitpause = 1

[State 2020, First hit]
type = Explod
trigger1 = !Time
anim = 1215
scale = 0.3,0.3
trans = add
sprpriority = 4
ignorehitpause = 1
persistent = 0
[State 2020, Small hits 2, 3]
type = Explod
trigger1 = Time = 3
trigger2 = Time = 8
anim = 1215
scale = 0.3,0.3
pos = -20+random%40,-25+random%60
trans = add
sprpriority = 4
ignorehitpause = 1
[State 2020, Rapid-fire 4 bursts]
type = Explod
triggerAll = Parent,Anim = 2005
trigger1 = Parent,AnimElem = 2, = 1
trigger2 = Parent,AnimElem = 7
trigger3 = Parent,AnimElem = 11
trigger4 = Parent,AnimElem = 16
anim = 1215
scale = 0.6+(Var(1)/10),0.6+(Var(1)/10)
trans = add
sprpriority = 4
[State 2020, Small bursts 8 to 11]
type = Explod
trigger1 = Parent,Anim = 2005 && Parent,AnimElem = 22
trigger2 = Time = 82
trigger3 = Time = 85
trigger4 = Time = 88
anim = 1215
scale = 0.3+(Var(1)/10),0.3+(Var(1)/10)
pos = -20+random%40,-25+random%60
trans = add
sprpriority = 4
ignorehitpause = 1
[State 2020, Final burst]
type = Explod
trigger1 = Time = 95
trigger2 = AnimElem = 2
anim = 1215
trans = add
sprpriority = 4
ignorehitpause = 1
persistent = 0

[State 2020, Hitsounds light]
type = PlaySnd
trigger1 = Time = 4
trigger2 = Time = 8
trigger3 = Time = 82
trigger4 = Time = 85
trigger5 = Time = 88
value = 1210,2
ignorehitpause = 1
[State 2020, Hitsounds medium]
type = PlaySnd
trigger1 = Parent,Anim = 2005 && Parent,AnimElem = 2, = 1
trigger2 = Parent,Anim = 2005 && Parent,AnimElem = 7
trigger3 = Parent,Anim = 2005 && Parent,AnimElem = 11
trigger4 = Parent,Anim = 2005 && Parent,AnimElem = 16
trigger5 = Parent,Anim = 2005 && Parent,AnimElem = 22
value = 1210,4
ignorehitpause = 1

[State 2020, Hitsparks]
type = Explod
trigger1 = Time = 4
trigger2 = Time = 8
trigger3 = Time = 82
trigger4 = Time = 85
trigger5 = Time = 88
trigger6 = Parent,Anim = 2005 && Parent,AnimElem = 2, = 1
trigger7 = Parent,Anim = 2005 && Parent,AnimElem = 7
trigger8 = Parent,Anim = 2005 && Parent,AnimElem = 11
trigger9 = Parent,Anim = 2005 && Parent,AnimElem = 16
trigger10 = Parent,Anim = 2005 && Parent,AnimElem = 22
anim = 8004
sprpriority = 5
scale = 0.3,0.3
pos = 20,-15+Random%25
ignorehitpause = 1
[State 2020, Hit counter]
type = HitAdd
trigger1 = Time = 4
trigger2 = Time = 8
trigger3 = Time = 82
trigger4 = Time = 85
trigger5 = Time = 88
trigger6 = Parent,Anim = 2005 && Parent,AnimElem = 2, = 1
trigger7 = Parent,Anim = 2005 && Parent,AnimElem = 7
trigger8 = Parent,Anim = 2005 && Parent,AnimElem = 11
trigger9 = Parent,Anim = 2005 && Parent,AnimElem = 16
trigger10 = Parent,Anim = 2005 && Parent,AnimElem = 22
value = 1
ignorehitpause = 1
[State 2020, Damage]
type = TargetLifeAdd
triggerAll = NumTarget
trigger1 = Time = 4
trigger2 = Time = 8
trigger3 = Time = 82
trigger4 = Time = 85
trigger5 = Time = 88
trigger6 = Parent,Anim = 2005 && Parent,AnimElem = 2, = 1
trigger7 = Parent,Anim = 2005 && Parent,AnimElem = 7
trigger8 = Parent,Anim = 2005 && Parent,AnimElem = 11
trigger9 = Parent,Anim = 2005 && Parent,AnimElem = 16
trigger10 = Parent,Anim = 2005 && Parent,AnimElem = 22
value = -ceil(parent,fvar(12)*20)
kill = 0
ignorehitpause = 1

[State 2020, Shake]
type = EnvShake
triggerAll = NumTarget
trigger1 = Time = 82
trigger2 = Time = 85
trigger3 = Time = 88
trigger4 = Parent,Anim = 2005 && Parent,AnimElem = 2, = 1
trigger5 = Parent,Anim = 2005 && Parent,AnimElem = 7
trigger6 = Parent,Anim = 2005 && Parent,AnimElem = 11
trigger7 = Parent,Anim = 2005 && Parent,AnimElem = 16
trigger8 = Parent,Anim = 2005 && Parent,AnimElem = 22
time = 6
freq = 60
ampl = 6
ignorehitpause = 1

[State 2020, Hit]
type = HitDef
trigger1 = Time = 5
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(parent,fvar(12)*20),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-0
hitsound         = S1210,11
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 27
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -5,-6
air.velocity     = -5,-3.3
guard.velocity   = -9.5
yaccel           = 0.4
getpower         = 0, 0
givepower        = 0, 0
envshake.time    = 18
envshake.freq    = 120
envshake.ampl    = 8
palfx.color      = 256
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 60
fall             = 1
fall.recover     = 0

[State 2010, Hitspark generator v0.2]
type = Helper
trigger1 = Time > 5
trigger1 = MoveContact = 1
trigger1 = HitPauseTime
name = "Hitspark generator"
ID = 8000
stateno = 8000
pos = IfElse(P2Dist X < 0, Floor(P2Dist X / 2), IfElse(P2Dist X < 20, Floor(20-(P2Dist X)/3), 20)), -15+Random%25
postype = p1
ownpal = 1
ignorehitpause = 1
supermovetime  = 99999999
persistent = 0
[State 2010, Electric spark generator]
type = Helper
trigger1 = Time > 5
trigger1 = !NumHelper(8100)
trigger1 = MoveContact = 1
trigger1 = HitPauseTime
ID = 8100
name = "Electric spark generator"
Stateno = 8100
ownpal = 1
ignorehitpause = 1
persistent = 0

;-----
; Fail case

; Send target to a state that can get hit
[State 2020, Target release]
type = TargetState
trigger1 = Parent,StateNo != 2000
value = 2051

; Skip straight to the final burst if Jin gets hit
[State 2020, Abort]
type = ChangeAnim
trigger1 = Parent,StateNo != 2000
value = Anim
Elem = 2
;-----

[State 2020, End]
type = DestroySelf
trigger1 = Time = 96
trigger2 = !AnimTime
;--------------------------
; Devil Spark - gethit
[StateDef 2050]
MoveType  = H
Type      = S
Physics   = S
Ctrl      = 0

[State 2050, Pos]
type = VelSet
trigger1 = !Time
x = 0
y = 0
ignorehitpause = 1
[State 2050, Pos]
type = PosSet
trigger1 = !Time
y = 0
ignorehitpause = 1

[State 2050, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 2050
ignorehitpause = 1

[State 2050, Turn]
type = Turn
trigger1 = !Time
trigger1 = Facing = EnemyNear,Facing

[State 2050, NHB]
type = NotHitBy
trigger1 = Time = [0,89]
value = SCA, AA, AP, AT

[State 2050, Hit]
type = VelSet
trigger1 = !Time
trigger2 = Time = 2
trigger3 = time = 4
trigger4 = time = 7
trigger5 = time = 10
trigger6 = time = 26
trigger7 = time = 40
trigger8 = time = 54
trigger9 = time = 83
trigger10 = time = 86
trigger11 = time = 89
trigger12 = time = 96
x = -3.5

[State 2050, End]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1
;--------------------------
; Devil Spark - gethit - aborted
[StateDef 2051]
MoveType  = H
Type      = S
Physics   = S
Ctrl      = 0

; No NotHitBy, so immediately gets hit by the projectile's final burst

[State 2051, End]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------

;--------------------------
; Autocombos
;--------------------------

;--------------------------
; Tenstring
[StateDef 2100]
Anim      = 6070
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 2100, Hitspark]
type = VarSet
trigger1 = MoveContact = 1
trigger1 = HitPauseTime
trigger2 = Time
var(22) = 8000
ignorehitpause = 1

[State 2100, AfterImage]
type = AfterImage
trigger1 = Time = 1
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add1
[State 2100, AfterImage persist]
type = AfterImageTime
trigger1 = 1
time = 2

[State 2100, SuperPause]
type = VarSet
trigger1 = !Time
var(9) = 25
[State 2100, SuperPause]
type = SuperPause
trigger1 = Time = 1
time = 28
anim = -1
p2defmul = 1
[State 2100, Supercharge]
type = Helper
trigger1 = Time = 1
name = "Supercharge"
stateno = 2900
pos = 0,-82
id = 2901
ownpal = 1
supermovetime = 500

[State 2100, Power]
type = PowerAdd
trigger1 = Time = 1
value = -1000

[State 2100, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

; The whole super counts as only one unique hit
[State 2100, Dampener counter increase]
type = VarAdd
triggerAll = MoveHit >= 1
trigger1 = AnimElem = 64
;triggerAll = MoveHit <= 12
;trigger1 = AnimElem = 4
;trigger2 = AnimElem = 10
;trigger3 = AnimElem = 15
;trigger4 = AnimElem = 22
;trigger5 = AnimElem = 31
;trigger6 = AnimElem = 37
;trigger7 = AnimElem = 42
;trigger8 = AnimElem = 49
;trigger9 = AnimElem = 54
;trigger10 = AnimElem = 64
fv = 10
value = 1
ignorehitpause = 1
persistent = 0

;---------
; right elbow

[State 2100, Hitspark 1]
type = VarSet
trigger1 = !Time
var(5) = 38084

[State 2100, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = !(Random%2)
value = 200, random%4
channel = 3

[State 2100, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 2
value = 7,5
channel = 2
persistent = 0

[State 2100, Hit 1]
type = HitDef
trigger1 = !Time
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = floor(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 10
ground.hittime   = 14
guard.hittime    = 10
ground.velocity  = -1.5
air.velocity     = -2,-3
guard.velocity   = -2
getpower         = 0, 0
givepower        = 10, 5
givepower        = 10, 5
ground.cornerpush.veloff = 0
sparkno = S8000

;--------------
; Left low kick

[State 2100, Hitspark 2]
type = VarSet
trigger1 = AnimElem = 9
trigger2 = AnimElem = 46
var(5) = 58021

[State 2100, Pos 1]
type = PosAdd
trigger1 = AnimElem = 6
x = 13
[State 2100, Pos 1]
type = PosAdd
trigger1 = AnimElem = 7
x = 22

[State 2100, Voice]
type = PlaySnd
triggerAll = !(Random%2)
trigger1 = AnimElem = 7
trigger2 = AnimElem = 44
value = 200, random%4
channel = 3

[State 2100, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 8
trigger2 = AnimElem = 45
value = 7,3
Channel = 2

[State 2100, Hit 4-8]
type = HitDef
trigger1 = AnimElem = 8
trigger2 = AnimElem = 45
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = floor(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-21
hitsound         = S5,0
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 15
guard.slidetime  = 14
ground.hittime   = 15
guard.hittime    = 14
ground.velocity  = -4.5
air.velocity     = -4.5, -3
guard.velocity   = -4
getpower         = 0, 0
givepower        = 10, 5
ground.cornerpush.veloff = 0
sparkno = S8000

;--------------
; Left sidekick

[State 2100, Hitspark 3]
type = VarSet
trigger1 = AnimElem = 13
var(5) = 59074

[State 2100, Width]
type = Width
trigger1 = AnimElemNo(0) = [13,14]
value = 30,-18

[State 233, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 12
value = 7,2
Channel = 2

[State 233, Hit]
type = HitDef
trigger1 = AnimElem = 13
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-74
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 15
ground.hittime   = 22
guard.hittime    = 15
ground.velocity  = -6.5
air.velocity     = -1, -3
guard.velocity   = -6.5
getpower         = 0, 0
givepower        = 10, 5
ground.cornerpush.veloff = 0
sparkno = S8000

;---------------------
; Left back roundhouse

[State 2100, Hitspark 3]
type = VarSet
trigger1 = AnimElemNo(0) = 20
var(5) = 40095
persistent = 0

[State 2100, Pos 0]
type = PosAdd
trigger1 = AnimElemNo(0) = 18
x = 15
persistent = 0

[State 2100, Pos 1]
type = PosAdd
trigger1 = AnimElemNo(0) = 19
x = 14
persistent = 0

[State 2100, Pos 2]
type = PosAdd
trigger1 = AnimElemNo(0) = 20
x = 17
persistent = 0

[State 2100, Pos 3]
type = PosAdd
trigger1 = AnimElemNo(0) = 21
x = 17
persistent = 0

[State 2100, Voice]
type = PlaySnd
trigger1 = AnimElemNo(0) = 20
trigger1 = !(Random%2)
value = 202, random%4
channel = 3
persistent = 0

[State 2100, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 20
value = 7,10
Channel = 2
persistent = 0

[State 2100, Hit 4]
type = HitDef
trigger1 = AnimElem = 20
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = floor(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-95
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 24
guard.slidetime  = 18
ground.hittime   = 24
guard.hittime    = 18
ground.velocity  = -6
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 0, 0
givepower        = 20, 10
ground.cornerpush.veloff = 0
sparkno = S8000

;-----------------------
; Right roundhouse punch

[State 2100, Hitspark 5]
type = VarSet
trigger1 = AnimElem = 26
var(5) = 58078

[State 2100, Voice]
type = PlaySnd
trigger1 = AnimElem = 27
trigger1 = !(Random%2)
value = 201, random%4
channel = 3

[State 2100, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 28
value = 7,8
Channel = 2

[State 2100, Slide]
type = PosAdd
trigger1 = AnimElemNo(0) = 26
x = 4
persistent = 1

[State 2100, Width]
type = Width
trigger1 = AnimElem = 27
value = 28,-20

[State 2100, Pos]
type = PosAdd
trigger1 = AnimElem = 27
x = 34

[State 2100, Elec whoosh]
Type = PlaySnd
trigger1 = Time = 67
value = 7,24
channel = 4
[State 2100, GFX]
type = Explod
trigger1 = Time = 67
anim = 252
scale = 0.4,0.4
trans = add
sprpriority = 5
bindtime = -1
removeongethit = 1

[State 2100, Hit 5]
type = HitDef
trigger1 = AnimElem = 27
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = -3.5
air.velocity     = -4, -3
guard.velocity   = -9.5
getpower         = 0, 0
givepower        = 15, 7
ground.cornerpush.veloff = 0
sparkno = S8000

;--------------
; Left uppercut

[State 2100, Hitspark 6]
type = VarSet
trigger1 = AnimElem = 34
var(5) = 40078

[State 2100, Hitspark 6]
type = VarSet
trigger1 = AnimElem = 35
var(5) = 23119

[State 2100, Pos fix]
type = PosAdd
trigger1 = AnimElem = 32
x = 15
[State 2100, Pos fix 2]
type = PosAdd
trigger1 =AnimElem = 33
x = 4
[State 2100, Pos fix 3]
type = PosAdd
trigger1 = AnimElem = 34
x = 11

[State 2100, Voice]
type = PlaySnd
trigger1 = AnimElem = 33
trigger1 = !(Random%2)
value = 200, random%4
channel = 3

[State 2100, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 33
value = 7,11
channel = 2
persistent = 0

[State 2100, GFX]
type = Explod
trigger1 = AnimElem = 32, = 1
anim = 1035
pos = -26,-15
scale = 0.4,0.4
trans = add
ownpal = 1
bindtime = -1
sprpriority = 5
removeongethit = 1
id = 1035
[State 2300, GFX end]
type = RemoveExplod
trigger1 = NumExplod(1035)
trigger1 = AnimElem = 38
id = 1035
[State 2100, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 32, = 1
value = 7,24
channel = 4

[State 2100, Hit 6]
type = HitDef
trigger1 = AnimElem = 33
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,5
guardsound       = S6,2
ground.type      = High
ground.slidetime = 12
ground.hittime   = 24
guard.hittime    = 16
ground.velocity  = -3
air.velocity     = -2,-3
guard.velocity   = -3.5
getpower         = 0, 0
givepower        = 10, 5
ground.cornerpush.veloff = 0
sparkno = S8000

[State 2100, Hit 6]
type = HitDef
triggerAll = AnimElem = 36
trigger1 = MoveContact > 10
trigger2 = !MoveHit
trigger2 = !MoveGuarded
trigger2 = !MoveReversed
trigger2 = !MoveContact
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-119
hitsound         = S5,5
guardsound       = S6,2
ground.type      = High
ground.slidetime = 12
ground.hittime   = 24
guard.hittime    = 16
ground.velocity  = -3
air.velocity     = -2,-3
guard.velocity   = -3.5
getpower         = 0, 0
givepower        = 10, 5
ground.cornerpush.veloff = 0
sparkno = S8000

;-----------------
; Right smash hook

[State 2100, hitspark position]
type = VarSet
trigger1 = AnimElem = 38
var(5) = 67064

[State 2100, Pos 1]
type = PosAdd
trigger1 = AnimElem = 39
x = 5
[State 2100, Pos 2]
type = PosAdd
trigger1 = AnimElem = 40
x = 14
[State 2100, Pos 3]
type = PosAdd
trigger1 = AnimElem = 43
x = 11

[State 2100, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 39
value = 7,9
Channel = 2

[State 2100, GFX]
type = Helper
trigger1 = AnimElem = 38
name = "Twin Lancer electricity"
stateno = 238
ownpal = 1
pos = -18,-40
[State 2100, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 38
value = 7,24
channel = 4

[State 2100, Hit 7]
type = HitDef
trigger1 = AnimElem = 40
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = ceil(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-64
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 24
guard.slidetime  = 21
ground.hittime   = 24
guard.hittime    = 21
ground.velocity  = -4
air.velocity     = -3,-2
guard.velocity   = -4.5
getpower         = 0, 0
givepower        = 15, 7
ground.cornerpush.veloff = 0
sparkno = S8000

;--------------------------
; Right low roundhouse kick

[State 2100, hitspark position]
type = VarSet
trigger1 = AnimElem = 50
var(5) = 67035

[State 2100, Voice]
type = PlaySnd
triggerAll = !(Random%2)
trigger1 = AnimElem = 51
value = 201, random%4
channel = 3

[State 2100, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 51
value = 7,10
Channel = 2

[State 2100, Width]
type = Width
trigger1 = AnimElem = 50
value = 28,-18
[State 2100, Pos]
type = PosAdd
trigger1 = AnimElem = 50
x = 28

[State 2100, GFX]
type = Explod
trigger1 = AnimElem = 51, = 2
anim = 1055
pos = 71,-27
scale = 0.4,0.4
trans = add
sprpriority = 5
bindtime = -1

[State 2100, Hit 9]
type = HitDef
trigger1 = AnimElem = 50
attr             = S, NA
hitflag          = MAF
guardflag        = LA
animtype         = Back
damage           = ceil(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-35
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 14
ground.hittime   = 15
guard.hittime    = 11
ground.velocity  = -1.5,-5
air.velocity     = -1.5, -5
guard.velocity   = -8
getpower         = 0, 0
givepower        = 15, 7
ground.cornerpush.veloff = 0
fall             = 1
fall.recover     = 0
sparkno = S8000

;------------------
; Right rising hook

[State 2100, 10HC 10 Vel]
type = VelSet
trigger1 = AnimElem = 58
x = 4
[State 2100, 10HC 10 Pos]
type = PosAdd
trigger1 = AnimElem = 58
x = 15

[State 2100, hitspark position]
type = VarSet
trigger1 = AnimElem = 58
var(5) = 40078

[State 2100, Whoosh]
Type = PlaySnd
trigger1 = AnimElem = 60
value = 7,6
channel = 2

[State 2100, Elec whoosh]
Type = PlaySnd
trigger1 = Time = 163
value = 7,24
channel = 4
[State 2100, GFX]
type = Explod
trigger1 = Time = 163
anim = 1025
pos = -26,-24
scale = 0.4,0.28
trans = add
ownpal = 1
bindtime = -1
sprpriority = 5
removeongethit = 1

[State 2100, Width]
type = Width
trigger1 = AnimElem = 60
value = 25,-18
[State 2100, Pos 1]
type = PosAdd
trigger1 = AnimElem = 60
x = 25
[State 2100, Pos 2]
type = PosAdd
trigger1 = AnimElem = 62
x = 4

[State 2100, Hit 10]
type = HitDef
trigger1 = AnimElem = 62
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*25),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,7
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 30
guard.hittime    = 16
ground.velocity  = -3.5,-5.5
air.velocity     = -4,-7.5
guard.velocity   = -8.5
getpower         = 0, 0
givepower        = 15, 7
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
fall.recover     = 0
ground.cornerpush.veloff = 0
sparkno = S8000

;----
; End

[State 2100, Idle]
type = StateTypeSet
trigger1 = AnimElemNo(0) = 63
movetype = I
persistent = 0

[State 2100, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;--------------------------
; Omen Fury
[StateDef 2200]
Anim      = 6076;6075
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 2200, AfterImage]
type = AfterImage
trigger1 = Time = 1
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
trans = add1
[State 2200, AfterImage persist]
type = AfterImageTime
trigger1 = 1
time = 2

[State 2200, SuperPause]
type = SuperPause
trigger1 = Time = 1
time = 28
anim = -1
p2defmul = 1
[State 2200, SuperPause]
type = VarSet
trigger1 = Time = 1
var(9) = 28
[State 2200, Supercharge]
type = Helper
trigger1 = Time = 1
name = "Supercharge"
stateno = 2900
pos = 25,-83
id = 2901
ownpal = 1
supermovetime = 500

[State 2200, Power]
type = PowerAdd
trigger1 = Time = 1
value = -1000

[State 2200, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

; The whole super counts as only one unique hit
[State 2200, Dampener counter increase]
type = VarAdd
triggerAll = MoveHit >= 1
trigger1 = AnimElemNo(0) = [34,35]
;trigger1 = AnimElemNo(0) = [3,4]
;trigger2 = AnimElemNo(0) = [7,8]
;trigger3 = AnimElemNo(0) = [14,15]
;trigger4 = AnimElemNo(0) = [20,21]
;trigger5 = AnimElemNo(0) = [25,26]
;trigger6 = AnimElemNo(0) = [29,30]
;trigger7 = AnimElemNo(0) = [34,35]
fv = 10
value = 1
persistent = 0

;---------
; Left jab

[State 2200, Hitspark 1]
type = VarSet
trigger1 = !Time
var(5) = 70085

[State 2200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = !(Random%2)
value = 200, random%4
channel = 3

[State 2200, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 2
value = 7,0
channel = 2
persistent = 0

[State 2200, Hit 1]
type = HitDef
trigger1 = !Time
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = floor(fvar(12)*32),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 10
ground.hittime   = 14
guard.hittime    = 10
ground.velocity  = -2.5
air.velocity     = -5,-3
guard.velocity   = -4.5
getpower         = 0, 0
givepower        = 10, 5
ground.cornerpush.veloff = 0
sparkno = S8000

;------------
; Right punch

[State 2200, Hitspark 2]
type = VarSet
trigger1 = AnimElemNo(0) = 5
var(5) = 78079
persistent = 0

[State 2200, Pos 1]
type = PosAdd
trigger1 = AnimElemNo(0) = 5
x = 7
persistent = 0

[State 2200, voice]
type = PlaySnd
trigger1 = AnimElemNo(0) = 5
trigger1 = !(Random%2)
value = 201, random%4
channel = 3

[State 2200, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 6
value = 7,4
Channel = 2
persistent = 0

[State 2200, Hit 2]
type = HitDef
trigger1 = AnimElem = 5
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = floor(fvar(12)*32),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 14
ground.hittime   = 18
guard.hittime    = 12
ground.velocity  = -2.5
air.velocity     = -2.5, -3
guard.velocity   = -3
getpower         = 0, 0
givepower        = 15, 7
fall.recover     = 0
ground.cornerpush.veloff = 0
sparkno = S8000

;--------------
; Corpse Thrust

[State 2200, Hitspark 3]
type = VarSet
trigger1 = AnimElemNo(0) = 9
var(5) = 57065
persistent = 0

[State 2200, Voice]
type = PlaySnd
trigger1 = AnimElemNo(0) = 12
trigger1 = !(Random%2)
value = 202, random%4
channel = 3
persistent = 0

[State 2200, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 12
value = 7,9
Channel = 2

[State 2200, Pos 0]
type = PosAdd
trigger1 = AnimElemNo(0) = 9
x = 21
persistent = 0
[State 2200, Pos 1]
type = PosAdd
trigger1 = AnimElemNo(0) = 10
x = 9
persistent = 0
[State 2200, Pos 2]
type = PosAdd
trigger1 = AnimElemNo(0) = 11
x = 2
persistent = 0
[State 2200, Pos 3]
type = PosAdd
trigger1 = AnimElemNo(0) = 12
x = 8
persistent = 0
[State 2200, Pos 4]
type = PosAdd
trigger1 = AnimElemNo(0) = 14
x = 8
persistent = 0
[State 2200, Pos 5]
type = PosAdd
trigger1 = AnimElemNo(0) = 16
x = 14
persistent = 0

[State 2200, Hit 3]
type = HitDef
trigger1 = AnimElem = 9
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = floor(fvar(12)*32),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-65
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 27
guard.hittime    = 14
ground.velocity  = -7.5
air.velocity     = -5, -3
guard.velocity   = -8.5
getpower         = 0, 0
givepower        = 20, 10
ground.cornerpush.veloff = 0
sparkno = S8000

;--------------
; Left sidekick

[State 2200, Hitspark 4]
type = VarSet
trigger1 = AnimElem = 17
var(5) = 59074;58021

[State 2200, Pos]
type = PosAdd
trigger1 = AnimElem = 17
x = 40

[State 2200, Voice]
type = PlaySnd
trigger1 = AnimElem = 18
trigger1 = !(Random%2)
value = 200, random%4
channel = 3

[State 2200, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 19
value = 7,3
Channel = 2

[State 2200, Hit 4]
type = HitDef
trigger1 = AnimElem = 17
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = floor(fvar(12)*32),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-74;21
hitsound         = S5,0
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 20
guard.slidetime  = 14
ground.hittime   = 20
guard.hittime    = 9
ground.velocity  = -4.5
air.velocity     = -4.5, -3
guard.velocity   = -4
getpower         = 0, 0
givepower        = 10, 5
ground.cornerpush.veloff = 0
sparkno = S8000

;------------
; Right punch

[State 2200, Hitspark 5]
type = VarSet
trigger1 = AnimElem = 23
var(5) = 78079

[State 2200, Pos]
type = PosAdd
trigger1 = AnimElem = 23
x = 15

[State 2200, Voice]
type = PlaySnd
trigger1 = AnimElemNo(0) = 23
trigger1 = !(Random%2)
value = 201, random%4
channel = 3

[State 2200, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 24
value = 7,4
Channel = 2
persistent = 0

[State 2200, Hit 5]
type = HitDef
trigger1 = AnimElem = 23
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = floor(fvar(12)*32),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 16
ground.hittime   = 18
guard.hittime    = 14
ground.velocity  = -3.5
air.velocity     = -2.5, -4.5
guard.velocity   = -4.5
getpower         = 0, 0
givepower        = 15, 7
ground.cornerpush.veloff = 0
sparkno = S8000

;---------------
; Right low kick

[State 2200, Hitspark 6]
type = VarSet
trigger1 = AnimElem = 27
var(5) = 75034

[State 2200, Voice]
type = PlaySnd
trigger1 = AnimElem = 28
trigger1 = !(Random%2)
value = 201, random%4
channel = 3

[State 2200, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 28
value = 7,7
Channel = 2

[State 2200, Pos]
type = PosAdd
trigger1 = AnimElem = 27
x = 20

[State 2200, GFX]
type = Explod
trigger1 = AnimElem = 28, = 2
anim = 1055
pos = 83,-30
scale = 0.4,0.4
trans = add
sprpriority = 5
bindtime = -1

[State 2200, Hit]
type = HitDef
trigger1 = AnimElem = 27
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = floor(fvar(12)*32),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-34
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 20
guard.slidetime  = 16
ground.hittime   = 18
guard.hittime    = 14
ground.velocity  = -5
air.velocity     = -2.2, -4.8
guard.velocity   = -8
getpower         = 0, 0
givepower        = 15, 7
ground.cornerpush.veloff = 0
sparkno = S8000

;---------------------
; Left back roundhouse

[State 2200, Hitspark 7]
type = VarSet
trigger1 = AnimElem = 33
var(5) = 40095

[State 2200, Pos 0]
type = PosAdd
trigger1 = AnimElem = 31
x = 15

[State 2200, Pos 1]
type = PosAdd
trigger1 = AnimElem = 32
x = 14

[State 2200, Pos 2]
type = PosAdd
trigger1 = AnimElem = 33
x = 17

[State 2200, Pos 3]
type = PosAdd
trigger1 = AnimElem = 34
x = 17

[State 2200, Voice]
type = PlaySnd
trigger1 = AnimElem = 33
trigger1 = !(Random%2)
value = 202, random%4
channel = 3

[State 2200, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 33
value = 7,10
Channel = 2

[State 2200, Hit 7]
type = HitDef
trigger1 = AnimElem = 33
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = floor(fvar(12)*32),3
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-95
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 21
guard.slidetime  = 15
ground.hittime   = 21
guard.hittime    = 15
ground.velocity  = -2,-4.5
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 0, 0
givepower        = 20, 10
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
ground.cornerpush.veloff = 0
fall             = 1
fall.recover     = 0
sparkno = S8000

;----
; End

[State 2200, Idle]
type = StateTypeSet
trigger1 = AnimElemNo(0) = 36
movetype = I
persistent = 0

[State 2200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------

;--------------------------
; Lv2
;--------------------------

;--------------------------
; Evil Eye
[StateDef 2300]
Anim      = 2300
MoveType  = A
Type      = S
Physics   = N
Velset    = 0,0
Ctrl      = 0

[State 2300, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 2300, SuperPause]
type = VarSet
trigger1 = !Time
var(9) = 33
[State 2300, SuperPause]
type = SuperPause
trigger1 = !Time
time = 35
anim = -1
p2defmul = 1
[State 2300, Supercharge]
type = Helper
trigger1 = !Time
name = "Supercharge"
stateno = 2900
pos = 17,-70
id = 2901
ownpal = 1
supermovetime = 500
[State 2300, AfterImage]
type = AfterImage
trigger1 = Time = 1
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 32, 32, 160
palpostbright = 0, 0, 0
trans = add1
[State 2300, AfterImage persist]
type = AfterImageTime
trigger1 = 1
time = 2

[State 2400, Power]
type = PowerAdd
trigger1 = Time = 1
value = -2000

; dash
[State 2300, Dash]
type = VelSet
trigger1 = AnimElem = 3
trigger1 = Anim = 2300
x = 12

[State 2300, Physics]
type = StateTypeSet
trigger1 = Time = 14
trigger2 = Anim = 2301
physics = S

[State 2300, NHB]
type = NothitBy
trigger1 = Time <= 20
value = SCA,AA,AP,AT

[State 2300, Dust]
type = Explod
trigger1 = Anim = 2300
trigger1 = AnimElem = 3
anim = 8520
trans = add
scale = 0.4,0.4
sprpriority = 5
[State 2300, Dust 2]
type = Explod
trigger1 = Anim = 2300
trigger1 = AnimElem = 4, = 5
anim = 8500
trans = add
scale = 0.4,0.4
sprpriority = 5

; double attack
[State 2300, Attack]
type = ChangeAnim
triggerAll = Anim = 2300
trigger1 = P2BodyDist X = [-40,60]
trigger1 = AnimElemNo(0) = [2,6]
trigger2 = AnimElem = 6
value = 2301

[State 2300, Slide]
type = VelSet
trigger1 = Anim = 2301
trigger1 = AnimElem = 1
x = 8
[State 2300, Pos fix]
type = PosAdd
trigger1 = Anim = 2301
trigger1 = AnimElem = 8
x = 7
[State 2300, Width]
type = Width
trigger1 = Anim = 2301
trigger1 = AnimElem = 9
value = 26,-18
[State 2300, Pos fix 2]
type = PosAdd
trigger1 = Anim = 2301
trigger1 = AnimElem = 9
x = 26
[State 2300, Width 2]
type = Width
trigger1 = Anim = 2301
trigger1 = AnimElem = 9
value = 22,-18

[State 2300, Hitspark position]
type = VarSet
trigger1 = Anim = 2301
trigger1 = AnimElem = 1
var(5) = 40078
[State 2300, Hitspark pos 2]
type = VarSet
trigger1 = Anim = 2301
trigger1 = AnimElem = 4
var(5) = 23119
[State 232, Hitspark pos 3]
type = VarSet
trigger1 = Anim = 2301
trigger1 = AnimElem = 5
var(5) = 67064

[State 2300, GFX]
type = Explod
trigger1 = Anim = 2301
trigger1 = AnimElem = 1
anim = 1035
pos = -26,-15
scale = 0.4,0.4
trans = add
ownpal = 1
bindtime = -1
sprpriority = 5
removeongethit = 1
id = 1035
[State 2300, GFX end]
type = RemoveExplod
trigger1 = NumExplod(1035)
trigger1 = Anim = 2301
trigger1 = AnimElem = 7
id = 1035

[State 2300, Dust]
type = Explod
trigger1 = Anim = 2301
trigger1 = AnimElem = 9
anim = 8521
trans = add
pos = 40,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1
[State 2300, Elec whoosh]
Type = PlaySnd
triggerAll = Anim = 2301
trigger1 = AnimElem = 2
trigger2 = AnimElem = 7
value = 7,24
channel = 4
[State 2300, GFX]
type = Helper
trigger1 = Anim = 2301
trigger1 = AnimElem = 7
name = "Twin Lancer electricity"
stateno = 238
ownpal = 1
pos = -18,-40

[State 2300, Hit]
type = HitDef
trigger1 = !Time
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*30),8
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,5
guardsound       = S6,2
ground.type      = High
ground.slidetime = 12
ground.hittime   = 24
guard.hittime    = 20
ground.velocity  = -3.5
air.velocity     = -1, -3
air.velocity     = -2,-3
guard.velocity   = -5
getpower         = 20, 10
givepower        = 10, 5
palfx.color      = 256
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 35
kill             = 0
fall.recover     = 0
sparkno = S8000

[State 2300, Hit]
type = HitDef
trigger1 = Anim = 2301
trigger1 = AnimElem = 4
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*30),8
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-119
hitsound         = S5,5
guardsound       = S6,2
ground.type      = High
ground.slidetime = 12
ground.hittime   = 24
guard.hittime    = 20
ground.velocity  = -6
air.velocity     = -4,-1
guard.velocity   = -5
getpower         = 20, 10
givepower        = 10, 5
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 35
kill             = 0
fall.recover     = 0
sparkno = S8000

[State 2300, Hit]
type = HitDef
trigger1 = Anim = 2301
trigger1 = AnimElem = 5
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = ceil(fvar(12)*50),18
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-64
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 1
guard.slidetime  = 1
ground.hittime   = 1
guard.hittime    = 1
ground.velocity  = -2
air.velocity     = -2,-2
guard.velocity   = -5.5
getpower         = 30, 10
givepower        = 15, 7
envshake.time    = 12
envshake.freq    = 120
envshake.ampl    = 6
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 35
kill             = 0
fall.recover     = 0
sparkno = S8000

[State 2300, Success - target]
type = TargetState
trigger1 = MoveHit
trigger1 = NumTarget
value = 2350
[State 2300, Success]
type = ChangeState
trigger1 = MoveHit
trigger1 = NumTarget
trigger1 = AnimElemNo(0) >= 10
value = 2301

[State 2300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;--------------------------
; Evil Eye - success
[StateDef 2301]
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 2400, AfterImage]
type = AfterImage
trigger1 = Time = 1
time = 2
timegap = 1
framegap = 10
length = 30
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 32,32,160
palpostbright = 0, 0, 0
trans = add1
[State 2400, AfterImage persist]
type = AfterImageTime
trigger1 = 1
time = 2

[State 2302, Anim]
type = ChangeAnim
trigger1 = Anim = 2301
trigger1 = AnimElem = 12
value = 2303

[State 2405, Bind]
type = null;TargetBind
trigger1 = NumTarget
trigger1 = !Time
pos = 45,0

[State 2405, Width]
type = Width
trigger1 = Anim = 2303
trigger1 = AnimElem = 21
value = 28, -18
[State 2405, Width]
type = Width
trigger1 = Anim = 2303
trigger1 = AnimElem = 25
value = 32, -18
[State 2405, Pos]
type = PosAdd
trigger1 = Anim = 2303
trigger1 = AnimElem = 12
x = 9
[State 2405, Pos]
type = PosAdd
trigger1 = Anim = 2303
trigger1 = AnimElem = 17
x = 3
[State 2405, Pos]
type = PosAdd
trigger1 = Anim = 2303
trigger1 = AnimElem = 18
x = 17
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 21
trigger2 = AnimElem = 73
x = 28
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 25
x = 32
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 41
x = 6
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 32
trigger2 = AnimElem = 50
trigger3 = AnimElem = 79
x = 11
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 52
x = 9
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 57
trigger2 = AnimElem = 70
trigger3 = AnimElem = 74
trigger4 = AnimElem = 80
x = 22
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 62
x = 5
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 64
trigger2 = AnimElem = 76
x = 10
[State 2405, Pos]
type = PosAdd
trigger1 = AnimElem = 78
x = 13

[State 2405, Whoosh]
type = PlaySnd
triggerAll = Anim = 2303
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
trigger3 = AnimElem = 11
trigger4 = AnimElem = 17
trigger5 = AnimElem = 22
trigger6 = AnimElem = 25
trigger7 = AnimElem = 31
trigger8 = AnimElem = 37
trigger9 = AnimElem = 42
trigger10 = AnimElem = 47
trigger11 = AnimElem = 51
value = 7,0
channel = 2
[State 2405, Whoosh]
type = PlaySnd
triggerAll = Anim = 2303
trigger1 = AnimElem = 57
trigger2 = AnimElem = 63
trigger3 = AnimElem = 69
value = 7,4
channel = 2
[State 2405, Whoosh]
type = PlaySnd
triggerAll = Anim = 2303
trigger1 = AnimElem = 74
value = 7,9
channel = 2

[State 2405, Voice 1]
type = PlaySnd
trigger1 = Anim = 2303
trigger1 = AnimElem = 2
value = 2400,0
channel = 3
[State 2405, Voice 2]
type = PlaySnd
trigger1 = Anim = 2303
trigger1 = AnimElem = 45
value = 2400,1
channel = 3

[State 2405, Hitspark 1]
type = null;VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 8
var(5) = 69072
[State 2405, Hitspark 2]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 3
var(5) = 48082
[State 2405, Hitspark 3]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 7
var(5) = 66057
[State 2405, Hitspark 4]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 11
var(5) = 40078
[State 2405, Hitspark 5]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 17
var(5) = 62067
[State 2405, Hitspark 6]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 22
var(5) = 56075
[State 2405, Hitspark 7]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 26
var(5) = 55077
[State 2405, Hitspark 8]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 31
var(5) = 39079
[State 2405, Hitspark 9]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 37
var(5) = 70072;62067
[State 2405, Hitspark 10]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 43
var(5) = 48082
[State 2405, Hitspark 11]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 47
var(5) = 66057
[State 2405, Hitspark 12]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 51
var(5) = 40078
[State 2405, Hitspark 13]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 58
var(5) = 55077
[State 2405, Hitspark 14]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 63
var(5) = 40078
[State 2405, Hitspark 15]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 69
var(5) = 62067
[State 2405, Hitspark 16]
type = VarSet
trigger1 = Anim = 2303
trigger1 = AnimElem = 75
var(5) = 58065

[State 202, Lightning sparks]
type = Helper
trigger1 = !(Time%4)
name = "Spark"
stateno = 8500
ownpal = 1
pos = -30+Random%80,-45-Random%35

[State 2405, Elec whoosh]
Type = PlaySnd
trigger1 = Anim = 2303
trigger1 = AnimElem = 74
value = 7,24
channel = 4
[State 2405, GFX end]
type = Explod
trigger1 = Anim = 2303
trigger1 = AnimElem = 74
anim = 1314
pos = 58,-65
trans = add
scale = 0.42,0.42
sprpriority = 5
ownpal = 1
bindtime = -1

[State 2405,Bind]
type = null;TargetBind
trigger1 = MoveHit = 1
trigger1 = AnimElemNo(0) < 75
time = 1
pos = 50,0

[State 2405, Hit high med]
type = HitDef
triggerAll = Anim = 2303
trigger1 = AnimElem = 11
trigger2 = AnimElem = 31
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*14),4
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 30
ground.hittime   = 30
guard.hittime    = 30
ground.velocity  = -1
air.velocity     = -0.7,-1.5
guard.velocity   = -2
getpower         = 0, 0
givepower        = 10, 5
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 35
forcestand       = 1
kill             = 0
fall.recover     = 0
[State 2405, Hit low med]
type = HitDef
triggerAll = Anim = 2303
trigger1 = AnimElem = 3
trigger2 = AnimElem = 7
trigger3 = AnimElem = 17
trigger4 = AnimElem = 22
trigger5 = AnimElem = 25
trigger6 = AnimElem = 37
trigger7 = AnimElem = 43
trigger8 = AnimElem = 47
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*14),4
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 30
ground.hittime   = 30
guard.hittime    = 30
ground.velocity  = -1
air.velocity     = -0.7,-1.5
guard.velocity   = -2
getpower         = 0, 0
givepower        = 10, 5
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 35
forcestand       = 1
kill             = 0
fall.recover     = 0
[State 2405, Hit high hard]
type = HitDef
triggerAll = Anim = 2303
trigger1 = AnimElem = 51
trigger2 = AnimElem = 63
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Heavy
damage           = ceil(fvar(12)*17),4
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 30
ground.hittime   = 30
guard.hittime    = 30
ground.velocity  = -1
air.velocity     = -0.7,-1.5
guard.velocity   = -2
getpower         = 0, 0
givepower        = 10, 5
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 35
forcestand       = 1
kill             = 0
fall.recover     = 0
[State 2405, Hit low hard]
type = HitDef
triggerAll = Anim = 2303
trigger1 = AnimElem = 57
trigger2 = AnimElem = 69
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Heavy
damage           = ceil(fvar(12)*17),4
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 30
ground.hittime   = 30
guard.hittime    = 30
ground.velocity  = -1
air.velocity     = -0.7,-1.5
guard.velocity   = -2
getpower         = 0, 0
givepower        = 10, 5
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 35
forcestand       = 1
kill             = 0
fall.recover     = 0
[State 2405, Hit final]
type = HitDef
trigger1 = AnimElem = 75
attr             = S, HA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*52),4
pausetime        = 18,19
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,6
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 30
ground.hittime   = 30
guard.hittime    = 30
ground.velocity  = -7,-3
air.velocity     = -5,-3
guard.velocity   = -2
getpower         = 0, 0
givepower        = 10, 5
envshake.time    = 18
envshake.freq    = 120
envshake.ampl    = 8
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 60
fall             = 1
fall.recover     = 0

[State 2300, Shake]
type = EnvShake
triggerAll = MoveHit = 1
triggerAll = Anim = 2303
trigger1 = AnimElemNo(0) = 59
trigger2 = AnimElemNo(0) = [64,65]
trigger3 = AnimElemNo(0) = 70
time = 6
freq = 60
ampl = 4

[State 2300, Success - target]
type = null;TargetState
trigger1 = MoveHit = 1
trigger1 = NumTarget
trigger1 = AnimElemNo(0) < 74
value = 2350
ignorehitpause = 1

[State 2405, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;--------------------------
; Evil Eye - gethit
[StateDef 2350]
MoveType  = H
Type      = S
Physics   = S
Ctrl      = 0

[State 2350, Turn]
Type = Turn
trigger1 = EnemyNear,Facing = Facing

[State 2350, Snap]
type = PosSet
trigger1 = 1
y = 0
[State 2350, Snap]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 2350, Grounded]
type = StateTypeSet
trigger1 = 1
statetype = S
physics = S

[State 2350, Anim]
type = ChangeAnim2
trigger1 = !Time 
value = 2350

[State 2350, End]
type = SelfState
trigger1 = !AnimTime
value = 0
ctrl = 1

;-----------------------------------------------------------------
;--------------------------
; Infernal Destruction
;--------------------------

;--------------------------
; Infernal Destruction
[StateDef 2500]
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 10

;-----
; Syst
[State 2500, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,700]

[State 2500, Anim 1]
type = ChangeAnim
trigger1 = !Time
value = 2501

[State 2500, SuperPause]
type = VarSet
trigger1 = Time = 0
var(9) = 73
[State 2500, SuperPause]
type = Pause
trigger1 = Time = 1
time = 75
;movetime = 35
;anim = -1
;p2defmul = 1
[State 2500, Supercharge]
type = Helper
trigger1 = !Time
name = "Supercharge Lv3"
stateno = 2910
pos = 0,0
id = 2901
ownpal = 1
supermovetime = 500

[State 2500, Power]
type = PowerAdd
trigger1 = Time = 1
value = -3000

[State 2500, Button detection reset]
type = VarSet
trigger1 = !Time
var(2) = 0

;-----
; Leap
[State 2500, Step]
type = PosAdd
trigger1 = AnimElem = 3
x = 34
[State 2500, Jump SFX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 1
[State 2500, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8520
trans = add
pos = -5,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 2500, Whoosh 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 7,3;7,1
channel = 2
[State 2500, Whoosh 2]
type = PlaySnd
trigger1 = AnimElem = 10
value = 7,7;7,2
channel = 2

[State 2500, Vel]
type = VelSet
trigger1 = AnimElem = 4
x = 2.5
y = -7
[State 2500, Boost]
type = PosAdd
trigger1 = AnimElem = 4
y = -10
[State 2500, Air]
type = StateTypeSet
trigger1 = AnimElem = 4
statetype = A
physics = N

[State 2500, Gravity - fake]
type = VelMul
trigger1 = AnimElemNo(0) = [4,7];9]
x = 0.95
y = 0.89
[State 2500, Gravity - fake]
type = VelMul
trigger1 = AnimElemNo(0) = [8,12]
x = 0.95
y = 0.75

[State 2500, Pos stop]
type = null;VelSet
trigger1 = AnimElem = 11
x = 0
y = 0

;-------
; Kick 1

[State 2500, hitspark position 1]
type = VarSet
trigger1 = !Time
var(5) = 46090

[State 2500, Hit 1]
type = HitDef
trigger1 = !Time
attr             = A, HA
hitflag          = MAF
guardflag        = MA
animtype         = Up
damage           = ceil(fvar(12)*60),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -12,-142
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -0.5,-8.5
air.velocity     = -0.5,-6.5
guard.velocity   = -7.5
getpower         = 50, 25
givepower        = 25, 12
fall             = 1
fall.recover     = 0
sparkno = S8000

;-------
; Kick 2

[State 1500, hitspark position 2]
type = VarSet
trigger1 = AnimElem = 10
var(5) = 53059

[State 2500, Hit 2]
type = HitDef
trigger1 = AnimElem = 10
attr             = A, HA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*50),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-0
hitsound         = S5,7;3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 27
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -3
air.velocity     = -5,-3
guard.velocity   = -9.5
getpower         = 25, 5
givepower        = 15, 7
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
palfx.color      = 256
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 120
forcestand       = 1
ID               = 2502
persistent = 0

[State 2500, Success - target]
type = TargetState
trigger1 = AnimElemNo(0) = [10,12]
trigger1 = MoveHit
trigger1 = NumTarget(2502)
trigger1 = Target(2502),StateNo != [2510,2515]
ID = 2502
value = 2510
ignorehitpause = 1

;-----
; FAIL
[State 2500, Air - fail]
type = StateTypeSet
trigger1 = Anim = 2501
trigger1 = AnimElem = 14
trigger1 = !NumTarget(2502)
statetype = A
physics = A
[State 2550, Fail anim]
type = ChangeAnim
trigger1 = AnimElem = 16
trigger1 = !NumTarget(2502)
value = Anim
elem = 21

;--------------
; Camera fixing
[State 2500, Camera]
Type = ScreenBound
trigger1 = NumTarget(2502)
trigger1 = Anim = 2501
trigger1 = AnimElemNo(0) >= 12
trigger1 = AnimElem = 22, < 6
value = 1
Movecamera = 1,0

[State 2500, Width]
type = Width
trigger1 = NumTarget(2502)
trigger1 = Anim = 2501
trigger1 = AnimElem = 12, >= 0
trigger1 = AnimElem = 12, < 14
edge = 80 + 10*(Time - 50),58 + 3*(Time - 50);100

;------
; Shoot
[State 2500, Voice charge]
type = PlaySnd
trigger1 = Anim = 2501
trigger1 = Time = 1
value = 2500,1
channel = 3
[State 2500, Voice 1]
type = PlaySnd
trigger1 = Anim = 2501
trigger1 = AnimElem = 8
value = 2500,0
channel = 3
[State 2500, Voice 2]
type = PlaySnd
trigger1 = Anim = 2501
trigger1 = AnimElem = 18
value = 2500,2
channel = 3
[State 2500, Voice fail]
type = StopSnd
trigger1 = Anim = 2501
trigger1 = AnimElem = 12
trigger1 = !NumTarget(2502)
channel = 3
[State 2500, Voice fail]
type = PlaySnd
trigger1 = Anim = 2501
trigger1 = AnimElem = 15
trigger1 = !NumTarget(2502)
value = 801,0
channel = 3

[State 2500, Whoosh 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = 7,7
channel = 2
[State 2500, Whoosh 2]
type = PlaySnd
trigger1 = AnimElem = 10
value = 7,10
Channel = 2

[State 2500, Raikouha]
type = Helper
trigger1 = Anim = 2501
trigger1 = AnimElem = 18
name = "Raikouha"
stateno = 2550
pos = 30,-100
id = 2550
ownpal = 1
supermovetime = 35

[State 2500, Supercharge]
type = Helper
triggerAll = Anim = 2501
triggerAll = NumTarget(2502)
triggerAll = NumHelper(2550)
trigger1 = Helper(2550),Time = 13
name = "Raikouha sparks"
stateno = 2560
pos = 0,0
id = 2560
ownpal = 1
supermovetime = 500
persistent = 0

[State 2020, Damage]
type = TargetLifeAdd
triggerAll = Anim = 2501
triggerAll = NumTarget(2502)
triggerAll = NumHelper(2550)
trigger1 = Helper(2550),Time = 13
trigger2 = Helper(2550),Time = 20
trigger3 = Helper(2550),Time = 27
trigger4 = Helper(2550),Time = 34
trigger5 = Helper(2550),Time = 41
trigger6 = Helper(2550),Time = 48
trigger7 = Helper(2550),Time = 55
value = -ceil(fvar(12)*30)
kill = 0
ignorehitpause = 1

[State 2500, Blast pushback]
type = VelSet
trigger1 = Anim = 2501
trigger1 = AnimElem = 18
x = -2.5
y = -3
[State 2500, Pushback gravity - fake]
type = VelMul
trigger1 = Anim = 2501
trigger1 = AnimElemNo(0) = [18,20]
x = 0.95
y = 0.9
[State 2500, Pos stop]
type = null;VelSet
trigger1 = Anim = 2501
trigger1 = AnimElem = 21
x = 0
y = 0

[State 2500, Air]
type = StateTypeSet
trigger1 = Anim = 2501
trigger1 = AnimElem = 21
statetype = A
physics = A

;-------------
; Raikouha hit

[State 2500, Beam hit]
type = TargetState
trigger1 = Anim = 2501
trigger1 = NumTarget(2502)
trigger1 = Numhelper(2550)
trigger1 = Helper(2550),AnimElem = 9
ID = 2502
value = 2514
persistent = 0

;-----
; Land
[State 2500, Land]
type = PosSet
trigger1 = Anim = 2501
trigger1 = !AnimTime
y = 0
[State 2500, StateType]
type = StateTypeSet
trigger1 = Anim = 2501
trigger1 = !AnimTime
statetype = S
physics = S

[State 2500, End]
type = ChangeState
triggerAll = !AnimTime
trigger1 = Anim = 2501
value = 52
ctrl = 0
;--------------------------
; ID - gethit : Hitpause
[StateDef 2510]
Type     = A
MoveType = H
Physics  = N
velset   = 0, 0

[State 2510, Hover]
type = PosSet
trigger1 = !Time
trigger1 = Pos Y > -60
y = -60

[State 2510, Anim]
Type = ChangeAnim
trigger1 = 1
value = 5002

[State 2510, Turn]
type = Turn
trigger1 = !Time
trigger1 = EnemyNear,Facing = Facing

[State 2510, End]
Type = ChangeState
trigger1 = HitShakeOver
value = 2511
;-----------------
; ID - gethit : Sent flying
[StateDef 2511]
Type     = A
MoveType = H
Physics  = N

[State 2511, Vel]
Type = VelSet
trigger1 = !Time
x = -15
y = 2
[State 2511, Accel]
Type = null;VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 2511, Screen]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0, 1
[State 2511, Push]
Type = PlayerPush
trigger1 = 1
value = 0

[State 2511, Anim]
Type = ChangeAnim
trigger1 = !Time
value = 5030

;-----------------
; Hitting the wall
[State 2511, Wall hit]
Type = ChangeAnim2
trigger1 = BackEdgeBodyDist <= 10 || FrontEdgeBodyDist <= 10
trigger1 = Anim != 4101
trigger1 = Time > 12
value = 4101
persistent = 0

[State 2511, Bounce X vel]
Type = VelSet
trigger1 = Anim = 4101
x = 6
persistent = 0

[State 2511, Turn]
Type = Turn
trigger1 = Anim = 4101
trigger1 = FrontEdgeDist < BackEdgeDist
persistent = 0

[State 2511, Pos]
Type = PosSet
trigger1 = Anim = 4101
trigger1 = FrontEdgeDist < BackEdgeDist
x = -160 * Facing
persistent = 0
[State 2511, Pos]
Type = PosFreeze
trigger1 = Anim = 4101

[State 2511, Push]
Type = PlayerPush
trigger1 = Anim = 4101
value = 1

[State 2511, Snd]
Type = PlaySnd
trigger1 = Anim = 4101
value = F7,0
persistent = 0
[State 2511, FX]
Type = Explod
trigger1 = Anim = 4101
Anim = F72
pos = 0, Floor(ScreenPos Y) -50
posType = Back
SprPriority = 3
persistent = 0

[State 2511, Bounce on wall]
Type = ChangeState
trigger1 = Anim = 4101
trigger1 = !AnimTime
value = 2512
;---

[State 2511, Hitting ground]
Type = null;SelfState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5100
;-----------------
; ID - gethit : Bounce downward
[StateDef 2512]
MoveType  = H
Type      = A
Physics   = N
VelSet    = 0,0
Ctrl      = 0

[State 2512, Screen]
Type = ScreenBound
trigger1 = 1
value = 1
Movecamera = 0, 1

[State 2512, Anim]
Type = ChangeAnim
trigger1 = HitShakeOver
value = 5061

[State 2512, Fall vel]
Type = VelSet
trigger1 = HitShakeOver
x = -4
y = 12

[State 2512, Turn]
Type = Turn
trigger1 = EnemyNear,Facing != Facing

[State 2512, Hit ground]
Type = ChangeState
trigger1 = HitShakeOver
trigger1 = Pos Y >= 0
value = 2513
;-------------
;ID - gethit : Bouncing on ground
[StateDef 2513]
Type     = L
MoveType = H
Physics  = N

[State 2513, Anim]
Type = ChangeAnim
trigger1 = !Time
value = 5100

[State 2513, Pos]
Type = PosSet
trigger1 = Anim = 5100
y = 0

[State 2513, EnvShake]
Type = EnvShake
trigger1 = !Time
time = 14
ampl = -4

[State 2513, SFX]
Type = null;PlaySnd
trigger1 = !Time
value = F7,1

[State 2513, Bounce anim]
Type = ChangeAnim
triggerAll = Anim = 5100
trigger1 = Time >= 3
trigger2 = !AnimTime
value = 5160
ignorehitpause = 1
;-------------
[State 2513, Bounce statetype]
type = StateTypeSet
trigger1 = Anim = 5160
movetype  = H
statetype = A
physics   = N

[State 2513, PSet]
Type = PosSet
trigger1 = Anim = 5160
y = 0
persistent = 0

[State 2513, Bounce vel]
Type = VelSet
trigger1 = Anim = 5160
;trigger1 = PrevStateNo = 4000
y = -8
persistent = 0
[State 2513, Bounce vel]
Type = VelSet
trigger1 = Anim = 5160
trigger1 = P2Dist X > 0
;trigger1 = PrevStateNo != 4000
x = 2
persistent = 0
[State 2513, Bounce vel]
Type = VelSet
trigger1 = Anim = 5160
trigger1 = P2Dist X < 0
;trigger1 = PrevStateNo != 4000
x = -2
persistent = 0

[State 2513, Bounce VAdd]
Type = VelAdd
trigger1 = Anim = 5160
y = 0.4

[State 2513, End]
Type = SelfState
trigger1 = Anim = 5160
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
value = 5110

;--------------------------
; ID - gethit : Raikouha
[StateDef 2514]
Type     = A
MoveType = H
Physics  = N
velset   = 0, 0

[State 2514, Anim]
Type = ChangeAnim
trigger1 = !Time
value = 5030

[State 2514, Turn]
type = Turn
trigger1 = !Time
trigger1 = EnemyNear,Facing = Facing

[State 2514, Pos fix]
type = PosAdd
trigger1 = !Time
x = -10
y = 30

[State 2514, End]
type = NotHitBy
trigger1 = Time < 48
value = SCA, AA, AP, AT

;--------------------------
; ID - Raikouha
[StateDef 2550]
MoveType  = A
Type      = A
Physics   = N
Velset    = 0,0
Ctrl      = 0
Juggle    = 0

[State 2550, Bind]
type = BindToParent
trigger1 = 1
pos = 30,-100

[State 2550, Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = Anim != 2550
value = 2550
ignorehitpause = 1

[State 2550, NHB]
type = NotHitBy
trigger1 = 1
value = SCA,AT,AA,AP
ignorehitpause = 1

[State 2550, HOR]
type = HitOverride
trigger1 = 1
stateno = 2550
attr = SCA,AA,AT,AP
ignorehitpause = 1

[State 2550, Angle]
type = AngleSet
trigger1 = 1
value = -37-Random%6+floor(Time/10);-40
[State 2550, Scale-rotate]
type = AngleDraw
trigger1 = 1
scale = 0.5,0.3
ignorehitpause = 1

[State 2550, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2550, Spr]
type = SprPriority
trigger1 = 1
value = 5
ignorehitpause = 1

[State 2550, No shadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2550, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 20000

;---
[State 2550, Hitsounds medium]
type = PlaySnd
triggerAll = Parent,NumTarget(2502)
trigger1 = Time = 13
trigger2 = Time = 20
trigger3 = Time = 27
trigger4 = Time = 34
trigger5 = Time = 41
trigger6 = Time = 48
trigger7 = Time = 55
value = 1210,4
ignorehitpause = 1

[State 2550, Hitsparks]
type = Explod
triggerAll = Parent,NumTarget(2502)
trigger1 = Time = 13
trigger2 = Time = 20
trigger3 = Time = 27
trigger4 = Time = 34
trigger5 = Time = 41
trigger6 = Time = 48
trigger7 = Time = 55
anim = 8004
sprpriority = 5
scale = 0.3,0.3
pos = floor(Parent,P2Dist X+Random%25) - 40,floor(Parent,P2Dist Y+Random%15) + 35;20,-15+Random%25
ignorehitpause = 1
[State 2550, Hit counter]
type = HitAdd
triggerAll = Parent,NumTarget(2502)
trigger1 = Time = 13
trigger2 = Time = 20
trigger3 = Time = 27
trigger4 = Time = 34
trigger5 = Time = 41
trigger6 = Time = 48
trigger7 = Time = 55
value = 1
ignorehitpause = 1

[State 2550, Shake]
type = envshake
triggerAll = Parent,NumTarget(2502)
trigger1 = Time = 13
trigger2 = Time = 20
trigger3 = Time = 27
trigger4 = Time = 34
trigger5 = Time = 41
trigger6 = Time = 48
trigger7 = Time = 55
time = 6
freq = 60
ampl = 6
ignorehitpause = 1
;---

[State 2550, Hit]
type = HitDef
trigger1 = AnimElemNo(0) = [40,42]
trigger1 = Parent,NumTarget(2502)
attr             = S, HP
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(parent,fvar(12)*80),20
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-0
hitsound         = S1210,11
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 27
ground.hittime   = 27
guard.hittime    = 20
ground.velocity  = -8,-5
air.velocity     = -8,-5
guard.velocity   = -9.5
getpower         = 0, 0
givepower        = 0, 0
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
palfx.color      = 256
palfx.mul        = 128,128,128
palfx.add        = 0,0,0
palfx.sinadd     = 256,256,256,6
palfx.time       = 120
fall             = 1
fall.recover     = 0
ID = 2550
persistent = 0

[State 2550, Final burst]
type = Explod
trigger1 = NumTarget(2550)
anim = 1215
scale = 0.85,0.85
pos = floor(Parent,P2Dist X) - 40,floor(Parent,P2Dist Y) + 40
trans = add
sprpriority = 4
ignorehitpause = 1
persistent = 0

[State 2010, End]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1
;-----------------------------------------------------------------
