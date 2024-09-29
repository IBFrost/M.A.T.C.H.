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
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
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
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
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
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "CPU1"
command = U, D, F, U, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU2"
command = U, B, F, U, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU3"
command = U, D, D, U, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU4"
command = F, B, U, U, D, F, U, B, U, D, F
time = 1

[Command]
name = "CPU5"
command = U, F, U, B, U, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU6"
command = U, D, B, U, B, U, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU7"
command = F, F, B, U, B, U, D, F, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU8"
command = U, D, U, U, B, U, D, F, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU9"
command = F, B, B, U, B, U, D, F, D, F, U, D, F, U, D, F
time = 1

[Command]
name = "CPU10"
command = F, F, B, B, U, B, U, D, F
time = 1

[Command]
name = "CPU11"
command = U, U, F, U, B, U, D, F
time = 1

[Command]
name = "CPU12"
command = U, B, B, U, B, U, D, F
time = 1

[Command]
name = "CPU13"
command = U, B, F, F, U, B, U, D, F
time = 1

[Command]
name = "CPU14"
command = U, F, B, U, U, B, U, D, F
time = 1

[Command]
name = "CPU15"
command = U, B, F, U, U, B, U, D, F
time = 1

[Command]
name = "CPU16"
command = U, B, B, B, U, B, U, D, F
time = 1

[Command]
name = "CPU17"
command = U, D, B, F, U, B, U, D, F
time = 1

[Command]
name = "CPU18"
command = U, D, B, D, U, B, U, D, F
time = 1

[Command]
name = "CPU19"
command = U, D, F, U, U, B, U, D, F
time = 1

[Command]
name = "CPU20"
command = U, D, U, B, U, B, U, D, F
time = 1

[Command]
name = "CPU21"
command = U, D, F, F, U, B, U, D, F
time = 1

[Command]
name = "CPU22"
command = F, F, F, F, U, B, U, D, F
time = 1

[Command]
name = "CPU23"
command = U, U, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU24"
command = B, B, B, U, B, U, D, F
time = 1

[Command]
name = "CPU25"
command = D, D, D, D, U, B, U, D, F
time = 1

[Command]
name = "CPU26"
command = D, D, D, U, B, U, D, F
time = 1

[Command]
name = "CPU27"
command = F, F, F, U, B, U, D, F
time = 1

[Command]
name = "CPU28"
command = U, U, U, U, B, U, D, F
time = 1

[Command]
name = "CPU29"
command = U, U, B, B, U, B, U, D, F
time = 1

[Command]
name = "CPU30"
command = D, D, F, F, U, B, U, D, F
time = 1

[Command]
name = "CPU31"
command = U, D, F, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU32"
command = U, B, F, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU33"
command = U, D, D, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU34"
command = F, B, U, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU35"
command = U, F, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU36"
command = U, D, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU37"
command = F, F, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU38"
command = U, D, U, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU39"
command = F, B, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU40"
command = F, F, B, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU41"
command = U, U, F, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU42"
command = U, B, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU43"
command = U, B, F, F, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU44"
command = U, F, B, U, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU45"
command = U, B, F, U, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU46"
command = U, B, B, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU47"
command = U, D, B, F, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU48"
command = U, D, B, D, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU49"
command = U, D, F, U, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU50"
command = U, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU51"
command = U, D, F, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU52"
command = U, B, F, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU53"
command = U, D, D, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU54"
command = F, B, U, U, D, F, U, B, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU55"
command = U, F, U, B, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU56"
command = U, D, B, U, B, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU57"
command = F, F, B, U, B, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU58"
command = U, D, U, U, B, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU59"
command = F, B, B, U, B, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1

[Command]
name = "CPU60"
command = F, F, B, B, U, B, U, D, F, D, U, B, U, D, U, B, U, D, F
time = 1



[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 20

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x;~F, D, DF, F, D, DF, x
time = 20

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, D, DB, B, y;~F, D, DF, F, D, DF, y
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "upper_x"
command = ~F, D, DF, x

[Command]
name = "upper_y"
command = ~F, D, DF, y

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

[Command]
name = "°­·ÂÄ®"
command = F, x
time = 4

[Command]
name = "¶ËÄ§"
command = U, x
time = 4

[Command]
name = "È¸Àüµ¹¸®±â"
command = U, y
time = 4

[Command]
name = "hold_c"
command = /c

[Command]
name = "hold_a"
command = /a

[Command]
name = "hold_x"
command = /x

[Command]
name = "hold_y"
command = /y


[Command]
name = "hold_z"
command = /z

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 14

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 14

[Command]
name = "BF"
command = ~B, F
time = 14

[Command]
name = "DD"
command = ~D, D
time = 14

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
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
name = "fwd_x"
command = /$F,x
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
name = "start"
command = s
time = 1

[Command]
name = "s"
command = s
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
name = "fwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "back";Required (do not remove)
command = /$B
time = 1

[Command]
name = "up" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "down";Required (do not remove)
command = /$D
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






[State -1, DashAttack]
type = ChangeState
value = 280
triggerall = var(59) = 0
triggerall = statetype != A
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holdup"
trigger1 = (stateno = 204) && movecontact | MoveReversed 
ignorehitpause = 1





[State -1, Stand Light Punch]
type = ChangeState
value = 202
triggerall = command = "¶ËÄ§"
trigger1 = stateno = 40
trigger1 = statetype = S
trigger2 = statetype = S
trigger2 = stateno = 50
trigger3 = stateno = 103
trigger4 = (stateno = 204) && movecontact | MoveReversed 
trigger5 = (stateno = 280) && movecontact | MoveReversed 
trigger6 = (stateno = 230) && movecontact | MoveReversed 


[State 400, State]
type = ChangeState
triggerall = var(59) = 0
triggerall = command = "holdup"
trigger1 = (stateno = 204) && movecontact | MoveReversed 
trigger2 = (stateno = 243) && movecontact | MoveReversed 
trigger3 = (stateno = 204) && movecontact | MoveReversed 
trigger4 = (stateno = 201) && movecontact | MoveReversed 
trigger5 = (stateno = 280) && movecontact | MoveReversed 
trigger6 = (stateno = 2003) && movehit | MoveReversed 
trigger7 = (stateno = 2004) && movehit | MoveReversed 
trigger8 = (stateno = 2002) && movehit | MoveReversed 
trigger9 = (stateno = 211) && movecontact | MoveReversed 
trigger10 = (stateno = 200) && movecontact | MoveReversed
trigger11 = (stateno = 241) && movecontact | MoveReversed
value = 40
ignorehitpause = 1

;===========================================================================
[State -1,AI]
type = Varset
triggerall = var(59) != 1
triggerall = RoundState != 3
trigger1 = command = "c"
trigger1 = command = "holddown"
var(59) = 1

[State 900, 0]
type = ChangeState
triggerall = RoundState = 2
triggerall = var(59) != 1
triggerall = statetype != A
triggerall = NumPartner = 1
trigger1 = command = "c"
trigger1 = ctrl
value = 5777
;===========================================================================
[State -1, Run Fwd]
type = ChangeState
value = 103
trigger1 = stateno = 250
trigger1 = command = "FF"

[State -1, Run Fwd]
type = ChangeState
value = 105
trigger1 = stateno = 250
trigger1 = command = "BB"
;---------------------------------------------------------------------------
[State -1, Run Fwd]
type = ChangeState
value = 103
triggerall = MoveType != H
triggerall = statetype = S
triggerall = ctrl
triggerall = Alive
trigger1 = command = "FF"
trigger2 = command = "BF" ;For turning around instances.

[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = MoveType != H
triggerall = statetype != A
triggerall = Alive
triggerall = command = "FF"
trigger1 = (stateno = 204) && movecontact | MoveReversed 
trigger2 = (stateno = 204) && movecontact | MoveReversed 
trigger3 = (stateno = 204) && movecontact | MoveReversed 
trigger4 = (stateno = 201) && movecontact | MoveReversed 
trigger5 = (stateno = 205) && movecontact | MoveReversed 
trigger6 = (stateno = 2003) && movehit | MoveReversed 
trigger7 = (stateno = 2004) && movehit | MoveReversed 
trigger8 = (stateno = 2002) && movehit | MoveReversed 
trigger9 = (stateno = 211) && movecontact | MoveReversed 
trigger10 = (stateno = 200) && movecontact | MoveReversed
ignorehitpause = 1





[State -1, Stand Light Punch]
type = ChangeState
value = 2036
triggerall = var(59) != 1
triggerall = command = "holddown"
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 2002) && movehit | MoveReversed 
trigger3 = (stateno = 211) && movecontact | MoveReversed 
trigger4 = (stateno = 204) && movecontact | MoveReversed 
trigger5 = (stateno = 280) && movecontact | MoveReversed 
trigger6 = (stateno = 400) && movecontact | MoveReversed 
trigger7 = (stateno = 2003) && movehit | MoveReversed 
trigger8 = (stateno = 280) && movecontact | MoveReversed



[State -1, DashAttack]
type = ChangeState
value = 2036
triggerall = MoveType != H
triggerall = statetype = A
triggerall = Alive
trigger1 = command = "y"
trigger1 = command = "holddown"
ignorehitpause = 1


[State 900, 0]
type = ChangeState
triggerall = var(59) = 0
triggerall = statetype != A
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = ctrl
trigger1 = power >= 1000
trigger1 = var(27) = 0
trigger1 = var(27) != 1
value = 900

;---------------------------------------------------------------------------
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Stand Light Kick]
type = ChangeState
value = 335
triggerall = var(59) = 0
triggerall = command = "recovery"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = ctrl
trigger3 = stateno = 100
trigger4 = stateno = 101
trigger5 = stateno = 103

[State -1, Stand Light Kick]
type = ChangeState
value = 333
triggerall = var(59) = 0
triggerall = command = "recovery"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = ctrl

[State -1, Stand Light Punch]
type = ChangeState
value = 250
triggerall = var(59) != 1
triggerall = command = "DD"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 101
trigger4 = stateno = 103
trigger5 = stateno = 1300
trigger6 = stateno = 1301

[State -1, DashAttack]
type = ChangeState
value = 250
triggerall = var(59) != 1
triggerall = statetype != A
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 101
trigger4 = stateno = 103
trigger5 = stateno = 1300
trigger6 = stateno = 1301

[State -1, DashAttack]
type = ChangeState
value = 120
triggerall = var(59) != 1
triggerall = statetype != A
triggerall = command = "hold_a"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 101
trigger4 = stateno = 103

[State -1, DashAttack]
type = ChangeState
value = 3400
triggerall = var(31) = 1
triggerall = var(59) != 1
triggerall = statetype != A
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = ctrl


[State -1, DashAttack]
type = ChangeState
value = 3000
triggerall = var(31) = 0
triggerall = var(59) != 1
triggerall = statetype = A
triggerall = command = "z"
triggerall = power >= 6000
triggerall = command = "holddown"
trigger1 = ctrl

[State -1, DashAttack]
type = ChangeState
value = 3000
triggerall = var(31) = 0
triggerall = var(59) != 1
triggerall = statetype != A
triggerall = command = "z"
triggerall = power >= 6000
triggerall = command = "holddown"
trigger1 = ctrl

[State -1, DashAttack]
type = ChangeState
value = 800
triggerall = var(59) != 1
triggerall = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = 103
trigger3 = stateno = 100
trigger4 = stateno = 101


[State -1, DashAttack]
type = ChangeState
value = 240
triggerall = var(59) != 1
triggerall = statetype = A
triggerall = command = "z"
trigger1 = ctrl

[State -1, DashAttack]
type = ChangeState
value = 240
triggerall = var(59) != 1
triggerall = statetype != A
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = stateno = 241



[State -1, DashAttack]
type = ChangeState
value = 240
triggerall = var(59) != 1
triggerall = statetype != A
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = ctrl
trigger2 = (stateno = 2002) && movehit | MoveReversed 
trigger3 = (stateno = 211) && movecontact | MoveReversed 
trigger4 = (stateno = 204) && movecontact | MoveReversed 
trigger5 = (stateno = 280) && movecontact | MoveReversed 
trigger6 = (stateno = 400) && movecontact | MoveReversed 
trigger7 = (stateno = 2003) && movehit | MoveReversed 
trigger8 = stateno = 103
trigger9 = stateno = 100
trigger10 = stateno = 101


[State -1, Stand Light Punch]
type = ChangeState
value = 2070
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = ctrl
trigger1 = statetype != A
trigger2 = (stateno = 2002) && movehit | MoveReversed 
trigger3 = (stateno = 211) && movecontact | MoveReversed 
trigger4 = (stateno = 204) && movecontact | MoveReversed 
trigger5 = (stateno = 280) && movecontact | MoveReversed 
trigger6 = (stateno = 400) && movecontact | MoveReversed 
trigger7 = (stateno = 2003) && movehit | MoveReversed 
trigger8 = (stateno = 280) && movecontact | MoveReversed


[State 12500, 2]
type = Helper
triggerall = numhelper(80) <= 9
triggerall = command = "y"
triggerall = MoveType != H
triggerall = command != "holdfwd"
trigger1 = statetype = A
helpertype = normal
name = "Ç¥Ã¢"
ID = 80
pos = 5,-20
postype = P1
facing = 1
stateno = 613
keyctrl = 0
ownpal = 1
Size.XScale = 1.0
Size.YScale = 0.6

;---------------------------------------------------------------------------

[State -1, Stand Light Punch]
type = ChangeState
value = 207
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command = "holdup"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 103
trigger3 = stateno = 40

[State -1, Stand Light Punch]
type = ChangeState
value = 650
triggerall = var(59) != 1
triggerall = command != "holddown"
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 207
trigger3 = stateno = 2070
trigger4 = stateno = 661

[State -1, Stand Light Punch]
type = ChangeState
value = 622
triggerall = var(59) != 1
triggerall = command = "holddown"
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 207
trigger3 = stateno = 2070
trigger4 = stateno = 661

[State -1, Stand Light Punch]
type = ChangeState
value = 601
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 640) && time > 5
trigger3 = (stateno = 601) && time > 10
trigger4 = (stateno = 600) && time > 5
trigger5 = stateno = 212
trigger6 = stateno = 50
trigger7 = stateno = 40
trigger8 = (stateno = 207) && movehit | MoveReversed 
trigger9 = (stateno = 2070) && movehit | MoveReversed 
trigger10 = (stateno = 611) && movehit | MoveReversed 
trigger11 = (stateno = 660) && movecontact | MoveReversed 
trigger12 = (stateno = 646) && movecontact | MoveReversed 

[State -1, Stand Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = command = "holdup"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 640) && time > 5
trigger3 = (stateno = 601) && time > 10
trigger4 = (stateno = 600) && time > 5
trigger5 = stateno = 212
trigger6 = stateno = 50
trigger7 = stateno = 40
trigger8 = (stateno = 207) && movehit | MoveReversed 
trigger9 = (stateno = 2070) && movehit | MoveReversed 
trigger10 = (stateno = 611) && movehit | MoveReversed 
trigger11 = (stateno = 660) && movecontact | MoveReversed 
trigger12 = (stateno = 646) && movecontact | MoveReversed 




[State -1, Stand Light Punch]
type = ChangeState
value = 646
triggerall = var(59) != 1
triggerall = command = "x"
triggerall = command = "holdback"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 640) && time > 5
trigger3 = (stateno = 600) && time > 3
trigger4 = (stateno = 601) && time > 10
trigger5 = stateno = 1000
trigger6 = stateno = 1001
trigger7 = stateno = 660
trigger8 = stateno = 45
trigger9 = stateno = 40
trigger10 = (stateno = 207) && movehit | MoveReversed 
trigger11 = (stateno = 2070) && movehit | MoveReversed 
trigger12 = (stateno = 611) && movehit | MoveReversed 
trigger13 = (stateno = 660) && movecontact | MoveReversed 

[State -1, Stand Light Punch]
type = ChangeState
value = 660
triggerall = command = "x"
triggerall = command = "holdfwd"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 640) && time > 5
trigger3 = (stateno = 601) && time > 10
trigger4 = (stateno = 600) && time > 5
trigger5 = stateno = 208
trigger6 = stateno = 209
trigger7 = stateno = 50
trigger8 = stateno = 40
trigger9 = (stateno = 207) && movehit | MoveReversed 
trigger10 = (stateno = 2070) && movehit | MoveReversed 
trigger11 = (stateno = 611) && movehit | MoveReversed 
trigger12 = (stateno = 646) && movecontact | MoveReversed 

[State -1, Stand Light Punch]
type = ChangeState
value = 640
triggerall = command = "x"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 601) && time > 10
trigger3 = (stateno = 600) && time > 5
trigger4 = (stateno = 640) && time > 8
trigger5 = stateno = 208
trigger6 = stateno = 209
trigger7 = stateno = 50
trigger8 = stateno = 40
trigger9 = (stateno = 207) && movehit | MoveReversed 
trigger10 = (stateno = 2070) && movehit | MoveReversed 
trigger11 = (stateno = 611) && movehit | MoveReversed 
trigger12 = (stateno = 660) && movecontact | MoveReversed 
trigger13 = (stateno = 646) && movecontact | MoveReversed 


;---------------------------------------------------------------------------


[State -1, DashAttack]
type = ChangeState
value = 203
triggerall = MoveType != H
triggerall = Alive
triggerall = command = "°­·ÂÄ®"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 2002) && movehit | MoveReversed 
trigger3 = (stateno = 211) && movecontact | MoveReversed 
trigger4 = (stateno = 243) && movecontact | MoveReversed 
trigger5 = (stateno = 230) && movecontact | MoveReversed 
trigger6 = (stateno = 200) && movecontact | MoveReversed 
trigger7 = (stateno = 201) && movecontact | MoveReversed 
trigger8 = (stateno = 280) && movecontact | MoveReversed
ignorehitpause = 1




;---------------------------------------------------------------------------
[State -1, Stand Light Punch]
type = ChangeState
value = 243
triggerall = command = "x"
trigger1 = statetype = S
trigger1 = stateno = 100
trigger2 = statetype = S
trigger2 = stateno = 101
trigger3 = stateno = 103

[State -1, DashAttack]
type = ChangeState
value = 280
triggerall = var(59) = 0
triggerall = statetype != A
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holdup"
trigger1 = ctrl
trigger2 = (stateno = 2002) && movecontact | MoveReversed 
trigger3 = (stateno = 204) && movecontact | MoveReversed 
trigger4 = (stateno = 243) && movecontact | MoveReversed 
trigger5 = (stateno = 212) && movecontact | MoveReversed 
ignorehitpause = 1

[State -1, Stand Light Punch]
type = ChangeState
value = 207
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command = "holdup"
trigger1 = stateno = 40
trigger1 = statetype = S

;---------------------------------------------------------------------------
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) != 1
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 211 && MoveReversed 
ignorehitpause = 1




[State -1, Stand Light Punch]
type = ChangeState
value = 240
triggerall = var(59) != 1
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger1 = statetype = S

;---------------------------------------------------------------------------

[State -1, Taunt]
type = ChangeState
value = 197
triggerall = var(59) != 1
triggerall = command = "start"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) != 1
triggerall = command = "start"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Taunt]
type = ChangeState
value = 196
triggerall = var(59) != 1
triggerall = command = "start"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl






[State -1, Stand Light Punch]
type = ChangeState
value = 208
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command != "holdup"
trigger1 = ctrl
trigger2 = stateno = 103
trigger3 = stateno = 40
trigger4 = (stateno = 207) && movehit | MoveReversed 
trigger5 = (stateno = 2070) && movehit | MoveReversed 
trigger6 = (stateno = 611) && movehit | MoveReversed 
trigger7 = (stateno = 280) && movecontact | MoveReversed
trigger8 = stateno = 100
trigger9 = stateno = 101

[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command != "holdup"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, Stand Light Punch]
type = ChangeState
value = 205
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command != "holdup"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 103
trigger3 = stateno = 40
trigger4 = statetype != A
trigger4 = ctrl
trigger5 = (stateno = 207) && movehit | MoveReversed 
trigger6 = (stateno = 2070) && movehit | MoveReversed 
trigger7 = (stateno = 211) && movehit | MoveReversed 

;---------------------------------------------------------------------------



[State -1,AI]
type = Varset
triggerall = var(59) != 1
triggerall = RoundState != 3
trigger1 = command = "CPU1"
trigger2 = command = "CPU2"
trigger3 = command = "CPU3"
trigger4 = command = "CPU4"
trigger5 = command = "CPU5"
trigger6 = command = "CPU6"
trigger7 = command = "CPU7"
trigger8 = command = "CPU8"
trigger9 = command = "CPU9"
trigger10 = command = "CPU10"
trigger11 = command = "CPU11"
trigger12 = command = "CPU12"
trigger13 = command = "CPU13"
trigger14 = command = "CPU14"
trigger15 = command = "CPU15"
trigger16 = command = "CPU16"
trigger17 = command = "CPU17"
trigger18 = command = "CPU18"
trigger19 = command = "CPU19"
trigger20 = command = "CPU20"
trigger21 = command = "CPU21"
trigger22 = command = "CPU22"
trigger23 = command = "CPU23"
trigger24 = command = "CPU24"
trigger25 = command = "CPU25"
trigger26 = command = "CPU26"
trigger27 = command = "CPU27"
trigger28 = command = "CPU28"
trigger29 = command = "CPU29"
trigger30 = command = "CPU30"
trigger31 = command = "CPU31"
trigger32 = command = "CPU32"
trigger33 = command = "CPU33"
trigger34 = command = "CPU34"
trigger35 = command = "CPU35"
trigger36 = command = "CPU36"
trigger37 = command = "CPU37"
trigger38 = command = "CPU38"
trigger39 = command = "CPU39"
trigger40 = command = "CPU40"
trigger41 = command = "CPU41"
trigger42 = command = "CPU42"
trigger43 = command = "CPU43"
trigger44 = command = "CPU44"
trigger45 = command = "CPU45"
trigger46 = command = "CPU46"
trigger47 = command = "CPU47"
trigger48 = command = "CPU48"
trigger49 = command = "CPU49"
trigger50 = command = "CPU50"
trigger51 = command = "CPU51"
trigger52 = command = "CPU52"
trigger53 = command = "CPU53"
trigger54 = command = "CPU54"
trigger55 = command = "CPU55"
trigger56 = command = "CPU56"
trigger57 = command = "CPU57"
trigger58 = command = "CPU58"
trigger59 = command = "CPU59"
trigger60 = command = "CPU60"
var(59) = 1






[State -1, Stand Strong Punch]
type = ChangeState
value = 640
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 110
triggerall = p2bodydist X > -150
triggerall = ctrl && EnemyNear,HitDefAttr = SCA, NP
trigger1 = random = [118,999]





[State -1, Stand Strong Punch]
type = ChangeState
value = 3000
triggerall = var(31) = 0
TriggerAll = palno != 3
triggerall = numhelper(15500) = 0
triggerall = power >= 6000
triggerall = var(59) = 1
triggerall = RoundState = 2
trigger1 = random < 10
trigger1 = ctrl





[State -3,1]
type = ChangeState
value = 105
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = ctrl 
trigger1 = p2statetype = L
trigger1 = p2bodydist X < 65
trigger1 = p2bodydist X > 0
trigger1 = random <= 10 + var(51) + 25


[State 7005, 1]
type = Turn
Trigger1 = Var(59) = 1
trigger1 = p2dist X < 0 && random < 200
trigger1 = statetype != A
Trigger1 = ctrl
Trigger2 = Var(59) = 1
trigger2 = p2dist X < -100
trigger2 = statetype != A
Trigger2 = ctrl



[State -1, Stand Strong Punch]
type = ChangeState
value = 202
triggerall = p2statetype != A
triggerall = p2statetype != L
triggerall = var(59) = 1
triggerall = p2bodydist X > -20
triggerall = RoundState = 2
triggerall = P2BodyDist y <= 75
triggerall = P2BodyDist X <= 30
triggerall = statetype = S
trigger1 = random <= 5 + var(51) + 25
trigger1 = stateno = 103
trigger2 = stateno = 103
trigger2 = random <= 5 + var(51) + 25




[State 12500, 2]
type = Helper
triggerall = var(59) = 1
triggerall = numhelper(80) <= 9
triggerall = MoveType != H
trigger1 = random <= 20
Trigger1  = movecontact
helpertype = normal
name = "Ç¥Ã¢"
ID = 80
pos = 5,-20
postype = P1
facing = 1
stateno = 613
keyctrl = 0
ownpal = 1
Size.XScale = 1.0
Size.YScale = 0.6



[State -1, Stand Strong Punch]
type = ChangeState
value = 1301
triggerall = p2statetype != L
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 100
triggerall = P2BodyDist X >= -100
triggerall = statetype != A
trigger1 = ctrl
trigger1 = random < 20
trigger2 = stateno = 103
trigger2 = random < 20

[State -1, Stand Strong Punch]
type = ChangeState
value = 1300
triggerall = p2statetype != L
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 100
triggerall = P2BodyDist X >= -40
triggerall = statetype != A
trigger1 = ctrl
trigger1 = random < 20
trigger2 = stateno = 103
trigger2 = random < 20

[State -1, Stand Strong Punch]
type = ChangeState
value = 1301
triggerall = p2statetype != L
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 500
triggerall = P2BodyDist X >= -100
triggerall = statetype != A
trigger1 = ctrl
trigger1 = random < 20
trigger2 = stateno = 103
trigger2 = random < 20
ignorehitpause = 0

[State -1, Stand Strong Punch]
type = ChangeState
value = 1300
triggerall = p2statetype != L
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= -500
triggerall = P2BodyDist X >= 100
triggerall = statetype != A
trigger1 = ctrl
trigger1 = random < 20
trigger2 = stateno = 103
trigger2 = random < 20
ignorehitpause = 0



[State -1, Stand Strong Punch]
type = ChangeState
value = 243
triggerall = P2BodyDist y >= -40
triggerall = p2statetype != L
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 55
triggerall = statetype != A
triggerall = p2bodydist X > 0
trigger1  = StateNo = 103
trigger1 = random <= 35
norehitpause = 1

[State -1, Stand Strong Punch]
type = ChangeState
value = 280
triggerall = P2BodyDist y >= -40
triggerall = p2statetype != L
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 45
triggerall = statetype != A
triggerall = p2bodydist X > 0
trigger1 = ctrl
trigger1 = random <= 10
norehitpause = 1

[State -1, Stand Strong Punch]
type = ChangeState
value = 200
triggerall = P2BodyDist y >= -40
triggerall = p2statetype != L
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 45
triggerall = statetype != A
triggerall = p2bodydist X > 0
trigger1 = ctrl
trigger1 = random <= 10
norehitpause = 1




[State 200, Phase2]
type = ChangeState
TriggerAll = palno = 3
triggerall = var(59) = 1
Trigger1  = movecontact = 1
trigger1  = StateNo = 600
value = 640




[State 200, Phase2]
type = ChangeState
TriggerAll = palno = 3
triggerall = var(59) = 1
Trigger1  = movecontact = 1
trigger1  = StateNo = 640
value = 660







[State -1, Stand Strong Punch]
type = ChangeState
value = 800
triggerall = P2BodyDist y >= -40
triggerall = p2statetype != L
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 30
triggerall = statetype != A
triggerall = p2bodydist X > 0
trigger1 = ctrl
trigger1 = random = [959,999]
trigger2 = StateNo = 103
trigger2 = random = [959,999]
trigger3 = StateNo = 101
trigger3 = random = [959,999]
ignorehitpause = 1

[State -1, Stand Strong Punch]
type = ChangeState
value = 250
triggerall = p2statetype != L
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 70
triggerall = P2BodyDist X >= -50
triggerall = statetype != A
trigger1 = ctrl 
trigger1 = random < 35
trigger2 = EnemyNear,HitDefAttr = SCA, AA, AP, HT, NT, ST, NA, SA, HA, NT, SP, NP, HP, AT
trigger2 = random < 35
trigger3 = stateno = 103
trigger3 = ctrl && EnemyNear,HitDefAttr = SCA, AA, AP, HT, NT, ST, NA, SA, HA, NT, SP, NP, HP, AT
trigger2 = random < 35
ignorehitpause = 0



[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact
trigger1  = StateNo = 204
trigger1 = random < 100
value = 280

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact
trigger1  = StateNo = 280
trigger1 = random < 200
value = 203

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact
trigger1  = StateNo = 280
trigger1 = random < 200
value = 200

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact
trigger1  = StateNo = 204
trigger1 = random < 200
value = 280

[State -1, Stand Strong Punch]
type = ChangeState
value = 402
triggerall = p2statetype != L
triggerall = var(59) = 1
triggerall = RoundState = 2
trigger1 = random < 100
trigger1  = StateNo = 207
trigger1 = Time >= 12



[State -1, Stand Strong Punch]
type = ChangeState
value = 207
triggerall = p2statetype != L
triggerall = numhelper(85) <= 0
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = p2bodydist X < 65
triggerall = p2bodydist X > 0
trigger1 = ctrl
trigger1 = random < 10
trigger1 = statetype != A
trigger2 = ctrl
trigger2 = random < 10
trigger2 = statetype != A

[State -1, Stand Strong Punch]
type = ChangeState
value = 208
triggerall = p2statetype != L
triggerall = numhelper(85) <= 0
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = p2bodydist X > 65
trigger1 = ctrl
trigger1 = random < 10
trigger1 = statetype != A
trigger2 = ctrl
trigger2 = random < 10
trigger2 = statetype != A

[State -1, Stand Strong Punch]
type = ChangeState
value = 2036
triggerall = p2statetype != L
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist y < -40
triggerall = p2bodydist X < 100
triggerall = p2bodydist X > -100
triggerall = numhelper(289) <= 10
trigger1 = ctrl
trigger1 = random < 20
trigger1 = statetype = A
trigger2 = ctrl
trigger2 = random < 20
trigger2 = statetype = A






[State -1, Stand Strong Punch]
type = ChangeState
value = 660
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 155
triggerall = statetype = A
triggerall = p2bodydist X > -50
trigger1 = ctrl
trigger1 = random < 10

[State -1, Stand Strong Punch]
type = ChangeState
value = 640
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 50
triggerall = statetype = A
triggerall = p2bodydist X > -50
trigger1 = ctrl
trigger1 = random < 10

[State -1, Stand Strong Punch]
type = ChangeState
value = 601
triggerall = stateno != 100
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 0
triggerall = statetype = A
triggerall = p2bodydist X > -150
trigger1 = ctrl
trigger1 = random < 10

[State -1, Stand Strong Punch]
type = ChangeState
value = IfElse(random < 500, 240, 335)
triggerall = p2statetype != L
triggerall = p2bodydist X > -25
trigger1 = random < 10
trigger1 = statetype != A
trigger1 = ctrl
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 50
trigger1 = ctrl
ignorehitpause = 0



[State -1, Stand Strong Punch]
type = ChangeState
value = IfElse(random < 500, 240, 333)
triggerall = p2statetype != L
triggerall = p2bodydist X > -25
trigger1 = random < 10
trigger1 = statetype = A
trigger1 = ctrl
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 50
trigger1 = ctrl
ignorehitpause = 0


[State -1, Stand Strong Punch]
type = ChangeState
value = IfElse(random < 500, 203, 280)
triggerall = P2BodyDist y >= -60
triggerall = p2statetype != L
trigger1 = stateno != 100
triggerall = p2bodydist X > 30
trigger1 = random < 10
trigger1 = statetype != A
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 80
trigger1 = ctrl
ignorehitpause = 0

[State -1, Stand Strong Punch]
type = ChangeState
value = 2003
triggerall = P2BodyDist y >= -60
triggerall = p2statetype != L
trigger1 = stateno = 203
triggerall = p2bodydist X > -10
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 70
trigger1 = random < 101
trigger1 = statetype != A
trigger1 = Time >= 10
ignorehitpause = 0




[State -1, Stand Strong Punch]
type = ChangeState
value = 2070
triggerall = p2bodydist X > 0
triggerall = var(59) = 1
triggerall = RoundState = 2
triggerall = P2BodyDist X <= 300
triggerall = Enemy,numhelper >= 1
trigger1 = random < 25
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = random < 25
trigger2  = StateNo = 103
ignorehitpause = 0





[State -3,1]
type = ChangeState
value = 105
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = ctrl 
trigger1 = p2statetype = L
trigger1 = p2bodydist X < 65
trigger1 = p2bodydist X > 0
trigger1 = random <= 20


[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact = 1
trigger1  = StateNo = 201
value = 211

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact = 1
trigger1  = StateNo = 200
value = 201

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact = 1
trigger1  = StateNo = 2003
value = IfElse(random < 500, 660, 105)

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
Trigger1  = movecontact = 1
trigger1  = StateNo = 211
value = IfElse(random < 500, 280, 205)

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
trigger1 = AnimElemtime(6) >= 5
trigger1 = StateNo = 200
value = 201

[State 200, Phase2]
type = ChangeState
triggerall = var(59) = 1
trigger1 = AnimElemtime(7) >= 5
trigger1 = StateNo = 201
value = 211

[State -1, SGuard]
type            = ChangeState
Value           = 40
triggerall      = var(59) = 1
triggerall      = RoundState = 2
triggerall      = ctrl && p2statetype != L
trigger1        = StateType != A && p2bodydist X > 50 && random <= 71

[State -1, SGuard]
type            = ChangeState
Value           = 103
triggerall      = var(59) = 1
triggerall      = RoundState = 2
triggerall      = ctrl && p2statetype != L
trigger1        = StateType != A && p2bodydist X > 50 && random <= 71

[State -1, SGuard]
type            = ChangeState
Value           = 105
triggerall      = numhelper(77) >= 1
triggerall      = numhelper(76) >= 1
triggerall      = var(59) = 1
trigger1      = RoundState = 2
trigger1      = ctrl && StateType != A && p2bodydist X < 30 && random <= 60

[State -1, SGuard]
type            = ChangeState
Value           = 105
triggerall      = numhelper(77) = 0
triggerall      = numhelper(76) = 0
triggerall      = var(59) = 1
triggerall      = RoundState = 2
trigger1      = ctrl && StateType != A && p2bodydist X < 30 && random <= 60



















