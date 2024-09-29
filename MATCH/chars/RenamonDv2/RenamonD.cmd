;-| AI |--------------------------------------------------------

; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: `The commands are CASE-SENSITIVE, and so are the command names.
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

[Command]
name = "CPU1"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU2"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU3"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU4"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU5"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU6"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU7"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU8"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU9"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU10"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU11"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU12"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU13"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU14"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU15"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU16"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU17"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU18"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU19"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU20"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU21"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU22"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU23"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU24"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU25"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU26"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU27"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU28"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU29"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU30"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU31"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU32"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU33"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU34"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU35"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU36"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU37"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU38"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU39"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU40"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU41"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU42"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU43"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU44"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU45"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU46"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU47"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU48"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU49"
command = U, D, B, F, a, b, x, y
time = 0

[Command]
name = "CPU50"
command = U, D, B, F, a, b, x, y
time = 0


;-| Super Motions |--------------------------------------------------------
[command]
name = "Sakuyamon"
command = ~D, F, D, F, c+z
time = 50

[command]
name = "PowerPaw"
command = ~D, F, D, F, a
time = 30

[command]
name = "PowerPaw"
command = ~D, F, D, F, b
time = 30

[command]
name = "PowerPaw"
command = ~D, F, D, F, c
time = 30

[command]
name = "DiamondStorm"
command = ~D, F, x+y
time = 30

[command]
name = "DiamondStorm"
command = ~D, F, y+z
time = 30

[command]
name = "DiamondStorm"
command = ~D, F, x+z
time = 30

[command]
name = "Gargomon"
command = ~D, F, b+y
time = 30

[command]
name = "Guilmon"
command = ~D, F, a+x
time = 30

[command]
name = "Kyuubimon"
command = ~B, D, F, a+b
time = 50

[command]
name = "Kyuubimon"
command = ~B, D, F, b+c
time = 50

[command]
name = "Kyuubimon"
command = ~B, D, F, a+c
time = 50

[command]
name = "Duo"
command = ~D, B, z+c
time = 50

;-| Special Motions |------------------------------------------------------
[Command]
name = "Arrowheadx"
command = ~D, F, x
time = 15

[Command]
name = "Arrowheady"
command = ~D, F, y
time = 15

[Command]
name = "Arrowheadz"
command = ~D, F, z
time = 15

[Command]
name = "WistPW"
command = ~30$B, F, x
time = 10

[Command]
name = "WistPM"
command = ~30$B, F, y
time = 10

[Command]
name = "WistPS"
command = ~30$B, F, z
time = 10

[Command]
name = "TeleportLeft"
command = ~D, D, a
time = 20

[Command]
name = "TeleportLeft"
command = ~D, D+a
time = 20

[Command]
name = "TeleportMiddle"
command = ~D, D, b
time = 20

[Command]
name = "TeleportMiddle"
command = ~D, D+b
time = 20

[Command]
name = "TeleportRight"
command = ~D, D, c
time = 20

[Command]
name = "TeleportRight"
command = ~D, D+c
time = 20

[Command]
name = "QCB_xy"
command = ~D, B, x+y

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
name = "SJ"
command = $D, $U

[Command]
name = "Super_Jump"
command = $D, $U

[Command]
name = "Super_Jump"
command = D, U

[Command]
name = "Up"
command = U

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
name = "striker";Required (do not remove)
command = b+y
time = 1

[Command]
name = "OH";Required (do not remove)
command = a+x
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

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdFD";Required (do not remove)
command = /$F+D
time = 1

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
name = "hold_z" ;Required (do not remove)
command = /$z
time = 1

[Command]
name = "hold_c";Required (do not remove)
command = /$c
time = 1

[command]
name = "crawl"
command = /$F+D
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
;--------------------AI------------------
[State -1, Activate AI]
type = VarSet
triggerall = var(59) != 1
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
v = 59
value = 1

[State -1]                   ;Match Over
type = Varset
trigger1 = MatchOver
v = 59
value = 0

;--------------------------------------------------
; Combo Varset
;--------------------------------------------------

[State -1, AI Idle Test]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
trigger1 = ctrl
trigger1 = Random <= 9
value = 0

[State -1, AI Grabs]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = P2movetype != H
triggerall = P2statetype != A
triggerall = P2statetype != L
trigger1 = ctrl
trigger1 = Random <= 249
trigger1 = p2bodydist X < 3
value = 800

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = P2movetype != H
triggerall = P2statetype != A
triggerall = P2statetype != L
trigger1 = ctrl
trigger1 = Random <= 249
trigger1 = p2bodydist X < 3
value = 805

;---------------------------------------------------------------------------
;AI Supers
[State -1, AI Duo Mode]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life > 0
triggerall = power >= 3000
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 49
trigger1 = ctrl
value = 3000

[State -1, AI INFSuper Wisteria Punch]
type = ChangeState
value = 2700
triggerall = var(1) = 1
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = Random <= 49
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 250) && movecontact
trigger3 = (stateno = 220) && movecontact
trigger4 = (stateno = 1011) && time > 20
trigger4 = (stateno = 1011) && movecontact
trigger5 = (stateno = 1012) && time > 20
trigger5 = (stateno = 1012) && movecontact


[State -1, AI INFSuper Air DiamondStorm ]
type = ChangeState
value = 2001
triggerall = var(1) = 1
triggerall = var(59) = 1
triggerall = statetype = A
triggerall = Random <= 49
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 610) && movecontact
trigger3 = (stateno = 640) && movecontact
trigger4 = (stateno = 650) && movecontact

[State -1, AI INFSuper Kyuubimon ]
type = ChangeState
value = 2010
triggerall = var(1) = 1
triggerall = var(59) = 1
triggerall = statetype = S
triggerall = Random <= 49
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 240) && movecontact
trigger5 = (stateno = 1010) && movecontact
trigger6 = (stateno = 1011) && movecontact
trigger6 = (stateno = 1011) && time > 46
trigger7 = (stateno = 1012) && movecontact
trigger8 = (stateno = 250) && movecontact

[State -1, AI Cross Over Supers] ;Gargomon
type = ChangeState
triggerall = var(1) = 0
triggerall = var(59) = 1
triggerall = power >= 2000
triggerall = numhelper(15001) = 0
triggerall = statetype != A
triggerall = P2statetype != L
triggerall = P2Life != 0
trigger1 = Random <= 9
trigger1 = ctrl = 1
trigger2 = Random <= 79
trigger2 = (stateno = 220) && movehit
trigger3 = Random <= 99
trigger3 = (stateno = 1012) && movehit
value = 2600

[State -1]                        ;Guilmon
type = ChangeState
triggerall = var(1) = 0
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = power >= 2000
triggerall = statetype != A
triggerall = P2statetype != A
trigger1 = Random <= 9
trigger1 = ctrl = 1
trigger2 = Random <= 49
trigger2 = (stateno = 450) && movehit
value = 2650

[State -1, AI Supers] ;Wisteria Punch Super
type = ChangeState
triggerall = var(1) = 0
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = power >= 1000
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = P2statetype != L
triggerall = P2Life != 0
trigger1 = Random <= 4
trigger1 = ctrl
trigger2 = Random <= 29
trigger2 = (stateno = 220) && movehit
trigger3 = Random <= 9
trigger3 = (stateno = 1012) && movehit
value = 2700

[State -1] ;Diamond Storm Air
type = ChangeState
triggerall = var(1) = 0
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype = A
triggerall = power >= 1000
triggerall = P2Life != 0
trigger1 = Random <= 4
trigger1 = ctrl
trigger1 = P2statetype = A
trigger2 = Random <= 9
trigger2 = (stateno = 610) && movehit
trigger3 = Random <= 19
trigger3 = (stateno = 640) && movehit
trigger4 = Random <= 19
trigger4 = (stateno = 650) && movehit
value = 2001

[State -1] ;Kyuubimon
type = ChangeState
triggerall = var(1) = 0
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = power >= 1000
triggerall = statetype != A
triggerall = P2statetype != L
triggerall = P2bodydist x <= 20
trigger1 = Random <= 2
trigger1 = ctrl
value = 2010

[State -1, AI Sakuyamon]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = Life <= 300
triggerall = power >= 3000
triggerall = statetype != A
triggerall = P2bodydist x <= 5
triggerall = P2statetype != L
triggerall = P2statetype != A
triggerall = command = "Sakuyamon"
trigger1 = Random <= 499
trigger1 = ctrl
value = 4500

[State -1, AI MVC Striker]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = backedgedist > 0
triggerall = numhelper(15001) = 0
triggerall = var(58) != 0
triggerall = statetype = S
triggerall = P2statetype != L
trigger1 = Random <= 14
trigger1 = ctrl
value = 15000

[State -1, AI Specials] ;OverHead
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = p2stateno = 5120
triggerall = P2bodydist x <= 60
triggerall = statetype = S
triggerall = P2statetype != L
trigger1 = ctrl
value = 1050

[State -1]           ;Fox Leaf Void Left
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = p2bodydist x > 70
trigger1 = ctrl
value = 1020

[State -1]            ;Fox Leaf Void Middle
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
value = 1021

[State -1]             ;Fox Leaf Void Right
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = p2bodydist x > 70
trigger1 = ctrl
value = 1022

[State -1]            ;Air Leaf Arrowhead
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
;triggerall = P2bodydist x <= 25
triggerall = statetype = A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
value = 1000

[State -1]             ;Ground Leaf Arrowhead Weak
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x >= 4
triggerall = P2bodydist x <= 30
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
trigger2 = Random <= 299
trigger2 = (stateno = 220) && movehit
value = 1003

[State -1]           ;Ground Leaf Arrowhead Medium
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x >= 24
triggerall = P2bodydist x <= 60
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
trigger2 = Random <= 299
trigger2 = (stateno = 220) && movehit
value = 1004

[State -1]            ;Ground Leaf Arrowhead Strong
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x >= 50
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
trigger2 = Random <= 299
trigger2 = (stateno = 220) && movehit
value = 1005

[State -1]            ;Power Paw Weak
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 50
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
trigger2 = Random <= 199
trigger2 = (stateno = 210) && movehit
trigger3 = Random <= 99
trigger3 = (stateno = 220) && movehit
trigger4 = Random <= 299
trigger4 = (stateno = 250) && movehit
;trigger5 = Random <= 299
;trigger5 = stateno = 1350
value = 1010

[State -1]             ;Power Paw Med
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
trigger2 = Random <= 499
trigger2 = (stateno = 220) && movehit
trigger2 = Random <= 499
trigger3 = (stateno = 240) && movehit
;trigger4 = Random <= 499
;trigger4 = stateno = 1350
value = 1011

[State -1]             ;Power Paw Strong
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = Random <= 9
trigger1 = ctrl
trigger2 = Random <= 499
trigger2 = (stateno = 220) && movehit
trigger3 = Random <= 499
trigger3 = (stateno = 240) && movehit
;trigger4 = Random <= 499
;trigger4 = stateno = 1350
value = 1012

[State -1, AI Movement]  ;Dash
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = p2stateno = 5120
triggerall = P2bodydist x > 60
triggerall = statetype != A
trigger1 = Random <= 19
trigger1 = ctrl
value = 100

[State -1]               ;Back Dash
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = statetype != A
triggerall = Random <= 19
trigger1 = ctrl
value = 105

[State -1]                ;MVC Jump
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = StateType != A
triggerall = P2statetype != L
trigger1 = Random <= 29
trigger1 = ctrl = 1
value = 7000
                           ;MVC Jump Cancel
[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = StateType != A
triggerall = P2statetype != L
trigger1 = (stateno = 250) && movehit
trigger2 = (stateno = 420) && movehit
value = 7001

[State -1, AI Normal Punches]          ;Standing  P
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = Random <= 149
triggerall = statetype != A
triggerall = P2statetype != L
trigger1 = ctrl
value = 200

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A ;= S
triggerall = P2statetype != L
trigger1 = Random <= 99
trigger1 = ctrl
trigger2 = (stateno = 200) && movehit
value = 210

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A ;= S
triggerall = P2statetype != L
trigger1 = Random <= 49
trigger1 = ctrl
trigger2 = Random <= 299
trigger2 = (stateno = 230) && movehit
trigger3 = Random <= 499
trigger3 = (stateno = 210) && movehit
trigger4 = Random <= 199
trigger4 = (stateno = 450) && movehit
value = 220

[State -1, AI Normal Kicks]                         ;Standing K
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= S
triggerall = P2statetype != L
trigger1 = Random <= 149
trigger1 = ctrl
trigger2 = Random <= 299
trigger2 = (stateno = 200) && movehit
value = 230

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= S
triggerall = P2statetype != L
trigger1 = Random <= 99
trigger1 = ctrl
trigger2 = Random <= 249
trigger2 = (stateno = 230) && movehit
trigger3 = Random <= 499
trigger3 = (stateno = 210) && movehit
value = 240

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= S
triggerall = P2statetype != L
trigger1 = Random <= 49
trigger1 = ctrl
trigger2 = (stateno = 210) && movehit
trigger3 = (stateno = 240) && movehit
value = 250

[State -1, Crawl]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x >= 50
triggerall = statetype = C
triggerall = P2statetype != L
trigger1 = ctrl
value = 25

[State -1, AI Crouch Punches]                           ;Crouch P
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= S
triggerall = P2statetype != L
trigger1 = Random <= 149
trigger1 = ctrl
value = 400

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= S
triggerall = P2statetype != L
trigger1 = Random <= 99
trigger1 = ctrl
trigger2 = Random <= 499
trigger2 = (stateno = 400) && movehit
value = 410

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= S
triggerall = P2statetype != L
trigger1 = Random <= 49
trigger1 = ctrl
trigger2 = Random <= 499
trigger2 = (stateno = 410) && movehit
trigger3 = Random <= 299
trigger3 = (stateno = 440) && movehit
value = 420

[State -1, AI Crouch Kicks]                        ;Crouch K
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= C
triggerall = P2statetype != L
trigger1 = Random <= 149
trigger1 = ctrl
trigger2 = (stateno = 400) && movehit
value = 430

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= C
triggerall = P2statetype != L
trigger1 = Random <= 99
trigger1 = ctrl
trigger2 = Random <= 499
trigger2 = (stateno = 430) && movehit
value = 440

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 20
triggerall = statetype != A;= C
triggerall = P2statetype != L
trigger1 = Random <= 49
trigger1 = ctrl
trigger2 = Random <= 499
trigger2 = (stateno = 440) && movehit
value = 450

[State -1, AI Air Punches]                             ;Jump P
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 30
triggerall = statetype = A
triggerall = P2statetype != L
trigger1 = Random <= 499
trigger1 = stateno = 7000
trigger1 = P2bodydist y <= 20 && P2bodydist y >= -20
trigger2 = Random <= 149
trigger2 = ctrl
trigger3 = Random <= 499
trigger3 = stateno = 1350 ;Air blocking
value = 600

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 30
triggerall = statetype = A
triggerall = P2statetype != L
trigger1 = Random <= 99
trigger1 = ctrl
trigger2 = (stateno = 600) && movehit
trigger3 = Random <= 499
trigger3 = (stateno = 630) && movehit
trigger4 = Random <= 499
trigger4 = stateno = 1350 ;Air blocking
value = 610

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 30
triggerall = statetype = A
triggerall = P2statetype != L
trigger1 = Random <= 49
trigger1 = ctrl
trigger2 = (stateno = 610) && movehit
trigger3 = Random <= 499
trigger3 = stateno = 1350 ;Air blocking
trigger4 = (stateno = 640) && movehit
trigger5 = Random <= 499
trigger5 = (stateno = 645) && movehit
value = 620

[State -1, AI Air Kicks]                        ;Jump K
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 30
triggerall = statetype = A
triggerall = P2statetype != L
trigger1 = stateno = 7000
trigger1 = P2bodydist y <= 20  && P2bodydist y >= -20
trigger2 = Random <= 149
trigger2 = ctrl
trigger3 = Random <= 499
trigger3 = stateno = 1350 ;Air blocking
trigger4 = Random <= 499
trigger4 = (stateno = 600) && movehit
value = 630

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 30
triggerall = statetype = A
triggerall = P2statetype != L
trigger1 = Random <= 99
trigger1 = ctrl
trigger2 = (stateno = 630) && movehit ;jump_x or jump_a
trigger3 = Random <= 499
trigger3 = stateno = 1350 ;Air blocking
trigger4 = Random <= 399
trigger4 = (stateno = 610) && movehit ;jump_x or jump_a
value = 640

[State -1]
type = ChangeState
triggerall = var(59) = 1
trigger1 = (stateno = 640) && movehit ;jump_x or jump_a
value = 645

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = P2Life != 0
triggerall = P2bodydist x <= 30
triggerall = statetype = A
triggerall = P2statetype != L
trigger1 = Random <= 49
trigger1 = ctrl
trigger2 = Random <= 499
trigger2 = stateno = 1350 ;Air blocking
trigger3 = (stateno = 640) && movehit
trigger4 = (stateno = 645) && movehit
value = 650

[State -1, AI Guard]
type = ChangeState
triggerall = var(59) = 1
triggerall = ctrl
triggerAll = stateno != [120,140]
trigger1 = inguarddist ||enemy,numproj||enemy(numenemy>1),numproj
trigger1 = enemynear, MoveGuarded = 0
value = 120

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = life > 0 && statetype != A
trigger1 = Random <= 499
trigger1 = stateno = 150
trigger2 = Random <= 499
trigger2 = stateno = 152
value = 330

[State -1]
type = ChangeState
triggerall = var(59) = 1
triggerall = life > 0 && statetype = A
trigger1 = Random <= 499
trigger1 = stateno = 154
value = 331

;===========================================================================
;---------------------------------------------------------------------------
[State -1, SuperMAX Duo Tag Team]
type = ChangeState
value = 3000
triggerall = var(59) = 0
triggerall = command = "Duo"
triggerall = Var(1) = 0
triggerall = power >= 3000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 250) && time >= 12
trigger2 = (stateno = 250) && movecontact

;---------------------------------------------------------------------------
[State -1, Sakuyamon]
type = ChangeState
value = 4500
triggerall = var(59) = 0
triggerall = Life <= 300
triggerall = power >= 3000
triggerall = command = "Sakuyamon"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Cross Over Gargomon]
type = ChangeState
value = 2600
triggerall = var(59) = 0
triggerall = command = "Gargomon"
triggerall = statetype = S
triggerall = var(1) = 0
triggerall = numhelper(15001) = 0
triggerall = power >= 2000
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 240) && movecontact
trigger5 = (stateno = 1010) && movecontact
trigger6 = (stateno = 1011) && movecontact
trigger6 = (stateno = 1011) && time > 46
trigger7 = (stateno = 1012) && movecontact
trigger8 = (stateno = 250) && movecontact

;---------------------------------------------------------------------------
[State -1, Cross Over Guilmon]
type = ChangeState
value = 2650
triggerall = var(59) = 0
triggerall = command = "Guilmon"
triggerall = statetype = S
triggerall = var(1) = 0
triggerall = power >= 2000
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 250) && movecontact
trigger3 = (stateno = 220) && movecontact
trigger4 = (stateno = 1011) && time > 20
trigger4 = (stateno = 1011) && movecontact
trigger5 = (stateno = 1012) && time > 20
trigger5 = (stateno = 1012) && movecontact

;===========================================================================
[State -1, INFSuper Wisteria Punch]
type = ChangeState
value = 2700
triggerall = var(59) = 0
triggerall = command = "DiamondStorm"
triggerall = statetype != A
triggerall = var(1) = 1
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 250) && movecontact
trigger3 = (stateno = 220) && movecontact
trigger4 = (stateno = 1011) && time > 20
trigger4 = (stateno = 1011) && movecontact
trigger5 = (stateno = 1012) && time > 20
trigger5 = (stateno = 1012) && movecontact


[State -1, INFSuper Air DiamondStorm ]
type = ChangeState
value = 2001
triggerall = var(59) = 0
triggerall = command = "DiamondStorm"
triggerall = statetype = A
triggerall = var(1) = 1
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 610) && movecontact
trigger3 = (stateno = 640) && movecontact
trigger4 = (stateno = 650) && movecontact

[State -1, INFSuper Kyuubimon ]
type = ChangeState
value = 2010
triggerall = var(59) = 0
triggerall = command = "Kyuubimon"
triggerall = statetype = S
triggerall = var(1) = 1
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 240) && movecontact
trigger5 = (stateno = 1010) && movecontact
trigger6 = (stateno = 1011) && movecontact
trigger6 = (stateno = 1011) && time > 46
trigger7 = (stateno = 1012) && movecontact
trigger8 = (stateno = 250) && movecontact

;---------------------------------------------------------------------------
[State -1, Super Wisteria Punch]
type = ChangeState
value = 2700
triggerall = var(59) = 0
triggerall = command = "DiamondStorm"
triggerall = statetype != A
triggerall = var(1) = 0
triggerall = power >= 1000
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 1011) && time > 20
trigger3 = (stateno = 1011) && movecontact
trigger4 = (stateno = 1012) && time > 20
trigger4 = (stateno = 1012) && movecontact

[State -1, Super Air DiamondStorm]
type = ChangeState
value = 2001
triggerall = var(59) = 0
triggerall = command = "DiamondStorm"
triggerall = statetype = A
triggerall = var(1) = 0
triggerall = power >= 1000
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 610) && movecontact
trigger3 = (stateno = 640) && movecontact
trigger4 = (stateno = 650) && movecontact

[State -1, Super Kyuubimon]
type = ChangeState
value = 2010
triggerall = var(59) = 0
triggerall = command = "Kyuubimon"
triggerall = statetype = S
triggerall = var(1) = 0
triggerall = power >= 1000
triggerall = P2Life != 0
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 240) && movecontact
trigger5 = (stateno = 1010) && movecontact
trigger6 = (stateno = 1011) && movecontact
trigger6 = (stateno = 1011) && time > 46
trigger7 = (stateno = 1012) && movecontact
trigger8 = (stateno = 250) && movecontact

;===========================================================================
;---------------------------------------------------------------------------
;Super Jump MVC System
[State -1, MVC Super Jump]
type = ChangeState
value = 7000
triggerall = var(59) = 0
triggerall = StateType != A
trigger1 = ctrl = 1
trigger1 = Command = "SJ" || Command = "SJ" && Command = "holdfwd" || Command = "SJ" && Command = "holdback"
ignorehitpause = 1

;---------------------------------------------------------------------------
;Bypassed Super Jump MVC System
[State -1, MVC Bypassed Super Jump]
type = ChangeState
value = 7001
triggerall = var(59) = 0
triggerall = StateType != A
trigger1 = (stateno = 420) && movehit = 1
trigger1 = Command = "SJ" || Command = "SJ" && Command = "holdfwd" || Command = "SJ" && Command = "holdback" || command = "Up" || command = "Up" && Command = "holdfwd"  || command = "Up" && Command = "holdback" || command = "holdup" || command = "holdup" && Command = "holdfwd"  || command = "holdup" && Command = "holdback"
trigger2 = (stateno = 250) && movehit = 1
trigger2 = Command = "SJ" || Command = "SJ" && Command = "holdfwd" || Command = "SJ" && Command = "holdback" || command = "Up" || command = "Up" && Command = "holdfwd"  || command = "Up" && Command = "holdback" || command = "holdup" || command = "holdup" && Command = "holdfwd"  || command = "holdup" && Command = "holdback"
;---------------------------------------------------------------------------
;---------------------------------------
;MVC Striker System
[State -1, MVC Striker]
type = ChangeState
value = 15000
triggerall = var(59) = 0
triggerall = command = "striker"
triggerall = backedgedist > 0
triggerall = numhelper(15001) = 0
triggerall = var(58) != 0
triggerall = WinKO = 0
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------
;Overhead
[State -1, SF3 Overhead]
type = ChangeState
value = 1050
triggerall = var(59) = 0
triggerall = command = "OH"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
[State -1, Fox Change Void Left]
type = ChangeState
value = 1020
triggerall = var(59) = 0
triggerall = command = "TeleportLeft"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact

;---------------------------------------------------------------------------
[State -1, Fox Change Void Middle]
type = ChangeState
value = 1021
triggerall = var(59) = 0
triggerall = command = "TeleportMiddle"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact

;---------------------------------------------------------------------------
[State -1, Fox Change Void Right]
type = ChangeState
value = 1022
triggerall = var(59) = 0
triggerall = command = "TeleportRight"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact

;---------------------------------------------------------------------------
[State -1, Air Fox Leaf Arrowhead Weak]
type = ChangeState
value = 1000
triggerall = var(59) = 0
triggerall = command = "Arrowheadx" || command = "Arrowheady" || command = "Arrowheadz"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 610) && movecontact
trigger3 = (stateno = 650) && movecontact

;===========================================================================
;---------------------------------------------------------------------------
[State -1, Ground Fox Leaf Arrowhead Weak]
type = ChangeState
value = 1003
triggerall = var(59) = 0
triggerall = command = "Arrowheadx"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 240) && time > 5

;---------------------------------------------------------------------------
[State -1, Ground Fox Leaf Arrowhead Medium]
type = ChangeState
value = 1004
triggerall = var(59) = 0
triggerall = command = "Arrowheady"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 240) && time > 5

;---------------------------------------------------------------------------
[State -1, Ground Fox Leaf Arrowhead Strong]
type = ChangeState
value = 1005
triggerall = var(59) = 0
triggerall = command = "Arrowheadz"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 240) && time > 5

;===========================================================================
;---------------------------------------------------------------------------
[State -1, Wisteria Punch Weak]
type = ChangeState
value = 1010
triggerall = var(59) = 0
triggerall = command = "WistPW"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 210) && movecontact
trigger4 = (stateno = 220) && time > 6
trigger4 = (stateno = 220) && movecontact
trigger5 = (stateno = 240) && time > 6
trigger5 = (stateno = 240) && movecontact
trigger6 = stateno = 1350

;---------------------------------------------------------------------------
[State -1, Wisteria Punch Medium]
type = ChangeState
value = 1011
triggerall = var(59) = 0
triggerall = command = "WistPM"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 220) && time > 6
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 240) && time > 6
trigger3 = (stateno = 240) && movecontact
trigger4 = stateno = 1350

;---------------------------------------------------------------------------
[State -1, Wisteria Punch Strong]
type = ChangeState
value = 1012
triggerall = var(59) = 0
triggerall = command = "WistPS"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 220) && time > 6
trigger2 = (stateno = 220) && movecontact
trigger3 = (stateno = 240) && time > 6
trigger3 = (stateno = 240) && movecontact
trigger4 = stateno = 1350

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59) = 0
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59) = 0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Cross Throw
;投げ
[State -1, Cross Throw]
type = ChangeState
value = 800
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command = "holdfwd" || command = "holdback"
triggerall = statetype != A
triggerall = P2movetype != H
triggerall = P2statetype != A
triggerall = ctrl
triggerall = stateno != 100
trigger1 = p2bodydist X < 3

;---------------------------------------------------------------------------
;Burning Throw
;投げ
[State -1, Burning Throw]
type = ChangeState
value = 805
triggerall = var(59) = 0
triggerall = command = "c"
triggerall = statetype = S
triggerall = statetype != A
triggerall = P2movetype != H
triggerall = P2statetype != A
triggerall = command = "holdfwd" || command = "holdback"
triggerall = ctrl
triggerall = stateno != 100
trigger1 = p2bodydist X < 3

;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A ;= S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time > 12

;---------------------------------------------------------------------------
;Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A ;= S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 1040) && movecontact

;---------------------------------------------------------------------------
[State -1, Stand Strong Punch]
type = ChangeState
value = 220
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype != A;= S
trigger1 = ctrl
trigger2 = (stateno = 230) && movecontact
trigger3 = (stateno = 210) && movecontact
trigger4 = (stateno = 450) && movecontact

;---------------------------------------------------------------------------
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A;= S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact

;---------------------------------------
[State -1, Stand Meduim Kick]
type = ChangeState
value = 240
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A;= S
trigger1 = ctrl
trigger2 = (stateno = 230) && movecontact
trigger3 = (stateno = 210) && movecontact

;---------------------------------------
[State -1, Stand Strong Kick]
type = ChangeState
value = 250
triggerall = var(59) = 0
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype != A;= S
trigger1 = ctrl
trigger2 = (stateno = 210) && time > 5
trigger3 = (stateno = 240) && time > 7


;---------------------------------------
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------
[State -1, Crawl]
type = ChangeState
value = 25
triggerall = var(59) = 0
triggerall = ctrl
triggerall = command = "crawl"
triggerall = P2dist x >= 50
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = var(59) = 0
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A;= S
trigger1 = ctrl
trigger2 = (stateno = 400) && time > 10

;---------------------------------------
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A;= S
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact

;---------------------------------------
[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = var(59) = 0
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype != A;= S
trigger1 = ctrl
trigger2 = (stateno = 410) && movecontact
trigger3 = (stateno = 440) && movecontact

;---------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59) = 0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A;= C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------
;Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = var(59) = 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A;= C
trigger1 = ctrl
trigger2 = (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 4)

;---------------------------------------
;Crouching Strong Kick
;しゃがみ強キック
[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = var(59) = 0
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype != A;= C
trigger1 = ctrl
trigger2 = (stateno = 440) && time > 6
trigger2 = (stateno = 440) && movecontact

;---------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59) = 0
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;---------------------------------------
;Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = var(59) = 0
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 630) && movecontact
trigger4 = stateno = 1350 ;Air blocking

;---------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = var(59) = 0
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 610) && movecontact ;jump_x or jump_a
trigger2 = statetime >= 7
trigger3 = stateno = 1350 ;Air blocking
trigger4 = (stateno = 640) && movecontact
trigger5 = (stateno = 645) && movecontact

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59) = 0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = (stateno = 600) && movecontact

;---------------------------------------------------------------------------
;Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = var(59) = 0
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 630) && movecontact ;jump_x or jump_a
trigger3 = stateno = 1350 ;Air blocking
trigger4 = (stateno = 610) && movecontact ;jump_x or jump_a
trigger4 = statetime >= 7

;---------------------------------------------------------------------------
;Jump Medium Kick +1
[State -1, Jump Medium Kick +1]
type = ChangeState
value = 645
triggerall = var(59) = 0
triggerall = command = "b"
trigger1 = (stateno = 640) && movecontact ;jump_x or jump_a

;---------------------------------------------------------------------------
;Jump Strong Kick
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = var(59) = 0
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = (stateno = 640) && movecontact
trigger4 = (stateno = 645) && movecontact

;---------------------------------------------------------------------------
;Ground Advanced Guard
[State -1,Ground Advanced Guard]
type = ChangeState
value = 330
triggerall = var(59) = 0
triggerall = Command = "x" || Command = "y" || Command = "z" || Command = "a" || Command = "b" || Command = "c"
triggerall = life > 0 && statetype != A
trigger1 = stateno = 150
trigger2 = stateno = 152

;---------------------------------------------------------------------------
;Air Advanced Guard
[State -1,Air Adv Guard]
type = ChangeState
value = 331
triggerall = var(59) = 0
triggerall = Command = "x" || Command = "y" || Command = "z" || Command = "a" || Command = "b" || Command = "c"
triggerall = life > 0 && statetype = A
trigger1 = stateno = 154
