;--------------------------
; BASICS & STRING COMBOS.ST
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
; FVar(11) : custom combo dampener after FVar(10) >= 3
; FVar(12) : CvS2 life&power damage scaling system added to combo dampener
;--------------------------

;--------------------------
; Standing
;--------------------------

;--------------------------
; Stand far Light Punch
[StateDef 200]
Anim      = 200
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
trigger1 = PrevStateNo != [200,400]

[State 200, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 200, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 70085

[State 200, Anim fix]
type = ChangeAnim
trigger1 = PrevStateNo != [200,201]
trigger1 = AnimElem = 4, = 3
value = Anim
elem = 5
[State 200, Anim fix 2]
type = ChangeAnim
trigger1 = PrevStateNo != [200,201]
trigger1 = AnimElem = 5, = 2
value = Anim
elem = 6

[State 200, Pos]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 310
x = 6

[State 200, Flash Punch Combo 2 pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 200
x = 10
persistent = 0
[State 200, Kishin Rekkou pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 210
x = 16
persistent = 0

[State 200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 200, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 2
value = 7,0
channel = 2
persistent = 0

; Electric sparks
[State 200, 1st spark]
type = Helper
trigger1 = PrevStateNo = 310
trigger1 = AnimElem = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = 35,-68
[State 200, 2nd spark]
type = Helper
trigger1 = PrevStateNo = 310
trigger1 = AnimElem = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = 61,-89
[State 200, 3rd spark]
type = Helper
trigger1 = PrevStateNo = 310
trigger1 = AnimElem = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = 34,-81

[State 200, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 10
ground.hittime   = 14;15
guard.hittime    = 10;11 (v2013)
ground.velocity  = -2
air.velocity     = -2,-3
guard.velocity   = -4.5
getpower         = 50, 25
givepower        = 25, 12
fall.recovertime = 40
ground.cornerpush.veloff = 0;-7
sparkno = S8000
[State 200, Hit - FPC2]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = [200,201]
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-85
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 11
ground.hittime   = 13
guard.hittime    = 14
ground.velocity  = -2
air.velocity     = -2,-3
guard.velocity   = -4.5
getpower         = 50, 25
givepower        = 25, 12
ground.cornerpush.veloff = 0
sparkno = S8000

[State 200, Hit - Kazama Style 6 Hit Combo 2]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 310
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*20),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -70,-85
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 10
ground.hittime   = 12;13
guard.hittime    = 10;11 (v2013)
ground.velocity  = -2
air.velocity     = -2,-3
guard.velocity   = -3.5
getpower         = 50, 25
givepower        = 25, 12
fall.recovertime = 40
ground.cornerpush.veloff = 0
sparkno = S8000

[State 200, Flash Punch Combo 2]
type = VarSet
triggerAll = Time > 2
triggerAll = PrevStateNo != [200,700]
trigger1 = AnimElemNo(0) < 5
trigger1 = !AILevel
trigger1 = Command = "x"
trigger1 = !Var(1)
var(1) = 200

[State 200, Flash Punch Combo 3]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo = 200 || PrevStateNo = 201
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = !Var(1)
var(1) = 240

[State 200, Left Right]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != [200,600]
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel && Command != "holdback"
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = !Var(1)
var(1) = 202

[State 200, Left Jab to Double Low / Jab, Knee Popper / 10HC 2]
type = VarSet
triggerAll = Time > 2
triggerAll = PrevStateNo != [200,500]
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel && Command = "holddown"
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = !Var(1)
var(1) = 211;4211

[State 200, Jab, Knee Popper to Left Sidekick / 10HC 3]
type = VarSet
trigger1 = Var(1) = 211
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
var(1) = 1233

[State 200, Stinger feint after Ni Rengeki input]
type = null;VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != 200 && PrevStateNo != 210
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = Var(1) = 210
var(1) = 245

[State 200, Ni Rengeki]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != [200,299]; && PrevStateNo != 210
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = !Var(1)
var(1) = 210

[State 200, Feint Kick]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != [200,299]; && PrevStateNo != 210
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = !Var(1)
var(1) = 245

[State 200, KS5HC 3]
type = VarSet
trigger1 = AnimElemNo(0) < 6
trigger1 = Var(1) = 210
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
var(1) = 5235
ignorehitpause = 1

[State 200, Kishin Rekkou 3]
type = VarSet
trigger1 = Time > 2
trigger1 = PrevStateNo = [210,211]
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b"
trigger1 = !Var(1)
var(1) = 213

[State 200, Flash Punch Combo 2]
type = null;VelSet
trigger1 = !Time
trigger1 = PrevStateNo = 200 || PrevStateNo = 201
x = 4

[State 200, String - Left Jab to Double Low]
type = ChangeState
triggerAll = AnimElemNo(0) >= 6
trigger1 = Var(1) = 211;4211
trigger2 = Var(1) = 1233
value = 211

[State 200, String - Stinger feint]
type = null;ChangeState
trigger1 = AnimElemNo(0) >= 5
trigger1 = Var(1) = 245
value = 210

[State 200, KS5HC 2]
type = ChangeState
trigger1 = AnimElemNo(0) >= 5
trigger1 = Var(1) = 5235
value = 210

[State 200, String]
type = ChangeState
trigger1 = AnimElemNo(0) >= 5
trigger1 = Var(1)
trigger1 = Var(1) != 1233
value = Var(1)

[State 200, Idle]
type = StateTypeSet
trigger1 = AnimElem = 4, = 0
movetype = I

[State 200, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand close Light Punch / Right Elbow
[StateDef 201]
Anim      = 201
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
trigger1 = PrevStateNo != [200,400]

[State 201, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 201, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 48081

[State 201, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 201, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,1;7,0
channel = 2

[State 201, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -38,-84
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 10
guard.slidetime  = 9
ground.hittime   = 13
guard.hittime    = 9
ground.velocity  = -2
air.velocity     = -2,-3
guard.velocity   = -4.5
getpower         = 50, 25
givepower        = 25, 12
ground.cornerpush.veloff = 0;-6
sparkno = S8000

[State 201, Flash Punch Combo 2]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel && Command = "x"
trigger1 = !Var(1)
var(1) = 200

[State 201, close Left Right]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel && Command != "holdback"
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = !Var(1)
var(1) = 202

[State 201, close Jab to Double Low]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel && Command = "holddown"
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = !Var(1)
var(1) = 211

[State 201, close Ni Rengeki]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = !Var(1)
var(1) = 210

[State 200, Feint Kick]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != [200,299]; && PrevStateNo != 210
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = !Var(1)
var(1) = 245

[State 200, KS5HC 3]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = Var(1) = 210
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
var(1) = 5235;5202

[State 201, String]
type = ChangeState
trigger1 = AnimElem = 6, >= 2
trigger1 = Var(1) = 4211
value = 211

[State 200, KS5HC 2]
type = ChangeState
trigger1 = AnimElem = 6, >= 2
trigger1 = Var(1) = 5235;5202
value = 210

[State 201, String]
type = ChangeState
trigger1 = AnimElem = 6, >= 2
trigger1 = Var(1)
value = Var(1)

[State 201, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6
movetype = I

[State 201, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand far Medium Punch
[StateDef 202]
Anim      = 202
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 202, O7HC Anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 211 || PrevStateNo = 233
value = 206

[State 202, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 2000
var(1) = 0

[State 202, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 78079

[State 202, Pos]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 200
x = 7

[State 202, O7HC Pos]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 211 || PrevStateNo = 233
x = 8;15

[State 202, O7HC Anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 211 || PrevStateNo = 233
value = Anim
elem = 3

[State 202, Voice]
type = PlaySnd
trigger1 = AnimElem = 3, = 0
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 202, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,4;7,1
Channel = 2

[State 202, Left Right Combo / close Double Thrust anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = [200,201]
value = Anim
elem = 3

; Electric sparks
[State 202, 1st spark]
type = Helper
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElem = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = -21,-76
[State 202, 2nd spark]
type = Helper
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElem = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = -2,-81
[State 202, 3rd spark]
type = Helper
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElem = 4, = 1
name = "Spark"
stateno = 8500
ownpal = 1
pos = 27,-86
[State 202, 4th spark]
type = Helper
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElem = 5
name = "Spark"
stateno = 8500
ownpal = 1
pos = 67,-74
[State 202, 5th spark]
type = Helper
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElem = 5, = 1
name = "Spark"
stateno = 8500
ownpal = 1
pos = 73,-80
[State 202, 6th spark]
type = Helper
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElem = 7
name = "Spark"
stateno = 8500
ownpal = 1
pos = 57,-76

[State 202, Hit]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo != [200,201]
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 18
ground.hittime   = 18
guard.hittime    = 14
ground.velocity  = -4.5
air.velocity     = -1, -2.5
guard.velocity   = -4.5
getpower         = 87, 37
givepower        = 37, 17
ground.cornerpush.veloff = 0;-10
sparkno = S8000

[State 202, Hit - Left Right Combo 2]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = [200,201]
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*50),0
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
ground.velocity  = -5
air.velocity     = -3, -3
guard.velocity   = -4.5
getpower         = 87, 37
givepower        = 37, 17
ground.cornerpush.veloff = 0
fall.recover     = 0
sparkno = S8000

[State 202, Hit - O7HC]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 211 || PrevStateNo = 233
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 14
ground.hittime   = 14
guard.hittime    = 12
ground.velocity  = -5
air.velocity     = -3, -3
guard.velocity   = -4.5
getpower         = 87, 37
givepower        = 37, 17
ground.cornerpush.veloff = 0
fall.recover     = 0
sparkno = S8000

[State 202, Demon Slayer]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "z" || Command = "rel_z"
trigger1 = !Var(1)
var(1) = 330

[State 202, Left Right Inner Axe]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo = [200,201]
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = !Var(1)
var(1) = 310

[State 202, Left Right Spinning Hook Kick / Switch Blade]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != [202,500]
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b" || Command = "c" || Command = "rel_c"
trigger1 = !Var(1)
var(1) = 215

[State 202, KS5HC TEMP 3]
type = null;VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo = 210
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel && Command = "x"
trigger1 = !Var(1)
var(1) = 203

[State 202, KS5HC TEMP 4]
type = null;VarSet
trigger1 = Var(1) = 203
trigger1 = !AILevel && Command = "b"
var(1) = 213

[State 202, Double Thrust]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != [200,210]
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = !Var(1)
var(1) = 230

[State 202, O7HC 6]
type = VarSet
triggerAll = Time > 2
trigger1 = Var(1) = 3202
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b"
var(1) = 3213

[State 230, Low Trick Kick]
type = null;VarSet
;triggerAll = PrevStateNo = 203
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel && Command = "b"
trigger1 = Var(1) = 212
var(1) = 234

[State 230, Roundhouse]
type = null;VarSet
triggerAll = Time > 2
triggerAll = PrevStateNo = 203
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel && Command = "b"
trigger1 = !Var(1)
var(1) = 212

[State 230, String - Low Trick Kick]
type = null;ChangeState
trigger1 = AnimElem = 6, >= 2
trigger1 = Var(1) = 234
value = 212

[State 202, O7HC 6]
type = ChangeState
trigger1 = AnimElemNo(0) >= 7
trigger1 = Var(1) = 3213
value = 213
ignorehitpause = 1
[State 202, KS5HC 4]
type = null;ChangeState
trigger1 = AnimElem = 6, >= 2
trigger1 = Var(1) = 213
value = 203

[State 202, String]
type = ChangeState
trigger1 = AnimElem = 6, >= 2
trigger1 = Var(1)
trigger1 = Var(1) < 1000
value = Var(1)
;trigger1 = Var(1) = 330 || Var(3) = 230

;[State 202, String - 2]
;type = ChangeState
;trigger1 = AnimElemNo(0) >= 7
;trigger1 = Var(1)
;value = Var(1)

[State 202, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 202, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand close Medium Punch
[StateDef 203]
Anim      = 203
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 203, KS5HC fix 1]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 235
value = Anim
elem = 2

[State 203, KS5HC fix 2]
type = PosAdd
triggerAll = !Time
trigger1 = PrevStateNo = 235
x = 21

[State 203, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) != 213
var(1) = 0

[State 203, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 38084

[State 203, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 203, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,5;7,1
Channel = 2

[State 203, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-81
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 19
guard.slidetime  = 15
ground.hittime   = 19
guard.hittime    = 15
ground.velocity  = -3
air.velocity     = -2.5, -4.5
guard.velocity   = -4.5
getpower         = 87, 37
givepower        = 37, 17
ground.cornerpush.veloff = 0
sparkno = S8000

[State 203, Hit - KS5HC]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 235
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-77
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
guard.slidetime  = 16
ground.hittime   = 11
guard.hittime    = 9
ground.velocity  = -3
air.velocity     = -2.5, -4.5
guard.velocity   = -4.5
getpower         = 87, 37
givepower        = 37, 17
ground.cornerpush.veloff = 0
sparkno = S8000

[State 203, Close Double Thrust]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = !Var(1)
var(1) = 230

[State 203, KS5HC 5]
type = VarSet
triggerAll = !AILevel
triggerAll = !Var(1)
trigger1 = Command = "b" || Command = "rel_b"
trigger1 = PrevStateNo = 235
var(1) = 213
ignorehitpause = 1
;trigger1 = AnimElemNo(0) < 8

[State 203, Demon Slayer]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo = 201
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y" || Command = "z" || Command = "rel_z"
trigger1 = !Var(1)
var(1) = 330

[State 203, Left Right Inner Axe]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo = 201
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = !Var(1)
var(1) = 310

[State 202, Left Right Spinning Hook Kick / Switch Blade]
type = VarSet
triggerAll = Time > 2
;trigger1 = PrevStateNo = 201
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b" || Command = "c" || Command = "rel_c"
trigger1 = !Var(1)
var(1) = 215

[State 203, String]
type = ChangeState
trigger1 = AnimElem = 4, > 2
trigger1 = Var(1)
value = Var(1)

[State 203, Idle]
type = StateTypeSet
trigger1 = AnimElem = 4
movetype = I

[State 203, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand far Heavy Punch
[StateDef 204]
Anim      = 204
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 204, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 204, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 74079

[State 204, Voice]
type = PlaySnd
trigger1 = AnimElem = 3, = 0
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 204, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 3
value = 7,8;7,2
Channel = 2
persistent = 0

[State 204, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 17
ground.hittime   = 22
guard.hittime    = 17
ground.velocity  = -11
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
ID               = 204
sparkno = S8000

[State 204, Counter hit collapse]
type = TargetState
trigger1 = MoveHit
trigger1 = Var(4)
trigger1 = NumTarget(204)
value = 4150
ID = 204
persistent = 0

[State 204, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand close Heavy Punch
[StateDef 205]
Anim      = 205
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 205, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 205, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 43079
[State 205, hitspark position]
type = VarSet
trigger1 = AnimElemNo(0) = 5
var(5) = 28106


[State 205, Voice]
type = PlaySnd
trigger1 = AnimElem = 4, = 0
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 205, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 4
value = 7,9;7,2
Channel = 2
persistent = 0

[State 205, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 17
ground.hittime   = 22
guard.hittime    = 17
ground.velocity  = -8
air.velocity     = -3, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
sparkno = S8000
[State 205, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = AnimElemNo(0) = 5
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-106
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 17
ground.hittime   = 22
guard.hittime    = 17
ground.velocity  = -8
air.velocity     = -3, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
persistent = 0
sparkno = S8000

[State 205, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand far Light Kick
[StateDef 210]
Anim      = 210
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
trigger1 = PrevStateNo != [200,400]

[State 210, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 5000
trigger1 = Var(1) != 1210
var(1) = 0
[State 210, String fix]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) = 5235
var(1) = 235

[State 210, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 48093

[State 210, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 210, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,2
Channel = 2

[State 210, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-93
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 10
ground.hittime   = 14;13
guard.hittime    = 10
ground.velocity  = -4.5
air.velocity     = -3, -3
guard.velocity   = -4
getpower         = 50, 25
givepower        = 25, 12
ground.cornerpush.veloff = 0
sparkno = S8000

[State 210, Hit - Ni Rengeki]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 200 || PrevStateNo = 201
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-93
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 10
guard.slidetime  = 11
ground.hittime   = 13;13
guard.hittime    = 13
ground.velocity  = -2.5
air.velocity     = -1.5, -3
guard.velocity   = -4
getpower         = 50, 25
givepower        = 25, 12
ground.cornerpush.veloff = 0
sparkno = S8000

[State 210, Ni Rengeki Sen]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel && Command = "back"
trigger1 = PrevStateNo = 200 || PrevStateNo = 201; || PrevStateNo = 211
;trigger1 = !Var(1)
var(1) = 105

[State 210, KS5HC 3]
type = VarSet
triggerAll = Time > 2
triggerAll = AnimElemNo(0) < 7
triggerAll = !AILevel
triggerAll = Command = "y" || Command = "rel_y"
triggerAll = !Var(1)
trigger1 = PrevStateNo = 200
trigger2 = PrevStateNo = 201
var(1) = 235
ignorehitpause = 1

[State 210, KS5HC 4]
type = VarSet
triggerAll = AnimElemNo(0) < 7
triggerAll = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = Var(1) = 235
var(1) = 5236;5203

;[State 210, Feint Kick Combo]
;type = VarSet
;triggerAll = Time > 2
;trigger1 = AnimElemNo(0) < 3
;trigger1 = !AILevel && Command = "a"
;trigger1 = PrevStateNo = 200
;trigger1 = !Var(1)
;var(1) = 245

[State 210, Kishin Rekkou]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = PrevStateNo != 200 && PrevStateNo != 201 && PrevStateNo != 211
trigger1 = !Var(1)
var(1) = 200

[State 210, 10HC 4 TEMP]
type = VarSet
triggerAll = AnimElemNo(0) < 7
triggerAll = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = Var(1) = 1210
var(1) = 1214

[State 210, KS5HC 3]
type = ChangeState
trigger1 = Var(1) = 5236;5203
trigger1 = AnimElemNo(0) >= 6
value = 235

[State 210, Feint Kick Combo early cancel]
type = ChangeState
trigger1 = Var(1) = 245
trigger1 = AnimElemNo(0) >= 3; before the actual kick
value = Var(1)

[State 210, String]
type = ChangeState
trigger1 = AnimElemNo(0) >= 6
trigger1 = Var(1) = 1214
value = 214

[State 210, String]
type = ChangeState
trigger1 = AnimElemNo(0) >= 6
trigger1 = Var(1)
trigger1 = !(PrevStateNo = 200 && Var(1) = 210)
trigger1 = Var(1) != [1210,1214]
value = Var(1)

[State 210, Idle]
type = StateTypeSet
trigger1 = AnimElem = 5, = 0
movetype = I

[State 210, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand close Light Kick
[StateDef 211]
Anim      = 211
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
trigger1 = PrevStateNo != [200,400]

[State 211, Left Jab to Double Low slower animation]
type = null;ChangeAnim
trigger1 = !Time
trigger1 = Var(1) = 4211
value = 4211

[State 211, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1000
var(1) = 0

[State 211, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 58021

[State 211, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 211, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 3
value = 7,3;7,1
Channel = 2
persistent = 0

[State 211, Left Jab to Double Low pos fix]
type = PosAdd
triggerAll = !Time
trigger1 = PrevStateNo = 200
x = 15
[State 211, close LP to Double Low pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 201
x = 7
[State 211, 10HC 8 pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 232
x = 11
[State 211, 10HC 8 pos fix 2]
type = PosAdd
trigger1 = AnimElem = 2
trigger1 = PrevStateNo = 232
x = 15

[State 211, Hit - normal]
type = HitDef
trigger1 = !Time ; PrevStateNo = 251 || PrevStateNo = 232 || PrevStateNo = 330
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-21
hitsound         = S5,0
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 15
guard.slidetime  = 14
ground.hittime   = 15
guard.hittime    = 11
ground.velocity  = -4.5
air.velocity     = -3, -3
guard.velocity   = -4
getpower         = 50, 25
givepower        = 25, 12
ground.cornerpush.veloff = 0
sparkno = S8000

[State 211, Hit - 10HC - O7HC]
type = HitDef
trigger1 = !Time 
trigger1 = PrevStateNo = 232 || PrevStateNo = 330
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-21
hitsound         = S5,0
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 13
guard.slidetime  = 14
ground.hittime   = 13
guard.hittime    = 9
ground.velocity  = -4.5
air.velocity     = -3, -3
guard.velocity   = -4
getpower         = 50, 25
givepower        = 25, 12
ground.cornerpush.veloff = 0
sparkno = S8000

[State 210, Kishin Rekkou]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = PrevStateNo != [200,400]
trigger1 = !Var(1)
var(1) = 200

[State 211, Left Jab to Double Low]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b"
trigger1 = PrevStateNo = 200 || PrevStateNo = 201
var(1) = 213

[State 211, KS5HC]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = PrevStateNo = 201
trigger1 = !Var(1)
var(1) = 235

[State 211, Jab, Knee Popper to Sidekick / 10HC 3]
type = VarSet
triggerAll = Time > 2
triggerAll = AnimElemNo(0) < 7
triggerAll = !AILevel && Command = "a"
trigger1 = PrevStateNo = 200 || PrevStateNo = 201
trigger1 = Var(1) = 4211 || !Var(1)
;trigger1 = PrevStateNo != 200 && PrevStateNo != 201
;trigger1 = !Var(1)
var(1) = 1233

[State 211, Knee Popper to Sidekick]
type = null;VarSet
triggerAll = Time > 2
triggerAll = AnimElemNo(0) < 7
triggerAll = !AILevel && Command = "a"
trigger1 = PrevStateNo != [200,299]
trigger1 = !Var(1)
var(1) = 233

[State 211, 10HC 9]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b"
trigger1 = PrevStateNo = 232
var(1) = 1234

[State 211, O7HC 5]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = PrevStateNo = 330
var(1) = 3202

[State 211, String - 10HC 3]
type = ChangeState
trigger1 = AnimElem = 6, > 0
trigger1 = Var(1) = 1233
value = 233

[State 211, String - 10HC 9]
type = ChangeState
trigger1 = AnimElem = 6, > 0
trigger1 = Var(1) = 1234
value = 234

[State 211, String - O7HC 5]
type = ChangeState
trigger1 = AnimElem = 6, > 0
trigger1 = Var(1) = 3202
value = 202

[State 211, String]
type = ChangeState
trigger1 = AnimElem = 6, > 0
trigger1 = Var(1)
trigger1 = Var(1) < 1000
value = Var(1)

[State 211, Idle]
type = StateTypeSet
trigger1 = AnimElem = 5, = 0
movetype = I

[State 211, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand far Medium Kick
[StateDef 212]
Anim      = 212
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 212, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) != 234 ; unless already canceled into Low Trick Kick
var(1) = 0

[State 212, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 74063

[State 212, Voice]
type = PlaySnd
trigger1 = AnimElem = 4, = 0
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 212, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 3
value = 7,6;7,2
Channel = 2
persistent = 0

[State 212, Mid Left Punch Roundhouse Kick Pos Add]
type = PosAdd
triggerAll = PrevStateNo = 230
trigger1 = !Time
trigger2 = AnimElem = 2
trigger3 = AnimElem = 3
x = 4

[State 212, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
air.animtype     = Back
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-63
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
ground.hittime   = 18
guard.hittime    = 14
ground.velocity  = -8.5
air.velocity     = -2.2, -4.8
guard.velocity   = -8
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 212, Shake]
type = EnvShake
trigger1 = MoveHit
trigger1 = PrevStateNo = 230
time = 12
freq = 60
ampl = 6
persistent = 0

[State 212, Keito]
type = VarSet
trigger1 = AnimElem = 6, < 3
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = PrevStateNo != [200,300]
trigger1 = !Var(1)
var(1) = 214

[State 212, Low Trick Kick]
type = null;VarSet
triggerAll = Time > 2
trigger1 = AnimElem = 3, < 3; early cancel
trigger1 = !AILevel && Command = "b"
trigger1 = PrevStateNo = 230 || PrevStateNo = 202
trigger1 = !Var(1)
var(1) = 234

[State 212, Low Trick Kick cancel]
type = null;ChangeState
trigger1 = AnimElem = 3, > 1; early cancel but not instantaneous
trigger1 = Var(1)
value = Var(1)

[State 212, Low Trick Kick cancel]
type = ChangeState
trigger1 = AnimElem = 3, > 1
trigger1 = Var(1) = 234
value = Var(1)

[State 212, String]
type = ChangeState
trigger1 = AnimElem = 5, > 3
trigger1 = Var(1)
value = Var(1)

[State 212, Idle]
type = StateTypeSet
trigger1 = AnimElem = 5, = 0
movetype = I

[State 212, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand close Medium Kick
[StateDef 213]
Anim      = 213
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 213, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1000
var(1) = 0

[State 213, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 75034

[State 213, Voice]
type = PlaySnd
trigger1 = AnimElem = 3, = 0
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 213, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 7,7;7,2
Channel = 2

[State 213, O7HC / KS5HC Anim fix]
type = ChangeAnim
triggerAll = !Time
trigger1 = PrevStateNo = 202 && Var(1) = 3213
trigger2 = PrevStateNo = 203
value = Anim
elem = 2

[State 213, Kishin Rekkou 3 / O7HC 6 pos fix]
type = PosAdd
triggerAll = !Time
trigger1 = PrevStateNo = 200
x = 17
[State 213, O7HC 6 pos fix]
type = PosAdd
triggerAll = !Time
trigger1 = PrevStateNo = 202 && Var(1) = 3213
x = 20

[State 213, KS5HC GFX]
type = Explod
trigger1 = PrevStateNo = 236
trigger1 = AnimElem = 3, = 2
anim = 1055
pos = 82,-28;71,-27
scale = 0.4,0.4
trans = add
sprpriority = 5
bindtime = -1

[State 213, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*60),0
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
ground.velocity  = -8.5
air.velocity     = -2.2, -4.8
guard.velocity   = -8
getpower         = 87, 37
givepower        = 37, 17
ground.cornerpush.veloff = 0
sparkno = S8000

[State 213, Hit - Left Jab to Double Low / Kishin Rekkou]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 211; || PrevStateNo = 200
attr             = S, NA
hitflag          = MAF
guardflag        = L
animtype         = Medium
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-34
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14;28
guard.slidetime  = 6;16
ground.hittime   = 14;18
guard.hittime    = 6;16
ground.velocity  = -8.5
air.velocity     = -2.2, -4.8
guard.velocity   = -8
getpower         = 87, 37
givepower        = 37, 17
ground.cornerpush.veloff = 0
sparkno = S8000

[State 213, Hit - KS5HC - low knockdown]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 201 || PrevStateNo = 203 || PrevStateNo = 236
attr             = S, NA
hitflag          = MAF
guardflag        = L
animtype         = Back
damage           = ceil(fvar(12)*50),0
pausetime        =  4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-34
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 26
guard.slidetime  = 2
ground.hittime   = 26
guard.hittime    = 2
ground.velocity  = -2.5, -3.5
air.velocity     = -2.2, -4.8
guard.velocity   = -8
getpower         = 87, 37
givepower        = 37, 17
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
fall.recover     = 0
ground.cornerpush.veloff = 0
sparkno = S8000

[State 213, O7HC 7]
type = VarSet
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = Var(1) = 3213
var(1) = 3214;3350

[State 213, Keito]
type = VarSet
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = PrevStateNo != [200,300]
trigger1 = !Var(1)
var(1) = 214

[State 213, O7HC 7]
type = ChangeState
trigger1 = AnimElem = 5, >= 2
trigger1 = Var(1) = 3214
value = 214
[State 213, String]
type = ChangeState
trigger1 = AnimElem = 5, >= 4
trigger1 = Var(1) != [3213,3214]
trigger1 = Var(1)
value = Var(1)

[State 213, Idle]
type = StateTypeSet
trigger1 = AnimElem = 5, = 0
movetype = I

[State 213, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand far Heavy Kick
[StateDef 214]
Anim      = 214
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 214, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1000
var(1) = 0

[State 214, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 40095

[State 214, Keito Anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 251
value = Anim
elem = 4
[State 214, O7HC Pos fix 1]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 251
x = 20

[State 214, O7HC Anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 213
trigger1 = Var(1) > 1000
value = 1050
elem = 4
[State 214, O7HC Pos fix 1]
type = PosAdd
trigger1 = !Time
trigger1 = Anim = 1050
x = 13
[State 214, O7HC Pos fix 2]
type = PosAdd
trigger1 = Anim = 1050
trigger1 = AnimElemNo(0) = 6
x = 17
[State 214, O7HC Anim fix 2]
type = ChangeAnim
trigger1 = Anim = 1050
trigger1 = AnimElemNo(0) = 6
value = 214
elem = 6
[State 214, O7HC Width]
type = Width
trigger1 = !Time
trigger1 = AnimElemNo(0) = 5
value = 42,-18
[State 214, O7HC Pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = AnimElemNo(0) = 5
x = 41
[State 214, O7HC Width 2]
type = Width
trigger1 = !Time
trigger1 = AnimElemNo(0) = 5
value = 22,-18

[State 214, Keito 2 Anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = [212,213]
trigger1 = Var(1) < 1000
value = Anim
elem = 5
[State 214, Keito 2 Pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 212
trigger1 = Var(1) < 1000
x = 9
[State 214, Keito 2 Pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 213
trigger1 = Var(1) < 1000
x = 13

[State 214, Voice]
type = PlaySnd
trigger1 = AnimElem = 6, = 0
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 214, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 6
value = 7,10;7,3
Channel = 2
persistent = 0

[State 214, Pos 1]
type = PosAdd
trigger1 = AnimElem = 3, = 0
x = 9
[State 214, Pos 2]
type = PosAdd
trigger1 = AnimElem = 4, = 0
x = 15
[State 214, Pos 3]
type = PosAdd
trigger1 = AnimElem = 5, = 0
trigger2 = AnimElem = 7, = 0
x = 17
[State 214, Pos 3]
type = PosAdd
trigger1 = AnimElem = 6, = 0
x = 20

[State 214, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-95
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 22
guard.slidetime  = 17
ground.hittime   = 22
guard.hittime    = 17
ground.velocity  = -11
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
ground.cornerpush.veloff = 0
sparkno = S8000

[State 214, Hit - 10HC 4]
type = HitDef
trigger1 = !Time
trigger1 = Var(1) = 1214
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
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
ground.velocity  = -6
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
ground.cornerpush.veloff = 0
sparkno = S8000

[State 214, Keito - Zenshin]
type = VarSet
trigger1 = AnimElemNo(0) < 12
trigger1 = !AILevel && Command = "holdfwd"
trigger1 = PrevStateNo = 251 || PrevStateNo = [212,213]
trigger1 = !Var(1)
var(1) = 1100

[State 214, 10HC 5]
type = VarSet
trigger1 = AnimElemNo(0) < 12
trigger1 = !AILevel
trigger1 = Command = "z" || Command = "rel_z"
trigger1 = Var(1) = 1214
var(1) = 1251

[State 214, 10HC 5]
type = ChangeState
trigger1 = AnimElem = 10, >= 3
trigger1 = Var(1) = 1251
value = 251

[State 214, Zenshin]
type = ChangeState
trigger1 = AnimElem = 10, >= 3
trigger1 = Var(1) && Var(1) < 2000
trigger1 = Var(1) != 1214 && Var(1) != 1251
value = Var(1)

[State 214, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stand close Heavy Kick
[StateDef 215]
Anim      = 215
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 215, Anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 405 || PrevStateNo = [202,203]
value = 216

[State 215, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 215, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 73098

[State 215, Voice]
type = PlaySnd
trigger1 = AnimElem = 4, = 0
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 215, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 4
value = 7,11;7,3
Channel = 2
persistent = 0

[State 215, Spinning Hook Kick pos fix]
type = PosAdd
trigger1 = Time < 2
trigger1 = PrevStateNo = 405 || PrevStateNo = [202,203]
x = 10

[State 215, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-98
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 21
ground.hittime   = 21
guard.hittime    = 16
ground.velocity  = -11
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
sparkno = S8000

[State 215, Hit - Spinning Hook Kick]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 405 || PrevStateNo = [202,203]
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = DiagUp
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-98
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 18
guard.slidetime  = 16
ground.hittime   = 18
guard.hittime    = 16
ground.velocity  = -2,-4.5
air.velocity     = -2, -4.5
guard.velocity   = -4.5
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
sparkno = S8000

[State 215, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 215, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Mid Left Punch / Left Drill Punch / Evil Intent 2 - dfLP
[StateDef 230]
Anim      = 230
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 7

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 230, Evil Intent anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 251
value = 231

[State 230, Evil Intent pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 251
x = 14

[State 230, Evil Intent slide]
type = VelSet
trigger1 = !Time
trigger1 = PrevStateNo = 251
x = 6.5

[State 230, Pos]
type = PosAdd
trigger1 = AnimElem = 4
x = 4
[State 230, Pos 2]
type = PosAdd
trigger1 = AnimElem = 5
x = 11

[State 230, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 230, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 53077

[State 230, Voice]
type = PlaySnd
triggerAll = !(Random%2)
trigger1 = Anim = 230
trigger1 = AnimElem = 4, = 0
trigger2 = Anim = 231
trigger2 = AnimElem = 2, = 0
value = 200, random%3
channel = 3

[State 230, Whoosh]
type = PlaySnd
trigger1 = Anim = 230
trigger1 = AnimElemNo(0) = 4
trigger2 = Anim = 231
trigger2 = AnimElemNo(0) = 2
value = 7,11;7,1
Channel = 2
persistent = 0

[State 230, EI2 GFX]
type = Explod
trigger1 = Time = 4
trigger1 = Anim = 231
anim = 229
trans = add
scale = 0.4,0.4
sprpriority = 5
bindtime = 12
removeongethit = 1
[State 230, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = Anim = 231
value = 7,24;7,4
channel = 4

[State 230, PosAdd]
type = PosAdd
trigger1 = Anim = 230
trigger1 = AnimElem = 2
trigger1 = PrevStateNo != 405
x = 23

[State 230, Double Thrust anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 405 || PrevStateNo = [202,203]
value = Anim
elem = 3

[State 230, Width]
type = Width
trigger1 = PrevStateNo = 405 || PrevStateNo = [202,203]
trigger1 = AnimElem = 3
value = 30,-18

[State 230, Double Thrust PosAdd]
type = PosAdd
trigger1 = PrevStateNo = [202,203]
trigger1 = AnimElem = 3
x = 30
[State 230, crouch Double Thrust PosAdd]
type = PosAdd
trigger1 = Anim = 230
trigger1 = AnimElem = 3
trigger1 = PrevStateNo = 405
x = 19

; Electric sparks
[State 230, 1st spark]
type = Helper
trigger1 = AnimElem = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = -12,-57
[State 230, 2nd spark]
type = Helper
trigger1 = AnimElem = 5
name = "Spark"
stateno = 8500
ownpal = 1
pos = 39,-58
[State 230, 3rd spark]
type = Helper
trigger1 = AnimElem = 7
name = "Spark"
stateno = 8500
ownpal = 1
pos = 52,-71

[State 230, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-77
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 19
ground.hittime   = 22
guard.hittime    = 19
ground.velocity  = -6.5
air.velocity     = -2, -2
guard.velocity   = -6
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 230, Evil Intent 2 Hit]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 251
attr             = S, NA
hitflag          = HAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-77
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 17
guard.slidetime  = 15
ground.hittime   = 17
guard.hittime    = 15
ground.velocity  = -6.5
air.velocity     = -2.5, -2
guard.velocity   = -6
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 230, Low Trick Kick]
type = VarSet
trigger1 = Anim = 230
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = !Var(1)
;trigger1 = !AILevel && Command = "b"
;trigger1 = Var(1) = 212
var(1) = 234

[State 230, Roundhouse]
type = VarSet
triggerAll = Time > 2
trigger1 = Anim = 230
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b"
trigger1 = !Var(1)
var(1) = 212

[State 251, Evil Intent 3]
type = VarSet
triggerAll = Time > 2
trigger1 = Anim = 231
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = !Var(1)
var(1) = 1111

[State 251, Twin Lancer 2]
type = VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo != [200,500]
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = !Var(1)
var(1) = 232

[State 230, String - Low Trick Kick]
type = ChangeState
trigger1 = AnimElem = 6, > 2
trigger1 = Var(1) = 234
value = 212

[State 230, String]
type = ChangeState
triggerAll = Var(1)
trigger1 = Anim = 230
trigger1 = AnimElem = 6, > 2
trigger2 = Anim = 231
trigger2 = AnimElem = 5, > 3
value = Var(1)

[State 230, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 230, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Twin Lancer 2 / Laser Breaker 3 / 10HC 7
[StateDef 232]
Anim      = 232
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 232, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1000
var(1) = 0

[State 232, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 67064

[State 232, Pos 1]
type = PosAdd
trigger1 = AnimElem = 2
x = 5
[State 232, Pos 2]
type = PosAdd
trigger1 = AnimElem = 3
x = 14
[State 232, Pos 3]
type = PosAdd
trigger1 = AnimElem = 6
x = 11

[State 232, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,9;7,2
Channel = 2
[State 232, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 7,24;7,4
channel = 4
[State 232, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8521
trans = add
pos = 40,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

[State 232, GFX]
type = Helper
trigger1 = !Time
name = "Twin Lancer electricity"
stateno = 238
ownpal = 1
pos = -18,-40

[State 232, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-64
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 1;14
guard.slidetime  = 12;11
ground.hittime   = 1;14
guard.hittime    = 12;11
ground.velocity  = -2
air.velocity     = -2,-2
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
ID               = 232
;p2facing         = -1
sparkno = S8000
; overhead

[State 232, 10HC 7 Hit no fall]
type = HitDef
trigger1 = !Time
trigger1 = Var(1) = 1232
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-64
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
guard.slidetime  = 11
ground.hittime   = 14
guard.hittime    = 11
ground.velocity  = -5
air.velocity     = -3,-2
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000
; overhead

;[State 232, Bound]
;type = null;TargetState
;triggerAll = Var(3)%10 < 3 ; Bound limiter
;trigger1 = Target,StateType != S && Target,StateType != C
;trigger1 = NumTarget(232)
;trigger1 = PrevStateNo = 230
;trigger1 = MoveHit
;trigger1 = Target,StateNo != [4000,4002]
;value = 4000

;[State -2, Bound]
;type = TargetState
;triggerAll = Var(3)%10 < 3 ; Bound limiter
;triggerAll = NumTarget
;triggerAll = Target,StateNo != [4000,4002]
;triggerAll = MoveHit
;trigger1 = StateNo = 232 && PrevStateNo = 230 && MoveHit;NumTarget(232) ; Twin Lancer hit 2 causes Bound in all cases
;trigger2 = StateNo = 310 && (Target,StateType = A || Var(4)) ; Left Axe Kick causes Bound on Counter or on airborne target
;trigger3 = StateNo = 1160 && (Target,StateType = A || Var(4)) && MoveHit = 1 ; Stinger causes Bound on Counter or on airborne target
;value = 4000
;ignorehitpause = 1

[State 232, Zenshin]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel && Command = "holdfwd"
trigger1 = !Var(1)
trigger1 = PrevStateNo = 230
var(1) = 1100;1105

[State 232, 10HC 8]
type = VarSet
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = Var(1) = 1232
var(1) = 2211

[State 232, 10HC 8]
type = ChangeState
trigger1 = AnimElem = 5, > 3
trigger1 = Var(1) = 2211
value = 211

[State 232, String]
type = ChangeState
trigger1 = AnimElem = 5, > 3
trigger1 = Var(1)
trigger1 = Var(1) != 1232
value = Var(1)

[State 232, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Left Sidekick
[StateDef 233]
Anim      = 233
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 233, Feint Kick Combo anim]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 245
value = 239
[State 233, Width]
type = Width
trigger1 = !Time
trigger1 = Anim = 239
value = 27,-18
[State 233, Pos add]
type = PosAdd
trigger1 = !Time
trigger1 = Anim = 239
x = 26

[State 233, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1000
var(1) = 0

[State 233, Heat Seeker animation skip]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 245
value = Anim
elem = 2

[State 233, O7HC 4]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 330
x = 40

[State 233, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 59074

[State 233, Whoosh]
type = PlaySnd
trigger1 = Anim = 233
trigger1 = AnimElem = 2
trigger2 = Anim = 239
trigger2 = AnimElem = 3
value = 7,2;7,1
Channel = 2

[State 233, Width]
type = Width
trigger1 = Anim = 233
trigger1 = AnimElemNo(0) = [3,4]
trigger2 = Anim = 239
trigger2 = AnimElemNo(0) = [5,4]
value = 35,-18

[State 233, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-74
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 18
ground.hittime   = 22
guard.hittime    = 18
ground.velocity  = -6.5
air.velocity     = -1, -3
guard.velocity   = -6.5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 233, O7HC 4 Hit]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 330
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-74
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 18
ground.hittime   = 22
guard.hittime    = 18
ground.velocity  = -3.5
air.velocity     = -1, -3
guard.velocity   = -3.5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 233, Sidekick Sen]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel && Command = "holdback"
trigger1 = PrevStateNo = 211
var(1) = 105

[State 233, Left Sidekick to Stinger]
type = VarSet
trigger1 = Time > 2
trigger1 = AnimElemNo(0) < 6
trigger1 = PrevStateNo != 245
trigger1 = PrevStateNo != 211
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "c" || Command = "rel_c"
var(1) = 1245

[State 233, 10HC 4]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = Var(1) = 1233
var(1) = 1214

[State 233, O7HC 5]
type = VarSet
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = PrevStateNo = 330
var(1) = 3202

[State 233, String - 10HC 4]
type = ChangeState
trigger1 = AnimElem = 6, > 2
trigger1 = Var(1) = 1214
value = 214;350

[State 233, String - O7HC 5]
type = ChangeState
trigger1 = AnimElem = 6, > 2
trigger1 = Var(1) = 3202
value = 202

[State 233, String - Left Sidekick to Stinger]
type = ChangeState
trigger1 = AnimElem = 5, >= 0
trigger1 = AnimElemNo(0) < 6
trigger1 = Var(1) = 1245
value = 245

[State 233, String]
type = ChangeState
trigger1 = AnimElem = 6, > 2
trigger1 = Var(1) = 105
value = Var(1)

[State 233, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Low Trick Kick - Lunging Low Roundhouse Kick
[StateDef 234]
Anim      = 1050
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
trigger1 = PrevStateNo != [200,400]

[State 234, Anim fix - Low Trick Kick]
type = ChangeAnim
triggerAll = !Time
trigger1 = PrevStateNo = 212 && Anim = 212 && AnimElem = 3, > 2 ; double take case
value = 1051
[State 234, Pos fix - Low Trick Kick]
type = PosAdd
trigger1 = Anim = 1051
trigger1 = AnimElemNo(0) = 1; double take from canceling Right Roundhouse Kick into Low Trick Kick
x = 12
persistent = 0
[State 234, Pos fix - Low Trick Kick]
type = PosAdd
trigger1 = Anim = 1051
trigger1 = AnimElemNo(0) = 3; double take from canceling Right Roundhouse Kick into Low Trick Kick
x = 5
persistent = 0

[State 234, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1000
var(1) = 0

[State 234, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 67035

[State 234, Voice]
type = PlaySnd
triggerAll = !(Random%2)
trigger1 = Anim = 1050
trigger1 = AnimElem = 2
trigger2 = Anim = 1051
trigger2 = AnimElem = 3
value = 201, random%4
channel = 3

[State 234, Whoosh]
type = PlaySnd
trigger1 = Anim = 1050
trigger1 = AnimElem = 2
trigger2 = Anim = 1051
trigger2 = AnimElem = 3
value = 7,10;7,2
Channel = 2

[State 234, 10HC 9 Width]
type = Width
trigger1 = !Time
trigger1 = PrevStateNo = 211
value = 28,-18
[State 234, 10HC 9 Pos]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 211
x = 28
[State 234, 10HC 9 Width 2]
type = Width
trigger1 = !Time
trigger1 = PrevStateNo = 211
value = 22,-18

[State 234, GFX]
type = Explod
trigger1 = Anim = 1050
trigger1 = AnimElem = 2, = 1
trigger2 = Anim = 1051
trigger2 = AnimElem = 3, = 1
anim = 1055
pos = 71,-27
scale = 0.4,0.4
trans = add
sprpriority = 5
bindtime = -1

[State 234, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = LA
animtype         = Back
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-35
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 14
guard.slidetime  = 15
ground.hittime   = 13
guard.hittime    = 15
ground.velocity  = -1.5,-4.5
air.velocity     = -1.5, -4.5
guard.velocity   = -8
getpower         = 50, 25
givepower        = 25, 12
fall             = 1
fall.recover     = 0
sparkno = S8000
; low attack

[State 233, 10HC 10]
type = VarSet
triggerAll = Time > 2
trigger1 = Anim = 1050
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y" || Command = "z" || Command = "rel_z"
trigger1 = Var(1) = 1234
var(1) = 1020

[State 233, String]
type = ChangeState
trigger1 = Anim = 1050
trigger1 = AnimElemNo(0) >= 6
trigger1 = Var(1)
trigger1 = Var(1) != 1234
value = Var(1)

[State 233, Idle]
type = StateTypeSet
trigger1 = Anim = 1050
trigger1 = AnimElem = 4, = 0
trigger2 = Anim = 1051
trigger2 = AnimElem = 5, = 0
movetype = I

[State 234, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; KS5HC 3 / Right gut punch
[StateDef 235]
Anim      = 235
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 235, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 2000
var(1) = 0
[State 235, String fix]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) = 5236
var(1) = 236

[State 235, Pos fix]
type = PosAdd
trigger1 = !Time
x = 7

[State 235, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 65056

[State 202, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 201, random%4
channel = 3

[State 202, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,5;7,1
Channel = 2

; Electric sparks
[State 202, 1st spark]
type = Helper
trigger1 = AnimElem = 1
name = "Spark"
stateno = 8500
ownpal = 1
pos = -10,-66
[State 202, 2nd spark]
type = Helper
trigger1 = AnimElem = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = 11,-57
[State 202, 3rd spark]
type = Helper
trigger1 = AnimElem = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = 62,-61
[State 202, 4th spark]
type = Helper
trigger1 = AnimElem = 6
name = "Spark"
stateno = 8500
ownpal = 1
pos = 57,-48

[State 235, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-56
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
guard.slidetime  = 12
ground.hittime   = 14
guard.hittime    = 12
ground.velocity  = -4.5
air.velocity     = -2.5, -4.5
guard.velocity   = -4
ground.cornerpush.veloff = 0
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 202, KS5HC TEMP 3]
type = null;VarSet
triggerAll = Time > 2
trigger1 = PrevStateNo = 210
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = !Var(1)
var(1) = 236

[State 202, KS5HC TEMP 4]
type = VarSet
trigger1 = Var(1) = 236
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b"
var(1) = 5213

[State 235, KS5HC 4]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 7
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = !Var(1)
trigger1 = PrevStateNo = 210 || PrevStateNo = 211
var(1) = 236

[State 235, String]
type = ChangeState
trigger1 = AnimElemNo(0) >= 5
trigger1 = Var(1)
value = 236

[State 235, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; KS5HC 4
[StateDef 236]
Anim      = 237
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
trigger1 = PrevStateNo != [200,400]

[State 203, KS5HC fix 1]
type = ChangeAnim
trigger1 = !Time
value = Anim
elem = 2

[State 203, KS5HC fix 2]
type = PosAdd
trigger1 = !Time
x = 25

[State 203, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 5000
var(1) = 0
[State 203, String fix]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) = 5213
var(1) = 213

[State 203, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 48081

[State 203, Voice]
type = PlaySnd
trigger1 = AnimElem = 3, = 0
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 203, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,1;7,1
Channel = 2

; Electric sparks
[State 202, 1st spark]
type = Helper
trigger1 = AnimElem = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = 45,-74

[State 203, Hit - KS5HC]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-77
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 25
guard.slidetime  = 25
ground.hittime   = 20
guard.hittime    = 18
ground.velocity  = -3
air.velocity     = -2.5, -4.5
guard.velocity   = -4.5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 203, KS5HC 5]
type = VarSet
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b"
trigger1 = !Var(1)
var(1) = 213
ignorehitpause = 1
;trigger1 = AnimElemNo(0) < 8

[State 203, String]
type = ChangeState
trigger1 = AnimElem = 6, > 3
trigger1 = Var(1)
value = Var(1)

[State 203, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 203, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Flash Punch Combo 3
[StateDef 240]
Anim      = 240
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 240, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 240, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 72073

[State 240, Pos 1]
type = PosAdd
trigger1 = !Time
x = 9
[State 240, Pos 2]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 6
trigger3 = AnimElem = 7
trigger4 = AnimElem = 9
x = 15
[State 240, Pos 3]
type = PosAdd
trigger1 = AnimElem = 3
x = 7
[State 240, Pos 4]
type = PosAdd
trigger1 = AnimElem = 8
x = 11

[State 240, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 3
value = 7,5;7,2
channel = 1
persistent = 0

[State 240, Width]
type = Width
trigger1 = AnimElemNo(0) = 4
value = 30,-18
[State 240, Width 2]
type = Width
trigger1 = AnimElem = 5
value = 22,-18

[State 240, GFX]
type = Explod
trigger1 = AnimElem = 4
anim = 1310
pos = 71, -73
trans = add
scale = 0.4,0.4
sprpriority = 5
[State 240, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8521
trans = add
pos = 56,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

; Electric sparks
[State 240, 1st spark]
type = Helper
trigger1 = AnimElem = 1, = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = -6,-66
[State 240, 2nd spark]
type = Helper
trigger1 = AnimElem = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = 33,-64
[State 240, 3rd spark]
type = Helper
trigger1 = AnimElem = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = 69,-76
[State 240, 4th spark]
type = Helper
trigger1 = AnimElem = 5, = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = 62,-64

[State 240, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-73
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 6
ground.hittime   = 22
guard.hittime    = 6
ground.velocity  = -14
air.velocity     = -5, -3
guard.velocity   = -12.5
ground.cornerpush.veloff = 0;-24
getpower         = 87, 37
givepower        = 37, 17
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
sparkno = S8000

[State 240, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Stinger
[StateDef 245]
Anim      = 245
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 245, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 245, Pos]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = [200,201]
x = 22
[State 245, Pos]
type = null;PosAdd
trigger1 = AnimElem = 3
trigger1 = PrevStateNo = 233
x = 12
[State 245, Pos]
type = PosAdd
trigger1 = AnimElem = 4
trigger2 = AnimElem = 5
x = 9

[State 245, Skip]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 233
value = Anim
elem = 3
[State 245, Skip]
type = ChangeAnim
trigger1 = AnimElem = 3
trigger1 = PrevStateNo != 233
value = Anim
elem = 5

[State 245, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1)
var(1) = 0

[State 245, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 48068

[State 245, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 5, = 4
value = 7,2
Channel = 2

[State 245, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Medium
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-68
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 22
guard.slidetime  = 15
ground.hittime   = 22
air.hittime      = 45
guard.hittime    = 15
ground.velocity  = -6.5
air.velocity     = -1, -3
guard.velocity   = -6.5
getpower         = 50, 25
givepower        = 25, 12
fall.recovertime = 505
sparkno = S8000
ID = 245

;[State 245, Bound]
;type = null;TargetState
;triggerAll = Var(3)%10 < 3 ; Bound limiter
;trigger1 = NumTarget(245)
;trigger1 = MoveHit
;trigger1 = Target,StateNo != [4000,4002]
;value = 4000

;[State 1160, Bound]
;type = null;TargetState
;triggerAll = Var(3)%10 < 3 ; Bound limiter
;trigger1 = NumTarget(245)
;trigger1 = MoveHit
;trigger1 = Var(4) || Target,StateType = A
;trigger1 = Target,StateNo != [4000,4002]
;trigger1 = Target,StateNo != [120,155]
;value = 4000

[State 245, Stinger Sen]
type = VarSet
trigger1 = AnimElemNo(0) < 11
trigger1 = !AILevel && Command = "back"
trigger1 = PrevStateNo = 233
var(1) = 105
[State 245, Zenshin]
type = VarSet
trigger1 = AnimElemNo(0) < 11
trigger1 = !AILevel && Command = "holdfwd"
trigger1 = PrevStateNo = 233
var(1) = 1100

[State 245, Heat Seeker]
type = VarSet
trigger1 = Time > 2
trigger1 = AnimElemNo(0) < 11
trigger1 = PrevStateNo = [200,201]
trigger1 = !AILevel && Command = "holdback"
trigger1 = Command = "a"
var(1) = 233

[State 245, String]
type = ChangeState
trigger1 = AnimElem = 10, >= 2
trigger1 = Var(1)
value = Var(1)

[State 245, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Right Roundhouse Punch - Evil Intent/Keito 1 / 10HC 5
[StateDef 251]
Anim      = 251
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 251, Slide]
type = VelSet
trigger1 = !Time
x = 5

[State 251, Anim fix]
type = ChangeAnim
trigger1 = !Time
trigger1 = PrevStateNo = 214
value = Anim
elem = 2

[State 251, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1200
var(1) = 0

[State 251, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 58078

[State 251, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !(Random%2)
value = 201, random%4
channel = 3
[State 251, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,8;7,2
Channel = 2
[State 251, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 3
value = 7,24;7,4
channel = 4
[State 251, Dust]
type = Explod
trigger1 = AnimElem = 4
anim = 8521
trans = add
pos = 36,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

[State 251, Slide]
type = PosAdd
trigger1 = AnimElemNo(0) = 2
x = 4
persistent = 1

[State 251, Pos]
type = PosAdd
trigger1 = AnimElemNo(0) = 3
x = 18
persistent = 0

[State 251, GFX]
type = Explod
trigger1 = Time = 3
anim = 252
scale = 0.4,0.4
trans = add
sprpriority = 5
bindtime = 16
removeongethit = 1

[State 251, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 17
guard.slidetime  = 14
ground.hittime   = 17
guard.hittime    = 14
ground.velocity  = -3.5;-7;-10
air.velocity     = -2.5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
sparkno = S8000

[State 251, Hit - counter]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = Var(4)
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*60),0
pausetime        = 4,16
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-78
hitsound         = S5,7
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
guard.slidetime  = 14
ground.hittime   = 33
guard.hittime    = 14
ground.velocity  = -3.5;-7;-10
air.velocity     = -2.5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
sparkno = S8000

[State 251, Laser Breaker 2]
type = null;VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 8
trigger1 = Command = "holddown" && Command = "holdfwd"
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = !Var(1)
var(1) = 252

[State 251, 10HC 6]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = Var(1) = 1251
var(1) = 1252

[State 233, 10HC 6]
type = null;VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "z" || Command = "rel_z"
trigger1 = Var(1) = 1251
var(1) = 1252

[State 251, Evil Intent 2]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = !Var(1)
var(1) = 230

[State 251, Keito]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 8
trigger1 = !AILevel
trigger1 = Command = "c" || Command = "rel_c"
trigger1 = !Var(1)
var(1) = 214

[State 211, String - 10HC 6]
type = ChangeState
trigger1 = AnimElem = 7, >= 5
trigger1 = Var(1) = 1252
value = 252

[State 251, String]
type = ChangeState
trigger1 = AnimElem = 7, >= 5
trigger1 = Var(1)
trigger1 = Var(1) != 1251
value = Var(1)

[State 251, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 251, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Laser Breaker 2 - Twin Lancer 1 - 10HC 6
[StateDef 252]
Anim      = 236
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
trigger1 = PrevStateNo != [200,400]

[State 252, String reset]
type = VarSet
trigger1 = !Time
trigger1 = Var(1) < 1000
var(1) = 0

[State 252, Hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 40078

[State 252, Hitspark position]
type = VarSet
trigger1 = AnimElem = 4
var(5) = 23119

[State 252, Width]
type = Width
trigger1 = !Time
value = 36,-18

[State 252, Pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 251
x = 15
[State 252, Pos fix 2]
type = PosAdd
trigger1 = AnimElem = 2
x = 4
[State 252, Pos fix 3]
type = PosAdd
trigger1 = AnimElem = 3
x = 11

[State 200, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = !(Random%2)
value = 200, random%4
channel = 3

[State 252, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 2
value = 7,11;7,1
channel = 2
persistent = 0

[State 252, GFX]
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
[State 252, Elec whoosh]
Type = PlaySnd
trigger1 = AnimElem = 2
value = 7,24;7,4
channel = 4

[State 252, Hit]
type = HitDef
trigger1 = !Time
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*30),0
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
ground.velocity  = -3.5
air.velocity     = -2,-3
guard.velocity   = -5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 252, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = AnimElem = 4
attr             = S, SA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*30),0
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
ground.velocity  = -3.5
air.velocity     = -2,-3
guard.velocity   = -5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

;[State 252, 10HC 7]
;type = VarSet
;trigger1 = AnimElemNo(0) < 6
;trigger1 = !AILevel && Command = "x"
;trigger1 = Var(1) = 1252
;var(1) = 1232

[State 252, Laser Breaker 3]
type = VarSet
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "y" || Command = "rel_y"
trigger1 = Var(1) < 1000
var(1) = 232
[State 252, 10HC 7]
type = VarSet
trigger1 = AnimElemNo(0) < 6
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_y"
trigger1 = Var(1) = 1252
var(1) = 1232

[State 252, String]
type = ChangeState
trigger1 = AnimElem = 4, > 5
trigger1 = Var(1)
trigger1 = Var(1) != 1252
value = 232

[State 252, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Shun Masatsu 1
[StateDef 300]
Anim      = 300
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 300, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 300, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 84056

[State 300, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 300, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,5;7,1
Channel = 2

[State 300, Pos fix]
type = null;PosAdd
trigger1 = AnimElem = 7
x = 12

[State 300, Pos 1]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 4
[State 300, Pos 2]
type = PosAdd
trigger1 = AnimElem = 4
x = 7
[State 300, Pos 3]
type = PosAdd
trigger1 = AnimElem = 8
x = -7
[State 300, Pos 4]
type = PosAdd
trigger1 = AnimElem = 11
x = 11
[State 300, Pos 5]
type = PosAdd
trigger1 = AnimElem = 12
x = 16

; Electric sparks
[State 300, 1st spark]
type = Helper
trigger1 = AnimElem = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = -19,-54
[State 300, 2nd spark]
type = Helper
trigger1 = AnimElem = 2, = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = -13,-61
[State 300, 3rd spark]
type = Helper
trigger1 = AnimElem = 4
name = "Spark"
stateno = 8500
ownpal = 1
pos = 6,-55
[State 300, 4th spark]
type = Helper
trigger1 = AnimElem = 5
name = "Spark"
stateno = 8500
ownpal = 1
pos = 82,-52
[State 300, 5th spark]
type = Helper
trigger1 = AnimElem = 5, = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = 86,-55

[State 300, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-56
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
guard.slidetime  = 12
ground.hittime   = 14
guard.hittime    = 12
ground.velocity  = -2.5
air.velocity     = -3.5, -3
guard.velocity   = -3.5
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 300, Shun Masatsu 2]
type = VarSet
triggerAll = Time > 2
triggerAll = AnimElemNo(0) < 7
trigger1 = !AILevel && (Command = "x" || Command = "z" || Command = "rel_x" || Command = "rel_z")
trigger1 = !Var(1)
trigger2 = AILevel
trigger2 = Random < (60 + AILevel*12)
var(1) = 305

[State 300, String]
type = ChangeState
trigger1 = AnimElemNo(0) >= 6
trigger1 = Var(1)
value = Var(1)

[State 300, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 300, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Shun Masatsu 2
[StateDef 305]
Anim      = 305
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 305, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 305, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 55076

[State 305, Voice]
type = PlaySnd
trigger1 = AnimElem = 3, = 0
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 305, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 3
value = 7,4;7,0
Channel = 2
persistent = 0

[State 305, Pos fix]
type = PosAdd
trigger1 = !Time
x = 22
[State 305, Pos fix]
type = PosAdd
trigger1 = AnimElem = 2
x = 22

; Electric sparks
[State 305, 1st spark]
type = Helper
trigger1 = AnimElem = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = 45,-47
[State 305, 1st spark b]
type = Helper
trigger1 = AnimElem = 3, = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = 39,-54
[State 305, 2nd spark]
type = Helper
trigger1 = AnimElem = 5
name = "Spark"
stateno = 8500
ownpal = 1
pos = 49,-108
[State 305, 2nd spark b]
type = Helper
trigger1 = AnimElem = 5, = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = 40,-111

[State 305, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*70),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-76
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 13
guard.slidetime  = 21
ground.hittime   = 26
guard.hittime    = 21
ground.velocity  = -4
air.velocity     = -3.5, -3
guard.velocity   = -7.5
getpower         = 50, 25
givepower        = 25, 12
forcestand       = 1
sparkno = S8000

[State 305, Idle]
type = StateTypeSet
trigger1 = AnimElem = 5, = 0
movetype = I

[State 305, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Left Axe Kick
[StateDef 310]
Anim      = 310
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
trigger1 = PrevStateNo != [200,400]

[State 310, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 310, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 40060

[State 310, Voice]
type = PlaySnd
trigger1 = AnimElem = 7, = 0
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 101, Step]
Type = PlaySnd
trigger1 = AnimElem = 3
value = 100,0
channel = 1

[State 310, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 7
value = 7,6;7,2
Channel = 2

[State 310, Pos]
type = PosAdd
trigger1 = AnimElem = 1, = 0
trigger2 = AnimElem = 2, = 0
x = 18
[State 310, Pos]
type = PosAdd
trigger1 = AnimElemNo(0) = 3
x = 16
persistent = 0
[State 310, Pos]
type = PosAdd
trigger1 = AnimElemNo(0) = 6
x = 9
persistent = 0

[State 310, Wind GFX]
type = Explod
trigger1 = AnimElem = 8
anim = 311
trans = add
pos = 49,-32
scale = 0.4,0.4
sprpriority = 5
ownpal = 1
removeongethit = 1
[State 310, Stomp SFX]
type = PlaySnd
trigger1 = AnimElem = 9
value = 40,1
channel = 1
[State 310, Dust]
type = Explod
trigger1 = AnimElem = 9
anim = 8521
trans = add
pos = 24,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 310, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Medium
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-60
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
guard.slidetime  = 15
ground.hittime   = 20;21
guard.hittime    = 16
ground.velocity  = -1.5
air.velocity     = -1.5, -3
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
forcestand       = 1
ID               = 310
sparkno = S8000

[State 310, Hit - Left Right Inner Axe]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 405 || PrevStateNo = 202 || PrevStateNo = 203
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Medium
damage           = ceil(fvar(12)*50),0
pausetime        = 4,6;2,2
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-60
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 20
guard.slidetime  = 15
ground.hittime   = 20
guard.hittime    = 15
ground.velocity  = -2
air.velocity     = -1.5, -3
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
forcestand       = 1
ID               = 310
sparkno = S8000

;[State 310, Bound]
;type = null;TargetState
;triggerAll = Var(3)%10 < 3 ; Bound limiter
;trigger1 = NumTarget(310)
;trigger1 = MoveHit
;trigger1 = Var(4) || Target,StateType = A
;trigger1 = Target,StateNo != [4000,4002]
;trigger1 = Target,StateNo != [120,155]
;value = 4000

[State 310, KS6HC]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElem = 10, < 3
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
trigger1 = !Var(1)
trigger1 = PrevStateNo != 405 && PrevStateNo != 202 && PrevStateNo != 203
var(1) = 200

[State 310, String]
type = ChangeState
trigger1 = AnimElem = 10, >= 3
trigger1 = Var(1)
value = Var(1)

[State 310, Idle]
type = StateTypeSet
trigger1 = AnimElem = 9, = 0
movetype = I

[State 310, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Demon''s Paw
[StateDef 320]
Anim      = 320
MoveType  = A
Type      = S
Physics   = S
Ctrl      = 0
Poweradd  = 12

[State 320, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 320, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 69079

[State 320, Vel]
type = VelSet;Mul
trigger1 = !Time
x = 4;0.5

[State 320, Width]
type = Width
trigger1 = AnimElem = 2
value = 27,-18
[State 320, Pos]
type = PosAdd
trigger1 = AnimElem = 2
x = 27

[State 320, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 320, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,9;7,2
Channel = 2

[State 320, GFX]
type = Explod
trigger1 = AnimElem = 3, = 2
anim = 1310
pos = 73,-71
trans = add
scale = 0.7,0.7
sprpriority = 5
ownpal = 1
[State 320, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8521
trans = add
pos = 40,0
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

[State 320, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*70),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 19
guard.slidetime  = 11
ground.hittime   = 19
guard.hittime    = 11
ground.velocity  = -7,0.5
air.velocity     = -3.5,-3
guard.velocity   = -9.5
getpower         = 87, 37
givepower        = 37, 17
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
ID               = 320
sparkno = S8000

[State 320, Counter hit collapse]
type = null;TargetState
trigger1 = MoveHit
trigger1 = Var(4)
trigger1 = NumTarget(320)
value = 4150
ID = 320
persistent = 0

[State 320, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Corpse Thrust / Demon Slayer 3 / Omen 7 Hit Combo 3
[StateDef 330]
Anim      = 330
MoveType  = A
Type      = S
Physics   = S
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 330, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 330, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 57065

[State 200, Voice]
type = PlaySnd
trigger1 = AnimElem = 5, = 0
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 330, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4;5
value = 7,9;7,2
Channel = 2

[State 330, Demon Slayer pos fix]
type = PosAdd
trigger1 = !Time
trigger1 = PrevStateNo = 202 || PrevStateNo = 405
x = 21

[State 330, Pos 1]
type = PosAdd
trigger1 = AnimElemNo(0) = 2
x = 9
persistent = 0
[State 330, Pos 2]
type = PosAdd
trigger1 = AnimElemNo(0) = 3
x = 2
persistent = 0
[State 330, Pos 3]
type = PosAdd
trigger1 = AnimElemNo(0) = 4
x = 8
persistent = 0
[State 330, Pos 4]
type = PosAdd
trigger1 = AnimElemNo(0) = 6
x = 8
persistent = 0
[State 330, Pos 5]
type = PosAdd
trigger1 = AnimElemNo(0) = 8
x = 14
persistent = 0

[State 330, GFX]
type = Explod
trigger1 = AnimElem = 6
anim = 1310
pos = 59,-65
trans = add
scale = 0.7,0.7
sprpriority = 5
ownpal = 1
[State 330, Dust]
type = Explod
trigger1 = AnimElem = 5
anim = 8521
trans = add
pos = 45,7
scale = 0.15,0.15
sprpriority = 5
ownpal = 1

[State 330, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-65
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
guard.slidetime  = 16
ground.hittime   = 15
guard.hittime    = 15
ground.velocity  = -6,-2.2
air.velocity     = -4.5, -2.2
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
fall             = 1
sparkno = S8000

[State 330, Demon Slayer 3 Hit]
type = HitDef
trigger1 = !Time
trigger1 = PrevStateNo = 405 || PrevStateNo = [202,203]
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-65
hitsound         = S5,3
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 16
guard.slidetime  = 16
ground.hittime   = 25
guard.hittime    = 19
ground.velocity  = -7.5
air.velocity     = -4.5, -3
guard.velocity   = -8.5
getpower         = 100, 50
givepower        = 50, 25
envshake.time    = 16
envshake.freq    = 120
envshake.ampl    = 6
sparkno = S8000

[State 330, O7HC]
type = VarSet
triggerAll = Time > 2
trigger1 = AnimElemNo(0) < 9
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
trigger1 = !Var(1)
var(1) = 3233;3211

[State 330, String - O7HC 4]
type = ChangeState
trigger1 = AnimElemNo(0) >= 9
trigger1 = Var(1) = 3233;3211
value = 233;211

[State 330, Idle]
type = StateTypeSet
trigger1 = AnimElem = 7, = 0
movetype = I

[State 330, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Left Spinning Jump Kick
[StateDef 340]
Anim      = 340
MoveType  = A
Type      = S
Physics   = S
Ctrl      = 0
Poweradd  = 12

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,400]

[State 340, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 340, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 56079

[State 340, Voice]
type = PlaySnd
trigger1 = AnimElem = 4
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 340, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,6
Channel = 2

[State 340, Pos 1]
type = PosAdd
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
x = 14

[State 340, Jump]
type = VelSet
trigger1 = AnimElem = 3
x = 2
y = -1.6
[State 340, Jump SFX]
type = PlaySnd
trigger1 = AnimElem = 3
value = 40,0
channel = 1
[State 340, Dust]
type = Explod
trigger1 = AnimElem = 3
anim = 8520
trans = add
pos = -22,0
scale = 0.2,0.2
sprpriority = 5
ownpal = 1

[State 340, Air]
type = StateTypeSet
trigger1 = AnimElem = 3
statetype = A
physics = N
[State 340, Gravity]
type = VelAdd
trigger1 = AnimElemNo(0) = [3,7]
y = 0.2
[State 340, Land]
type = StateTypeSet
trigger1 = AnimElem = 8
statetype = S
physics = S

[State 340, Land Pos]
type = PosSet
trigger1 = AnimElemNo(0) >= 8
trigger1 = Pos Y != 0
y = 0
[State 340, Land Vel]
type = VelSet
triggerAll = AnimElemNo(0) >= 8
trigger1 = Vel Y != 0
trigger2 = Vel X != 0
x = 0
y = 0
[State 340, Land SFX]
type = PlaySnd
trigger1 = AnimElem = 8
value = 40,1
channel = 1
[State 340, Land dust]
type = Explod
trigger1 = AnimElem = 8
anim = 8510
trans = add
scale = 0.25,0.25
sprpriority = -5

[State 340, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-79
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 18
guard.slidetime  = 15
ground.hittime   = 18
guard.hittime    = 15
ground.velocity  = -2
air.velocity     = -2, -3
guard.velocity   = -4
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 340, Hit - counter]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = var(4)
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Back
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-59
hitsound         = S5,7
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 18
guard.slidetime  = 9
ground.hittime   = 18
guard.hittime    = 9
ground.velocity  = -2
air.velocity     = -2, -3
guard.velocity   = -4
getpower         = 87, 37
givepower        = 37, 17
envshake.time    = 12
envshake.freq    = 60
envshake.ampl    = 4
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 340, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;-----------------------------------------------------------------
; Amara
[StateDef 360]
Anim      = 360
MoveType  = A
Type      = A
Physics   = A
Ctrl      = 0
Poweradd  = 25
VelSet    = 0,0

[State 360, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 53059

[State 360, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 360, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,3
Channel = 2

[State 360, Physics]
type = StateTypeSet
trigger1 = !Time
physics = N
statetype = A
[State 360, Dive]
type = VelSet
trigger1 = AnimElem = 5
x = 5
y = 7

[State 360, Hit]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = ceil(fvar(12)*70),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-59
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 22
guard.slidetime  = 10
ground.hittime   = 22
guard.hittime    = 10
ground.velocity  = -2
air.velocity     = -2, -3
getpower         = 100, 50
givepower        = 50, 25
sparkno = S8000

[State 360, Hit - counter]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = var(4)
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Back
damage           = 70,0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-59
hitsound         = S5,7
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 22
guard.slidetime  = 10
ground.hittime   = 22
guard.hittime    = 10
ground.velocity  = -2
air.velocity     = -2, -3
getpower         = 100, 50
givepower        = 50, 25
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 360, End]
type = ChangeState
trigger1 = Pos Y >= 0
value = 52
;-----------------------------------------------------------------
; Crouching
;--------------------------

;--------------------------
; Crouch Light Punch
[StateDef 400]
Anim      = 400
MoveType  = A
Type      = C
Physics   = C
Velset    = 0,0
Ctrl      = 0

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,500]

[State 400, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 400, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 47057

[State 400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2, = 0
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 400, Whoosh]
type = PlaySnd
trigger1 = AnimElemNo(0) = 2
value = 7,0
channel = 2
persistent = 0

[State 400, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-57
hitsound         = S5,0
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
guard.slidetime  = 10
ground.hittime   = 14
guard.hittime    = 10
ground.velocity  = -2
air.velocity     = -3.5, -2.5
guard.velocity   = -2
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 400, crouch Left Right Combo]
type = VarSet
trigger1 = !Var(1)
trigger1 = AnimElemNo(0) < 4
trigger1 = !AILevel && Command != "holdback"
trigger1 = Command = "y" || Command = "rel_y"
var(1) = 405

[State 400, String]
type = ChangeState
trigger1 = Var(1)
trigger1 = AnimElem = 3, > 2
value = Var(1)

[State 400, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;-----------------------------------------------------------------
; Crouch Medium Punch
[StateDef 405]
Anim      = 405
MoveType  = A
Type      = C
Physics   = C
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,500]

[State 405, String reset]
type = VarSet
trigger1 = !Time
var(1) = 0

[State 405, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 60056

[State 405, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 405, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,4;7,1
Channel = 2

; Electric sparks
[State 202, 1st spark]
type = Helper
trigger1 = PrevStateNo = 400
trigger1 = AnimElem = 1
name = "Spark"
stateno = 8500
ownpal = 1
pos = -33,-53
[State 202, 2nd spark]
type = Helper
trigger1 = PrevStateNo = 400
trigger1 = AnimElem = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = -16,-48
[State 202, 3rd spark]
type = Helper
trigger1 = PrevStateNo = 400
trigger1 = AnimElem = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = -5,-57
[State 202, 4th spark]
type = Helper
trigger1 = PrevStateNo = 400
trigger1 = AnimElem = 3
name = "Spark"
stateno = 8500
ownpal = 1
pos = 58,-53
[State 202, 5th spark]
type = Helper
trigger1 = PrevStateNo = 400
trigger1 = AnimElem = 3, = 2
name = "Spark"
stateno = 8500
ownpal = 1
pos = 45,-61

[State 405, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-56
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 21
ground.hittime   = 19
guard.hittime    = 14
ground.velocity  = -4
air.velocity     = -3.5, -3
guard.velocity   = -5.5
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 405, crouch Left Right Inner Axe]
type = VarSet
trigger1 = !Var(1)
trigger1 = PrevStateNo = 400
trigger1 = AnimElemNo(0) < 5
trigger1 = !AILevel
trigger1 = Command = "a" || Command = "rel_a"
var(1) = 310

[State 405, crouch Left Right Spinning Hook Kick]
type = VarSet
trigger1 = !Var(1)
trigger1 = PrevStateNo = 400
trigger1 = AnimElemNo(0) < 5
trigger1 = !AILevel
trigger1 = Command = "b" || Command = "rel_b" || Command = "c" || Command = "rel_c"
var(1) = 215

[State 405, crouch Double Thrust]
type = VarSet
trigger1 = !Var(1)
trigger1 = PrevStateNo != 400
trigger1 = AnimElemNo(0) < 5
trigger1 = !AILevel
trigger1 = Command = "x" || Command = "rel_x"
var(1) = 230

[State 405, crouch Demon Slayer]
type = VarSet
trigger1 = !Var(1)
trigger1 = PrevStateNo = 400
trigger1 = AnimElemNo(0) < 5
trigger1 = !AILevel
trigger1 = Command = "z" || Command = "rel_z"
var(1) = 330

[State 405, String]
type = ChangeState
trigger1 = Var(1)
trigger1 = AnimElem = 4, > 1
value = Var(1)

[State 405, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;-----------------------------------------------------------------
; Crouch Hard Punch
[StateDef 410]
Anim      = 410
MoveType  = A
Type      = C
Physics   = C
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,500]

[State 410, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 41059
[State 410, hitspark position 2]
type = VarSet
trigger1 = AnimElemNo(0) = 4
var(5) = 33115
persistent = 0

[State 410, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 410, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,7;7,2
channel = 2


[State 410, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-59
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 25
guard.slidetime  = 19
ground.hittime   = 25
guard.hittime    = 19
ground.velocity  = -11
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
forcestand       = 1
sparkno = S8000
[State 410, Hit 2]
type = HitDef
trigger1 = !MoveHit
trigger1 = !MoveGuarded
trigger1 = !MoveReversed
trigger1 = !MoveContact
trigger1 = AnimElem = 4
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Hard
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-115
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = High
ground.slidetime = 23
guard.slidetime  = 17
ground.hittime   = 23
guard.hittime    = 17
ground.velocity  = -11
air.velocity     = -5, -3
guard.velocity   = -9.5
getpower         = 100, 50
givepower        = 50, 25
forcestand       = 1
sparkno = S8000

[State 410, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;-----------------------------------------------------------------
; Crouch Light Kick
[StateDef 415]
Anim      = 415
MoveType  = A
Type      = C
Physics   = C
Velset    = 0,0
Ctrl      = 0
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,500]

[State 415, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 52010

[State 415, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 415, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,2;7,1
Channel = 2

[State 415, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Light
damage           = ceil(fvar(12)*30),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-10
hitsound         = S5,0
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 14
ground.hittime   = 14
guard.hittime    = 10
ground.velocity  = -4
air.velocity     = -3.5, -3
guard.velocity   = -5.5
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 415, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;-----------------------------------------------------------------
; Crouch Medium Kick
[StateDef 420]
Anim      = 420
MoveType  = A
Type      = C
Physics   = C
Velset    = 0,0
Ctrl      = 0
Poweradd  = 12
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,500]

[State 420, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 51028

[State 420, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 420, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,6;7,2
Channel = 2

[State 420, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = MA
animtype         = Medium
damage           = ceil(fvar(12)*60),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-28
hitsound         = S5,1
guardsound       = S6,2
ground.type      = Low
ground.slidetime = 12
guard.slidetime  = 13
ground.hittime   = 17
guard.hittime    = 13
ground.velocity  = -5.5
air.velocity     = -5, -3
guard.velocity   = -8
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 420, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;-----------------------------------------------------------------
; Crouch Hard Kick
[StateDef 425]
Anim      = 425
MoveType  = A
Type      = C
Physics   = C
Velset    = 0,0
Ctrl      = 0
Poweradd  = 25
Juggle    = 8

[State 200, Turn]
type = Turn
trigger1 = !Time
trigger1 = P2Dist X < 0
trigger1 = PrevStateNo != [200,500]

[State 425, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 77005

[State 425, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 425, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,10;7,3
Channel = 2

[State 425, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = LA
animtype         = Back
damage           = ceil(fvar(12)*90),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-5
hitsound         = S5,2
guardsound       = S6,2
ground.type      = Trip
ground.slidetime = 21
ground.hittime   = 21
guard.hittime    = 17
ground.velocity  = -2.5, -3
air.velocity     = -5, -3
guard.velocity   = -8
getpower         = 100, 50
givepower        = 50, 25
fall             = 1
fall.recover     = 0
sparkno = S8000

[State 425, Idle]
type = StateTypeSet
trigger1 = AnimElem = 6, = 0
movetype = I

[State 425, End]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1
;-----------------------------------------------------------------
; Air
;--------------------------

;--------------------------
; Jump Light Punch
[StateDef 600]
Anim      = 600
MoveType  = A
Type      = A
Physics   = A
Ctrl      = 0

[State 600, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 47077

[State 600, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 600, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,0
Channel = 2

[State 600, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Light
damage           = ceil(fvar(12)*40),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-77
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 14
guard.slidetime  = 6
ground.hittime   = 14
guard.hittime    = 6
ground.velocity  = -2
air.velocity     = -2, -3
guard.velocity   = -3
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 600, Anim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 600
value = 41
elem = 5
;-----------------------------------------------------------------
; Jump Medium Punch
[StateDef 605]
Anim      = 605
MoveType  = A
Type      = A
Physics   = A
Ctrl      = 0
Poweradd  = 12

[State 605, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 59100

[State 605, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 605, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 3
value = 7,4;7,1
Channel = 2

[State 605, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Medium
damage           = ceil(fvar(12)*70),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-100
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
ground.slidetime = 18
guard.slidetime  = 7
ground.hittime   = 18
guard.hittime    = 7
ground.velocity  = -5
air.velocity     = -2.5, -4.5
guard.velocity   = -4.5
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 605, Anim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 605
value = 41
elem = 5
;-----------------------------------------------------------------
; Jump Hard Punch
[StateDef 610]
Anim      = 610
MoveType  = A
Type      = A
Physics   = A
Ctrl      = 0
Poweradd  = 25

[State 610, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 53058

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 610, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,7;7,2
Channel = 2

[State 610, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = ceil(fvar(12)*100),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-58
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 16
guard.slidetime  = 20
ground.hittime   = 22
guard.hittime    = 10
ground.velocity  = -2
air.velocity     = -2, -3
guard.velocity   = -3
getpower         = 100, 50
givepower        = 50, 25
sparkno = S8000

[State 610, Anim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 610
value = 41
elem = 5
;-----------------------------------------------------------------
; Jump Light Kick
[StateDef 615]
Anim      = 615
MoveType  = A
Type      = A
Physics   = A
Ctrl      = 0

[State 615, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 63080

[State 610, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 200, random%3
channel = 3

[State 615, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,2;7,1
Channel = 2

[State 615, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Medium
damage           = ceil(fvar(12)*70),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-80
hitsound         = S5,0
guardsound       = S6,2
ground.type      = High
ground.slidetime = 18
guard.slidetime  = 7
ground.hittime   = 14
guard.hittime    = 6
ground.velocity  = -2
air.velocity     = -2, -3
guard.velocity   = -3
getpower         = 50, 25
givepower        = 25, 12
sparkno = S8000

[State 615, Anim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 615
value = 41
elem = 5
;-----------------------------------------------------------------
; Jump Medium Kick
[StateDef 620]
Anim      = 620
MoveType  = A
Type      = A
Physics   = A
Ctrl      = 0
Poweradd  = 12

[State 620, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 43110

[State 620, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
trigger1 = !(Random%2)
value = 201, random%3
channel = 3

[State 620, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 2
value = 7,6;7,2
Channel = 2

[State 620, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Medium
damage           = ceil(fvar(12)*70),0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-110
hitsound         = S5,1
guardsound       = S6,2
ground.type      = High
ground.slidetime = 18
guard.slidetime  = 7
ground.hittime   = 18
guard.hittime    = 7
ground.velocity  = -5
air.velocity     = -2.5, -4.5
guard.velocity   = -4.5
getpower         = 87, 37
givepower        = 37, 17
sparkno = S8000

[State 620, Anim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 620
value = 41
elem = 5
;-----------------------------------------------------------------
; Jump Hard Kick
[StateDef 625]
Anim      = 625
MoveType  = A
Type      = A
Physics   = A
Ctrl      = 0
Poweradd  = 25

[State 625, hitspark position]
type = VarSet
trigger1 = !Time
var(5) = 53059

[State 625, Voice]
type = PlaySnd
trigger1 = AnimElem = 3
trigger1 = !(Random%2)
value = 202, random%3
channel = 3

[State 625, Whoosh]
type = PlaySnd
trigger1 = AnimElem = 4
value = 7,10;7,3
Channel = 2

[State 625, Hit]
type = HitDef
trigger1 = !Time
attr             = S, NA
hitflag          = MAF
guardflag        = HA
animtype         = Hard
damage           = 90,0
pausetime        = 4,6
sparkno          = S8000
guard.sparkno    = S8000
sparkxy          = -10,-59
hitsound         = S5,2
guardsound       = S6,2
ground.type      = High
air.type         = Low
ground.slidetime = 22
guard.slidetime  = 10
ground.hittime   = 22
guard.hittime    = 10
ground.velocity  = -2
air.velocity     = -2, -3
getpower         = 100, 50
givepower        = 50, 25
sparkno = S8000

[State 625, Anim]
type = ChangeAnim
trigger1 = !AnimTime
trigger1 = Anim = 625
value = 41
elem = 5
;-----------------------------------------------------------------
