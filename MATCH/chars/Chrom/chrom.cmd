; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
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
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------
[Command]
name = "Awakening Aether"
command = ~F, DF, D, DB, B, x+y
time = 30

[Command]
name = "Awakening Aether"
command = ~F, DF, D, DB, B, z
time = 30

[Command]
name = "Killer Edge 03"
command = ~F, D, DF, a+b
time = 30

[Command]
name = "Killer Edge 03"
command = ~F, D, DF, c
time = 30

[Command]
name = "Gradivus Hyper"
command = ~B, DB, D, DF, F, a+b
time = 30

[Command]
name = "Gradivus Hyper"
command = ~B, DB, D, DF, F, c
time = 30

;-| Special Motions |------------------------------------------------------
[Command]
name = "Javelin 01"
command = ~D, DF, F, x
time = 15

[Command]
name = "Javelin 02"
command = ~D, DF, F, y
time = 15

[Command]
name = "Javelin 03"
command = ~D, DF, F, z
time = 15

[Command]
name = "Javelin Up 01"
command = ~D, DB, B, x
time = 15

[Command]
name = "Javelin Up 02"
command = ~D, DB, B, y
time = 15

[Command]
name = "Javelin Up 03"
command = ~D, DB, B, z
time = 15

[Command]
name = "Levin Sword 01"
command = ~D, DF, F, a
time = 15

[Command]
name = "Levin Sword 02"
command = ~D, DF, F, b
time = 15

[Command]
name = "Levin Sword 03"
command = ~D, DF, F, c
time = 15

[Command]
name = "Counter"
command = ~D, DB, B, a
time = 15

[Command]
name = "Counter"
command = ~D, DB, B, b
time = 15

[Command]
name = "Counter"
command = ~D, DB, B, c
time = 15

[Command]
name = "Soaring Slash 01"
command = ~F, D, DF, x
time = 20

[Command]
name = "Soaring Slash 02"
command = ~F, D, DF, y
time = 20

[Command]
name = "Soaring Slash 03"
command = ~F, D, DF, z
time = 20

[Command]
name = "Soaring Slash Air"
command = ~F, D, DF, x
time = 20

[Command]
name = "Soaring Slash Air"
command = ~F, D, DF, y
time = 20

[Command]
name = "Soaring Slash Air"
command = ~F, D, DF, z
time = 20

[Command]
name = "Killer Edge 01"
command = ~F, D, DF, a
time = 20

[Command]
name = "Killer Edge 02"
command = ~F, D, DF, b
time = 20

[Command]
name = "Advance Guard"
command = x+y
time = 5

[Command]
name = "Advance Guard"
command = x+z
time = 5

[Command]
name = "Advance Guard"
command = y+z
time = 5

[Command]
name = "SJ"
command = $D, $U

[Command]
name = "Power Up"
command = x+a

[Command]
name = "recovery_roll"
command = B,DB,D,a
time = 1

[Command]
name = "recovery_roll"
command = B,DB,D,b
time = 1

[Command]
name = "recovery_roll"
command = B,DB,D,c
time = 1

[Command]
name = "recovery_roll"
command = /F,a
time = 1

[Command]
name = "recovery_roll"
command = /F,b
time = 1

[Command]
name = "recovery_roll"
command = /F,c
time = 1

[Command]
name = "recovery_rollback"
command = /B,a
time = 1

[Command]
name = "recovery_rollback"
command = /B,b
time = 1

[Command]
name = "recovery_rollback"
command = /B,c
time = 1

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
name = "recovery" ;Required (do not remove)
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
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

[Command]
name = "recovery A"
command = a+b
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
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
[State -1, AI Activation]
type = varset
triggerall = AILevel > 2
triggerall = (roundstate = 2) && (var(59) = 0)
trigger1 = Random <= ((AILevel-2)*100)
v = 59
value = 1

[State -1, AI Deactivation]
type = varset
triggerall = AIlevel < 7
triggerall = var(59) = 1
trigger1 = Random > ((AILevel-2)*100)
trigger2 = roundstate != 2
v = 59
value = 0

;---------------------------------------------------------------------------
[State -1, AI Awakening Aether]
type = ChangeState
triggerall = var(59) > 0
triggerall = AILevel >= 7
triggerall = Power >= 3000
triggerall = StateType = S
trigger1 = p2MoveType = H && P2StateNo = [5000, 5011]
trigger1 = p2BodyDist X <= 200
trigger1 = Random <= 200
trigger1 = ctrl = 1
value = 3000

[State -1, AI Killer Edge Hyper]
type = ChangeState
triggerall = var(59) > 0
triggerall = AILevel >= 6
triggerall = Power >= 1000
triggerall = StateType = S || StateType = C
triggerall = (EnemyNear(var(58)), Alive) && !(InGuardDist)
trigger1 = StateNo != 3000
trigger1 = p2MoveType = H || P2MoveType = A
trigger1 = p2BodyDist X = [0,40]
trigger1 = Random <= 500
trigger1 = ctrl = 1
value = 3100

[State -1, AI Guarding, Easy/Medium AI]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = AILevel <=5
triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
trigger1 = (p2bodydist x <= 250) && (random = [200,899]) && (vel x < 0)
trigger2 = (p2bodydist x <= 250) && (random = [800,899]) && (vel x > 0)
trigger3 = (p2bodydist x <= 250) && (random = [400,899]) && (vel x = 0)
trigger4 = (anim = 21)
trigger5 = (prevstateno > 5000) && (random < 200)
value = 130

[State -1, AI Guarding, Easy/Medium AI]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = AILevel <=5
triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
trigger1 = (p2bodydist x <= 250) && (random = [500,899])
trigger2 = (prevstateno > 5000) && (random < 200)
value = 131

[State -1, AI Guarding, Easy/Medium AI]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = AILevel <=5
triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
trigger1 = (p2bodydist x <= 250) && (random = [700,899])
trigger2 = (anim = 43) || (anim = 46)
trigger3 = (prevstateno > 5000) && (random < 200)
value = 132

[State -1, AI Guarding, Hard AI]
type = ChangeState
triggerall = (var(59) != 0) && Numenemy && (stateno != [120,155])
triggerall = RoundState = 2
triggerall = AILevel > 5
triggerall = Random <= (AILevel * 10)
triggerall =!(enemynear,hitdefattr = SCA,AT)
triggerall = inguarddist
trigger1 = ctrl
value = 120

[State -1, AI Advance Guard Stand]
type = ChangeState
value = 880
triggerall = AILevel >= 7
triggerall = (var(59) > 0)
triggerall = statetype = S
trigger1 = stateno = [150,153]
trigger1 = random < 200

[State -1, AI Advance Guard Crouch]
type = ChangeState
value = 881
triggerall = AILevel >= 7
triggerall = (var(59) > 0)
triggerall = statetype = C
trigger1 = stateno = [150,153]
trigger1 = random < 200

[State -1, AI Advance Guard Air]
type = ChangeState
value = 882
triggerall = AILevel >= 6
triggerall = (var(59) > 0)
triggerall = statetype = A
trigger1 = stateno = [154,155]
trigger1 = random < 200

[State -1, AI Taunt]
type = ChangeState
value = 195
triggerall = Var(59) = 1
triggerall = StateType = S || StateType = C
triggerall = RoundState = 3
triggerall = Alive = 1
trigger1 = Ctrl = 1

[State -1, Rec] ; Recover near ground (use ChangeState)
type = ChangeState
triggerall = var(59) > 0 && (stateno = [5050,5060])
triggerall = AILevel >= 5
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
trigger1 = CanRecover
value = 5200 ;HITFALL_RECOVER

[State -1, Rec] ; Recover in mid air (use SelfState)
type = SelfState
triggerall = var(59) > 0 && (stateno = [5050,5060])
triggerall = AILevel >= 4
triggerall = Vel Y > 0
triggerall = alive
trigger1 = CanRecover
value = 5210 ;HITFALL_AIRRECOVER

;---------------------------------------------------------------------------
;Jump
[State -1, Jump]
type = ChangeState
value = 49
triggerall = stateno != 100 && pos y = 0 && ctrl && p2stateno != 822 && p2stateno != 823
triggerall = var(59) > 0
triggerall = statetype != A && enemy,vel y < 0 && enemy,pos y < -10
triggerall = p2movetype != A
trigger1 = p2stateno = 5040 || p2stateno = 5200 || p2stateno = 5210 || p2movetype = H
trigger1 = (p2bodydist y = [-40,-1]) || enemy,vel y < 0
trigger1 = p2bodydist x <= 25
trigger2 = p2movetype = H && (p2stateno = 5040 || p2stateno = 5200 || p2stateno = 5210)
trigger2 = (p2bodydist y = [-40,-1])
trigger2 = p2bodydist x <= 50

[State -1, Jump]
type = ChangeState
value = 49
triggerall = stateno != 100 && pos y = 0 && ctrl && p2stateno != 822 && p2stateno != 823
triggerall = var(59) > 0
triggerall = statetype != A && frontedgedist > 200 && p2movetype != A
trigger1 = (p2bodydist x = [150,170]) && random <= 400
trigger1 = enemy,backedgedist < 70

;===========================================================================
;Awakening Aether
[State -1, Awakening Aether]
type = ChangeState
value = 3000
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Awakening Aether"
triggerall = power >= 3000
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
;Killing Edge Heavy
[State -1, Killing Edge Heavy]
type = ChangeState
value = 3100
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Killer Edge 03"
triggerall = power >= 1000
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
;Gradivus Hyper
[State -1, Gradivus Hyper]
type = ChangeState
value = 3200
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Gradivus Hyper"
triggerall = power >= 2000
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;===========================================================================
;---------------------------------------------------------------------------
;Soaring Slash 01
[State -1, Soaring Slash 01]
type = ChangeState
value = 1300
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Soaring Slash 01"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
;Soaring Slash 02
[State -1, Soaring Slash 02]
type = ChangeState
value = 1301
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Soaring Slash 02"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
;Soaring Slash 03
[State -1, Soaring Slash 03]
type = ChangeState
value = 1302
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Soaring Slash 03"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
;Soaring Slash Air
[State -1, Soaring Slash Air]
type = ChangeState
value = 1303
triggerall = Var(59) = 0
triggerall = statetype = A
triggerall = command = "Soaring Slash Air"
trigger1 = ctrl
trigger2 = stateno = [600,650]
trigger2 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
;Killing Edge 01
[State -1, Killing Edge 01]
type = ChangeState
value = 1200
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Killer Edge 01"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
;Killing Edge 02
[State -1, Killing Edge 02]
type = ChangeState
value = 1201
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Killer Edge 02"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Javelin Throw 01
[State -1, Javelin Throw 01]
type = ChangeState
value = 1000
triggerAll = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Javelin 01"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Javelin Throw 02
[State -1, Javelin Throw 02]
type = ChangeState
value = 1001
triggerAll = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Javelin 02"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Javelin Throw 03
[State -1, Javelin Throw 03]
type = ChangeState
value = 1002
triggerAll = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Javelin 03"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Javelin Up Throw 01
[State -1, Javelin Up Throw 01]
type = ChangeState
value = 1010
triggerAll = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Javelin Up 01"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Javelin Up Throw 02
[State -1, Javelin Up Throw 02]
type = ChangeState
value = 1011
triggerAll = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Javelin Up 02"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Javelin Up Throw 03
[State -1, Javelin Up Throw 03]
type = ChangeState
value = 1012
triggerAll = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Javelin Up 03"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Levin Sword 01
[State -1, Levin Sword 01]
type = ChangeState
value = 1100
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Levin Sword 01"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Levin Sword 02
[State -1, Levin Sword 02]
type = ChangeState
value = 1101
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Levin Sword 02"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Levin Sword 03
[State -1, Levin Sword 03]
type = ChangeState
value = 1102
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Levin Sword 03"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Counter
[State -1, Counter]
type = ChangeState
value = 1400
triggerall = Var(59) = 0
triggerall = statetype != A
triggerall = command = "Counter"
trigger1 = (statetype = S) && ctrl
trigger2 = stateno = [200,250]
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = [400,450]
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Advance Guard (Stand)
[State -1, Advance Guard (Stand)]
type = ChangeState
value = 880
triggerall = !Var(59)
triggerall = command = "Advance Guard" && statetype = S
trigger1 = stateno = [150,153]

;---------------------------------------------------------------------------
; Advance Guard (Crouch)
[State -1, Advance Guard (Crouch)]
type = ChangeState
value = 881
triggerall = !Var(59)
triggerall = command = "Advance Guard" && statetype = C
trigger1 = stateno = [150,153]

;---------------------------------------------------------------------------
; Advance Guard (Jump)
[State -1, Advance Guard (Jump)]
type = ChangeState
value = 882
triggerall = !Var(59)
triggerall = command = "Advance Guard" && statetype = A
trigger1 = stateno = [154,155]

;---------------------------------------------------------------------------
; Forward Dodge
[State -1, Forward Dodge]
type = Changestate
value = 900
triggerall = var(59) <= 0
triggerall = command = "fwd_x"
trigger1 = statetype != A
trigger1 = (statetype = s) && ctrl

;---------------------------------------------------------------------------
; Backward Dodge
[State -1, Backward Dodge]
type = Changestate
value = 910
triggerall = var(59) <= 0
triggerall = command = "back_x"
trigger1 = statetype != A
trigger1 = (statetype = s) && ctrl

;---------------------------------------------------------------------------
; Spot Dodge
[State -1, Spot Dodge]
type = Changestate
value = 920
triggerall = var(59) <= 0
triggerall = command = "recovery A"
trigger1 = statetype != A
trigger1 = (statetype = s) && ctrl

;---------------------------------------------------------------------------
; Air Dodge
[State -1, Air Dodge]
type = Changestate
value = 921
triggerall= command = "recovery A" && var(59) != 1
trigger1 = statetype = A && (ctrl)

;---------------------------------------------------------------------------
; Lie Down Recovery Roll Foward
[State -1, Roll]
type = ChangeState
value = 940
triggerall = command = "holdfwd"
triggerall = !var(0)&&roundstate=2
triggerall = time = 1
trigger1 = stateno = 5120

;---------------------------------------------------------------------------
; Lie Down Recovery Roll Back
[State -1, Roll]
type = ChangeState
value = 941
triggerall = command = "holdback"
triggerall = !var(0)&&roundstate=2
triggerall = time = 1
trigger1 = stateno = 5120

;---------------------------------------------------------------------------
; Tech Hit Recovery Roll Forward
[State -1, Roll]
type = ChangeState
value = 942
triggerall = !ctrl && Command = "recovery_roll"
triggerall = (StateNo = 5030) || (StateNo = 5035) || (StateNo = 5050) || (StateNo = 5071)
triggerall = !var(0)&&roundstate=2
triggerall = movetype != A
trigger1 = pos Y > -10

;---------------------------------------------------------------------------
; Tech Hit Recovery Roll Back
[State -1, Roll]
type = ChangeState
value = 943
triggerall = !ctrl && Command = "recovery_rollback"
triggerall = (StateNo = 5030) || (StateNo = 5035) || (StateNo = 5050) || (StateNo = 5071)
triggerall = !var(0)&&roundstate=2
triggerall = movetype != A
trigger1 = pos Y > -10

;---------------------------------------------------------------------------
;Power Up
[State -1, Power Up]
type = ChangeState
value = 700
triggerall = var(59) = 0
triggerall = command = "Power Up"
triggerall = power < powermax
trigger1 = (statetype = S || statetype = C) && ctrl
ignorehitpause = 0

;---------------------------------------------------------------------------
; Super Jump
[State -1, Super Jump]
type = ChangeState
value = 7000
triggerall = !Var(59)
trigger1 = Command = "SJ"
trigger1 = StateType = S
trigger1 = ctrl
trigger2 = Command = "holdup"
trigger2 = stateno = 420 && movehit

;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "y" || command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 10
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;===========================================================================
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 230
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 230
trigger3 = (time >= 9) || MoveContAct
trigger4 = stateno = 240
trigger4 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 210
trigger3 = (time >= 10) || MoveContAct
trigger4 = stateno = 230
trigger4 = (time >= 9) || MoveContAct
trigger5 = stateno = 240
trigger5 = (time >= 9) || MoveContAct
trigger6 = stateno = 400
trigger6 = (time >= 9) || MoveContAct
trigger7 = stateno = 410
trigger7 = (time >= 10) || MoveContAct
trigger8 = stateno = 430
trigger8 = (time >= 9) || MoveContAct
trigger9 = stateno = 440
trigger9 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 230
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 230
trigger3 = (time >= 9) || MoveContAct
trigger4 = stateno = 210
trigger4 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 210
trigger3 = (time >= 10) || MoveContAct
trigger4 = stateno = 230
trigger4 = (time >= 9) || MoveContAct
trigger5 = stateno = 240
trigger5 = (time >= 9) || MoveContAct
trigger6 = stateno = 400
trigger6 = (time >= 9) || MoveContAct
trigger7 = stateno = 410
trigger7 = (time >= 10) || MoveContAct
trigger8 = stateno = 430
trigger8 = (time >= 9) || MoveContAct
trigger9 = stateno = 440
trigger9 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 430
trigger3 = (time >= 10) || MoveContAct

;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 430
trigger3 = (time >= 10) || MoveContAct
trigger4 = stateno = 440
trigger4 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 410
trigger3 = (time >= 10) || MoveContAct
trigger4 = stateno = 430
trigger4 = (time >= 9) || MoveContAct
trigger5 = stateno = 440
trigger5 = (time >= 9) || MoveContAct
trigger6 = stateno = 200
trigger6 = (time >= 9) || MoveContAct
trigger7 = stateno = 210
trigger7 = (time >= 10) || MoveContAct
trigger8 = stateno = 230
trigger8 = (time >= 9) || MoveContAct
trigger9 = stateno = 240
trigger9 = (time >= 9) || MoveContAct
trigger10 = stateno = 450
trigger11 = (time >= 9) || MoveContact

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 430
trigger3 = (time >= 10) || MoveContAct

;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 410
trigger3 = (time >= 10) || MoveContAct
trigger4 = stateno = 430
trigger4 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 410
trigger3 = (time >= 9) || MoveContAct
trigger4 = stateno = 430
trigger4 = (time >= 9) || MoveContAct
trigger5 = stateno = 440
trigger5 = (time >= 9) || MoveContAct
trigger6 = stateno = 200
trigger6 = (time >= 9) || MoveContAct
trigger7 = stateno = 210
trigger7 = (time >= 10) || MoveContAct
trigger8 = stateno = 230
trigger8 = (time >= 9) || MoveContAct
trigger9 = stateno = 240
trigger9 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 630
trigger3 = (time >= 10) || MoveContAct

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 630
trigger3 = (time >= 9) || MoveContAct
trigger4 = stateno = 640
trigger4 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 610
trigger3 = (time >= 9) || MoveContAct
trigger4 = stateno = 630
trigger4 = (time >= 9) || MoveContAct
trigger5 = stateno = 640
trigger5 = (time >= 9) || MoveContAct
trigger6 = stateno = 650
trigger6 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 630
trigger3 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 610
trigger3 = (time >= 10) || MoveContAct
trigger4 = stateno = 630
trigger4 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = (time >= 9) || MoveContAct
trigger3 = stateno = 610
trigger3 = (time >= 10) || MoveContAct
trigger4 = stateno = 620
trigger4 = (time >= 9) || MoveContAct
trigger5 = stateno = 630
trigger5 = (time >= 9) || MoveContAct
trigger6 = stateno = 640
trigger6 = (time >= 9) || MoveContAct

;---------------------------------------------------------------------------
