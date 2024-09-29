;---------------------
; VOICE SYSTEM - AI.ST
;---------------------

; All other voices (including in other files) check if a voice is not currently playing
; Var(1) : voice currently playing, format XXXXY where XXXX = group number, Y = sound number
; Var(2) : current voice "SoundTime" ( <=> AnimTime)
; FVar(5) : Life
; FVar(6) : LifeMax
; FVar(7) : Enemy Life
; FVar(8) : Enemy LifeMax
; Var(10~18) : voices 4500,0~8 played once or not

;-------------
; Voice system
[StateDef 4500]
Anim     = 196
Type     = S
MoveType = I
Physics  = N

; Stick to parent for the AI to detect EnemyNear properly
[State 4500, Pos]
type = PosSet
trigger1 = 1
x = Parent,Pos X
y = Parent,Pos Y

[State 4500, Life]
type = VarSet
trigger1 = 1
fvar(5) = Parent,Life
[State 4500, LifeMax]
type = VarSet
trigger1 = 1
fvar(6) = Parent,LifeMax

[State 4500, EnemyLife]
type = VarSet
trigger1 = 1
fvar(7) = EnemyNear,Life
[State 4500, EnemyLifeMax]
type = VarSet
trigger1 = 1
fvar(8) = EnemyNear,LifeMax

; SoundTime countdown
[State 4500, Countdown]
type = VarAdd
trigger1 = Var(2) >= 0
v = 2
value = -1

; INTROS (must stay here and not move to Sys.st so that they can be turned off when leaving the intro state)

; 191,0 : Ore wa unmei ni kusshitari shinai
; 191,1 : Deban ka
; 191,2 : Tekagen wa dekinai
; 191,3 : Kisama ni wa ore wa taosen

[State 4500, Taunt]
type = VarSet
trigger1 = Parent,StateNo = 195
trigger1 = Parent,AnimElem = 8
var(1) = 1950
[State 4500, Taunt]
type = VarSet
trigger1 = Parent,StateNo = 195
trigger1 = Parent,AnimElem = 8
var(2) = 120
[State 4500, Taunt]
type = PlaySnd
trigger1 = Parent,StateNo = 195
trigger1 = Parent,AnimElem = 8
value = 195,0
channel = 3

[State 4500, Taunt]
type = VarSet
trigger1 = Parent,PrevStateNo = [190,195]
trigger1 = Parent,Time < 2
var(1) = 0
[State 4500, Intro/taunt end]
type = StopSnd
trigger1 = Parent,PrevStateNo = [190,195]
trigger1 = Parent,Time < 2
channel = 3

; IN-FIGHT

; Doko wo mite iru (roll/recovery randomized)
; Mondai nai (recovery randomized)

[State 4500, Tatakai wa mou hajimatte iru]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = Time >= 500
trigger1 = FVar(5) = FVar(6)
trigger1 = FVar(7) = FVar(8)
trigger1 = !var(10)
var(1) = 45000
[State 4500, 45000]
type = VarSet
trigger1 = Var(1) = 45000
trigger1 = !Var(10)
var(10) = 1

[State 4500, Damatte mite iru dake ka]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = Time >= 1080
trigger1 = FVar(5) = FVar(6)
trigger1 = FVar(7) < FVar(8)
trigger1 = !var(11)
var(1) = 45001
[State 4500, 45001]
type = VarSet
trigger1 = Var(1) = 45001
trigger1 = !Var(11)
var(11) = 1

[State 4500, Koko de taoreru tsumori wa nai]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = FVar(5)/FVar(6) *100 = [20,40]
trigger1 = FVar(7)/FVar(8) * 100 >= 65
trigger1 = !Var(12)
var(1) = 45002
[State 4500, 45002]
type = VarSet
trigger1 = Var(1) = 45002
trigger1 = !Var(12)
var(12) = 1

[State 4500, Kisama no you no yatsu ga ita to wa na]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = FVar(5)/FVar(6) *100 < 20
trigger1 = FVar(7)/FVar(8) * 100 > 40
trigger1 = !Var(13)
var(1) = 45003
[State 4500, 45003]
type = VarSet
trigger1 = Var(1) = 45003
trigger1 = !Var(13)
var(13) = 1

[State 4500, Naze ore no jama wo suru]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = FVar(5)/FVar(6) *100 < 20
trigger1 = FVar(7)/FVar(8) * 100 = [20,40]
trigger1 = !Var(14)
var(1) = 45004
[State 4500, 45004]
type = VarSet
trigger1 = Var(1) = 45004
trigger1 = !Var(14)
var(14) = 1

[State 4500, Oujougiwa ga warui na]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = FVar(5)/FVar(6) * 100 > 65
trigger1 = FVar(7)/FVar(8) * 100 < 20
trigger1 = !Var(15)
var(1) = 45005
[State 4500, 45005]
type = VarSet
trigger1 = Var(1) = 45005
trigger1 = !Var(15)
var(15) = 1

[State 4500, Akiramerou, omae ni wa muri da]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = FVar(5)/FVar(6) *100 = [40,60]
trigger1 = (FVar(7)/FVar(8) * 100) < 20
trigger1 = !Var(16)
var(1) = 45006
[State 4500, 45006]
type = VarSet
trigger1 = Var(1) = 45006
trigger1 = !Var(16)
var(16) = 1

[State 4500, Teikou shite mo muda da]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = FVar(5)/FVar(6) *100 = [40,60]
trigger1 = (FVar(7)/FVar(8) * 100) = [20,40]
trigger1 = !Var(17)
var(1) = 45007
[State 4500, 45007]
type = VarSet
trigger1 = Var(1) = 45007
trigger1 = !Var(17)
var(17) = 1

[State 4500, Katta tsumori ka]
type = VarSet
triggerAll = RoundState = 2
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = FVar(5)/FVar(6) *100 < 20
trigger1 = FVar(7)/FVar(8) * 100 < 20
trigger1 = !Var(18)
var(1) = 45008
[State 4500, 45008]
type = VarSet
trigger1 = Var(1) = 45008
trigger1 = !Var(18)
var(18) = 1

; VICTORY
; for randomization, activate each set of voices on a different tick
; the first has a randomizer, the second just checks if the first (with var(1)) wasn't started + randomizer, etc.

[State 4500, Victory]
type = VarSet
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 1
var(1) = 0
[State 4500, Victory]
type = VarSet
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 1
var(2) = -1
 
; 181,3 : Jikan wo muda ni shita (win >65% life, lots of time spent)
[State 4500, Jikan wo muda ni shita]
type = VarSet
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 3
trigger1 = FVar(5)/FVar(6) * 100 > 65
trigger1 = Time > 2100
var(1) = 1813

; 181,6 : Kore wa shouri ja nai, tada no kekka da (win >80% life)
[State 4500, Kore wa shouri ja nai, tada no kekka da]
type = VarSet
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 3
trigger1 = (FVar(5)/FVar(6) * 100) > 85
var(1) = 1816

; 181,4 : Ore ni honki wo dasaseru to wa na (win <20% life)
[State 4500, Ore ni honki wo dasaseru to wa na]
type = VarSet
trigger1 = !Var(1)
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 3
trigger1 = (FVar(5)/FVar(6) * 100) < 20
var(1) = 1814
; 181,5 : Tama ni wa warukunai na (win <20% life - CONT')
[State 4500, Tama ni wa warukunai na]
type = VarSet
trigger1 = Var(1) = 1814
trigger1 = !Var(2)
var(1) = 1815
[State 4500, SoundTime 181,5]
type = VarSet
trigger1 = Var(1) = 1815
trigger1 = !Var(2)
var(2) = 135
persistent = 0
[State 4500, Play]
type = PlaySnd
trigger1 = Var(1) = 1815
trigger1 = Var(2) = 135
value = (floor(Var(1)/10)), Var(1)%10
channel = 3
persistent = 0

; 181,0 : Ore ni wa yaru beki koto ga aru (win 1 RANDOM)
[State 4500, Ore ni wa yaru beki koto ga aru]
type = VarSet
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 4
trigger1 = Random < 333
var(1) = 1810

; 181,1 : Subete wo ushinatte mo (win 1 CONT'')
[State 4500, Subete wo ushinatte mo]
type = VarSet
trigger1 = Var(1) = 1810 ; immediately after first part of speech
trigger1 = !Var(2)
var(1) = 1811
[State 4500, SoundTime 181,1]
type = VarSet
trigger1 = Var(1) = 1811
trigger1 = !Var(2)
var(2) = 90
persistent = 0
[State 4500, Play]
type = PlaySnd
trigger1 = Parent,MoveType != A
trigger1 = Var(1) = 1811
trigger1 = Var(2) = 90
value = (floor(Var(1)/10)), Var(1)%10
channel = 3
persistent = 0

; 181,2 : Kore de jama mono wa kieta you da na (win 2 RANDOM)
[State 4500, Kore de jama mono wa kieta you da na]
type = VarSet
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 4, = 2
trigger1 = Random < 500
var(1) = 1812

; 181,7 : Koroshi wa shinai, hayaku kono ba wo sare (win 3 RANDOM)
[State 4500, Koroshi wa shinai, hayaku kono ba wo sare]
type = VarSet
trigger1 = !Var(1)
trigger1 = Var(2) = -1
trigger1 = Root,Anim = 181
trigger1 = Root,AnimElem = 4, = 3
var(1) = 1817

; PLAYSND
[State 4500, Play]
type = PlaySnd
trigger1 = Parent,MoveType != A
trigger1 = Var(1)
trigger1 = Var(2) = -1
value = (floor(Var(1)/10)), Var(1)%10;Var(1)%10,(Var(1)-Var(1)%10)
channel = 3

; Setting the timer
; IN-FIGHT
[State 4500, SoundTime 4500,0]
type = VarSet
trigger1 = Var(1) = 45000
trigger1 = Var(2) = -1
var(2) = 90
[State 4500, SoundTime 4500,1]
type = VarSet
trigger1 = Var(1) = 45001
trigger1 = Var(2) = -1
var(2) = 80
[State 4500, SoundTime 4500,2]
type = VarSet
trigger1 = Var(1) = 45002
trigger1 = Var(2) = -1
var(2) = 108
[State 4500, SoundTime 4500,3]
type = VarSet
trigger1 = Var(1) = 45003
trigger1 = Var(2) = -1
var(2) = 120
[State 4500, SoundTime 4500,4]
type = VarSet
trigger1 = Var(1) = 45004
trigger1 = Var(2) = -1
var(2) = 90
[State 4500, SoundTime 4500,5]
type = VarSet
trigger1 = Var(1) = 45005
trigger1 = Var(2) = -1
var(2) = 100
[State 4500, SoundTime 4500,6]
type = VarSet
trigger1 = Var(1) = 45006
trigger1 = Var(2) = -1
var(2) = 165
[State 4500, SoundTime 4500,7]
type = VarSet
trigger1 = Var(1) = 45007
trigger1 = Var(2) = -1
var(2) = 90
[State 4500, SoundTime 4500,8]
type = VarSet
trigger1 = Var(1) = 45008
trigger1 = Var(2) = -1
var(2) = 90
; WIN
[State 4500, SoundTime 181,0]
type = VarSet
trigger1 = Var(1) = 1810
trigger1 = Var(2) = -1
var(2) = 120
[State 4500, SoundTime 181,2]
type = VarSet
trigger1 = Var(1) = 1812
trigger1 = Var(2) = -1
var(2) = 115
[State 4500, SoundTime 181,3]
type = VarSet
trigger1 = Var(1) = 1813
trigger1 = Var(2) = -1
var(2) = 75
[State 4500, SoundTime 181,4]
type = VarSet
trigger1 = Var(1) = 1814
trigger1 = Var(2) = -1
var(2) = 135
[State 4500, SoundTime 181,6]
type = VarSet
trigger1 = Var(1) = 1816
trigger1 = Var(2) = -1
var(2) = 210
[State 4500, SoundTime 181,7]
type = VarSet
trigger1 = Var(1) = 1817
trigger1 = Var(2) = -1
var(2) = 210

; Reset
[State 4500, Reset]
type = VarSet
trigger1 = Var(1) != 0
;trigger1 = Var(1) != 1816
;trigger1 = Var(1) != 1810
trigger1 = !Var(2)
var(1) = 0

; Display info
[State 4500, Clipboard]
type = DisplayToClipboard
trigger1 = 1
text = "Voice = %d, SoundTime = %d, life = %f, lmax = %f \n voice and AI - Jin Kazama by Byakko"
params = var(1), var(2), FVar(5), FVar(6)
ignorehitpause = 1

;-----------------------------------------------------------------

; Get-hit voices
;---------------

; Light get-hit
[State 4500, Light get-hit]
type = PlaySnd
triggerAll = Parent,GetHitVar(AnimType) = 0
triggerAll = Parent,Time = 1 && Parent,Alive
triggerAll = Random%5 < 3
trigger1 = Parent,StateNo = 5000 || Parent,StateNo = 5010 || Parent,StateNo = 5020 || Parent,StateNo = 5070 || Parent,StateNo = 5080
trigger2 = (Parent,StateNo = 5050 || Parent,StateNo = 5100) && Parent,PrevStateNo != [5000,5199]
value = 5000,random%3
channel = 3
ignorehitpause = 1
;persistent = 0

; Medium get-hit
[State 4500, Medium get-hit]
type = PlaySnd
triggerAll = Parent,GetHitVar(AnimType) = 1
triggerAll = Parent,Time = 1 && Parent,Alive
triggerAll = Random%5 < 3
trigger1 = Parent,StateNo = 5000 || Parent,StateNo = 5010 || Parent,StateNo = 5020 || Parent,StateNo = 5070 || Parent,StateNo = 5080
trigger2 = (Parent,StateNo = 5050 || Parent,StateNo = 5100) && Parent,PrevStateNo != [5000,5199]
value = 5001,random%2
channel = 3
ignorehitpause = 1
;persistent = 0

; Heavy get-hit
[State 4500, Heavy get-hit]
type = PlaySnd
triggerAll = (Parent,GetHitVar(AnimType) = 2 && Random%5 < 3) || Parent,GetHitVar(AnimType) > 2
triggerAll = Parent,Time = 1 && Parent,Alive
trigger1 = Parent,StateNo = 5000 || Parent,StateNo = 5010 || Parent,StateNo = 5020 || Parent,StateNo = 5070 || Parent,StateNo = 5080
trigger2 = (Parent,StateNo = 5050 || Parent,StateNo = 5100) && Parent,PrevStateNo != [5000,5199]
value = 5002,random%3
channel = 3
ignorehitpause = 1
;persistent = 0

;-----------------------------------------------------------------

;==========================
; AI COMBO INPUTS
;==========================

;--------------------------
; FLASH PUNCH COMBO
;-------------
; Flash Punch Combo 2
; Condition : opponent close, low randomization
[State 4500, FPC 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = (Parent,StateNo = 200 && Parent,AnimElemNo(0) >= 5) || (Parent,StateNo = 201 && Parent,AnimElem = 6, >= 2)
triggerAll = Parent,PrevStateNo != [200,700]
trigger1 = P2BodyDist X < 60
trigger1 = Random < (25 + Parent,AILevel*15)
var(1) = 200
;-------------
; Flash Punch Combo 3
; Condition : opponent not too far, high randomization
[State 4500, FPC 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 200
triggerAll = Parent,PrevStateNo = 200 || Parent,PrevStateNo = 201
triggerAll = Parent,AnimElemNo(0) >= 5
trigger1 = P2BodyDist X < 100
trigger1 = Random < (60 + Parent,AILevel*4 + (P2MoveType = H)*(P2StateType != A)*AILevel*15)
var(1) = 240
;--------------------------

;--------------------------
; NI RENGEKI
;-------------
; Ni Rengeki 2
; Condition : medium randomization, Flash Punch Combo has priority but lower randomization
[State 4500, NR 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = (Parent,StateNo = 200 && Parent,AnimElemNo(0) >= 5) || (Parent,StateNo = 201 && Parent,AnimElemNo(0) >= 6)
trigger1 = Random < (80 + Parent,AILevel*5 + (P2MoveType = H)*(P2StateType != A)*AILevel*15)
var(1) = 210
;-------------
; Ni Rengeki Sen
; Condition : low randomization, opponent is attacking
[State 4500, NRS]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 210
triggerAll = Parent,PrevStateNo = 200 || Parent,PrevStateNo = 201
triggerAll = Parent,AnimElemNo(0) >= 6
trigger1 = Random < (30 + Parent,AILevel*5*(P2MoveType = A)*(P2BodyDist X < 80))
var(1) = 105
;--------------------------

;--------------------------
; KAZAMA STYLE 5 HIT COMBO
;-------------
; KS5HC 3
; Condition : opponent not above, high randomization, higher if opponent is close, even higher if opponent is getting hit
[State 4500, KS5HC 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 210
triggerAll = Parent,AnimElemNo(0) >= 6
triggerAll = P2Dist Y >= -40
trigger1 = Random < (30 + Parent,AILevel*( 7 + (P2BodyDist X < (100 - Parent,AILevel*6))*8 + (P2MoveType=H)*5 ))
var(1) = 235
;-------------
; KS5HC 4
; Condition : opponent not above, high randomization, higher if opponent is close, even higher if opponent is getting hit
[State 4500, KS5HC 4]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 235
triggerAll = Parent,AnimElemNo(0) >= 5
trigger1 = Random < (30 + Parent,AILevel*( 7 + (P2BodyDist X < (90 - Parent,AILevel*5))*8 + (P2MoveType=H)*5 ))
var(1) = 236
;-------------
; KS5HC 5
; Condition : opponent on ground, very high randomization, higher if opponent is close, even higher if opponent is getting hit
[State 4500, KS5HC 5]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 236
triggerAll = Parent,AnimElem = 6, > 3
trigger1 = Random < (50 + Parent,AILevel*( 7 + (P2StateType != A)*12 + (P2MoveType=H)*5 ))
var(1) = 213
;-------------
; KS6HC 2
; Condition : good randomization, opponent on ground, not too far
[State 4500, KS6HC 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 310
triggerAll = Parent,AnimElem = 10, >= 3
trigger1 = Random < (50 + Parent,AILevel*( 5 + (P2StateType != A)*12 + (P2BodyDist X < (90 - Parent,AILevel*6))*8 ))
var(1) = 200
;--------------------------

;--------------------------
; LEFT RIGHT COMBO
;-------------
; Left Right Combo 2
; Condition : opponent close, high randomization, Ni Rengeki has priority but lower randomization
[State 4500, LRC 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = (Parent,StateNo = 200 && Parent,AnimElemNo(0) = 5) || (Parent,StateNo = 201 && Parent,AnimElem = 6, >= 2)
triggerAll = Parent,PrevStateNo != [200,600]
trigger1 = P2BodyDist X < (110 - Parent,AILevel*5)
trigger1 = Random < (50 + Parent,AILevel*25)
var(1) = 202
;-------------
; Left Right Combo 2 (crouch)
; Condition : opponent close, high randomization
[State 4500, LRC 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 400 && Parent,AnimElemNo(0) = 4
triggerAll = Parent,PrevStateNo != [200,600]
trigger1 = P2BodyDist X < (110 - Parent,AILevel*5)
trigger1 = Random < (50 + Parent,AILevel*25)
var(1) = 405
;-------------
; Demon Slayer 3
; Condition : opponent a little further, good randomization
[State 4500, DS 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 202 && Parent,PrevStateNo = [200,201]
triggerAll = Parent,AnimElem = 6, >= 2
trigger1 = P2BodyDist X = [60,120]
trigger1 = Random < (80 + Parent,AILevel*4)
var(1) = 330
;-------------
; Left Right Inner Axe 3
; Condition : opponent crouching
[State 4500, LRIA 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 202 && Parent,PrevStateNo = [200,201]
triggerAll = Parent,AnimElem = 6, >= 2
trigger1 = P2StateType = C
trigger1 = Random < (70 + Parent,AILevel*5)
var(1) = 310
;-------------
; Left Right Spinning Hook Kick 3 / Switch Blade
; Condition : good randomization
[State 4500, LRSHK 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 202 && Parent,PrevStateNo != [202,500]
triggerAll = Parent,AnimElem = 6, >= 2
trigger1 = P2StateType != C
trigger1 = Random < (70 + Parent,AILevel*5)
var(1) = 215
;--------------------------

;--------------------------
; STINGER SERIES
;-------------
; Feint Kick Combo 2
; Condition description
[State 4500, FKC 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 200
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; Feint Kick Combo 3
; Condition description
[State 4500, FKC 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; Left Sidekick to Stinger
; Condition description
[State 4500, LSS 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; Left Sidekick to Stinger Sen
; Condition description
[State 4500, LSSS 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;--------------------------

;--------------------------
; LEFT JAB TO DOUBLE LOW
;-------------
; LJDL 2
; Condition description
[State 4500, LJDL 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 200
triggerAll = Parent,AnimElemNo(0) >= 5
trigger1 = P2BodyDist X < (90 - Parent,AILevel*5)
trigger1 = Random < (50 + Parent,AILevel*(15 + (P2StateType=S)*10))
var(1) = 211
;-------------
; LJDL 3
; Condition description
[State 4500, LJDL 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 211
triggerAll = Parent,AnimElem = 6, > 0
trigger1 = Random < (80 + AILevel*(15 + (P2StateType=S)*10 + (P2MoveType=H)*6 + (P2StateType=S && P2StateNo=[120,160])*18))
var(1) = 213
;--------------------------

;--------------------------
; DOUBLE THRUST
;-------------
; Double Thrust
; Condition : high randomization
[State 4500, DT 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = (Parent,StateNo = 202 && Parent,AnimElemNo(0) < 7 && Parent,PrevStateNo != [200,210]) || (Parent,StateNo = 203 && Parent,AnimElemNo(0) < 6) || (Parent,StateNo = 405 && Parent,AnimElemNo(0) < 5)
trigger1 = P2BodyDist X < (115 - Parent,AILevel*5)
trigger1 = Random < (100 + Parent,AILevel*22)
var(1) = 230
;-------------
; Double Thrust Low Trick Kick
; Condition : low randomization, enemy blocking and standing
[State 4500, DTLTK]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,Anim = 230 && Parent,AnimElemNo(0) < 8
trigger1 = P2StateType != A
trigger1 = Random < (60 + Parent,AILevel*8 + (P2StateType=S && P2StateNo=[120,160])*AILevel*10)
var(1) = 234
;-------------
; Double Thrust Roundhouse
; Condition : high randomization, Low Trick Kick has priority but low randomization
[State 4500, DTR]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,Anim = 230 && Parent,AnimElemNo(0) < 8
trigger1 = Random < (100 + Parent,AILevel*22)
var(1) = 212
;--------------------------

;--------------------------
; ZENSHIN SERIES
;-------------
; Twin Lancer
; Condition : high randomization
[State 4500, TL2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 230
triggerAll = Parent,Anim = 230 && Parent,AnimElemNo(0) < 8
triggerAll = Parent,PrevStateNo != [200,500]
trigger1 = Random < (60 + Parent,AILevel*22)
var(1) = 232
;-------------
; Zenshin
; Condition : high randomization
[State 4500, TL2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Random < (40 + Parent,AILevel*22)
trigger1 = Parent,StateNo = 232
trigger1 = Parent,PrevStateNo = 230
trigger1 = Parent,AnimElem = 5, > 3
trigger2 = Parent,StateNo = 214
trigger2 = Parent,AnimElem = 10, >= 3
var(1) = 1100
;--------------------------

;--------------------------
; RIGHT ROUNDHOUSE PUNCH
;-------------
; Evil Intent 2
; Condition : high randomization, opponent not in the air, not too far or not running forward
[State 4500, EI 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 251
triggerAll = Parent,AnimElem = 7, >= 5
triggerAll = Random < (80 + Parent,AILevel*5)
triggerAll = P2StateType != A
trigger1 = P2BodyDist X < 180
trigger2 = EnemyNear,Vel X >= 4
var(1) = 230
;-------------
; Evil Intent 3
; Condition : very high randomization, opponent did not block, opponent not too far or in the air
[State 4500, EI 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 230 && Parent,PrevStateNo = 251
triggerAll = Parent,AnimElem = 5, > 3
triggerAll = !MoveGuarded
triggerAll = P2StateType != A
trigger1 = P2BodyDist X < 110
trigger1 = Random < (110 + Parent,AILevel*6)
var(1) = 1111
;-------------
; Laser Breaker 2
; Condition : opponent in the air or crouching and close enough, medium randomization, or opponent standing and low randomization
[State 4500, LB 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 251
triggerAll = Parent,AnimElem = 7, >= 5
triggerAll = P2BodyDist X < 80
trigger1 = P2StateType != S
trigger1 = Random < (50 + Parent,AILevel*4)
trigger2 = Random < (30 + Parent,AILevel*4)
var(1) = 252
;-------------
; Laser Breaker 3
; Condition description
[State 4500, LB 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; Keito
; Condition : opponent not too far but not too close, not crouching, not attacking (or randomization quickly decreasing with AI level), good randomization
[State 4500, Keito]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 251
triggerAll = Parent,AnimElem = 7, >= 5
trigger1 = P2StateType != C
trigger1 = P2MoveType != A || Random < (400 - Parent,AILevel*40)
trigger1 = P2BodyDist X = [55,120]
trigger1 = Random < (70 + Parent,AILevel*5)
var(1) = 214
;-------------
; Keito, Zenshin
; Condition description
[State 4500, K-Z]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 214 && Parent,PrevStateNo = 251
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;--------------------------

;--------------------------
; KISHIN REKKOU
;-------------
; Kishin Rekkou 2
; Condition : high randomization
[State 4500, KR 2]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,PrevStateNo != [200,400]
triggerAll = Parent,StateNo = [210,211]
triggerAll = Parent,AnimElemNo(0) >= 6
trigger1 = Random < (80 + Parent,AILevel*15)
var(1) = 200
;-------------
; Kishin Rekkou 3
; Condition : high randomization
[State 4500, KR 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 200 && Parent,PrevStateNo = [210,211]
triggerAll = Parent,AnimElemNo(0) = 5
trigger1 = Random < (100 + Parent,AILevel*15)
var(1) = 213
;--------------------------

;--------------------------
; 10 HIT COMBO
;-------------
; 10 Hit Combo 3
; Condition description
[State 4500, 10HC 3]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; 10 Hit Combo 4
; Condition description
[State 4500, 10HC 4]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; 10 Hit Combo 5
; Condition description
[State 4500, 10HC 5]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; 10 Hit Combo 6
; Condition description
[State 4500, 10HC 6]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; 10 Hit Combo 7
; Condition description
[State 4500, 10HC 7]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; 10 Hit Combo 8
; Condition description
[State 4500, 10HC 8]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; 10 Hit Combo 9
; Condition description
[State 4500, 10HC 9]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; 10 Hit Combo 10
; Condition description
[State 4500, 10HC 10]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;--------------------------

;--------------------------
; OMEN 7 HIT COMBO
;-------------
; Omen 7 Hit Combo 4
; Condition description
[State 4500, O7HC 4]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; Omen 7 Hit Combo 5
; Condition description
[State 4500, O7HC 5]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; Omen 7 Hit Combo 6
; Condition description
[State 4500, O7HC 6]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;-------------
; Omen 7 Hit Combo 7
; Condition description
[State 4500, O7HC 7]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 0
triggerAll = Parent,AnimElem = 1
trigger1 = Random < 0
var(1) = 2
;--------------------------

;--------------------------
; MENTAL ALERTNESS SERIES
;-------------
; Dash
; Condition : low randomization, opponent mid-range and on ground or jumping back
[State 4500, MA-D]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [24,30]
triggerAll = Parent,Anim = 1105
trigger1 = P2MoveType != A
trigger1 = P2StateType != A || EnemyNear,Vel X < 0
trigger1 = P2bodyDist X > 110
trigger1 = P2bodyDist X < 150
trigger1 = Random < (10 + Parent,AILevel*3)
var(1) = 100
;-------------
; Special Step
; Condition : low randomization, opponent far and on ground or jumping back
[State 4500, MA-SS]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [28,36]
triggerAll = Parent,Anim = 1105
trigger1 = P2StateType != A || EnemyNear,Vel X < 0
trigger1 = P2BodyDist X > (200 - Parent,AILevel*6)
trigger1 = P2BodyDist X < (230 - Parent,AILevel*4)
trigger1 = Random < (20 + Parent,AILevel*5)
var(1) = 1000
;-------------
; Left Drill Punch
; Condition : opponent mid  to far ranged, not in air or moving back and down, high randomization, higher if opponent is attacking (armor)
[State 4500, MA-LDP]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [11,36]
trigger1 = P2StateType != L
trigger1 = P2StateType != A || (EnemyNear,Vel X < 0 && EnemyNear,Vel Y > 0)
trigger1 = P2BodyDist X > (50 + Parent,AILevel*6)
trigger1 = P2BodyDist X < (200 - Parent,AILevel*4)
trigger1 = Random < (40 + Parent,AILevel*((P2MoveType=A)*4 + 8))
var(1) = 1110
;-------------
; Spine Cracker
; Condition : LDP not blocked, opponent close enough, not in the air, not moving back (unless getting hit), average randomization, boosted randomization if LDP hit
[State 4500, MA-LDP-SC]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1110
triggerAll = Parent,AnimElemNo(0) >= 7
trigger1 = P2StateType != L
trigger1 = EnemyNear,Vel X >= 0 || P2MoveType = H
trigger1 = P2StateType != A
trigger1 = P2BodyDist X > 15
trigger1 = P2BodyDist X < (115 - Parent,AILevel*4)
trigger1 = Random < (80 + Parent,AILevel*( (NumTarget(1110)>0)*18 + 4 - (P2StateNo=[120,160])*12 ))
var(1) = 1111
;-------------
; Swaying Willow
; Condition : opponent close, not in the air, not crouching, medium to high randomization, higher if opponent attacking and at the start of movement
[State 4500, MA-SW]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [4,36]
trigger1 = P2StateType != L
trigger1 = P2StateType != C
trigger1 = P2Dist Y > -40 || (EnemyNear,Vel Y>0 && P2Dist Y>-65)
trigger1 = P2Dist X > 10
trigger1 = P2BodyDist X < (100 - Parent,AILevel*4)
trigger1 = Random < (80 + Parent,AILevel*((P2MoveType=A && EnemyNear,Time<3)*8+(P2BodyDist X<85)*40+25))
var(1) = 1120
;-------------
; Joudan Tsukiage Niren
; Condition description
[State 4500, MA-JTN]
type = null;ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [11,36]
trigger1 = P2StateType != L
trigger1 = Random < 0
var(1) = 1130
;-------------
; Leaping Side Kick
; Condition : opponent in the air
[State 4500, MA-LSK]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [11,36]
trigger1 = P2StateType != L
trigger1 = P2Dist Y >= -135
trigger1 = P2Dist Y <= -45
trigger1 = P2Dist X >= 25
trigger1 = P2Dist X <= (185 + Parent,AILevel*((EnemyNear,Vel X<0)*-3 + (P2Dist Y>-60)*-2 + (EnemyNear,Vel Y<0)*2 - 3))
trigger1 = Random < (40 + Parent,AILevel*8)
var(1) = 1140
;-------------
; Right Sweep
; Condition : opponent in range, not in the air
[State 4500, MA-RS]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [4,36]
trigger1 = P2StateType != L
trigger1 = P2StateType != A
trigger1 = P2BodyDist X <= (140 + Parent,AILevel*((EnemyNear,Vel X<0)*-3 - 6))
trigger1 = P2BodyDist X >= 12 
trigger1 = Random < (80 + Parent,AILevel*(12+(P2BodyDist X<70)*4))
var(1) = 1150
;-------------
; Stinger
; Condition : opponent not attacking, close but not too close, crouching or in the air going down, low randomization
[State 4500, MA-S]
type = null;ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1100
triggerAll = Parent,Time = [11,36]
trigger1 = P2StateType != L
trigger1 = P2MoveType != A
trigger1 = P2StateType = C ||(P2StateType=A && EnemyNear,Vel Y > 0)
trigger1 = P2Dist X > 22
trigger1 = P2BodyDist X < 70
trigger1 = Random < 0
var(1) = 2
;--------------------------

;--------------------------
;SPECIAL STEP SERIES
;-------------
; Backdash
; Condition : opponent close, attacking, low randomization
[State 4500, SS-BD]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [9,29]
trigger1 = P2BodyDist X < 60
trigger1 = P2MoveType = A
trigger1 = Random < (30 + Parent,AILevel*4)
trigger1 = BackEdgeBodyDist > 30
var(1) = 105
;-------------
; Thrusting Uppercut
; Condition : highest priority to be used as a counter, otherwise lower randomization than LDP
[State 4500, SS-TU]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [9,29]
trigger1 = P2BodyDist X >= 0
trigger1 = P2BodyDist X < (60 + 25*(EnemyNear,Vel X > 0))
trigger1 = EnemyNear, Pos Y > (-100 + 27*(EnemyNear,Vel Y < 0)*ceil(AILevel/4))
trigger1 = Random < (60 + Parent,AILevel*10 + (P2MoveType = A && P2StateType = S)*AILevel*5)
var(1) = 1030
;-------------
; Thrusting Uppercut EX
; Condition description
[State 4500, SS-TUEX]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [0,29]
triggerAll = Power >= 500
trigger1 = P2BodyDist X >= 0
trigger1 = P2BodyDist X < (60 + 12*(EnemyNear,Vel X > 0)*ceil(AILevel/4))
trigger1 = EnemyNear, Pos Y > (-100 + 55*(EnemyNear,Vel Y < 0))
trigger1 = Random < (80 + Parent,AILevel*12)
var(1) = 1070
;-------------
; Leaping Slash Kick
; Condition : opponent attempting a crouch attack, highest priority to counter a low attack, otherwise medium randomization at a distance
[State 4500, SS-LSK]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [9,29]
trigger1 = P2BodyDist X = [0,110]
trigger1 = P2StateType = C
trigger1 = P2MoveType = A
trigger1 = Random < (80 + Parent,AILevel*12)
trigger2 = P2StateType != A
trigger2 = P2BodyDist X = [60,110]
trigger2 = P2MoveType != A
trigger2 = Random < (80 + Parent,AILevel*6)
var(1) = 1060
;-------------
; Left Drill Punch
; Condition : the only one that can be done if the opponent is behind, because it is the fastest
[State 4500, SS-LDP]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [9,29]
trigger1 = P2BodyDist X >= 0
trigger1 = P2BodyDist X < (50 + 12*(EnemyNear,Vel X > 0)*ceil(AILevel/4))
trigger1 = P2Dist Y = 0 || (EnemyNear,Vel Y > 0 && EnemyNear, Pos Y > -30)
trigger1 = Random < (40 + Parent,AILevel*20)
var(1) = 1010
;-------------
; Wind Hook Fist
; Condition description
[State 4500, SS-WHF]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [9,29]
trigger1 = P2BodyDist X >= 0
trigger1 = P2BodyDist X < (45 + 12*(EnemyNear,Vel X > 0)*ceil(AILevel/4))
trigger1 = EnemyNear, Pos Y > (-50 + 20*(EnemyNear,Vel Y < 0))
trigger1 = Random < (40 + Parent,AILevel*25)
var(1) = 1020
;-------------
; Spinning Flare Kick
; Condition : opponent crouching, low randomization, higher randomization if the opponent is crouching and guarding, plus very low randomization if opponent is not crouching, or higher if opponent is moving back
[State 4500, SS-SFK]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [9,29]
triggerAll = P2BodyDist X >= 0
triggerAll = P2BodyDist X <= (90 + 10*(EnemyNear,Vel X < 0)*ceil(AILevel/4))
trigger1 = P2StateType = C
trigger1 = Random < (50 + Parent,AILevel*4)
trigger2 = P2StateType = C
trigger2 = P2StateNo = [120,155]
trigger2 = Random < (70 + Parent,AILevel*4)
trigger3 = Random < (20 + Parent,AILevel*4 + 6*(EnemyNear,Vel X < 0)*AILevel*8)
var(1) = 1040
;-------------
; Lunging Low Roundhouse Kick
; Condition : Opponent not in the air, average randomization or opponent is stand-guarding and high randomization
[State 4500, SS-LLRK]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1000
triggerAll = Parent,Time = [9,29]
triggerAll = P2BodyDist X = [0,80]
triggerAll = P2StateType != A
trigger1 = Random < (50 + Parent,AILevel*4)
trigger2 = P2StateType = S
trigger2 = P2StateNo = [120,155]
trigger2 = Random < (80 + Parent,AILevel*5)
var(1) = 1050
;-------------
; Lunging Low Roundhouse Kick - Spinning Flare Kick
; Condition : opponent close and low randomization, or LLRK success or crouch guarded and good randomization
[State 4500, SS-LLRK-SFK]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1050
triggerAll = Parent,AnimElemNo(0) = [6,7]
trigger1 = P2BodyDist X = [0,110]
trigger1 = Random < (30 + Parent,AILevel*4)
trigger2 = MoveHit && NumTarget && Random < (60 + Parent,AILevel*4)
trigger3 = MoveGuarded && P2StateType = C && Random < (70 + Parent,AILevel*5)
var(1) = 1040
;-------------
; Lunging Low Roundhouse Kick - Wind Hook Fist
; Condition : opponent close, high randomization whether hit or blocked or miss (better recovery, better guard advantage)
[State 4500, SS-LLRK-WHF]
type = ParentVarSet
triggerAll = !(Parent,Var(1))
triggerAll = Parent,AILevel
triggerAll = Parent,StateNo = 1050
triggerAll = Parent,AnimElemNo(0) = [6,7]
trigger1 = P2BodyDist X = [0,70]
trigger1 = Random < (70 + Parent,AILevel*5)
var(1) = 1020
;--------------------------

;==========================

;-----------------------------------------------------------------
