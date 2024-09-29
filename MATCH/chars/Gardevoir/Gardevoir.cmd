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

[Command]
name = "AI1"
command = a,a,a,a,a,a,a,a
time = 0

[Command]
name = "AI2"
command = b,b,b,b,b,b,b,b
time = 0

[Command]
name = "AI3"
command = c,c,c,c,c,c,c,c
time = 0

[Command]
name = "AI4"
command = x,x,x,x,x,x,x,x
time = 0

[Command]
name = "AI5"
command = y,y,y,y,y,y,y,y
time = 0

[Command]
name = "AI6"
command = z,z,z,z,z,z,z,z
time = 0

[Command]
name = "AI7"
command = a,a,a,a,b,b,b,b
time = 0

[Command]
name = "AI8"
command = a,a,a,a,c,c,c,c
time = 0

[Command]
name = "AI9"
command = a,a,a,a,x,x,x,x
time = 0

[Command]
name = "AI10"
command = a,a,a,a,y,y,y,y
time = 0

[Command]
name = "AI11"
command = a,a,a,a,z,z,z,z
time = 0

[Command]
name = "AI12"
command = b,b,b,b,a,a,a,a
time = 0

[Command]
name = "AI13"
command = b,b,b,b,c,c,c,c
time = 0

[Command]
name = "AI14"
command = b,b,b,b,x,x,x,x
time = 0

[Command]
name = "AI15"
command = b,b,b,b,y,y,y,y
time = 0

[Command]
name = "AI16"
command = b,b,b,b,z,z,z,z
time = 0

[Command]
name = "AI17"
command = c,c,c,c,a,a,a,a
time = 0

[Command]
name = "AI18"
command = c,c,c,c,b,b,b,b
time = 0

[Command]
name = "AI19"
command = c,c,c,c,x,x,x,x
time = 0

[Command]
name = "AI20"
command = c,c,c,c,y,y,y,y
time = 0

[Command]
name = "AI21"
command = c,c,c,c,z,z,z,z
time = 0

[Command]
name = "AI22"
command = x,x,x,x,a,a,a,a
time = 0

[Command]
name = "AI23"
command = x,x,x,x,b,b,b,b
time = 0

[Command]
name = "AI24"
command = x,x,x,x,c,c,c,c
time = 0

[Command]
name = "AI25"
command = x,x,x,x,y,y,y,y
time = 0

[Command]
name = "AI26"
command = x,x,x,x,z,z,z,z
time = 0

[Command]
name = "AI27"
command = y,y,y,y,a,a,a,a
time = 0

[Command]
name = "AI28"
command = y,y,y,y,b,b,b,b
time = 0

[Command]
name = "AI29"
command = y,y,y,y,c,c,c,c
time = 0

[Command]
name = "AI30"
command = y,y,y,y,x,x,x,x
time = 0

[Command]
name = "AI31"
command = y,y,y,y,z,z,z,z
time = 0

[Command]
name = "AI32"
command = z,z,z,z,a,a,a,a
time = 0

[Command]
name = "AI33"
command = z,z,z,z,b,b,b,b
time = 0

[Command]
name = "AI34"
command = z,z,z,z,c,c,c,c
time = 0

[Command]
name = "AI35"
command = z,z,z,z,x,x,x,x
time = 0

[Command]
name = "AI36"
command = z,z,z,z,y,y,y,y
time = 0

[Command]
name = "AI37"
command = a,a,b,b,c,c,x,x
time = 0

[Command]
name = "AI38"
command = b,b,c,c,x,x,y,y
time = 0

[Command]
name = "AI39"
command = c,c,x,x,y,y,z,z
time = 0

[Command]
name = "AI40"
command = x,x,y,y,z,z,a,a
time = 0

;-| Super Motions |--------------------------------------------------------
[Command]
name = "Wish1"
command =D,DF,F,x+y
time = 30

[Command]
name = "Wish2"
command =D,DF,F,y+z
time = 30

[Command]
name = "razorwind"
command =D,DF,F,a+b
time = 30

[Command]
name = "razorwind"
command =D,DF,F,b+c
time = 30


[command]
name = "PetalFury3"
command =~D,DF,F,D,DF,z
time = 30

[command]
name = "PetalFury2"
command =~D,DF,F,D,DF,y
time = 30

[command]
name = "PetalFury1"
command =~D,DF,F,D,DF,x
time = 30






;-| Special Motions |------------------------------------------------------

[Command]
name = "Helper1"
command = c+z
time = 30

[Command]
name = "Helper2"
command = c+z
time = 30

[Command]
name = "Helper3"
command = c+z
time = 30


[Command]
name = "Psychic2"
command =D,B,b
time = 20

[Command]
name = "Psychic1"
command =D,B,a
time = 20

[Command]
name = "FutureSight2"
command =D,D,y
time = 20

[Command]
name = "FutureSight1"
command =D,D,x
time = 20

[Command]
name = "Walking Light Punch"
command = F, x
time = 20

[Command]
name = "PetalDance1"
command = D,F,a
time = 30

[Command]
name = "PetalDance2"
command = D,F,b
time = 30

[Command]
name = "PetalDance3"
command = F,D,F,a
time = 30

[Command]
name = "PetalDance4"
command = F,D,F,b
time = 30

[Command]
name = "Projectile1"
command = ~20$B,F,x
time = 30

[Command]
name = "Projectile2"
command = ~20$B,F,y
time = 30

[Command]
name = "Teleport1"
command = D,F,x
time = 30

[Command]
name = "Teleport2"
command = D,F,y
time = 30

[Command]
name = "Teleport3"
command = D,B,x
time = 30

[Command]
name = "Teleport4"
command = D,B,y
time = 30

name = "Walking Medium Punch"
command = F, y
time = 20

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


;razorwind
[State -1, razorwind]
type = ChangeState
value = 450
triggerall = !var(59)
triggerall = command = "razorwind"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 1500

;PetalFury3
[State -1, PetalFury3]
type = ChangeState
value = 337
triggerall = !var(59)
triggerall = command = "PetalFury3"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 3000

;PetalFury2
[State -1, PetalFury2]
type = ChangeState
value = 336
triggerall = !var(59)
triggerall = command = "PetalFury2"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 2000

;PetalFury1
[State -1, PetalFury1]
type = ChangeState
value = 335
triggerall = !var(59)
triggerall = command = "PetalFury1"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 1000

;Psychic2
[State -1, Psychic2]
type = ChangeState
value = 355
triggerall = !var(59)
triggerall = command = "Psychic2"
trigger1 = (statetype = s) && ctrl

;Psychic1
[State -1, Psychic1]
type = ChangeState
value = 350
triggerall = !var(59)
triggerall = command = "Psychic1"
trigger1 = (statetype = s) && ctrl

;FutureSight2
[State -1, FutureSight2]
type = ChangeState
value = 342
triggerall = !var(59)
triggerall = command = "FutureSight2"
trigger1 = (statetype = s) && ctrl

;FutureSight1
[State -1, FutureSight1]
type = ChangeState
value = 340
triggerall = !var(59)
triggerall = command = "FutureSight1"
trigger1 = (statetype = s) && ctrl

[State -1, charge]
type = ChangeState
value = 4005
triggerall = !var(59)
triggerall = command = "a" && command = "c"
triggerall = power < 3000
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = stateno != 304
triggerall = stateno != 305
trigger1 = statetype = S

;Wish1
[State -1, Wish1]
type = ChangeState
value = 330
triggerall = !var(59)
triggerall = command = "Wish1"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 1000
triggerall = life < 1000

;Wish2
[State -1, Wish2]
type = ChangeState
value = 331
triggerall = !var(59)
triggerall = command = "Wish2"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 2000
triggerall = life < 1000

;PetalDance4
[State -1, PetalDance4]
type = ChangeState
value = 325
triggerall = !var(59)
triggerall = command = "PetalDance4"
trigger1 = (statetype = s) && ctrl

;PetalDance3
[State -1, PetalDance3]
type = ChangeState
value = 320
triggerall = !var(59)
triggerall = command = "PetalDance3"
trigger1 = (statetype = s) && ctrl

;PetalDance2
[State -1, PetalDance2]
type = ChangeState
value = 315
triggerall = !var(59)
triggerall = command = "PetalDance2"
trigger1 = (statetype = s) && ctrl

;PetalDance1
[State -1, PetalDance1]
type = ChangeState
value = 310
triggerall = !var(59)
triggerall = command = "PetalDance1"
trigger1 = (statetype = s) && ctrl

;Projectile1
[State -1, Projectile1]
type = ChangeState
value = 304
triggerall = !var(59)
triggerall = command = "Projectile1"
trigger1 = (statetype = s) && ctrl
triggerall = numproj = 0
triggerall = stateno != 4005
Trigger2 = MoveContact
Trigger2 = Stateno = 200
Trigger3 = MoveContact
Trigger3 = Stateno = 201
Trigger4 = MoveContact
Trigger4 = Stateno = 210
Trigger5 = MoveContact
Trigger5 = Stateno = 211
Trigger6 = MoveContact
Trigger6 = Stateno = 230
Trigger7 = MoveContact
Trigger7 = Stateno = 240

;Projectile2
[State -1, Projectile2]
type = ChangeState
value = 305
triggerall = !var(59)
triggerall = command = "Projectile2"
trigger1 = (statetype = s) && ctrl
triggerall = stateno != 4005
triggerall = numproj = 0
Trigger2 = MoveContact
Trigger2 = Stateno = 200
Trigger3 = MoveContact
Trigger3 = Stateno = 201
Trigger4 = MoveContact
Trigger4 = Stateno = 210
Trigger5 = MoveContact
Trigger5 = Stateno = 211
Trigger6 = MoveContact
Trigger6 = Stateno = 230
Trigger7 = MoveContact
Trigger7 = Stateno = 240

;Teleport1
[State -1, Teleport1]
type = ChangeState
value = 300
triggerall = !var(59)
triggerall = command = "Teleport1"
trigger1 = (statetype = s) && ctrl

;Teleport2
[State -1, Teleport2]
type = ChangeState
value = 301
triggerall = !var(59)
triggerall = command = "Teleport2"
trigger1 = (statetype = s) && ctrl

;Teleport3
[State -1, Teleport3]
type = ChangeState
value = 302
triggerall = !var(59)
triggerall = command = "Teleport3"
trigger1 = (statetype = s) && ctrl

;Teleport4
[State -1, Teleport4]
type = ChangeState
value = 303
triggerall = !var(59)
triggerall = command = "Teleport4"
trigger1 = (statetype = s) && ctrl

;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !var(59)
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
triggerall = var(2) <= 2

;---------------------------------------------------------------------------
; Run Fwd Air
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !var(59)
trigger1 = command = "FF"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = var(2) <= 2

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !var(59)
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
triggerall = var(3) <= 2

;---------------------------------------------------------------------------
; Run Back Air
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !var(59)
trigger1 = command = "BB"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = var(3) <= 2

;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = !var(59)
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
triggerall = !var(59)
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Moving Light Punch
[State -1, Walking Light Punch]
type = ChangeState
value = 201
triggerall = !var(59)
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
Trigger2 = MoveContact
Trigger2 = Stateno = 304
Trigger3 = MoveContact
Trigger3 = Stateno = 210
Trigger4 = MoveContact
Trigger4 = Stateno = 211
Trigger5 = MoveContact
Trigger5 = Stateno = 230
Trigger6 = MoveContact
Trigger6 = Stateno = 240

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = !var(59)
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && Time >= 3
Trigger3 = MoveContact
Trigger3 = Stateno = 304
Trigger4 = MoveContact
Trigger4 = Stateno = 201
Trigger5 = MoveContact
Trigger5 = Stateno = 210
Trigger6 = MoveContact
Trigger6 = Stateno = 211
Trigger7 = MoveContact
Trigger7 = Stateno = 230
Trigger8 = MoveContact
Trigger8 = Stateno = 240

;---------------------------------------------------------------------------
;Moving Medium Punch
[State -1, Walking Medium Punch]
type = ChangeState
value = 211
triggerall = !var(59)
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
Trigger2 = MoveContact
Trigger2 = Stateno = 200
Trigger3 = MoveContact
Trigger3 = Stateno = 201
Trigger4 = MoveContact
Trigger4 = Stateno = 210
Trigger5 = MoveContact
Trigger5 = Stateno = 304
Trigger6 = MoveContact
Trigger6 = Stateno = 230
Trigger7 = MoveContact
Trigger7 = Stateno = 240

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = !var(59)
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 230) && movecontact
Trigger3 = MoveContact
Trigger3 = Stateno = 200
Trigger4 = MoveContact
Trigger4 = Stateno = 201
Trigger5 = MoveContact
Trigger5 = Stateno = 304
Trigger6 = MoveContact
Trigger6 = Stateno = 211
Trigger7 = MoveContact
Trigger7 = Stateno = 230
Trigger8 = MoveContact
Trigger8 = Stateno = 240

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = !var(59)
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 230) && Time >= 9
trigger3 = (stateno = 200) && movecontact
Trigger4 = MoveContact
Trigger4 = Stateno = 200
Trigger5 = MoveContact
Trigger5 = Stateno = 201
Trigger6 = MoveContact
Trigger6 = Stateno = 210
Trigger7 = MoveContact
Trigger7 = Stateno = 211
Trigger8 = MoveContact
Trigger8 = Stateno = 304
Trigger9 = MoveContact
Trigger9 = Stateno = 240

;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = !var(59)
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 210) && movecontact
Trigger3 = MoveContact
Trigger3 = Stateno = 200
Trigger4 = MoveContact
Trigger4 = Stateno = 201
Trigger5 = MoveContact
Trigger5 = Stateno = 210
Trigger6 = MoveContact
Trigger6 = Stateno = 211
Trigger7 = MoveContact
Trigger7 = Stateno = 230
Trigger8 = MoveContact
Trigger8 = Stateno = 304

;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = !var(59)
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && Time >= 3

;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = !var(59)
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = !var(59)
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = !var(59)
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = !var(59)
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = !var(59)
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = !var(59)
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = !var(59)
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;------------------------------------------------------------------------------
[State -1, sparry]
type=hitoverride
triggerall = !var(59) && roundstate=2 && statetype = S
triggerall = command = "back" && command != "fwd"&&command != "up" && command != "down"
trigger1 = ctrl || stateno=700 || stateno=701
trigger1 = var(21):=1
trigger2 = var(21):=-1
attr=SA,AA,AP
stateno=700
slot=0

[State -1, cparry]
type=hitoverride
triggerall = !var(59) && roundstate = 2 && statetype != A
triggerall = (statetype=S && command = "down") || (statetype = C && command = "back") && command != "fwd" && command != "up"
trigger1 = ctrl || stateno = 700 || stateno = 701
trigger1 = var(21):=2
trigger2 = var(21):=-2
attr=C,AA,AP
stateno=701
slot=0

[State -1, aparry]
type=hitoverride
triggerall = !var(59) && roundstate = 2 && statetype = A
triggerall = command = "back" && command != "fwd" && command != "up" && command != "down"
trigger1 = ctrl || stateno = 702
trigger1 = var(21):=3
trigger2 = var(21):=-3
attr=SA,AA,AP
stateno=702
forceair=1
slot=0

;AI--------------------------------------------------------------------------

;AI Command Check
[State -1, AI Command]
type = varset
triggerall = var(59) <= 0
trigger1  = command = "AI1" || command = "AI2" || command = "AI3" || command = "AI4"
trigger2  = command = "AI5" || command = "AI6" || command = "AI7" || command = "AI8"
trigger3  = command = "AI9" || command = "AI10" || command = "AI11" || command = "AI12"
trigger4  = command = "AI13" || command = "AI14" || command = "AI15" || command = "AI16"
trigger5  = command = "AI17" || command = "AI18" || command = "AI19" || command = "AI20"
trigger6  = command = "AI21" || command = "AI22" || command = "AI23" || command = "AI24"
trigger7  = command = "AI25" || command = "AI26" || command = "AI27" || command = "AI28"
trigger8  = command = "AI29" || command = "AI30" || command = "AI31" || command = "AI32"
trigger9  = command = "AI33" || command = "AI34" || command = "AI35" || command = "AI36"
trigger10 = command = "AI37" || command = "AI38" || command = "AI39" || command = "AI40"
;trigger11 = 1;AI即起動スイッチ

v = 59
value = 5;(←防御レベル。ここを1～10の範囲で変更して下さい。)
ignorehitpause = 1

;---------------------------------------------------------------------------
[State -1];ストライカー選択
type = varset
trigger1 = 1
var(57) = random%4;(←ストライカー選択。ここを0～3の範囲で変更して下さい。)
ignoreHitpause = 1

;var(57) = 0        なし
;var(57) = 1        キルリア
;var(57) = 2        エルレイド
;var(57) = 3        ムウマ
;var(57) = random%4 ランダム

;---------------------------------------------------------------------------
[State -1];ブロッキングレベル
type = varset
trigger1 = 1
var(55) = 5;(←ブロッキングレベル。ここを0～10の範囲で変更して下さい。)
ignoreHitpause = 1

[State -1];赤ブロ自重スイッチ
type = varset
trigger1 = stateno = [5000,5099]
var(56) = 0;(0は自重なし・1は自重有り)
ignoreHitpause = 1

[State -1];自重スイッチリセット
type = varset
trigger1 = stateno != [5000,5099]
var(56) = 0
ignoreHitpause = 1

;---------------------------------------------------------------------------
[State -1];タッグ時　死体に反応しないように
type = varset
trigger1 = numenemy = 1;相手が１人の場合
trigger2 = numenemy = 2;相手が２人の場合
trigger2 = enemynear(0),life > 0;最も近い相手が生きている場合
var(58) = 0
ignoreHitpause = 1

[State -1]
type = varset
trigger1 = numenemy = 2;相手が２人の場合
trigger1 = enemynear(0),life <= 0;最も近い相手が死んでいる場合
var(58) = 1
ignoreHitpause = 1

;---------------------------------------------------------------------------
[State -1];制御用
type = varset
trigger1 = roundstate = 3 && roundno >= 2
trigger1 = stateno = 195
var(54) = 1
ignoreHitpause = 1

;------------------------------------------------------------------------------
[State -1, sparry]
type=hitoverride
triggerall = var(59) >= 1 && roundstate = 2
triggerall = var(56) = 0
triggerall = statetype = S
triggerall = random <= var(55) * 100
trigger1 = ctrl || stateno = 700 || stateno = 701
trigger1 = var(21):=1
trigger2 = enemynear(var(58)),movetype = A
trigger2 = (enemynear(var(58)),numproj || enemynear(var(58)),numhelper) ;&& p2movetype = A
trigger2 = ctrl || stateno = 700 || stateno = 701
trigger2 = var(21):=1
trigger3 = enemynear(var(58)),hitdefattr = SCA, NA,SA,HA
trigger3 = ctrl || stateno = 700 || stateno = 701
trigger3 = var(21):=1
trigger4 = var(21):=-1
attr = SA,AA,AP
stateno = 700
slot = 0

[State -1, cparry]
type=hitoverride
triggerall = var(59) >= 1 && roundstate = 2
triggerall = var(56) = 0
triggerall = statetype != A
triggerall = random <= var(55) * 100
trigger1 = ctrl || stateno = 700 || stateno = 701
trigger1 = var(21):=2
trigger2 = enemynear(var(58)),movetype = A
trigger2 = (enemynear(var(58)),numproj || enemynear(var(58)),numhelper) ;&& p2movetype = A
trigger2 = ctrl || stateno = 700 || stateno = 701
trigger2 = var(21):=2
trigger3 = enemynear(var(58)),hitdefattr = SCA, NA,SA,HA
trigger3 = ctrl || stateno = 700 || stateno = 701
trigger3 = var(21):=2
trigger4 = var(21):=-2
attr = C,AA,AP
stateno = 701
slot = 0

[State -1, aparry]
type=hitoverride
triggerall = var(59) >= 1 && roundstate = 2
triggerall = var(56) = 0
triggerall = statetype = A
triggerall = random <= var(55) * 100
trigger1 = ctrl || stateno = 702
trigger1 = var(21):=3
trigger2 = enemynear(var(58)),movetype = A
trigger2 = (enemynear(var(58)),numproj || enemynear(var(58)),numhelper) ;&& p2movetype = A
trigger2 = ctrl || stateno = 702
trigger2 = var(21):=3
trigger3 = enemynear(var(58)),hitdefattr = SCA, NA,SA,HA
trigger3 = ctrl || stateno = 702
trigger3 = var(21):=3
trigger4 = var(21):=-3
attr = SA,AA,AP
stateno = 702
forceair = 1
slot = 0

;---------------------------------------------------------------------------
[State -1, 空中ガード]
type  = ChangeState
value = 132
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = A
triggerall = enemynear(var(58)),statetype = A
triggerall = inguarddist
triggerall = stateno != [190,194]
triggerall = random <= var(59) * 100
trigger1 = ctrl
trigger2 = enemynear(var(58)),movetype = A
trigger2 = (enemynear(var(58)),numproj || enemynear(var(58)),numhelper) ;&& p2movetype = A
trigger2 = ctrl
trigger3 = enemynear(var(58)),hitdefattr = SCA, NA,SA,HA
trigger3 = ctrl

[State -1, 対地 立ちガード]
type  = ChangeState
value = 130
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype = S
triggerall = inguarddist
triggerall = stateno != [190,194]
triggerall = random <= var(59) * 100
trigger1 = ctrl || stateno = 100
trigger2 = enemynear(var(58)),movetype = A
trigger2 = (enemynear(var(58)),numproj || enemynear(var(58)),numhelper) ;&& p2movetype = A
trigger2 = ctrl || stateno = 100
trigger3 = enemynear(var(58)),hitdefattr = SCA, NA,SA,HA
trigger3 = ctrl || stateno = 100

[State -1, 対空 立ちガード]
type  = ChangeState
value = 130
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype = A
triggerall = inguarddist
triggerall = stateno != [190,194]
triggerall = random <= var(59) * 100
trigger1 = ctrl || stateno = 100
trigger2 = enemynear(var(58)),movetype = A
trigger2 = (enemynear(var(58)),numproj || enemynear(var(58)),numhelper) ;&& p2movetype = A
trigger2 = ctrl || stateno = 100
trigger3 = enemynear(var(58)),hitdefattr = SCA, NA,SA,HA
trigger3 = ctrl || stateno = 100

[State -1, しゃがみガード]
type  = ChangeState
value = 131
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype = C
triggerall = inguarddist
triggerall = stateno != [190,194]
triggerall = random <= var(59) * 100
trigger1 = ctrl || stateno = 100
trigger2 = enemynear(var(58)),movetype = A
trigger2 = (enemynear(var(58)),numproj || enemynear(var(58)),numhelper) ;&& p2movetype = A
trigger2 = ctrl || stateno = 100
trigger3 = enemynear(var(58)),hitdefattr = SCA, NA,SA,HA
trigger3 = ctrl || stateno = 100

;---------------------------------------------------------------------------
;しゃがみ
[State -1, crouch]
type = ChangeState
value = 11
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype = S
trigger1 = p2bodydist X = [0,40]
trigger1 = ctrl
trigger1 = random <= 200

;---------------------------------------------------------------------------
;ジャンプ
[State -1]
type = ChangeState
value = 39
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = ctrl
triggerall = random <= 250
trigger1 = enemynear(var(58)),statetype != A
trigger1 = enemynear(var(58)),movetype = I
trigger1 = p2bodydist X = [5,150]
trigger2 = enemynear(var(58)),statetype != A
trigger2 = enemynear(var(58)),movetype = A
trigger2 = p2bodydist X >= 140
trigger3 = enemynear(var(58)),statetype = A
trigger3 = p2bodydist X = [90,150]

;---------------------------------------------------------------------------
;エルレイド
[State -1, Helper]
type = Helper
triggerall = power >= 1000
triggerall = var(40) = 1
triggerall = NumHelper(1000) = 0
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = var(59) <= 0
trigger1 = command = "Helper1"
trigger2 = var(59) >= 1
trigger2 = enemynear(var(58)),statetype = A
trigger2 = enemynear(var(58)),movetype = H && (enemynear,stateno = [5000,5099])
trigger2 = p2bodydist X = [0,50]
trigger2 = p2bodydist Y = [-100,-50]
trigger2 = ctrl
trigger2 = random <= 333
trigger3 = var(59) >= 1
trigger3 = enemynear(var(58)),movetype = A
trigger3 = p2bodydist X = [0,40]
trigger3 = ctrl
trigger3 = random <= 333
helpertype = normal
name = "Helper1"
ID = 1000
stateno = 510
pos = 30,0
postype = p1
facing = 1
ignorehitpause = 1

;ムウマ
[State -1, Helper]
type = Helper
triggerall = power >= 1500
triggerall = var(40) = 2
triggerall = NumHelper(1000) = 0
triggerall = statetype != A
triggerall = roundstate=2
trigger1 = var(59) <= 0
trigger1 = command = "Helper3"
trigger2 = var(59) >= 1
trigger2 = ctrl
trigger2 = random <= 150
helpertype = normal
name = "Helper3"
ID = 1000
stateno = 530
pos = 0,-125
postype = back
facing = 1
ignorehitpause = 1

;キルリア
[State -1, Helper]
type = Helper
triggerall = power >= 1500
triggerall = var(40) = 6
triggerall = NumHelper(1000) = 0
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = var(59) <= 0
trigger1 = command = "Helper2"
trigger2 = var(59) >= 1
trigger2 = ctrl
trigger2 = random <= 333
helpertype = normal
name = "Helper2"
ID = 1000
stateno = 520
pos = 30,0
postype = p1
facing = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
;razorwind
[State -1, razorwind]
type = ChangeState
value = 450
triggerall = var(59) >= 1 && roundstate = 2
triggerall = power >= 1500
triggerall = (statetype = S) && ctrl
triggerall = random <= 333
trigger1 = enemynear(var(58)),movetype = A
trigger1 = p2bodydist X > 180
trigger2 = enemynear(var(58)),statetype = A
trigger2 = enemynear(var(58)),movetype = H && (enemynear(var(58)),stateno = [5000,5099])
trigger2 = enemynear(var(58)),vel Y > 0
trigger2 = p2bodydist Y = [-100,-50]

;PetalFury3
[State -1, PetalFury3]
type = ChangeState
value = 337
triggerall = var(59) >= 1 && roundstate = 2
triggerall = power >= 3000
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X < 30
trigger1 = stateno = 210 || stateno = 240
trigger1 = movehit && (enemynear(var(58)),stateno = [5000,5099])
trigger1 = random <= 333

;PetalFury2
[State -1, PetalFury2]
type = ChangeState
value = 336
triggerall = var(59) >= 1 && roundstate = 2
triggerall = power >= 2000
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X < 30
triggerall = random <= 333
trigger1 = stateno = 210 || stateno = 240
trigger1 = movehit && (enemynear(var(58)),stateno = [5000,5099])
trigger2 = stateno = 310 || stateno = 315
trigger2 = movehit && animtime = 0
trigger2 = frontedgebodydist < 50

;PetalFury1
[State -1, PetalFury1]
type = ChangeState
value = 335
triggerall = var(59) >= 1 && roundstate = 2
triggerall = power >= 1000
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X < 30
triggerall = random <= 333
trigger1 = stateno = 210 || stateno = 240
trigger1 = movehit && (enemynear(var(58)),stateno = [5000,5099])
trigger2 = stateno = 310 || stateno = 315
trigger2 = movehit && animtime = 0
trigger2 = frontedgebodydist < 50

;Psychic2
[State -1, Psychic2]
type = ChangeState
value = 355
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
trigger1 = (statetype = S) && ctrl
trigger1 = p2bodydist X = [140,170]
trigger1 = random <= 333

;Psychic1
[State -1, Psychic1]
type = ChangeState
value = 350
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
trigger1 = (statetype = S) && ctrl
trigger1 = p2bodydist X = [30,55]
trigger1 = random <= 333

;FutureSight2
[State -1, FutureSight2]
type = ChangeState
value = 342
triggerall = var(59) >= 1 && roundstate = 2
trigger1 = (statetype = S) && ctrl
trigger1 = enemynear(var(58)),statetype != A
trigger1 = enemynear(var(58)),movetype != A
trigger1 = p2bodydist X > 140
trigger1 = random <= 250

;FutureSight1
[State -1, FutureSight1]
type = ChangeState
value = 340
triggerall = var(59) >= 1 && roundstate = 2
trigger1 = (statetype = S) && ctrl
trigger1 = enemynear(var(58)),statetype != A
trigger1 = enemynear(var(58)),movetype != A
trigger1 = p2bodydist X = [55,140]
trigger1 = random <= 250

;Wish1
[State -1, Wish1]
type = ChangeState
value = 330
triggerall = var(59) >= 1 && roundstate = 2
triggerall = power >= 1000
triggerall = life < 700
triggerall = (statetype = s) && ctrl
triggerall = enemynear(var(58)),statetype != A
triggerall = !inguarddist
triggerall = enemy,numproj = 0
triggerall = ctrl
triggerall = random <= 333
trigger1 = enemynear(var(58)),statetype = L
trigger1 = p2bodydist X > 180
trigger2 = enemynear(var(58)),movetype != A
trigger2 = p2bodydist X > 180

;Wish2
[State -1, Wish2]
type = ChangeState
value = 331
triggerall = var(59) >= 1 && roundstate = 2
triggerall = power >= 2000
triggerall = life < 500
triggerall = (statetype = s) && ctrl
triggerall = enemynear(var(58)),statetype != A
triggerall = !inguarddist
triggerall = enemy,numproj = 0
triggerall = ctrl
triggerall = random <= 333
trigger1 = enemynear(var(58)),statetype = L
trigger1 = p2bodydist X > 180
trigger2 = enemynear(var(58)),movetype != A
trigger2 = p2bodydist X > 180

;charge
[State -1, charge]
type = ChangeState
value = 4005
triggerall = var(59) >= 1 && roundstate = 2
triggerall = power < 3000
triggerall = statetype = S
triggerall = stateno != 304
triggerall = stateno != 305
triggerall = !inguarddist
triggerall = enemynear(var(58)),numproj = 0
triggerall = ctrl
triggerall = random <= 500
trigger1 = enemynear(var(58)),statetype = L
trigger1 = p2bodydist X > 180
trigger2 = enemynear(var(58)),statetype != A
trigger2 = enemynear(var(58)),movetype != A
trigger2 = p2bodydist X > 180

;PetalDance4
[State -1, PetalDance4]
type = ChangeState
value = 325
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X = [0,115]
triggerall = p2bodydist Y = [-100,0]
trigger1 = enemynear(var(58)),movetype != A
trigger1 = ctrl
trigger1 = random <= 150
trigger2 = stateno = 310 || stateno = 315
trigger2 = movehit && animtime = 0

;PetalDance3
[State -1, PetalDance3]
type = ChangeState
value = 320
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X = [0,90]
triggerall = p2bodydist Y = [-100,0]
trigger1 = enemynear(var(58)),movetype != A
trigger1 = ctrl
trigger1 = random <= 150
trigger2 = stateno = 310 || stateno = 315
trigger2 = movehit && animtime = 0

;PetalDance2
[State -1, PetalDance2]
type = ChangeState
value = 315
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = random <= 333
trigger1 = enemynear(var(58)),numproj = 0
trigger1 = p2bodydist X = [100,140]
trigger1 = ctrl
trigger2 = stateno = 210 || stateno = 240
trigger2 = movehit && (enemynear(var(58)),stateno = [5000,5099])

;PetalDance1
[State -1, PetalDance1]
type = ChangeState
value = 310
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
trigger1 = enemynear(var(58)),numproj = 0
trigger1 = p2bodydist X = [45,90]
trigger1 = ctrl
trigger1 = random <= 150
trigger2 = stateno = 210 || stateno = 240
trigger2 = movehit && (enemynear(var(58)),stateno = [5000,5099])

;Projectile1
[State -1, Projectile1]
type = ChangeState
value = 304
triggerall = var(59) >= 1 && roundstate = 2
triggerall = numproj = 0
triggerall = stateno != 4005
triggerall = random <= 333
trigger1 = (statetype = S) && ctrl
trigger1 = p2bodydist X > 150
trigger1 = p2bodydist Y = [-40,0]
trigger2 = Stateno = 210 || Stateno = 240
trigger2 = movecontact

;Projectile2
[State -1, Projectile2]
type = ChangeState
value = 305
triggerall = var(59) >= 1 && roundstate = 2
triggerall = stateno != 4005
triggerall = numproj = 0
triggerall = random <= 333
trigger1 = (statetype = S) && ctrl
trigger1 = p2bodydist X > 150
trigger1 = p2bodydist Y = [-40,0]
trigger2 = Stateno = 210 || Stateno = 240
trigger2 = movecontact

;Teleport1
[State -1, Teleport1]
type = ChangeState
value = 300
triggerall = var(59) >= 1 && roundstate = 2
triggerall = (statetype = S) && ctrl
triggerall = inguarddist
triggerall = random <= var(59) * 100
trigger1 = statetype != A
trigger1 = movetype != A
trigger1 = p2bodydist X = [-10,125]
trigger2 = p2bodydist X > 200
trigger2 = backedgebodydist < 50
trigger3 = p2bodydist X = [-10,50]
trigger3 = backedgebodydist < 50
trigger4 = statetype != A
trigger4 = movetype != A
trigger4 = enemynear(var(58)),animtime <= -18
trigger4 = p2bodydist X = [-10,125]
trigger5 = statetype != A
trigger5 = movetype != A
trigger5 = enemynear(var(58)),animtime <= -26
trigger5 = p2bodydist X = [-10,125]
trigger6 = enemynear(var(58)),numproj > 0

;Teleport2
[State -1, Teleport2]
type = ChangeState
value = 301
triggerall = var(59) >= 1 && roundstate = 2
triggerall = (statetype = S) && ctrl
triggerall = movetype != A
triggerall = inguarddist
triggerall = frontedgebodydist > 100
triggerall = random <= var(59) * 100
trigger1 = enemynear(var(58)),movetype != A
trigger1 = p2bodydist X = [120,220]
trigger2 = enemynear(var(58)),animtime <= -18
trigger2 = p2bodydist X = [120,220]
trigger3 = enemynear(var(58)),animtime <= -26
trigger3 = p2bodydist X = [120,220]
trigger4 = enemynear(var(58)),numproj > 0
trigger5 = enemynear(var(58)),statetype = L
trigger5 = p2bodydist X = [120,220]

;Teleport3
[State -1, Teleport3]
type = ChangeState
value = 302
triggerall = var(59) >= 1 && roundstate = 2
triggerall = (statetype = S) && ctrl
triggerall = movetype != A
triggerall = inguarddist
triggerall = p2bodydist X = [-10,80]
triggerall = random <= var(59) * 100
trigger1 = enemynear(var(58)),movetype != A
trigger2 = enemynear(var(58)),animtime <= -18
trigger3 = enemynear(var(58)),animtime <= -26
trigger4 = enemynear(var(58)),statetype = L

;Teleport4
[State -1, Teleport4]
type = ChangeState
value = 303
triggerall = var(59) >= 1 && roundstate = 2
triggerall = (statetype = S) && ctrl
triggerall = movetype != A
triggerall = p2bodydist X = [-10,80]
triggerall = backedgebodydist > 100
triggerall = inguarddist
triggerall = random <= var(59) * 100
trigger1 = enemynear(var(58)),movetype != A
trigger2 = enemynear(var(58)),animtime <= -18
trigger3 = enemynear(var(58)),animtime <= -26
trigger4 = enemynear(var(58)),statetype = L

;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) >= 1 && roundstate = 2
triggerall = var(2) <= 2
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),numproj = 0
triggerall = stateno != 100
triggerall = frontedgebodydist >= 50
triggerall = ctrl
triggerall = random <= 333
trigger1 = enemynear(var(58)),movetype != A || (enemynear(var(58)),movetype != A && enemynear(var(58)),ctrl = 0)
trigger1 = p2bodydist X > 100
trigger2 = enemynear(var(58)),statetype = L
trigger2 = p2bodydist X > 260
trigger3 = enemynear(var(58)),statetype = L
trigger3 = backedgebodydist < 50
trigger3 = p2bodydist X < 50

;---------------------------------------------------------------------------
; Run Fwd Air
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) >= 1 && roundstate = 2
triggerall = var(2) <= 2
triggerall = statetype = A
triggerall = enemynear(var(58)),numproj = 0
triggerall = stateno != 100
triggerall = frontedgebodydist >= 50
triggerall = ctrl
triggerall = random <= 333
trigger1 = enemynear(var(58)),movetype != A || (enemynear(var(58)),movetype != A && enemynear(var(58)),ctrl = 0)
trigger1 = p2bodydist X > 150
trigger2 = stateno = 150
trigger2 = p2bodydist X > 230

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) >= 1 && roundstate = 2
triggerall = var(3) <= 2
triggerall = statetype = S
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),numproj = 0
triggerall = stateno != 105
triggerall = backedgebodydist >= 150
triggerall = ctrl
triggerall = random <= 200
trigger1 = enemynear(var(58)),statetype != A
trigger1 = enemynear(var(58)),movetype = A
trigger1 = p2bodydist X = [20,50]
trigger1 = enemynear,hitdefattr = SCA, NT, ST, HT
trigger2 = enemynear(var(58)),movetype = A
trigger2 = p2bodydist X = [0,50]
trigger3 = p2bodydist X = [70,100]
trigger4 = enemynear(var(58)),statetype = L
trigger4 = p2bodydist X = [0,50]

;---------------------------------------------------------------------------
; Run Back Air
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) >= 1 && roundstate = 2
triggerall = var(3) <= 2
triggerall = statetype = A
triggerall = enemynear(var(58)),movetype != H
triggerall = enemynear(var(58)),numproj = 0
triggerall = stateno != 105
triggerall = backedgebodydist >= 150
triggerall = ctrl
triggerall = random <= 200
trigger1 = enemynear(var(58)),movetype = A
trigger1 = p2bodydist X = [20,80]
trigger2 = p2bodydist X = [20,80]

;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = ctrl
triggerall = stateno != 100
trigger1 = p2bodydist X < 10
trigger1 = (enemynear(var(58)),statetype = S) || (enemynear(var(58)),statetype = C)
trigger1 = enemynear(var(58)),movetype != H

;===========================================================================
;---------------------------------------------------------------------------
; Moving Light Punch
[State -1, Walking Light Punch]
type = ChangeState
value = 201
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X = [0,50]
triggerall = random <= 333
trigger1 = Stateno = 210 || Stateno = 211 || Stateno = 230 || Stateno = 240 || Stateno = 304
trigger1 = movecontact

;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != A
triggerall = p2bodydist X = [0,20]
triggerall = random <= 333
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movehit && Time >= 3
trigger2 = p2bodydist X < 15
trigger3 = Stateno = 210 || Stateno = 211 || Stateno = 230 || Stateno = 240 || Stateno = 304
trigger3 = movecontact

;---------------------------------------------------------------------------
;Moving Medium Punch
[State -1, Walking Medium Punch]
type = ChangeState
value = 211
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X = [40,90]
triggerall = random <= 333
trigger1 = Stateno = 201 || Stateno = 304
trigger1 = movecontact

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype = S
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X = [0,10]
triggerall = random <= 333
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = Stateno = 200 || Stateno = 304
trigger2 = movecontact

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X = [0,42]
triggerall = random <= 333
triggerall = random <= 333
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 230)  && movehit && Time >= 9
trigger2 = p2bodydist X < 20
trigger3 = Stateno = 200 || Stateno = 210 || Stateno = 304
trigger3 = movecontact

;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = p2bodydist X = [0,35]
triggerall = random <= 333
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = Stateno = 230 || Stateno = 304
trigger2 = movecontact

;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != A
triggerall = p2bodydist X = [0,30]
triggerall = random <= 50
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) && Time >= 3

;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != A
trigger1 = statetype != A
trigger1 = p2bodydist X = [0,30]
trigger1 = ctrl
trigger1 = random <= 50

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59) >= 1 && roundstate = 2
triggerall = enemynear(var(58)),statetype != A
triggerall = enemynear(var(58)),statetype != L
triggerall = enemynear(var(58)),movetype != A
trigger1 = statetype != A
trigger1 = p2bodydist X = [0,40]
trigger1 = ctrl
trigger1 = random <= 333

;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = var(59) >= 1 && roundstate = 2
trigger1 = stateno = 430 && movecontact

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = A
trigger1 = enemynear(var(58)),statetype = A
trigger1 = enemynear(var(58)),movetype != A
trigger1 = p2bodydist X = [0,30]
trigger1 = p2bodydist Y = [-20,-10]
trigger1 = ctrl
trigger1 = random <= 333

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = var(59) >= 1 && roundstate = 2
triggerall = stateno != 105
triggerall = statetype = A
triggerall = p2bodydist X - enemynear,vel X * 6 = [0,32]
triggerall = ctrl
triggerall = random <= 500
trigger1 = enemynear(var(58)),statetype = A || stateno = 100
trigger1 = p2bodydist Y = [0,30]
trigger2 = enemynear(var(58)),statetype != A
trigger2 = stateno = 50
trigger2 = vel Y > 2
trigger2 = p2bodydist Y > 0

;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = A
triggerall = p2bodydist X - enemynear,vel X * 12 = [0,26]
triggerall = ctrl
triggerall = random <= 500
trigger1 = enemynear(var(58)),statetype = A || stateno = 100
trigger1 = p2bodydist Y = [0,25]
trigger2 = enemynear(var(58)),statetype != A
trigger2 = stateno = 50
trigger2 = vel Y > 2
trigger2 = p2bodydist Y > 0

;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = var(59) >= 1 && roundstate = 2
triggerall = statetype = A
triggerall = enemynear(var(58)),movetype != A
triggerall = p2bodydist X - enemynear,vel X * 9 = [0,46]
triggerall = ctrl
triggerall = random <= 500
trigger1 = p2bodydist Y = [-50,50]
trigger2 = enemynear(var(58)),statetype != A
trigger2 = stateno = 50
trigger2 = vel Y > 1
trigger2 = p2bodydist Y > 0

;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) >= 1
triggerall = var(54) = 0
triggerall = statetype != A
triggerall = ctrl
trigger1 = roundstate = 2
trigger1 = enemynear(var(58)),statetype = L
trigger1 = p2bodydist X > 180
trigger1 = random <= 150
trigger2 = roundstate = 3 && roundno >= 2
trigger2 = enemynear(var(58)),life = 0

;---------------------------------------------------------------------------
