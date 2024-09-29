;--------------------------
; STATEDEF -2.ST
;--------------------------
;==========
; VARIABLES
;==========
; Var(0) : special cancelable
; Var(1) : string position
; Var(2) : button press detection for special moves
; Var(3) : bound limiter
; Var(4) : Counter Hit - 0 : none, 1 : regular counter (constant check), 2 : forced counter (after EX Power Stance or canceled Super Charge at EX level), 3 : attacking after forced counter
; Var(5) : hitspark generator X axis * 1000 + Y axis
; Var(6) : throw limiter by OrochiKoF97 - 0 : no limit, 1 : basic throw limit, 2 : special throw limit, 3 : special / super used
; Var(7) : Hitspark limiter
; Var(8) : Custom cornerpush by Vans
; Var(9) Custom cornerpush - superpause
; FVar(10) : custom combo counter for custom combo dampener
; FVar(11) : custom combo dampener after FVar(10) >= 3
; FVar(12) : Counter Hit multiplier added to combo dampener ; [CvS2 life&power damage scaling system added to combo dampener] REMOVED
; FVar(13) : Custom cornerpush by Vans
;--------------------------

;--------------------------
; -2
;--------------------------
[Statedef -2]
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Movements & inputs
;-------------------
[State -2, Spr]
type = SprPriority
trigger1 = !Time
trigger1 = MoveType = A
value = 2
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Fast recovery
[State -2, Recovery]
type = ChangeState
triggerAll = StateType = L
triggerAll = Command = "DD"
trigger1 = Time < 3 && StateNo != 5110
value = 5120
ignorehitpause = 1
;---------------------------------------------------------------------------
; Tactical recovery
;[State -2, Tactical recovery]
;type = ChangeState
;trigger1 = StateType = L
;trigger1 = Command = "FF"
;value = [roll forward]
;ignorehitpause = 1
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
[State -2, String - button reset]
type = Null
triggerAll = Ctrl
trigger1 = Var(1)
trigger1 = Var(1) := 0
trigger2 = Var(2)
trigger2 = Var(2) := 0
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Effects
;--------
[State -2, Remove MA GFX]
type = RemoveExplod
;trigger1 = !Time
;trigger1 = PrevStateNo = 1100
trigger1 = NumExplod(1106)
trigger1 = StateNo != 1100
ID = 1106
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
[State -2, Wall slam SFX]
type = PlaySnd
trigger1 = NumTarget
trigger1 = Target,StateNo = 4101 || (Target,StateNo = 2511 && Target,Time > 12)
trigger1 = Target,BackEdgeBodyDist <= 10 || Target,FrontEdgeBodyDist <= 10
trigger1 = !numExplod(8540)
value = 40,2
channel = 1
[State -2, Wall slam GFX]
type = Explod
trigger1 = NumTarget
trigger1 = Target,StateNo = 4101 || (Target,StateNo = 2511 && Target,Time > 12)
trigger1 = Target,BackEdgeBodyDist <= 10 || Target,FrontEdgeBodyDist <= 10
trigger1 = !numExplod(8540)
id = 8540
anim = 8540
postype = P2
pos = -10,Target,const(size.mid.pos.y)+10
scale = 0.4,0.4
sprpriority = -5
ownpal = 1
[State -2, Remove wall slam GFX]
type = RemoveExplod
trigger1 = !NumTarget
trigger1 = NumExplod(8540)
id = 8540
;---------------------------------------------------------------------------
[State -2, Ground slam SFX]
type = PlaySnd
triggerAll = NumTarget
triggerAll = Target,Time = 1
trigger1 = Target,StateNo = 4001
trigger2 = Target,StateNo = 2513
value = 40,2
channel = 1
[State -2, Ground slam GFX]
type = Explod
triggerAll = NumTarget
triggerAll = Target,Time = 1
trigger1 = Target,StateNo = 4001
trigger2 = Target,StateNo = 2513
ID = 8530
anim = 8530
postype = P2
scale = 0.4,0.4
sprpriority = -5
[State -2, Remove ground slam GFX]
type = RemoveExplod
trigger1 = !NumTarget
trigger1 = NumExplod(8530)
id = 8530
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
[State -2, Jump SFX]
type = PlaySnd
trigger1 = Anim = 40
trigger1 = AnimElem = 1, = 2
value = 40,0
channel = 1
;---------------------------------------------------------------------------
[State -2, Land SFX]
type = PlaySnd
trigger1 = Anim = 47
trigger1 = AnimElem = 1, = 1
value = 40,1
channel = 1
;---------------------------------------------------------------------------
[State -2, Land dust]
type = Explod
trigger1 = Anim = 47
trigger1 = AnimElem = 1, = 1
anim = 8510
trans = add
scale = 0.25,0.25
sprpriority = -5
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
[state -2, Super jump AfterImage]
type = AfterImage
trigger1 = StateNo = 50
trigger1 = Time = 1 && Vel X > const(velocity.jump.fwd.x)
time = 2
timegap = 1
framegap = 10
trans = add1
length = 30
paladd = 0,0,0
palmul = .9,.9,.9
palcontrast = 120,120,120
palpostbright = 0,0,0
;---------------------------------------------------------------------------
[State -2, Super jump AfterImage persist]
type = AfterImageTime
trigger1 = StateNo = 50
trigger1 = Time > 1 && Vel X > const(velocity.jump.fwd.x)
time = 2
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Voice helper
[State -2, Voice]
type = Helper
trigger1 = !NumHelper(4500)
trigger1 = Ctrl
name = "Voice system"
stateno = 4500
id = 4500
ownpal = 1
;---------------------------------------------------------------------------
; Win voice
[State -2, Winpose]
type = AssertSpecial
triggerAll = Anim = 181
trigger1 = AnimElemNo(0) < 4
trigger2 = AnimElemNo(0) >= 4
trigger2 = NumHelper(4500)
trigger2 = Helper(4500),Var(2) > -1
flag = RoundNotOver
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; System
;-------
[State -2, Penetrating Fist blast hit poweradd]
type = PowerAdd
trigger1 = NumHelper(1210)
trigger1 = Helper(1210),MoveHit = 1
trigger2 = NumHelper(1220)
trigger2 = Helper(1220),MoveHit = 1
value = 100
ignorehitpause = 1
[State -2, Penetrating Fist blast hit poweradd]
type = PowerAdd
triggerAll = Var(2) < 4
trigger1 = NumHelper(1210)
trigger1 = Helper(1210),MoveGuarded = 1
;trigger2 = NumHelper(1220)
;trigger2 = Helper(1220),MoveGuarded = 1
value = 50
ignorehitpause = 1
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Combo systems
;---------------------------------------------------------------------------
[State -2, Bound limiter reset]
type = VarSet
trigger1 = Var(3)
trigger1 = !NumTarget
var(3) = 0
;---------------------------------------------------------------------------
[State -2, Bound count]
type = VarAdd
triggerAll = Var(3)%10 < 3 ; Bound limiter
triggerAll = MoveHit = 1
triggerAll = NumTarget
triggerAll = Target,StateNo != 4000 ; target not yet in state 4000, the TargetState is immediately after
trigger1 = StateNo = 232 ; Twin Lancer overhead
trigger2 = StateNo = 310 && NumTarget(310) ; Left Axe Kick
trigger3 = StateNo = 245 ; Stinger Feint
trigger4 = StateNo = 1160 ; Stinger
v = 3
value = 1
ignorehitpause = 1
;---------------------------------------------------------------------------
[State -2, Wall Slam count]
type = VarAdd
triggerAll = floor((Var(3)%100)/10) < 3 ; Wall Slam limiter
triggerAll = NumTarget
triggerAll = Target,StateNo != 4100 ; target not yet in state 4100, the TargetState is immediately after
trigger1 = StateNo = 243 ; Savage Sword 3
trigger2 = StateNo = 1301 && MoveHit = 1 ; Median Line Destruction EX finisher
v = 3
value = 10
ignorehitpause = 1
;---------------------------------------------------------------------------
; X Cancel counter
; no other trigger, if it was done outside of a combo the counter will reset on the next tick
[State -2, Cross Cancel count]
type = VarAdd
trigger1 = floor(Var(3)/100) < 3 ; Wall Slam limiter
trigger1 = StateNo = 4200 && !Time ; Cross Cancel state start
v = 3
value = 100
ignorehitpause = 1
;---------------------------------------------------------------------------
; Bound
; if you used a Bound more times than allowed in one combo, the TargetState will not occur and the regular hitvels in the HitDef will take place
[State -2, Bound]
type = TargetState
triggerAll = Var(3)%10 < 3 ; Bound limiter
triggerAll = !MoveGuarded && !MoveReversed
triggerAll = Movehit = 1
triggerAll = NumTarget
triggerAll = Target,StateNo != [4000,4002]
trigger1 = StateNo = 232 && NumTarget(232) && PrevStateNo = 230; Twin Lancer hit 2 causes Bound in all cases
trigger2 = StateNo = 310 && NumTarget(310) && (Target,StateType = A || Var(4)) ; Left Axe Kick causes Bound on Counter or on airborne target
trigger3 = StateNo = 1160 && NumTarget(1160) && (Target,StateType = A || Var(4)); Stinger (special) causes Bound on Counter or on airborne target
trigger4 = StateNo = 245 && NumTarget(245) && (Target,StateType = A || Var(4)); Stinger (String) causes Bound on Counter or on airborne target
value = 4000
ignorehitpause = 1
;---------------------------------------------------------------------------
; Wall Slam
; if you used a Wall Slam more times than allowed in one combo, the TargetState will not occur and the regular hitvels in the HitDef will take place
[State -2, Wall Slam]
type = TargetState
triggerAll = floor((Var(3)%100)/10) < 3 ; Wall Slam limiter
triggerAll = NumTarget
triggerAll = Target,StateNo != 4100
trigger1 = StateNo = 1301 && MoveHit = 1 ; Median Line Destruction EX causes Wall Slam on last hit
trigger2 = StateNo = 243 && MoveHit = 1 ; Savage Sword third hit
value = 4100
ignorehitpause = 1
;---------------------------------------------------------------------------
; Cross Cancel
[State -2, XC]
type = ChangeState
triggerAll = (!AILevel && Command = "y" && Command = "b") || (AILevel && Random < (10 + AILevel*((NumTarget>0)*12 + 1) ))
triggerAll = Power >= 500
triggerAll = MoveContact
trigger1 = StateNo = 1010 ; Drill Hook Fist
trigger2 = StateNo = 1020 ; Wind Hook Fist
trigger3 = StateNo = 1030 ; Thrusting Uppercut
trigger4 = StateNo = 1130 && ((AILevel && AnimElemNo(0) >= 5) || 1) ; Joudan Tsukiage Niren
trigger5 = StateNo = 1500 && ((AILevel && AnimElemNo(0) >= 5) || 1) ; Double Lift Kick
value = 4200
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Counter Hit
;---------------------------------------------------------------------------
[State -2, Red flash helper]
type = Helper
triggerAll = Var(4) > 0
trigger1 = MoveHit = 1
trigger2 = NumHelper(1210)
trigger2 = Helper(1210),MoveHit = 1
trigger3 = NumHelper(1220)
trigger3 = Helper(1220),MoveHit = 1
trigger4 = NumHelper(2010)
trigger4 = Helper(2010),MoveHit = 1
stateno = 8200
id = 8200
ownpal = 1
ignorehitpause = 1
;---------------------------------------------------------------------------
[state -2, Counter pause]
type = Pause
triggerAll = Var(4) > 0
trigger1 = MoveHit = 1
trigger2 = NumHelper(1210)
trigger2 = Helper(1210),MoveHit = 1
trigger3 = NumHelper(1220)
trigger3 = Helper(1220),MoveHit = 1
trigger4 = NumHelper(2010)
trigger4 = Helper(2010),MoveHit = 1
time = 2
movetime = 2
ignorehitpause = 1
;---------------------------------------------------------------------------
[State -2, Counter Hit detection/reset]
type = Null
trigger1 = !Var(4) && MoveType = A && EnemyNear,MoveType = A ; detect a Counter Hit
trigger1 = Var(4) := 1
trigger1 = 0
trigger2 = Var(4) = 1 && (MoveType != A || EnemyNear,MoveType != A) ; reset Counter Hit detection if not attacking or not attacked (and automatic Counter Hit not set)
trigger2 = Var(4) := 0
trigger3 = Var(4) >= 2 ; automatic Counter Hit case
trigger3 = PrevStateNo = [200, 3000] ; if you just used an attack (whiff case)
trigger3 = PrevStateNo != 1000 && PrevStateNo != 1100 && PrevStateNo != 1400 ; ignore coming from Special Step, Mental Alertness and Power Stance (counter / autoblock moves) (not the follow-up moves)
trigger3 = Var(4) := 0
trigger4 = Var(4) >= 2 ; automatic Counter Hit case
trigger4 = NumHelper(1210)
trigger4 = Helper(1210),MoveHit = 1
trigger4 = Var(4) := 0 ; reset when the first Penetrating Fist hits
trigger5 = Var(4) >= 2 ; automatic Counter Hit case
trigger5 = NumHelper(1220)
trigger5 = Helper(1220),MoveHit = 1
trigger5 = Var(4) := 0 ; reset when the second EX Penetrating Fist hits
trigger6 = Var(4) >= 2 ; automatic Counter Hit case
trigger6 = NumHelper(2010)
trigger6 = Helper(2010),MoveHit = 1
trigger6 = Var(4) := 0 ; reset when the Devil Spark hits
trigger7 = Var(4) >= 2 ; automatic Counter Hit case
trigger7 = MoveContact ; if you just connected with an attack
trigger7 = Var(4) := 0
trigger8 = Var(4) = 2 ; automatic Counter Hit case
trigger8 = MoveType = A ; if attacking during automatic Counter Hit case
trigger8 = Var(4) := 3 ; memorize that I am attacking
trigger8 = 0
trigger9 = Var(4) = 3 ; if I memorized that I was attacking during an automatic Counter Hit case
trigger9 = MoveType != A ; if I am not attacking anymore
trigger9 = Var(4) := 0
ignorehitpause = 1
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Combo dampener
;---------------------------------------------------------------------------
[State -2, Combo counter - Reset]
type = VarSet
triggerAll = FVar(10) != 1
trigger1 = !NumTarget && !NumHelper(1010) && !NumHelper(2010)
trigger2 = NumTarget
trigger2 = Target, StateNo >= 5100
;trigger3 = StateNo = ; Cross Cancel reset
fvar(10) = 1
ignorehitpause = 1
;---------------------------------------------------------------------------
; Combo counter increase
; fvar(10) counts the number of hits.
; persistent = 0 ensures multiple hitting special moves aren''t over dampened.
[State -2, Combo counter - Increase]
type = VarAdd
trigger1 = MoveType = A
trigger1 = MoveHit = 1
trigger1 = FVar(10) < 21
trigger1 = NumTarget
trigger1 = StateNo != [2000,3000] ; Supers don''t count
fv = 10
value = 1
persistent = 0
;ignorehitpause = 1
;---------------------------------------------------------------------------
; Combo dampening formula - SFxTK & CvS2 dampener
; fvar(11) is the dampening factor calculated from the number of hits.
; Dampens to 1/10 if you connected more than 10 hits.
[State -2, Combo Dampener - dampening factor formula]
type = VarSet
trigger1 = FVar(10) > 2
trigger2 = FVar(10) < 3 && FVar(11) := 1 && 0 ; resets factor to 1 if less than 3 hits and doesn''t apply the formula
fvar(11) = IfElse(FVar(10)<10, (11-FVar(10))/10, 0.1)
ignorehitpause = 1
;---------------------------------------------------------------------------
; Counter Hit multiplier [+ CvS2 Power&Life multiplier]
; fvar(12) is the power/life modifier added to the combo dampening factor, as well as the 25% added damage in the case of a Counter Hit.
; This is the final combo dampening factor, applying to any hit in a combo.
; Super moves count for one hit, multiple hitting special moves count for one hit, String combos count for multiple hits.
[State -2, Final multiplier]
type = VarSet
trigger1 = 1
;fvar(12) = FVar(11) * (1 + 0.25*(Var(4)>0) + .01*(power>=1000)+.01*(power>=2000)+.03*(power>=3000)+.15*(life<=300))
;fvar(12) = FVar(11) * (1 + 0.25*(Var(4)>0) + .01*(power>=1000)+.01*(power>=2000)+.03*(power>=3000))
fvar(12) = FVar(11) * (1 + 0.25*(Var(4)>0))
ignorehitpause = 1
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Sparks
;---------------------------------------------------------------------------
[State -2, Hitspark on]
type = VarSet
trigger1 = MoveContact = 1
trigger1 = HitPauseTime
trigger1 = !Var(7)
var(7) = 1
ignorehitpause = 1
;---------------------------------------------------------------------------
[State -2, Hitspark generator]
type = Helper
trigger1 = Var(7) = 1
trigger1 = MoveContact = 1
trigger1 = HitPauseTime
name = "Hitspark generator"
ID = 8000
stateno = 8000;var(22)
pos = IfElse(P2Dist X < 0, Floor(P2Dist X / 2), IfElse(P2Dist X < Floor(Var(5)/1000), Floor(Var(5)/1000-(P2Dist X)/3), Floor(Var(5)/1000))), -Var(5)%1000;Floor(-Var(5)%1000 + IfElse((P2Dist Y < -Var(5)%1000), 0, P2Dist Y / 2))
postype = p1
ownpal = 1
ignorehitpause = 1
supermovetime  = 99999999
;---------------------------------------------------------------------------
[State -2, Hitspark displayed]
type = VarSet
trigger1 = Var(7) = 1
var(7) = 2
ignorehitpause = 1
;---------------------------------------------------------------------------
[State -2, Hitspark off]
type = VarSet
trigger1 = !MoveContact || MoveContact >= 2
trigger1 = !HitPauseTime
var(7) = 0
ignorehitpause = 1
;---------------------------------------------------------------------------
[State -2, Electric spark generator]
type = Helper
;triggerAll = !NumHelper(8100)
triggerAll = MoveHit = 2;1
triggerAll = NumTarget
trigger1 = StateNo = 2303 ; Evil Eye Destruction
trigger2 = StateNo = 1030 ; Thrusting Uppercut
trigger3 = StateNo = 1111 ; Spine Cracker / Evil Intent 3
trigger4 = StateNo = 232 ; Twin Lancer 2 / Laser Breaker 3
trigger5 = StateNo = 1120 ; Swaying Willow
;trigger1 = StateNo = 1020
;trigger2 = StateNo = 1030
;trigger3 = StateNo = 1140
;trigger4 = StateNo = 1150
;trigger5 = StateNo = 202 && PrevStateNo = [200,201]
ID = 8100
name = "Electric spark generator"
;postype = P2
Stateno = 8100
ownpal = 1
ignorehitpause = 1
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Throw limiter
;---------------------------------------------------------------------------
[State -2, Throw limiter - reset]
type = VarSet
trigger1 = !NumTarget || EnemyNear,StateNo != [5000,5999] ; Enemy not in hitstun
trigger1 = EnemyNear,StateNo != [150,155] ; Enemy not in guard stun : guard hit (stand, crouch, air) - shaking, knocked back
var(6) = 0
;---------------------------------------------------------------------------
[State -2, Normal throw limiter : stand/crouch basics]
type = VarSet
trigger1 = MoveContact = 1
trigger1 = StateNo = [200,500]
var(6) = 1
;---------------------------------------------------------------------------
[State -2, Special throw limiter : jump basics]
type = VarSet
trigger1 = MoveContact = 1
trigger1 = StateNo = [600,700]
var(6) = 2
;---------------------------------------------------------------------------
[State -2, Throw limiter : everything]
type = VarSet
triggerAll = StateNo >= 1000
trigger1 = MoveContact = 1
trigger2 = NumHelper(1220)
trigger2 = Helper(1220),MoveContact = 1
var(6) = 3
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Display info
[State -2, Clipboard]
type = DisplayToClipboard
trigger1 = 1
text = "String : %d, button : %d, SpCancel : %d, Counter : %d, Dampener : %f \n Jin Kazama by Byakko"
params = var(1), var(2), var(0), var(4), fvar(12)
ignorehitpause = 1
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;================================================================================
; ------- KOF Cornerpush System by Vans --------
;===============================================================================
[State -2, Superpause Check]
type = VarAdd
trigger1 = var(9)
var(9) = -1

[State -2, Reset Time counter]
type = VarSet
trigger1 = movecontact = 1
var(8) = 0

[State -2, Accel]
type = VarSet
triggerall = roundstate = 2
triggerall = var(9) <= 0
triggerall = numtarget >= 1
trigger1 = target, hitshakeover
fvar(13) = (target, gethitvar(xvel)*exp((-0.6)*((var(8)))))
;fvar(13) = (target, gethitvar(xvel)*exp((-0.1886)*((var(8)))))

[State -2, Push]
type = PosAdd
triggerall = roundstate = 2
triggerall = !var(9)
triggerall = numtarget >= 1
triggerall = (target, BackEdgeBodyDist <= 0) || (target, FrontEdgeBodyDist <= 0)
triggerall = stateno != [900,949]
triggerall = stateno != [956,979]
triggerall = target,statetype != A
triggerall = target,statetype != L
triggerall = p2stateno!=10400 && p2movetype = H
trigger1 = statetype != A
x = ifelse(facing = -1,fvar(13),-fvar(13))

[State -2, Increase]
type = VarSet
triggerall = numtarget >= 1
triggerall = target, hitshakeover
trigger1 = var(9) <= 0
trigger1 = var(8)
var(8) = var(8)+1

[State -2, Time counter]
type = VarSet
trigger1 = !var(8)
trigger1 = fvar(13)
var(8) = 1

[State -2, Freeze Pos During Superpause]
type = null;PosFreeze
trigger1 = var(9)
value = 1

[State -2, Drop]
type = VarSet
triggerall = fvar(13)
trigger1 = !numtarget
trigger2 = projcontact = 1
trigger3 = movecontact = 1
fvar(13) = 0
ignorehitpause = 1
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;[StateDef -3]
;[State -3, Hit Detection Start]
;type = null;VarAdd
;trigger1 = movecontact
;var(21) = 1
;ignorehitpause = 1

;[State -3, Hit Detection Reset]
;type = null;VarSet
;trigger1 = !movecontact
;trigger2 = !hitpausetime
;var(21) = 0
