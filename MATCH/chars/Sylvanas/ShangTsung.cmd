;Inteligência Artificial (by DarkSide Joe)
[Command]
name = "CPU_1"
command = F, F, F, F, F, F,U, U, U, U
time = 1

[Command]
name = "CPU_2"
command = a, a, a, a, a, a, b, b, b, b
time = 1

[Command]
name = "CPU_3"
command = D, U, D, U, D, U, D, D, D, D
time = 1

[Command]
name = "CPU_4"
command = F, x, F, B, y, B, F, x, F, B
time = 1

[Command]
name = "CPU_5"
command = F, x, F, B, y, B, F, x, F, B
time = 1

[Command]
name = "CPU_6"
command = a, c, b, y, y, B, F, x, F, B
time = 1

[Command]
name = "CPU_7"
command = F, x, F, B, a, x, y, x, F, B
time = 1


;-| Button Remapping |-----------------------------------------------------
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------

[Command]
name = "qcf_2k"
command = ~D, DF, F, D, DF, F, a+x
time=25

[Command]
name = "qcf_2k"
command = ~D, DF, F,D, DF, F, z+c
time=25

[Command]
name = "qcf_2k"
command = ~D, DF, F,D, DF, F, b+y
time=25

[Command]
name = "qcb_2k"
command = ~D, DB, B,D, DF, F, a+x
time=25

[Command]
name = "qcb_2k"
command = ~D, DB, B,D, DF, F, z+c
time=25

[Command]
name = "qcb_2k"
command = ~D, DB, B,D, DF, F, b+y
time=25


[command]
name = "superupper"
command = ~D,DB,B,D,DB,B,z
time = 25

[command]
name = "superupper2"
command = ~D,DB,B,D,DB,B,y
time = 25

[command]
name = "superupper3"
command = ~D,DB,B,D,DB,B,x
time = 25

[command]
name = "superupper"
command = ~D,DB,B,D,DB,B,~z
time = 25
buffer.time=10
[command]
name = "superupper2"
command = ~D,DB,B,D,DB,B,~y
time = 25
buffer.time=10
[command]
name = "superupper3"
command = ~D,DB,B,D,DB,B,~x
time = 25
buffer.time=10

[command]
name = "uppers"
command = ~D,DB,B,D,DB,B,x+y
time = 25

[command]
name = "uppers"
command = ~D,DB,B,D,DB,B,x+z
time = 25

[command]
name = "uppers"
command = ~D,DB,B,D,DB,B,z+y
time = 25

[command]
name = "uppers"
command = ~D,DB,B,D,DB,B,z+y
time = 25
buffer.time=10
[command]
name = "uppers"
command = ~D,DB,B,D,DB,B,z+x
time = 25
buffer.time=10
[command]
name = "uppers"
command = ~D,DB,B,D,DB,B,x+y
time = 25
buffer.time=10

[Command]
name = "QCB_PP"
command = ~D, DF,F,D, DF,F, x
time=25
[Command]
name = "QCB_PP"
command = ~D, DF,F,D, DF,F, y
time=25
[Command]
name = "QCB_PP"
command = ~D, DF,F,D, DF,F,z
time=25

[Command]
name = "Hyper 2"
command = ~D, DF, F,D, DF, F, a
time = 25
[Command]
name = "Hyper 2"
command = ~D, DF, F,D, DF, F,b
time = 25
[Command]
name = "Hyper 2"
command = ~D, DF, F,D, DF, F,c
time = 25

;-| Special Motions |------------------------------------------------------
[Command]
name = "RoundhouseKick"
command = c
time = 15

[Command]
name = "Sweep"
command = B,a
time = 15


[Command]
name = "sp4"
command = D,DB, B, x+y
time = 25
[Command]
name = "sp4"
command = D,DB, B, y+z
time = 25
[Command]
name = "sp4"
command = D,DB, B, z+x
time = 25


[Command]
name = "sp3"
command = D,DB, B, x
time = 25

[Command]
name = "sp2"
command = D,DB, B, y
time = 25

[Command]
name = "sp1"
command = D,DB, B, z
time = 25

[Command]
name = "SkullFire"
command = ~D,DF,F,x
time = 15

[Command]
name = "SkullFire"
command = ~D,DF,F,y
time = 15

[Command]
name = "SkullFire2"
command = ~D,DF,F,z
time = 15

;necro upper
[Command]
name = "necroupper1"
command = ~D, DB, B, a
time = 20

[Command]
name = "necroupper2"
command = ~D, DB, B, b
time = 20

[Command]
name = "necroupper3"
command = ~D, DB, B, c
time = 20

;foguinho
[Command]
name = "????X"
command=$D,D,x
time=25

[Command]
name = "????Y"
command=$D,D,y
time=25
[Command]
name = "????A"
command=$D,D,z
time=25

[Command]
name = "????B"
command=$D,D,x+y
time=25
[Command]
name = "????B"
command=$D,D,z+y
time=25
[Command]
name = "????B"
command=$D,D,x+z
time=25

;ombie
[Command]
name="bfp"
command= D, DF, F,a
time=25
[Command]
name="bfp"
command=D, DF, F,b
time=25
[Command]
name="bfp"
command=D, DF, F,c
time=25
[Command]
name="bfp"
command=~D,DF,F,a
time=25
[Command]
name="bfp"
command=~D,DF,F,b
time=25
[Command]
name="bfp"
command=~D,DF,F,c
time=25


;EX Skull Fire 
[Command]
name = "SkullFire3"
command = ~D,DF,F,z+y
time = 25
[Command]
name = "SkullFire3"
command = ~D,DF,F,z+x
time = 25
[Command]
name = "SkullFire3"
command = ~D,DF,F,x+y
time = 25

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, x
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, y
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, z
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, ~x
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, ~y
time = 16

[Command]
name = "412p" ;Zero Counter
command = ~B, DB, D, ~z
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, a
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, b
time = 16

[Command]
name=  "412k" ;Zero Counter
command = ~B, DB, D, c
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, ~a
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, ~b
time = 16

[Command]
name = "412k" ;Zero Counter
command = ~B, DB, D, ~c
time = 16

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+x
time = 1

[Command]
name = "pp"
command = x+y
time = 1

[Command]
name = "pp"
command = x+z
time = 1

[Command]
name = "pp"
command = y+z
time = 1

[Command]
name = "kk"
command = a+b
time = 1

[Command]
name = "kk"
command = a+c
time = 1

[Command]
name = "kk"
command = b+c
time = 1

[Command]
name = "a+x"
command = a+x
time=1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
;Release Direction
[Command]
name = "rlsfwd"
command = ~$F
time = 1

[Command]
name = "rlsback"
command = ~$B
time = 1

[Command]
name = "rlsup"
command = ~$U
time = 1

[Command]
name = "rlsdown"
command = ~$D
time = 1

;--------------------------------------------------------------------------
;Release Button
[Command]
name = "rlsx"
command = ~x
time = 1

[Command]
name = "rlsy"
command = ~y
time = 1

[Command]
name = "rlsz"
command = ~z
time = 1

[Command]
name = "rlsa"
command = ~a
time = 1

[Command]
name = "rlsb"
command = ~b
time = 1

[Command]
name = "rlsc"
command = ~c
time = 1
;---------------------------------------------------------------------------
;Other
[Command]
name = "highjump"
command = $D, $U
time = 15
;---------------------------------------------------------------------------




;--------------------------------------------------------------------------
[Statedef -1]

[State -1, Tick Fix]
type = CtrlSet
triggerall = !ctrl
trigger1 = (StateNo = 52 || StateNo = 101 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime
trigger3 = (StateNo = [760,762]) && !AnimTime
trigger4 = StateNo = 810 && !AnimTime
trigger5 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
trigger6 = (StateNo = [700,715]) && !AnimTime
value = 1

[State -1, CtrlSet For Helpers];special thanks to 20S
type = CtrlSet
trigger1 = IsHelper
value = 0

[State -1, Hit Count For Helpers];special thanks to 20S
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime 
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -1, Juggle Count For Helpers];special thanks to 20S
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime 
trigger1 = !(HitDefAttr = SCA, AT)
var(15) = 1


;=================INTELIGENCIA ARTIFICIAL=========================================

[State -1]
type = VarSet
trigger1 = command = "CPU_1"
trigger2 = command = "CPU_2"
trigger3 = command = "CPU_3"
trigger4 = command = "CPU_4"
trigger5 = command = "CPU_5"
trigger6 = command = "CPU_6"
trigger7 = command = "CPU_7"
v = 59
value = 1

;---Rotinas da AI-------------

;CPU_1
[State -1, AntiAereo]
type = ChangeState
triggerall = Ctrl
triggerall = RoundState = 2 && NumProj = 0
triggerall = var(59) != 0
Triggerall = statetype != A && movetype !=H
trigger1 = P2BodyDist X >80 && Random <= 40
Trigger2 = enemy,numproj != 0 && random <=40
value = ifelse(p2bodydist x<=100,10001,10003)

;CPU_2
[State -1, Defesa Abaixo]
type = ChangeState
trigger1 = Ctrl
trigger1 = RoundState = 2
trigger1 = var(59) != 0
trigger1 = Random <= 850
trigger1 = P2BodyDist X <= 75
trigger1 = StateType = C
trigger1 = P2MoveType = A
trigger1 = stateType != A
Trigger1 = !Inguarddist
value = 131

;CPU_3
[State -1, Defesa em pé]
type = ChangeState
triggerall = Ctrl
triggerall = RoundState = 2 && NumProj = 0
triggerall = var(59) != 0
Triggerall = statetype != A && movetype !=H
trigger1 = P2Bodydist X >= 130 && random <=40
Trigger2 = enemy,numproj != 0 && random <=40
value = 501600

;CPU_4
[State -1, Agarroes]
type = ChangeState
trigger1 = Ctrl
trigger1 = RoundState = 2
trigger1 = var(59) != 0
Trigger1 = P2StateType != L
trigger1 = Random <= 90
trigger1 = P2BodyDist X <= 10
trigger1 = P2MoveType != H && P2StateType != A
trigger1 = stateType != A && Movetype != H
value = ifelse(frontedgedist >= backedgedist,800,850)

;CPU_5
[State -1, Magia];skul fire
type = ChangeState
triggerall = Ctrl
triggerall = RoundState = 2 && NumProj = 0
triggerall = var(59) != 0
Triggerall = statetype != A && movetype !=H
trigger1 = P2BodyDist X >80 && Random <= 70
Trigger2 = enemy,numproj != 0 && random <=70
value = ifelse(p2bodydist x<=200,1000,1004)

;CPU_5
[State -1, Magia];skul fire
type = ChangeState
triggerall = Ctrl
triggerall = RoundState = 2 && NumProj = 0
triggerall = var(59) != 0
Triggerall = statetype != A && movetype !=H
trigger1 = P2BodyDist X >80 && Random <= 50&& power >= 500 
Trigger2 = enemy,numproj != 0 && random <=30
value = 1005

;CPU6
[State -1, Magia] ; ex eRUPTION
type = ChangeState
triggerall = Ctrl
triggerall = RoundState = 2 && NumProj = 0
triggerall = var(59) != 0
Triggerall = statetype != A && movetype !=H
trigger1 = P2BodyDist X >200 && Random <= 50 && power >= 500 
Trigger2 = enemy,numproj != 0 && random <=100
value = 1100

;CPU7
[State -1, Magia]; ERUPTION
type = ChangeState
triggerall = Ctrl
triggerall = RoundState = 2 && NumProj = 0
triggerall = var(59) != 0
Triggerall = statetype != A && movetype !=H
trigger1 = enemynear, pos X = 80 && Random <= 100
Trigger2 = enemy,numproj != 0 && random <=100
value = 1105


;[State -1, ProjContact];special thanks to 20S
;type = VarSet
;trigger1 = IsHelper
;trigger1 = MoveContact = 1 && NumTarget
;var(18) = 1

;[State -1, Root ProjContact];special thanks to 20S
;type = ParentVarSet
;trigger1 = IsHelper
;trigger1 = MoveContact = 1 && NumTarget
;var(18) = 1

;The Lost Soul's
[State -1, Lost souls army]
type = ChangeState
value = 3300
triggerall = power >= 3000
triggerall = command = "qcf_2k"
trigger1 = statetype = S
trigger1 = ctrl = 1

;uppers
[State -1, uppers]
type = ChangeState
value = 1850
triggerall = command = "uppers"
triggerall = (statetype != A)
triggerall = power >= 2000
trigger1= ctrl

;superupper3
[State -1, superupper3]
type = ChangeState
value = 1750
triggerall = command = "superupper3"
triggerall = numhelper(100) =0
triggerall = (statetype != A)
trigger1= ctrl
triggerall = power >= 1000

;superupper2
[State -1, superupper2]
type = ChangeState
value = 1751
triggerall = command = "superupper2"
triggerall = numhelper(100) =0
triggerall = (statetype != A)
trigger1= ctrl
triggerall = power >= 1000

;superupper
[State -1, superupper]
type = ChangeState
value = 1752
triggerall = command = "superupper"
triggerall = numhelper(100) =0
triggerall = (statetype != A)
trigger1= ctrl
triggerall = power >= 1000


[State -1, Brilliant Shower]
type = ChangeState
value = 3400
triggerall = roundstate = 2 && !var(59) && var(6) < 2
triggerall = command = "QCB_PP"
triggerall = power >= 1000
trigger1 = statetype != A && ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 220 && movecontact
trigger5 = stateno = 230 && movecontact
trigger6 = stateno = 240 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && movecontact
trigger10 = stateno = 420 && movecontact
trigger11 = stateno = 425 && movecontact
trigger12 = stateno = 430 && movecontact
trigger13 = stateno = 440 && movecontact
trigger14 = stateno = 450 && movecontact

; Painfull Nightmare
[State -1, Painfull Nightmare]
type = ChangeState
value = 2180
triggerall = !Var(59)
triggerall = command = "Hyper 2"
triggerall = power >= 1000
triggerall = numhelper(2181) = 0
triggerall = StateType != A
trigger1 = ctrl
trigger2 = (stateno = [200,490]) && movecontact

[State -1, eruption]
type = ChangeState
value = 1100
trigger1 = command = "sp4"
triggerall = statetype = S
triggerall = power >= 500
triggerall = ctrl = 1
triggerall = numhelper(1100) = 0
;triggerall = enemy,numexplod(118) = 0
triggerall = roundstate = 2
trigger1 = var(50) = 0 
trigger2 = p2statetype != A || p2stateno = 5120
trigger2 = (p2stateno!= [600,621])
trigger2 = p2bodydist x > 210 || (p2bodydist x > 110 && p2movetype = A)
trigger2 = var(50) = 1 
trigger2 = p2life > 1 && enemy,vel x = 0 && inguarddist = 0 && p2stateno != 1000

[State -1, eruption]
type = ChangeState
value = 1105
trigger1 = command = "sp3"
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = numhelper(1105) = 0
;triggerall = enemy,numexplod(118) = 0
triggerall = roundstate = 2
trigger1 = var(50) = 0 
trigger2 = p2statetype != A || p2stateno = 5120
trigger2 = (p2stateno!= [600,621])
trigger2 = p2bodydist x > 210 || (p2bodydist x > 110 && p2movetype = A)
trigger2 = var(50) = 1 
trigger2 = p2life > 1 && enemy,vel x = 0 && inguarddist = 0 && p2stateno != 1000

[State -1, eruption]
type = ChangeState
value = 1107
trigger1 = command = "sp2"
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = numhelper(1107) = 0
;triggerall = enemy,numexplod(118) = 0
triggerall = roundstate = 2
trigger1 = var(50) = 0 
trigger2 = p2statetype != A || p2stateno = 5120
trigger2 = (p2stateno!= [600,621])
trigger2 = p2bodydist x > 210 || (p2bodydist x > 110 && p2movetype = A)
trigger2 = var(50) = 1 
trigger2 = p2life > 1 && enemy,vel x = 0 && inguarddist = 0 && p2stateno != 1000

[State -1, eruption]
type = ChangeState
value = 1109
trigger1 = command = "sp1"
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = numhelper(1109) = 0
;triggerall = enemy,numexplod(118) = 0
triggerall = roundstate = 2
trigger1 = var(50) = 0 
trigger2 = p2statetype != A || p2stateno = 5120
trigger2 = (p2stateno!= [600,621])
trigger2 = p2bodydist x > 210 || (p2bodydist x > 110 && p2movetype = A)
trigger2 = var(50) = 1 
trigger2 = p2life > 1 && enemy,vel x = 0 && inguarddist = 0 && p2stateno != 1000

;---------------------------------------------------------------------------

;Bastonazo
[State -1, Bastonazo]
type = ChangeState
value = 10001
triggerall = command = "necroupper1"
trigger1 = statetype != A
trigger1 = ctrl

;Bastonazo
[State -1, Bastonazo]
type = ChangeState
value = 10002
triggerall = command = "necroupper2"
trigger1 = statetype != A
trigger1 = ctrl

;Bastonazo
[State -1, Bastonazo]
type = ChangeState
value = 10003
triggerall = command = "necroupper3"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------

;Skull Fire
[State -1]
type = Changestate
value = 1005
triggerall = command = "SkullFire3"
triggerall = RoundState = 2 && StateType != A
triggerall = ifelse(var(20) <= 0, power >= 500, power >= 0)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(5)

;---------------------------------------------------------------------------
;Skull Fire
[State -1]
type = Changestate
value = 1004
triggerall = command = "SkullFire2"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(5)

;---------------------------------------------------------------------------
;Skull Fire
[State -1]
type = Changestate
value = 1000
triggerall = command = "SkullFire"
triggerall = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(5)
trigger3 = stateno = 105



[State Soul Summon]
type = ChangeState
triggerall = var(55) = 0; & (var(56) = [6,7])
triggerall = var(59) < 1
triggerall = command = "bfp"
triggerall = !numhelper(501405)
triggerall = !numhelper(501410)
triggerall = !numhelper(501601)
triggerall = !numhelper(501602)
triggerall = !numhelper(501603)
triggerall = !numhelper(501604)
triggerall = !numhelper(501605)
triggerall = life >= 3
trigger1 = statetype != A &(stateno = [0,100]) | (stateno=[200,210]) |  (stateno=[220,430]) & (stateno != 300) & (time <= 5)
value = 501600


;????A
[State -1, JA]
type = ChangeState
value = 1305
triggerall = command = "????B" & power >= 500
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;????X
[State -1, JX]
type = ChangeState
value = 1300
triggerall = command = "????X"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;????Y
[State -1, JY]
type = ChangeState
value = 1310
triggerall = command = "????Y"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact

;????A
[State -1, JA]
type = ChangeState
value = 1315
triggerall = command = "????A"
triggerall = statetype != A
trigger1 = ctrl
trigger2=(stateno=[200,499]) && movecontact



;------------------------------------------------------------------------------

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20)

[State -1]
type = ChangeState
value = 800
triggerall = var(59)!=1
triggerall = roundstate=2
triggerall = command = "pp"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype = S
triggerall = p2bodydist X <= 15
triggerall = ctrl
triggerall = stateno != [100,101]
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H


[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl


[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = command="Sweep"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1= ctrl || (stateno=[100,101])

[State -1, roll/dodge]
type=changestate
value=ifelse(command="holdfwd",720,715)
triggerall=var(59)<=0&&roundstate=2&&(command="a+x")&&statetype!=A
trigger1=ctrl

[State -1, powercharge]
type=changestate
value=730
trigger1=var(59)<=0&&roundstate=2&&command="hold_b"&&command="hold_y"&&statetype!=A&&power<powermax&&ctrl&&!var(20)


;--------------------------------------------------------------------------
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1= ctrl || (stateno=[100,101])
trigger2= (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >=5

[State -1, Stand Medium Punch]
type = ChangeState
value = 210 
triggerall = command = "y"
triggerall = command != "holddown"  
triggerall = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = stateno = 220
trigger2 = animtime = 0

[State -1, Stand Strong Punch]
type = ChangeState
value = 220 
triggerall = command = "z"
triggerall = command != "holddown" 
triggerall = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = stateno = 210
trigger3 = stateno = 210
trigger3 = animtime = 0

[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1= ctrl || (stateno=[100,101])


[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = command="RoundhouseKick"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1= ctrl || (stateno=[100,101])

[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1= ctrl || (stateno=[100,101])

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2= (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >=5

[State -1, Crouching Medium Punch]
type = ChangeState
value = 400
triggerAll = command = "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2= (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >=15

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59)<1  &&roundstate=2
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl
