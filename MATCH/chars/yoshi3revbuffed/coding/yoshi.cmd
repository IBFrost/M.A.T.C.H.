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
name = "LargeEggToss"
command = ~D, DF, F, D, DF, F, x
time = 20
[Command]
name = "LargeEggToss"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 20
[Command]
name = "LargeEggToss"
command = ~D, F, D, F, x
time = 20
[Command]
name = "LargeEggToss"   ;Same name as above
command = ~D, F, D, F, y
time = 20

[Command]
name = "YoshiStampede"
command = ~D, DB, B, DB, D, DF, F, x+a
time = 30
[Command]
name = "YoshiStampede"
command = ~D, B, D, F, x+a
time = 30
;Negative Edge
[Command]
name = "YoshiStampede"
command = ~D, DB, B, DB, D, DF, F, ~x+a
time = 30
[Command]
name = "YoshiStampede"
command = ~D, B, D, F, ~x+a
time = 30

[Command]
name = "EggLauncher"
command = ~F, B, DB, D, DF, F, x
time = 30
[Command]
name = "EggLauncher"
command = ~F, B, DB, D, DF, F, y
time = 30
[Command]
name = "EggLauncher"
command = ~F, B, D, F, x
time = 30
[Command]
name = "EggLauncher"
command = ~F, B, D, F, y
time = 30
;Negative Edge
[Command]
name = "EggLauncher"
command = ~F, B, DB, D, DF, F, ~x
time = 30
[Command]
name = "EggLauncher"
command = ~F, B, DB, D, DF, F, ~y
time = 30
[Command]
name = "EggLauncher"
command = ~F, B, D, F, ~x
time = 30
[Command]
name = "EggLauncher"
command = ~F, B, D, F, ~y
time = 30

[Command]
name = "SuperFireBreath"
command = ~D, DB, B, D, DB, B, a
time = 30
[Command]
name = "SuperFireBreath"   ;Same name as above
command = ~D, DB, B, D, DB, B, b
time = 30
[Command]
name = "SuperFireBreath"
command = ~D, B, D, B, a
time = 30
[Command]
name = "SuperFireBreath"   ;Same name as above
command = ~D, B, D, B, b
time = 30
;Negative Edge
[Command]
name = "SuperFireBreath"
command = ~D, DB, B, D, DB, B, ~a
time = 30
[Command]
name = "SuperFireBreath"   ;Same name as above
command = ~D, DB, B, D, DB, B, ~b
time = 30
[Command]
name = "SuperFireBreath"
command = ~D, B, D, B, ~a
time = 30
[Command]
name = "SuperFireBreath"   ;Same name as above
command = ~D, B, D, B, ~b
time = 30


[Command]
name = "YRush"
command = ~D, DB, B, D, DB, B, x;~F, D, DF, F, D, DF, x
time = 20
[Command]
name = "YRush"   ;Same name as above
command = ~D, DB, B, D, DB, B, y;~F, D, DF, F, D, DF, y
time = 20
[Command]
name = "YRush"
command = ~D, B, D, B, x;~F, D, DF, F, D, DF, x
time = 20
[Command]
name = "YRush"   ;Same name as above
command = ~D, B, D, B, y;~F, D, DF, F, D, DF, y
time = 20
;Negative Edge
[Command]
name = "YRush"
command = ~D, DB, B, D, DB, B, ~x;~F, D, DF, F, D, DF, x
time = 20
[Command]
name = "YRush"   ;Same name as above
command = ~D, DB, B, D, DB, B, ~y;~F, D, DF, F, D, DF, y
time = 20
[Command]
name = "YRush"
command = ~D, B, D, B, ~x;~F, D, DF, F, D, DF, x
time = 20
[Command]
name = "YRush"   ;Same name as above
command = ~D, B, D, B, ~y;~F, D, DF, F, D, DF, y
time = 20


;-| Special Motions |------------------------------------------------------
[Command]
name = "upper_x"
command = ~F, D, DF, x
time = 15
[Command]
name = "upper_y"
command = ~F, D, DF, y
time = 15
[Command]
name = "upper_xy"
command = ~F, D, DF, x+y
time = 15
[Command]
name = "upper_a"
command = ~F, D, DF, a
time = 15
[Command]
name = "upper_b"
command = ~F, D, DF, b
time = 15
[Command]
name = "upper_ab"
command = ~F, D, DF, a+b
time = 15

[Command]
name = "rising20_a"
command = ~20$D,$U,a
time = 35
[Command]
name = "rising20_b"
command = ~20$D,$U,b
time = 35
[Command]
name = "rising20_ab"
command = ~20$D,$U,a+b
time = 35
;Negative Edge
[Command]
name = "rising20_a"
command = ~20$D,$U,~a
time = 35
[Command]
name = "rising20_b"
command = ~20$D,$U,~b
time = 35
[Command]
name = "rising20_ab"
command = ~20$D,$U,~a+b
time = 35

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
name = "QCF_x"
command = ~D, F, x
[Command]
name = "QCF_y"
command = ~D, F, y
[Command]
name = "QCF_xy"
command = ~D, F, x+y
;Negative Edge
[Command]
name = "QCF_x"
command = ~D, DF, F, ~x
[Command]
name = "QCF_y"
command = ~D, DF, F, ~y
[Command]
name = "QCF_xy"
command = ~D, DF, F, ~x+y
[Command]
name = "QCF_x"
command = ~D, F, ~x
[Command]
name = "QCF_y"
command = ~D, F, ~y
[Command]
name = "QCF_xy"
command = ~D, F, ~x+y


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
name = "QCB_x"
command = ~D, B, x
[Command]
name = "QCB_y"
command = ~D, B, y
[Command]
name = "QCB_xy"
command = ~D, B, x+y
;Negative Edge
[Command]
name = "QCB_x"
command = ~D, DB, B, ~x
[Command]
name = "QCB_y"
command = ~D, DB, B, ~y
[Command]
name = "QCB_xy"
command = ~D, DB, B, ~x+y
[Command]
name = "QCB_x"
command = ~D, B, ~x
[Command]
name = "QCB_y"
command = ~D, B, ~y
[Command]
name = "QCB_xy"
command = ~D, B, ~x+y



[Command]
name = "FF_ab"
command = ~F, F, a+b
[Command]
name = "FF_a"
command = ~F, F, a
[Command]
name = "FF_b"
command = ~F, F, b
;Negative Edge
[Command]
name = "FF_ab"
command = ~F, F, ~a+b
[Command]
name = "FF_a"
command = ~F, F, ~a
[Command]
name = "FF_b"
command = ~F, F, ~b

[Command]
name = "HCF_a"
command = ~B, DB, D, DF, F, a
time = 32
[Command]
name = "HCF_b"
command = ~B, DB, D, DF, F, b
time = 32
[Command]
name = "HCF_ab"
command = ~B, DB, D, DF, F, a+b
time = 32
[Command]
name = "HCF_a"
command = ~B, D, F, a
time = 32
[Command]
name = "HCF_b"
command = ~B, D, F, b
time = 32
[Command]
name = "HCF_ab"
command = ~B, D, F, a+b
time = 32

[Command]
name = "15_a"
command = ~30$B, F, a
;time = 32
[Command]
name = "15_b"
command = ~30$B, F, b
;time = 32
[Command]
name = "15_ab"
command = ~30$B, F, a+b
;time = 32
;Negative Edge
[Command]
name = "15_a"
command = ~30$B, F, ~a
;time = 32
[Command]
name = "15_b"
command = ~30$B, F, ~b
;time = 32
[Command]
name = "15_ab"
command = ~30$B, F, ~a+b
;time = 32

[Command]
name = "FHCF_b"
command = ~F, B, DB, D, DF, F, b
time = 32
[Command]
name = "FHCF_x"
command = ~F, B, DB, D, DF, F, x
time = 32
[Command]
name = "FHCF_y"
command = ~F, B, DB, D, DF, F, y
time = 32
[Command]
name = "FHCF_xy"
command = ~F, B, DB, D, DF, F, x+y
time = 32
[Command]
name = "FHCF_x"
command = ~F, B, D, F, x
time = 32
[Command]
name = "FHCF_y"
command = ~F, B, D, F, y
time = 32
[Command]
name = "FHCF_xy"
command = ~F, B, D, F, x+y
time = 32

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "BBF"     ;Required (do not remove)
command = $B, $B, F
time = 20

[Command]
name = "DDab"     ;Required (do not remove)
command = ~D, D, a+b
time = 10
[Command]
name = "DDa"     ;Required (do not remove)
command = ~D, D, a
time = 10
[Command]
name = "DDb"     ;Required (do not remove)
command = ~D, D, b
time = 10
;Negative Edge
[Command]
name = "DDab"     ;Required (do not remove)
command = ~D, D, ~a+b
time = 10
[Command]
name = "DDa"     ;Required (do not remove)
command = ~D, D, ~a
time = 10
[Command]
name = "DDb"     ;Required (do not remove)
command = ~D, D, ~b
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "dodge";Required (do not remove)
command = x+a
time = 1

[Command]
name = "x+a";Required (do not remove)
command = x+a
time = 1

[Command]
name = "b+y";Required (do not remove)
command = b+y
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
name = "JumpCancel";Required (do not remove)
command = $D, $U
time = 10

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
name = "holddownback"
command = /DB
time = 1

[Command]
name = "holddownfwd"
command = /DF
time = 1
;-Direction------------------------------------------------------------------
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


;---------------------------------------------------------------------------
;AI Helper (Original Coding by Winane)
[State -1, AI Helper Check]
type = ChangeState
trigger1 = IsHelper(9741)
value = 9741

;-------------------------------------------------------------------------------
;------------------------------------AI-----------------------------------------
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;General Movement
;-------------------------------------------------------------------------------

[State -1, AI Guard]
type= Changestate
value = 120
trigger1 = var(59)>=1 && roundstate=2 && (ctrl||stateno = 25)
trigger1 = (stateno!=[120,155]) && !(enemynear,hitdefattr=SCA,AT) && inguarddist ;&& p2statetype = A
trigger1 = random<ifelse((enemynear,stateno = [200,699]), 100, ifelse((enemynear,stateno = [1000,2999]),300, 1000))

[State -1, AI Taunt]
type = ChangeState
value = 195
triggerall = name != "MetalYoshi3"
triggerall = movetype!=H 
triggerall =var(59)>=1 && statetype=S && ctrl = 1
trigger1= roundstate=2 &&random<50
trigger1= enemynear,movetype!=A && p2bodydist x>200
;Enemy on Ground
trigger2 = roundstate=2
trigger2 = enemynear,statetype = L && random<50 && p2bodydist x>60
;Far(Life lead)
trigger3= roundstate=2 &&random<50 && life>enemynear,life
trigger3 = enemynear,movetype != A && p2bodydist x>60

[State -1, AI Run Fwd]
type = ChangeState
value = 100
triggerall = movetype!=H && enemynear,statetype != L && name != "MetalYoshi3" && (life<=enemynear,life)
trigger1= var(59)>=1 && statetype=S && roundstate=2 && ctrl && (stateno !=[100,105])&&random<150;+(life/100)
trigger1= enemynear,movetype!=A && p2bodydist x = [50,9999]

[State -1, AI Walk];Metal Yoshi
type = ChangeState
value = 25
triggerall = name = "MetalYoshi3"
triggerall = ctrl && movetype!=H && enemynear,statetype != L && var(59)>=1 && roundstate=2
trigger1= statetype=S && (stateno!=[20,155]) && random<(50+(life/10))
trigger1= enemynear,movetype!=A && p2bodydist x = [0,9999]

[State -1, AI Walk];Yoshi
type = ChangeState
value = 25
triggerall = name != "MetalYoshi3"
triggerall = ctrl && (stateno!=[20,155]) && var(59)>=1 && roundstate=2
trigger1= statetype=S && random<(50+(life/10))
trigger1= enemynear,movetype!=A && p2bodydist x = [0,49] ;&& p2bodydist x<100


[State -1, AI Back Dash]
type = ChangeState
value = 105
triggerall = movetype!=H && var(59)>=1 && ctrl = 1 && backedgebodydist > 0
trigger1 = prevstateno = 102
trigger1= enemynear,statetype != L && statetype=S && roundstate=2 && ctrl = 1
trigger1=(stateno!=[100,105]) && enemynear,movetype!=A && p2bodydist x<=50&& random<500
;After Low Tail Strike
trigger2 = prevstateno = 241
trigger2= enemynear,statetype = L && statetype=S && roundstate=2 && ctrl = 1
trigger2=(stateno!=[100,105]) && enemynear,movetype!=A && p2bodydist x<=50&& random<500
;Escaping(LowLife)
trigger3= statetype=S && roundstate=2 && ctrl = 1 && life <=500
trigger3=(stateno!=[100,105]) && p2bodydist x <100 && random<50 && backedgebodydist > 30
;Projectile?
trigger4 = statetype!=A && roundstate=2 && p2bodydist x<=80 && ctrl && random<50
trigger4 = enemy,numproj>0
;Normals Guarded?
trigger5 = (prevstateno = [200,299]) || (prevstateno = [400,499]) && moveguarded = 1 && random<500 && ctrl = 1
;-------------------------------------------------------------------------------
;Super Chains
;-------------------------------------------------------------------------------
[State -1, AI Yoshi Stampede]
type = ChangeState
value = 3050
triggerall = var(59)>=1
triggerall = stateno != [1240,1261]
triggerall = name!= "MetalYoshi3"
triggerall = name!= "GigaYoshi3"
triggerall = power >= 3000
triggerall = movetype!=H && statetype != A && enemynear,statetype != L
triggerall = stateno != [3000,3004]
triggerall = stateno != [1050,1075]
;Random Use
trigger1 = (stateno = [200,299]) || (stateno = [400,499]) && movehit = 1 && random<500
;From Yoshi Headbutt
trigger2 = (stateno = 1200 || stateno = 1210) && movehit = 1 && random<500

[State -1, AI Super Fire Breath]
type = ChangeState
value = 3010
triggerall = var(59)>=1
triggerall = stateno != [1240,1261]
triggerall = power >= 1000
triggerall = movetype!=H && statetype != A && enemynear,statetype != L
triggerall = stateno != [3000,3004]
triggerall = stateno != [1050,1075]
;Combo
trigger1 = (stateno = [200,299]) || (stateno = [400,499]) && movehit = 1 && random<500
;Is the opponent using a dash move?
trigger2 = statetype!=A && roundstate=2 && p2bodydist x<=80 && ctrl && random<500
trigger2 = enemynear,vel x >0 && enemy,movetype = A
;From light headbutt
trigger3 = stateno = 1200 && movehit = 1 && random<500 && life > 500
;Combo(Enemy Chip Killable or LowLife)
trigger4 = (stateno = [200,299]) || (stateno = [400,499]) && movecontact = 1 && random<500
trigger4 = (enemynear,life <= 60 || life <= 500)
;From light headbutt(LowLife)
trigger5 = stateno = 1200 && movecontact = 1 && random<500 && life <= 500

[State -1, AI Egg Launcher]
type = ChangeState
value = 3030
triggerall = var(59)>=1
triggerall = power >= 1000
triggerall = movetype!=H && statetype != A && enemynear,statetype != L
trigger1 = roundstate=2 && p2bodydist x<=10 && ctrl && random<100 && enemynear,movetype != H
;---------------------------------------------------------------------------
;Moves
;---------------------------------------------------------------------------
[State -1, AI Throw]
type = ChangeState
value = 800
triggerall = var(59)>=1 && ctrl && (stateno != [100,102])
triggerall = movetype!=H && statetype != A && enemynear,statetype != L
trigger1 = roundstate=2 && (p2bodydist x = [0,15]) && random<50 && enemynear,movetype != H

[State -1, AI Jump L.Punch]
type = ChangeState
value = 600
triggerall = var(59)>=1
triggerall = movetype!=H && statetype = A && enemynear,statetype != L
;From Jump
trigger1 = pos y <= -20 && enemynear,statetype != L
trigger1= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<500
trigger1= enemynear,movetype!=A && (enemynear,pos y >= (pos y+5-random%10)) && p2bodydist x<=40
;From Air Block
trigger2 = stateno = 1350 && random<100 && roundstate=2
trigger2 = (enemynear,pos y >= pos y+5 || enemynear,pos y < pos y-5) && p2bodydist x<=40

[State -1, AI Jump L.Kick]
type = ChangeState
value = 630
triggerall = var(59)>=1
triggerall = movetype!=H && statetype = A && enemynear,statetype != L
;From Jump
trigger1 = pos y <= -20 && enemynear,statetype != L
trigger1= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<500
trigger1= enemynear,movetype!=A && enemynear,pos y >= pos y+15 && p2bodydist x<=40
;From Air Block
trigger2 = stateno = 1350 && random<100 && roundstate=2
trigger2 = (enemynear,pos y >= pos y+5 || enemynear,pos y < pos y-5) && p2bodydist x<=40
;From Air L.Punch
trigger3 = stateno = 600 && roundstate=2 && movecontact
trigger3 = p2bodydist x<=40

[State -1, AI Tail Slash]
type = ChangeState
value = 641
triggerall = var(59)>=1
triggerall = movetype!=H && statetype = A && enemynear,statetype != L && vel x>=0
;From Jump
trigger1 = pos y <= -25 && enemynear,statetype != L
trigger1= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<100
trigger1= enemynear,movetype!=A && (enemynear,pos y >= (pos y+5-random%5)) && p2bodydist x<=30
;From Air Block
trigger2 = stateno = 1350 && random<100 && roundstate=2
trigger2 = (enemynear,pos y >= pos y+5 || enemynear,pos y < pos y-5) && p2bodydist x<=40
;From Air L.Punch
trigger3 = stateno = 600 && random<100 && roundstate=2 && movecontact
trigger3 =  p2bodydist x<=40
;From Air L.Kick
trigger4 = (stateno = 632) && roundstate=2 && movecontact = 1
trigger4 =  p2bodydist x<=40

[State -1, AI Jump S.Kick]
type = ChangeState
value = 640
triggerall = var(59)>=1
triggerall = movetype!=H && statetype = A && enemynear,statetype != L && vel x<=0
;From Jump
trigger1 = pos y <= -25 && enemynear,statetype != L
trigger1= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<100
trigger1= enemynear,movetype!=A && (enemynear,pos y >= pos y+5 || enemynear,pos y < pos y-5) && p2bodydist x<=30
;From Air Block
trigger2 = stateno = 1350 && random<100 && roundstate=2
trigger2 = (enemynear,pos y >= pos y+5 || enemynear,pos y < pos y-5) && p2bodydist x<=40
;From Air L.Punch
trigger3 = stateno = 600 && random<100 && roundstate=2 && movecontact
trigger3 =  p2bodydist x<=40
;From Air L.Kick
trigger4 = (stateno = 630||stateno = 632) && roundstate=2 && movecontact = 1
trigger4 =  p2bodydist x<=40

[State -1, AI Crouching L.Kick]
type = ChangeState
value = 400
triggerall = movetype!=H && enemynear,statetype != L && enemynear,statetype != A
triggerall = var(59)>=1
triggerall = stateno != 100
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<=15 && ctrl && random<70
;Repeat
trigger2 = statetype!=A && roundstate=2 && p2bodydist x<=25
trigger2 = stateno = 400 && movecontact = 1 && random<500

[State -1, AI Crouching S.Kick]
type = ChangeState
value = 440
triggerall = movetype!=H && enemynear,statetype != L && enemynear,statetype != A
triggerall = var(59)>=1
triggerall = stateno != 100
;Random Use
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<=65 && ctrl && random<70
;From Crouching L.Kick
trigger2 = statetype!=A && roundstate=2 && p2bodydist x<=65 && p2bodydist x>25
trigger2 = (stateno = 400 || stateno = 430) && movecontact = 1 && random<500

[State -1, AI Standing S.Punch]
type = ChangeState
value = 210
triggerall = movetype!=H && enemynear,statetype != L
triggerall = var(59)>=1
trigger1 = statetype=S && roundstate=2 && p2bodydist x<=40
trigger1 = ctrl && enemynear,pos y >= -35 && random<50
;Combo
trigger2 = name != "MetalYoshi3"
trigger2 = statetype=S && roundstate=2 && p2bodydist x<=40
trigger2 = (stateno = 200 || stateno = 230) && movecontact = 1 && random<700

[State -1, AI Chained Standing S.Kick]
type = ChangeState
value = 242
triggerall = movetype!=H && enemynear,statetype != L
triggerall = var(59)>=1
trigger1 = statetype=S && roundstate=2 && p2bodydist x<=40
trigger1 = (stateno = 200 || stateno = 230) && movecontact = 1 && random<500
;From Low Tail Strike
trigger2 = statetype=S && roundstate=2 && p2bodydist x<=30
trigger2 = stateno = 241 && movecontact = 1 && random<500


[State -1, AI Standing S.Kick]
type = ChangeState
value = 240
triggerall = var(59)>=1 && enemynear,statetype != L
trigger1 = statetype=S && roundstate=2 && p2bodydist x<=40
trigger1 = ctrl && enemynear,pos y >= -35 && random<50


[State -1, AI L.Punch]
type = ChangeState
value = 200
triggerall = var(59)>=1 && movetype!=H && enemynear,statetype != L
trigger1 = (p2bodydist x = [0,20]) && statetype=S && roundstate=2
trigger1 = ctrl && enemynear,pos y >= -35 && random<30 ;Use combo condition (above)

[State -1, AI L.Kick]
type = ChangeState
value = 230
triggerall = movetype!=H && enemynear,statetype != L
triggerall = var(59)>=1
trigger1 = statetype=S && roundstate=2 && p2bodydist x = [0,23]
trigger1 = ctrl && enemynear,pos y >= -35 && random<500
;From L.Punch
trigger2 = statetype=S && roundstate=2 && p2bodydist x = [0,23]
trigger2 = stateno = 200 && movecontact = 1 && random<500

[State -1, AI Low Tail Strike]
type = ChangeState
value = 241
triggerall = var(59)>=1 && enemynear,statetype = L
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<=25
trigger1 = ctrl && random<50

[State -1, AI Rising Headbutt]
type = ChangeState
value = 420
triggerall = movetype!=H && enemynear,statetype != L && stateno !=100
triggerall = var(59)>=1
;Anti-Air
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<40 && ctrl && random<500
trigger1 = enemynear,statetype = A && enemynear,pos y >= -80 ;&& enemynear,vel y <= 0
;On Ground
trigger2 = statetype!=A && roundstate=2 && p2bodydist x<40 && ctrl && random<10
;Combo
trigger3 = statetype=S && roundstate=2 && p2bodydist x<40
trigger3 = stateno = 230 && movehit = 1 && random<500
persistent = 0

[State -1, AI Close Yoshi Bomb]
type = ChangeState
value = 1050
triggerall = movetype!=H && enemynear,statetype != L
triggerall = var(59)>=1
;Combo from Rising Headbutt
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger1 = stateno = 420 && movecontact = 1 && random<50
;Combo from Slide
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger1 = stateno = 440 && movehit = 1 && random<100

[State -1, AI Far Yoshi Bomb]
type = ChangeState
value = 1060
triggerall = movetype!=H && enemynear,statetype != L
triggerall = var(59)>=1
;Combo from Rising Headbutt
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger1 = stateno = 420 && movecontact = 1 && random<50
;Combo from Tounge Sweep
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger1 = stateno = 410 && movecontact = 1 && random<50

[State -1, AI EX Headbutt]
type = ChangeState
value = 1220
triggerall = var(59)>=1 && movetype!=H && enemynear,statetype != L
triggerall = enemynear,pos y >= -45 && power>=500 && (stateno!=[120,155])
;Random Use
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<50 && ctrl && random<50 && (enemynear,stateno!=[120,155])
;Enemy Attacking?
trigger2 = statetype!=A && roundstate=2 && p2bodydist x<=80 && ctrl && random<(ifelse(backedgebodydist>0,50,150))
trigger2 = enemynear,vel x >=0 && enemy,movetype = A && life > 450
;Combo
trigger3 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger3 = (stateno = [200,299]) || (stateno = [400,499])
trigger3 = stateno != 420
trigger3 = stateno != 440 && movecontact = 1 && random<500
;Enemy Attacking? (Low)
trigger4 = statetype!=A && roundstate=2 && p2bodydist x<=80 && ctrl && random<(ifelse(backedgebodydist>0,150,250))
trigger4 = enemynear,vel x >=0 && enemy,movetype = A && life <= 450
persistent = 0

[State -1, AI Light Headbutt]
type = ChangeState
value = 1200
triggerall = var(59)>=1 && movetype!=H && enemynear,statetype != L
triggerall = enemynear,pos y >= -45 && enemy,movetype != A
;Random Use
trigger1 = statetype!=A && roundstate=2 && p2bodydist x<50 && ctrl && random<(ifelse(backedgebodydist>0,50,15))
trigger1 = (enemynear,stateno!=[120,155])
;Combo
trigger2 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 && movehit = 1 && random<500 ;Use combo condition (above)
persistent = 0

[State -1, AI EX Fire Breath]
type = ChangeState
value = 1020
triggerall = power >= 500
triggerall = var(59)>=1
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
triggerall = movetype!=H && enemynear,statetype != L
;Random Use
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>=30 && p2bodydist x<100 && ctrl && random<10
trigger1 = enemy,statetype = A && vel x < 0 && time >=15
;After Back Dash
trigger2 = prevstateno = 105 && life<=650
trigger2= var(59)>=1 && statetype=S && roundstate=2 && ctrl = 1
trigger2= (stateno!=[100,105]) && enemynear,movetype!=A && random<70

[State -1, AI Light Fire Breath]
type = ChangeState
value = 1000
triggerall = var(59)>=1
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
triggerall = movetype!=H && enemynear,statetype != L
;Random Use
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>=30 && p2bodydist x<100 && ctrl && random<10
trigger1 = enemy,statetype = A && vel x < 0 && time >=15
;After Back Dash
trigger2 = prevstateno = 105 && life<=650
trigger2= var(59)>=1 && statetype=S && roundstate=2 && ctrl = 1
trigger2= (stateno!=[100,105]) && enemynear,movetype!=A && random<70

[State -1, AI Strong Fire Breath]
type = ChangeState
value = 1010
triggerall = var(59)>=1
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
triggerall = movetype!=H && enemynear,statetype != L
;Random Use
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>=100 && ctrl && random<10
trigger1 = enemy,statetype = A && vel x < 0 && time >=15
;After Back Dash
trigger2 = prevstateno = 105 && life<=650
trigger2= var(59)>=1 && statetype=S && roundstate=2 && ctrl = 1
trigger2= (stateno!=[100,105]) && enemynear,movetype!=A && random<50

[State -1, AI Diag. Egg Toss]
type = ChangeState
value = 1040
triggerall = var(59)>=1
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
triggerall = numhelper(1030) < 1
triggerall = movetype!=H && enemynear,statetype != L
;Far
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>=80 && ctrl && random<30
trigger1 = enemy,statetype = A && enemynear, pos y <= -45 &&life>500
;Far(LowLife)
trigger2 = statetype!=A && roundstate=2 && p2bodydist x>=60 && ctrl && random<50
trigger2 = enemy,statetype = A && enemynear, pos y <= -45 && life<=500

[State -1, AI Straight Egg Toss]
type = ChangeState
value = 1030
triggerall = var(59)>=1
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
triggerall = numhelper(1030) < 1
triggerall = movetype!=H && enemynear,statetype != L
;Far
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>=120 && ctrl && random<10
trigger1 = enemy,statetype != A && enemy,statetype != A && life>500
;Far(Attacking)
trigger2 = statetype!=A && roundstate=2 && p2bodydist x>=120 && ctrl && random<10
trigger2 = enemy,statetype != A && enemy,movetype = A && life>500
;Far(LowLife)
trigger3 = statetype!=A && roundstate=2 && p2bodydist x>=120 && ctrl && random<60
trigger3 = enemy,statetype != A && life<=500
;Dash Move?
trigger4 = statetype!=A && roundstate=2 && p2bodydist x<=130 && ctrl && random<50
trigger4 = enemynear,vel x >0 && enemy,movetype = A && p2bodydist x>60
;Projectile?
trigger5 = statetype!=A && roundstate=2 && p2bodydist x<=80 && ctrl && random<50
trigger5 = enemy,numproj>0

[State -1, AI EX EggRoll]
type = ChangeState
value = 1260
triggerall = movetype!=H && enemynear,statetype != L && (enemynear,stateno!=[120,155])
triggerall = var(59)>=1
triggerall = power>=500
;Far
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>50 && ctrl && random<60
trigger1 = enemy,statetype != A && (life>500||life<=enemynear,life) && enemy,movetype != A
;Far(LowLife)
trigger2 = statetype!=A && roundstate=2 && p2bodydist x>50 && ctrl && random<100
trigger2 = enemy,statetype != A && (life<=500||life<=enemynear,life) && enemy,movetype != A
;Close
trigger3 = statetype!=A && roundstate=2 && p2bodydist x<=60 && p2bodydist x>50 && ctrl && random<10 && life<300
;Combo
trigger4 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger4 = (stateno = [200,299]) || (stateno = [400,499])
trigger4 = stateno != 440 && stateno != 420 && movehit = 1 && random<500
persistent = 0

[State -1, AI Light EggRoll]
type = ChangeState
value = 1240
triggerall = movetype!=H && enemynear,statetype != L && (enemynear,stateno!=[120,155])
triggerall = var(59)>=1
;Far
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>60 && p2bodydist x<100 && ctrl && random<(life/100)
trigger1 = enemy,statetype != A && enemy, movetype = A
;Close
trigger2 = statetype!=A && roundstate=2 && p2bodydist x<=60 && p2bodydist x>50 && ctrl && random<50 && enemy,movetype = A
;Combo
trigger3 = statetype!=A && roundstate=2 && p2bodydist x<=40
trigger3 = (stateno = [200,299]) || (stateno = [400,499])
trigger3 = stateno != 440 && stateno != 420 && movehit = 1 && random<500
persistent = 0

[State -1, AI Strong EggRoll]
type = ChangeState
value = 1250
triggerall = movetype!=H && enemynear,statetype != L && (enemynear,stateno!=[120,155])
triggerall = var(59)>=1
;Far
trigger1 = statetype!=A && roundstate=2 && p2bodydist x>70 && ctrl && random<(life/100)
trigger1 = enemy,statetype != A && life>= 250

;---------------------------------------------------------------------------
;Air Attack Branches
[State -1, AI Air Dash]
type = ChangeState
value = 1080
triggerall = movetype!=H
triggerall= var(59)>=1
;During Jump
trigger1= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<50
trigger1= vel x >= 0 && enemynear,movetype!=A && pos y <= -25 && p2bodydist x >=60
;From Strong Kick
trigger2= statetype=A && roundstate=2 && movecontact = 1 && stateno = 640 && random<700
trigger2= enemynear,movetype!=A
;From Strong Punch
trigger3= statetype=A && roundstate=2 && movecontact = 1 && stateno = 610 && random<700
trigger3= enemynear,movetype!=A
persistent = 0
ignorehitpause = 1

[State -1, AI HeadStomp]
type = ChangeState
value = 631
triggerall = movetype!=H
triggerall= var(59)>=1
;From Jump
trigger1 = pos y <= -35 && enemynear,statetype != L
trigger1= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<100
trigger1= vel x >=0 && enemynear,movetype!=A && enemynear,pos y >= pos y+15 && p2bodydist x<=50
;From ParaYoshi Charge
trigger2 = statetype=A && roundstate=2 && p2bodydist x<=30
trigger2 = stateno = 1080 && movehit = 0 && time>=20 &&random<500
persistent = 0

[State -1, AI GroundPound]
type = ChangeState
value = 1052
triggerall = movetype!=H
triggerall= var(59)>=1
;From Jump
trigger1 = pos y <= -25
trigger1= statetype=A && roundstate=2 && (ctrl||((stateno = 1080 && time >= 20)||stateno = 1081)) && (stateno = [45,50]) && random<100
trigger1= vel x >=0 && enemynear,movetype!=A && enemynear,pos y >= (pos y+5) && p2bodydist x<=30
trigger1= enemynear,statetype!=A
;From Jump (Near Downed Enemy)
trigger2 = pos y <= -25 && enemynear,statetype = L
trigger2= statetype=A && roundstate=2 && (ctrl||((stateno = 1080 && time >= 20)||stateno = 1081)) && (stateno = [45,50]) && random<100
trigger2= vel x >=0 && enemynear,movetype!=A && enemynear,pos y >= 0 && p2bodydist x<=30
;From Jump
trigger3 = pos y <= -25
trigger3= statetype=A && roundstate=2 && (ctrl||((stateno = 1080 && time >= 20)||stateno = 1081)) && (stateno = [45,50]) && random<200
trigger3= vel x >=0 && enemynear,movetype=A && enemynear,pos y >= (pos y+5) && p2bodydist x<=25
trigger3= enemynear,statetype!=A
;From HeadStomp
trigger4 = pos y <= -25
trigger4= statetype=A && roundstate=2 && (ctrl&&prevstateno = 633) && (stateno = [45,50]) && random<500
trigger4= enemynear,movetype!=A && p2bodydist x<=30
trigger4= enemynear,statetype!=A
persistent = 0

[State -1, AI Super Ground Pound]
type = ChangeState
value = 1072
triggerall = movetype!=H
triggerall= var(59)>=1 && power>=500 && life<500
;From Jump
trigger1 = pos y <= -25 && enemynear,statetype != L
trigger1= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<10
trigger1= vel x >=0 && enemynear,movetype!=A && enemynear,pos y >= pos y+5 && p2bodydist x<=50
trigger1= enemynear,statetype!=A
;From ParaYoshi Charge
trigger2 = statetype=A && roundstate=2 && p2bodydist x<=30
trigger2 = stateno = 1080 && movehit = 0 && random<500 && time >= 20
;From Jump (Near Downed Enemy)
trigger3 = pos y <= -25 && enemynear,statetype = L
trigger3= statetype=A && roundstate=2 && ctrl && stateno = 50 && random<100
trigger3= vel x >=0 && enemynear,movetype!=A && enemynear,pos y >= 0 && p2bodydist x<=30
persistent = 0




;General Movement II------------------------------------------------------------





;-------------------------------------------------------------------------------
;--------------------------------End Of AI--------------------------------------
;-------------------------------------------------------------------------------


;---------------------------------------------------------------------------
;Super Armor Helper (Original Coding by Winane)
[State -1, (ArmorHelper)Hide]
type = AssertSpecial
trigger1 = IsHelper(44304)
flag = invisible
flag2 = NoShadow
IgnoreHitPause = 1

[State -1, (ArmorHelper)Reset]
type = SelfState
trigger1 = IsHelper(44304)
trigger1 = StateNo != [44304,44305]
value = 44304
IgnoreHitPause = 1
;---------------------------------------------------------------------------
;Yoshi Stampede
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Yoshi Stampede]
type = ChangeState
value = 3050
triggerall = var(59)<=0
triggerall = stateno != [1240,1261]
triggerall = name!= "MetalYoshi3"
triggerall = name!= "GigaYoshi3"
triggerall = command = "YoshiStampede"
triggerall = power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact
trigger2 = stateno != [3000,3004]
trigger2 = stateno != [1050,1075]
;---------------------------------------------------------------------------
;Super Fire Breath
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Super Fire Breath]
type = ChangeState
value = 3010
triggerall = var(59)<=0
triggerall = stateno != [1240,1261]
triggerall = command = "SuperFireBreath"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact
trigger2 = stateno != [3000,3004]
trigger2 = stateno != [1050,1075]
;trigger3 = life <= 250
;trigger3 = stateno != 3000 && stateno != [3002,3003]
;trigger3 = stateno = 3001 && animelemtime(28) >= 0
;trigger3 = movecontact
;---------------------------------------------------------------------------
;Egg Launcher
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Egg Launcher]
type = ChangeState
value = 3030
triggerall = var(59)<=0
triggerall = command = "EggLauncher"
triggerall = power >= 1000
triggerall = statetype != A
triggerall =(stateno != [100,102])
trigger1 = ctrl
;---------------------------------------------------------------------------
;Large Egg Toss
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Large Egg Toss]
type = null;ChangeState
value = 3020
triggerall = stateno != [1240,1251]
triggerall = command = "LargeEggToss"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [1240,1261)
trigger2 = stateno != [3020,3004)
trigger2 = stateno != [1050,1075]
trigger2 = movecontact
;trigger3 = life <= 250
;trigger3 = stateno = 3010 && animelemtime(8) >= 0
;---------------------------------------------------------------------------
;Yoshi Rush
;スマッシュ・カンフー・ウッパー（ゲージレベル１）
[State -1, Yoshi Rush]
type = null;ChangeState
value = 3000
;triggerall = name = "MetalYoshi3"
triggerall = stateno != [1240,1251]
triggerall = command = "YRush"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3004)
trigger2 = stateno != [1050,1075]
trigger2 = movecontact
;trigger3 = life <= 250
;trigger3 = stateno = 3010 && animelemtime(8) >= 0
;---------------------------------------------------------------------------
;GuardCancel-Attack
;カンフー・ウッパー（弱）
[State -1, GuardCancel-Attack]
type = null;ChangeState
value = 4001
triggerall = power >= 1000
trigger1 = stateno = 150 || stateno = 152
trigger1 = command = "b+y"
trigger1 = statetype != A
;---------------------------------------------------------------------------
;GuardCancel-Back Dodge
;カンフー・ウッパー（弱）
[State -1, GuardCancel-Back Dodge]
type =  null;ChangeState
value = 4005
triggerall = power >= 1000
triggerall = command = "holdback" &&  command = "dodge"
trigger1 = stateno = 150 || stateno = 152
trigger1 = statetype != A
;---------------------------------------------------------------------------
;GuardCancel-Fwd Dodge
;カンフー・ウッパー（弱）
[State -1, GuardCancel-Fwd Dodge]
type =  null;ChangeState
value = 4003
triggerall = power >= 1000
triggerall = command = "holdfwd" &&  command = "dodge"
trigger1 = stateno = 150 || stateno = 152
trigger1 = statetype != A
;---------------------------------------------------------------------------
;Back Dodge
[State -1, Back Dodge]
type =  null;ChangeState
value = 4004
triggerall = command = "dodge" && command = "holdback"
trigger1 = ctrl && statetype != A ;Use combo condition (above)
;---------------------------------------------------------------------------
;Fwd Dodge
[State -1, Fwd Dodge]
type =  null;ChangeState
value = 4002
triggerall = command = "dodge" && command = "holdfwd"
trigger1 = ctrl && statetype != A ;Use combo condition (above)

;---------------------------------------------------------------------------
;Neutral Dodge
[State -1, Neutral Dodge]
type =  null;ChangeState
value = 4000
triggerall = command = "dodge"
trigger1 = ctrl && statetype != A ;Use combo condition (above)

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Ground Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Ground Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
var(1) = 1

[State -1, Air -> Ground Combo condition Reset]
type = VarSet
triggerall = stateno != 52
triggerall = statetype != A
trigger1 = (gametime%3)=0
var(3) = 0

[State -1, Air -> Ground Combo condition Check]
type = VarSet
;trigger1 = statetype = A
;trigger1 = ctrl
trigger1 = (stateno = [600,699])
trigger1 = movecontact
var(3) = 1
persistent = 1
ignorehitpause = 1
;---------------------------------------------------------------------------
;Strong Egg Trap
;投げ
[State -1, Strong Egg Trap]
type = null;ChangeState
value = 1110
triggerall = power >= 500
triggerall = numhelper(1122) < 1
triggerall = command = "FHCF_b";"FHCF_x" || command = "FHCF_y"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Light Egg Trap
;投げ
[State -1, Light Egg Trap]
type = null;ChangeState
value = 1100
triggerall = command = "FHCF_x"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Super Ground Pound (1/3 super bar)
;速いカンフー蹴り（ゲージレベル１／３）
[State -1, Super Ground Pound(A)]
type = ChangeState
value = 1072
triggerall = var(59)<=0
triggerall = command = "DDab"
triggerall = power >= 500
trigger1 = ctrl
trigger1 = statetype = A
trigger2 = stateno = 1081
trigger3 = stateno = 1080 && time >= 20
;---------------------------------------------------------------------------
;Super Ground Pound (1/3 super bar)
;速いカンフー蹴り（ゲージレベル１／３）
[State -1, Super Ground Pound(G)]
type = ChangeState
value = 1070
triggerall = var(59)<=0
triggerall = command = "rising20_ab";"upper_ab"
triggerall = power >= 500
trigger1 = var(1) || stateno=40 || stateno=52;var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;GroundPound
;カンフー蹴り（弱）
[State -1, GroundPound]
type = ChangeState
value = 1052
triggerall = var(59)<=0
triggerall = command = "DDb"
trigger1 = statetype = A && ctrl = 1
trigger2 = stateno = 1081
trigger3 = stateno = 1080 && time >= 20
;---------------------------------------------------------------------------
;Close Yoshi Bomb
;カンフー蹴り（弱）
[State -1, Close Yoshi Bomb]
type = ChangeState
value = 1050
triggerall = var(59)<=0
triggerall = command = "rising20_a";"upper_a"
trigger1 = var(1) || stateno=40 || stateno=52;var(1) ;Use combo condition (above)
trigger2 = stateno = 440
trigger2 = movecontact
;---------------------------------------------------------------------------
;Far Yoshi Bomb
;カンフー蹴り（弱）
[State -1, Far Yoshi Bomb]
type = ChangeState
value = 1060
triggerall = var(59)<=0
triggerall = command =  "rising20_b";"upper_b"
trigger1 = var(1) || stateno=40 || stateno=52 ;Use combo condition (above)

;---------------------------------------------------------------------------
;Straight Egg Toss
;カンフー突き手（弱）
[State -1, Straight Egg Toss]
type = ChangeState
value = 1030
triggerall = var(59)<=0
triggerall = command = "QCF_x"
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
triggerall = numhelper(1030) < 1
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Diag. Egg Toss
;カンフー突き手（強）
[State -1, Diag. Egg Toss]
type = ChangeState
value = 1040
triggerall = var(59)<=0
triggerall = command = "QCF_y"
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
triggerall = numhelper(1030) < 1
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;EX Fire Breath
[State -1, EX Fire Breath]
type = ChangeState
value = 1020
triggerall = var(59)<=0
triggerall = command = "15_ab"
triggerall = power >= 500
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Fire Breath
;カンフー突き手（弱）
[State -1, Light Fire Breath]
type = ChangeState
value = 1000
triggerall = var(59)<=0
triggerall = command = "15_a"
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Fire Breath
;カンフー突き手（強）
[State -1, Strong Fire Breath]
type = ChangeState
value = 1010
triggerall = var(59)<=0
triggerall = command = "15_b"
triggerall = numhelper(1000) < 1
triggerall = numhelper(1020) < 1
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;EX Egg Roll
;カンフー蹴り（弱）
[State -1, EX Egg Roll]
type = ChangeState
value = 1260
triggerall = var(59)<=0
triggerall = power >=500
triggerall = command = "FF_ab"
trigger1 = var(1) ;Use combo condition (above)
;---------------------------------------------------------------------------
;Strong Egg Roll
;カンフー蹴り（弱）
[State -1, Strong Egg Roll]
type = ChangeState
value = 1250
triggerall = var(59)<=0
triggerall = command = "FF_b"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Egg Roll
;カンフー蹴り（弱）
[State -1, Light Egg Roll]
type = ChangeState
value = 1240
triggerall = var(59)<=0
triggerall = command = "FF_a"
trigger1 = var(1) ;Use combo condition (above)


;---------------------------------------------------------------------------
;EX Smash Headbutt
[State -1, EX Smash Headbutt]
type = ChangeState
value = 1220
triggerall = var(59)<=0
triggerall = command = "QCB_xy"
triggerall = power >= 500
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Light Smash Headbutt
[State -1, Light Smash Headbutt]
type = ChangeState
value = 1200
triggerall = var(59)<=0
triggerall = command = "QCB_x"
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Strong Smash Headbutt
[State -1, Strong Smash Headbutt]
type = ChangeState
value = 1210
triggerall = var(59)<=0
triggerall = command = "QCB_y"
trigger1 = var(1) ;Use combo condition (above)

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, EX ParaYoshiCharge]
type = null;ChangeState
value = 1083
triggerall = var(59)<=0
triggerall = power >=500
triggerall = command = "FF"
trigger1 = stateno = 105;type = A
trigger1 = ctrl
;trigger2 = stateno = [600,699]
;trigger2 = movecontact
;trigger3 = stateno = 1080
;trigger3 = movecontact
;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, ParaYoshiCharge]
type = ChangeState
value = 1080
triggerall = var(59)<=0
triggerall = command = "FF"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,699]
trigger2 = stateno != 641
trigger2 = movecontact

;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(59)<=0
trigger1 = stateno !=102
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59)<=0
trigger1 = stateno !=102
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Backward Throw
;投げ
[State -1, Backward Throw]
type = ChangeState
value = 801
triggerall = var(59)<=0
triggerall = command = "b+y"
triggerall = (stateno != [100,102])
trigger1 = statetype = S
trigger1 = ctrl
;Neutral Throw
;投げ
[State -1, Forward Throw]
type = ChangeState
value = 800
triggerall = var(59)<=0
triggerall = command = "x+a"
triggerall = (stateno != [100,102])
trigger1 = statetype = S
trigger1 = ctrl
;--------------------------------------------------------------


;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
;立ち弱パンチ
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = var(59)<=0
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time > 6
trigger3 = (stateno = 230) && animelemtime(5) >= 0
trigger4 = var(3)
trigger4 = statetype!= A
;---------------------------------------------------------------------------
;Stand Strong Punch
;立ち強パンチ
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = var(59)<=0
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 || stateno = 230 ;jump_x or jump_a
trigger2 = movecontact && time >= 0
trigger3 = var(3)
trigger3 = statetype!= A
;---------------------------------------------------------------------------
;Stand Light Kick
;立ち弱キック
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = var(59)<=0
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && time >= 4
trigger3 = var(3)
trigger3 = statetype!= A
;---------------------------------------------------------------------------
;Low Tail Strike
;立ち強キック
[State -1, Low Tail Strike]
type = ChangeState
value = 241
triggerall = var(59)<=0
triggerall = command = "b"
triggerall = command = "holddownfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(3)
trigger2 = statetype != A
;trigger2 = stateno = 200 || stateno = 230 ;jump_x or jump_a
;trigger2 = movecontact
;---------------------------------------------------------------------------
;Standing Strong Kick
;立ち強キック
[State -1, Standing Strong Kick(Chained)]
type = ChangeState
value = 242
triggerall = var(59)<=0
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = stateno = 200 || stateno = 230 ;jump_x or jump_a
trigger1 = movecontact && time >= 0
trigger2 = stateno = 241
trigger2 = movecontact && time >= 0
trigger3 = var(3)
trigger3 = statetype!= A
;---------------------------------------------------------------------------
;Standing Strong Kick
;立ち強キック
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = var(59)<=0
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;Taunt
;挑発
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59)<=0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Rising Headbutt
;しゃがみ強パンチ
[State -1, Rising Headbutt]
type = ChangeState
value = 420
triggerall = var(59)<=0
triggerall = stateno != 420
triggerall = command = "y"
triggerall = command = "holddownfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400)
trigger2 = (time > 12) || (movecontact && time >= 0)
trigger3 = (stateno = 430)
trigger3 = (time > 12) || (movecontact && time >= 0)
trigger4 = (stateno = 200) || (stateno = 230)
trigger4 = movecontact && time >= 0
trigger5 = var(3)
trigger5 = statetype!= A
;---------------------------------------------------------------------------
;Crouching Light Attack
;しゃがみ弱パンチ
[State -1, Crouching Light Attack]
type = ChangeState
value = 400
triggerall = var(59)<=0
triggerall = command = "x" || command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C;!= A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (animelemtime(6) >= 0) || (movecontact && time >= 5)
trigger3 = var(3)
trigger3 = statetype!= A
;---------------------------------------------------------------------------
;Crouching Strong Punch
;しゃがみ強パンチ
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = var(59)<=0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C;!= A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 12) || (movecontact && time > 5)
trigger3 = var(3)
trigger3 = statetype!= A
;---------------------------------------------------------------------------
;Crouching Strong Kick
;しゃがみ強キック
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = var(59)<=0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C;!= A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 12) || (movecontact && time > 5)
trigger3 = var(3)
trigger3 = statetype!= A
;---------------------------------------------------------------------------
;Jump Light Punch
;空中弱パンチ
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = var(59)<=0
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = var(59)<=0
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || (stateno = 630||stateno = 632) ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------
;Head Stomp
[State -1, Head Stomp]
type = ChangeState
value = 631
triggerall = var(59)<=0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 1081
trigger4 = stateno = 1080 && (time >= 20)
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = var(59)<=0
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 ;jump_x or jump_a
trigger3 = movecontact
;---------------------------------------------------------------------------
;Jump Tail Slash
;空中強キック
[State -1, Jump Tail Slash]
type = ChangeState
value = 641
triggerall = var(59)<=0
triggerall = vel x > 0
triggerall = command = "holdfwd"
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || (stateno = 630||stateno = 632) ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------
;Jump Strong Kick
;空中強キック
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = var(59)<=0
;triggerall = command != "holdfwd"
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || (stateno = 630||stateno = 632) ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

