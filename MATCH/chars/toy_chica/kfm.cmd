; The CMD file.

;EPIC FIGHT FILES SYSTEM ...............
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;AUTHOR BY MEGAX
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
;AUTHOR BY MEGAX
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
;               command = x+y+z;AUTHOR BY MEGAX  ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                      ;AUTHOR BY MEGAXor released any other keys in between
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
;   Time that the command will be buffered ;AUTHOR BY MEGAXfor. If the command is done
;   successfully, then ;AUTHOR BY MEGAXit will be valid for this time. The simplest
;   case i;AUTHOR BY MEGAXs to set this to 1. That means that the command is valid
;   only in the;AUTHOR BY MEGAX same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier ;AUTHOR BY MEGAXto do because you can perform
;   the command ;AUTHOR BY MEGAXearly. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's ;AUTHOR BY MEGAXlight punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allo;AUTHOR BY MEGAXw multiple motions for the same move.
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


;EPIC FIGHT FILES SISTEM ...............
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


;EPIC FIGHT FILES SISTEM ...............
;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
[Command]
name = "TripleKFPalm2"
command = ~D, DF, F, D, DF, F, x+y
time = 20

[Command]
name = "TripleKFPalm"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, D, DF, F, y
time = 20


[Command]
name = "SmashKFUpper2"
command = ~D, DB, B, D, DB, B, x+y
time = 30

[Command]
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x;~D, DB, B, D, DB, B, Y
time = 30

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, D, DB, B, y;~F, D, DF, F, D, DF, y
time = 20

[Command]
name = "Dragon_Cannon"
command = ~D,DF,F, a+b
Time = 30
;---------------------------------------------------------------------------
[Command]
name = "jump"    
command = ~$D,$U
time = 8

;---------------------------------------------------------------------------
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
time = 20

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "atack_dustEX"
command = ~D,DB,B, a+b

[Command]
name = "atack_dust"
command = ~D,DB,B, a

[Command]
name = "atack_dust2"
command = ~D,DB,B, b

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y
time = 30

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
command = x
time = 1

[Command]
name = "recovery";Required (do not remove)
command = y
time = 1
[Command]
name = "recovery";Required (do not remove)
command = a
time = 1
[Command]
name = "recovery";Required (do not remove)
command = b
time = 1

[Command]
name = "‚Ó‚Á”ò‚Î‚µ"
command = c
time = 1

[Command]
name = "‚Ó‚Á”ò‚Î‚µ"
command = y+b
time = 1

[Command]
name = "‹Ù‹}‰ñ”ð‘O"
command = z
time= 1


[Command]
name = "‹Ù‹}‰ñ”ðŒã"
command = /$B,z
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

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "holdx";Required (do not remove)
command = /x
time = 1

[Command]
name = "holdy";Required (do not remove)
command = /y
time = 1

[Command]
name = "holdz";Required (do not remove)
command = /z
time = 1

[Command]
name = "holda";Required (do not remove)
command = /a
time = 1

[Command]
name = "holdb";Required (do not remove)
command = /b
time = 1

[Command]
name = "holdc";Required (do not remove)
command = /c
time = 1

[Command]
name = "hold_s";Required (do not remove)
command = /s
time = 1


;EPIC FIGHT FILES SYSTEM ...............
;---------------------------------------------------------------------------
[Statedef -1]

[State -1, AI Guard]
type = ChangeState
triggerall = var(59) = 1
triggerall = ctrl
triggerAll = stateno != [120,140]
trigger1 = inguarddist ||enemy,numproj||enemy(numenemy>1),numproj
trigger1 = enemynear, MoveGuarded = 0
value = 120


;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3090
triggerall = command = "SmashKFUpper2"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3117
triggerall = command = "TripleKFPalm2"
triggerall = power >= 2000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 1100 && movecontact
trigger8 = stateno = 1110 && movecontact
trigger9 = stateno = 1120 && movecontact
trigger10 = stateno =1020 && movecontact
;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 1100 && movecontact
trigger8 = stateno = 1110 && movecontact
trigger9 = stateno = 1120 && movecontact
trigger10 = stateno =1020 && movecontact
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = command = "SmashKFUpper"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3050,3100)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for sweep kick
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
var(1) = 1



;---------------------------------------------------------------------------
;
[State -1,upper metal ex]
type = ChangeState
value = 1120
triggerall = command = "upper_xy"
triggerall = power >= 1000
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact
trigger6= stateno = 230 && movecontact
trigger7= stateno = 240 && movecontact
trigger8= stateno = 430 && movecontact
trigger9= stateno = 440 && movecontact

;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1020
triggerall = command = "QCF_xy"
triggerall = power >= 1000
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact
trigger6= stateno = 230 && movecontact
trigger7= stateno = 240 && movecontact
trigger8= stateno = 430 && movecontact
trigger9= stateno = 440 && movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Upper
[State -1, Strong Kung Fu Upper]
type = ChangeState
value = 1110
triggerall = command = "upper_y"
trigger1 = var(1) ;Use combo condition (above)

;-----------------------------------------------------------------------------
;Light Kung Fu Upper
[State -1, Light Kung Fu Upper]
type = ChangeState
value = 1100
triggerall = command = "upper_x"
trigger1 = var(1) ;Use combo condition (above)


;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "QCF_x"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact
;---------------------------------------------------------------------------
;ƒK[ƒhƒLƒƒƒ“ƒZƒ‹‚Ó‚Á”ò‚Î‚µUŒ‚
[State -1, 290]
type = ChangeState
value = 291
triggerall = command = "‚Ó‚Á”ò‚Î‚µ"
triggerall = power >= 500
trigger1 = stateno = 150
trigger2 = stateno = 151

;---------------------------------------------------------------------------
;‚Ó‚Á”ò‚Î‚µUŒ‚
[State -1, 290]
type = ChangeState
value = 290
triggerall = command = "‚Ó‚Á”ò‚Î‚µ"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;‹ó’†‚Ó‚Á”ò‚Î‚µUŒ‚
[State -1, Jump Strong Kick]
type = ChangeState
value = 690
triggerall = command = "‚Ó‚Á”ò‚Î‚µ"
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl
;---------------------------------------------------------------------------
;‹Ù‹}‰ñ”ðŒã
[State -1, Taunt]
type = ChangeState
value = 710
triggerall = command = "‹Ù‹}‰ñ”ðŒã"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;ƒK[ƒhƒLƒƒƒ“ƒZƒ‹‹Ù‹}‰ñ”ðŒã
[State -1, 701]
type = ChangeState
value = 710
triggerall = command = "‹Ù‹}‰ñ”ðŒã"
triggerall = power >= 1000
trigger1 = stateno = 150
trigger2 = stateno = 151
;---------------------------------------------------------------------------
;‹Ù‹}‰ñ”ð‘O
[State -1, Taunt]
type = ChangeState
value = 700
triggerall = command = "‹Ù‹}‰ñ”ð‘O"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;ƒK[ƒhƒLƒƒƒ“ƒZƒ‹‹Ù‹}‰ñ”ð‘O
[State -1, 700]
type = ChangeState
value = 700
triggerall = command = "‹Ù‹}‰ñ”ð‘O"
triggerall = power >= 1000
trigger1 = stateno = 150
trigger2 = stateno = 151
;---------------------------------------------------------------------------
;ƒNƒCƒbƒN‘O“]
[State -1, 700]
type = ChangeState
value = 700
triggerall = command = "‹Ù‹}‰ñ”ð‘O"
triggerall = power >= 1000
trigger1 = stateno = [200,499]
trigger1 = movecontact
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 3502
triggerall = command = "atack_dustEX"
triggerall = power >= 1000
trigger1 = ctrl = 1
trigger2 = var(1) ;Use combo condition (above)
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5= stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7= stateno = 230 && movecontact
trigger8= stateno = 240 && movecontact
trigger9= stateno = 430 && movecontact
trigger10= stateno = 440 && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 3501
triggerall = command = "atack_dust2"
triggerall = roundstate<=2
trigger1 = ctrl = 1
trigger2 = var(1) ;Use combo condition (above)
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5= stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7= stateno = 230 && movecontact
trigger8= stateno = 240 && movecontact
trigger9= stateno = 430 && movecontact
trigger10= stateno = 440 && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 3500
triggerall = command = "atack_dust"
triggerall = roundstate<=2
trigger1 = ctrl = 1
trigger2 = var(1) ;Use combo condition (above)
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5= stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7= stateno = 230 && movecontact
trigger8= stateno = 240 && movecontact
trigger9= stateno = 430 && movecontact
trigger10= stateno = 440 && movecontact



;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1010
triggerall = command = "QCF_y"
trigger1 = var(1) ;Use combo condition (above)
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact


;---------------------------------------------------------------------------
;Power Charge
[State -1, Powah power]
type = ChangeState
value = 8000
triggerall = roundstate<=2
triggerall = !var(52)||Var(52) && !var(11)
triggerall = Power != Powermax
triggerall = command = "holdy" && command = "holda"
triggerall = !numhelper(3111)
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------

;Fast Kung Fu Blow (1/3 super bar)
[State -1, Fast Kung Fu Blow]
type = ChangeState
value = 1220
triggerall = command = "QCB_xy"
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 215 && movecontact
trigger7 = stateno = 245 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && animelem = 5,>=0
trigger10= stateno = 250 && movecontact
trigger11= stateno = 251 && movecontact
trigger12= stateno = 261 && movecontact

;HD’Êí‹Z–³ðŒƒLƒƒƒ“ƒZƒ‹
trigger26= stateno = [200,499]
trigger26= movecontact
trigger26= var(21) > 0

;---------------------------------------------------------------------------
;Light Kung Fu Blow
[State -1, Light Kung Fu Blow]
type = ChangeState
value = 1300
triggerall = command = "QCB_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 215 && movecontact
trigger7 = stateno = 245 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && animelem = 5,>=0
trigger10= stateno = 250 && movecontact
trigger11= stateno = 251 && movecontact
trigger12= stateno = 261 && movecontact
trigger13= stateno = 290 && animelem = 7,>=0

;ƒhƒ‰ƒCƒuƒLƒƒƒ“ƒZƒ‹
trigger14= stateno = 1000 && movehit
trigger14= var(20) >= 500
trigger14= var(21) = 0
trigger15= stateno = 1050 && movehit
trigger15= var(20) >= 500
trigger15= var(21) = 0
trigger16= stateno = 1100 && movehit
trigger16= var(20) >= 500
trigger16= var(21) = 0
trigger17= stateno = 1150 && movehit
trigger17= var(20) >= 500
trigger17= var(21) = 0
trigger18= stateno = 1210 && movehit
trigger18= var(20) >= 500
trigger18= var(21) = 0
trigger19= stateno = 1260 && movehit
trigger19= var(20) >= 500
trigger19= var(21) = 0

;HDƒLƒƒƒ“ƒZƒ‹
trigger20= stateno = 1000 && movecontact
trigger20= var(21) > 0
trigger21= stateno = 1050 && movecontact
trigger21= var(21) > 0
trigger22= stateno = 1100 && movecontact
trigger22= var(21) > 0
trigger23= stateno = 1150 && movecontact
trigger23= var(21) > 0
trigger24= stateno = 1210 && movecontact
trigger24= var(21) > 0
trigger25= stateno = 1260 && movecontact
trigger25= var(21) > 0

;HD’Êí‹Z–³ðŒƒLƒƒƒ“ƒZƒ‹
trigger26= stateno = [200,499]
trigger26= movecontact
trigger26= var(21) > 0


;---------------------------------------------------------------------------
;Strong Kung Fu Blow
[State -1, Strong Kung Fu Blow]
type = ChangeState
value = 1300
triggerall = command = "QCB_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 235 && movecontact
trigger5 = stateno = 210 && movecontact
trigger6 = stateno = 215 && movecontact
trigger7 = stateno = 245 && movecontact
trigger8 = stateno = 400 && movecontact
trigger9 = stateno = 410 && animelem = 5,>=0
trigger10= stateno = 250 && movecontact
trigger11= stateno = 251 && movecontact
trigger12= stateno = 261 && movecontact
trigger13= stateno = 290 && animelem = 7,>=0

;ƒhƒ‰ƒCƒuƒLƒƒƒ“ƒZƒ‹
trigger14= stateno = 1000 && movehit
trigger14= var(20) >= 500
trigger14= var(21) = 0
trigger15= stateno = 1050 && movehit
trigger15= var(20) >= 500
trigger15= var(21) = 0
trigger16= stateno = 1100 && movehit
trigger16= var(20) >= 500
trigger16= var(21) = 0
trigger17= stateno = 1150 && movehit
trigger17= var(20) >= 500
trigger17= var(21) = 0
trigger18= stateno = 1210 && movehit
trigger18= var(20) >= 500
trigger18= var(21) = 0
trigger19= stateno = 1260 && movehit
trigger19= var(20) >= 500
trigger19= var(21) = 0

;HDƒLƒƒƒ“ƒZƒ‹
trigger20= stateno = 1000 && movecontact
trigger20= var(21) > 0
trigger21= stateno = 1050 && movecontact
trigger21= var(21) > 0
trigger22= stateno = 1100 && movecontact
trigger22= var(21) > 0
trigger23= stateno = 1150 && movecontact
trigger23= var(21) > 0
trigger24= stateno = 1210 && movecontact
trigger24= var(21) > 0
trigger25= stateno = 1260 && movecontact
trigger25= var(21) > 0

;HD’Êí‹Z–³ðŒƒLƒƒƒ“ƒZƒ‹
trigger26= stateno = [200,499]
trigger26= movecontact
trigger26= var(21) > 0



;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Throw
[State -1,Throw]
type = ChangeState
value = 800
triggerall = var(59) = 0
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------
;Throw2
[State -1,Throw]
type = ChangeState
value = 830
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H



;===========================================================================


;===========================================================================
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = time > 6

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Drsgon_Cannon
[State -1, Dragon_Cannon]
type = ChangeState
value = 2500
triggerall = command = "Dragon_Cannon" && power >= 4000
trigger1 = ctrl
trigger1 = statetype = S

;---------------------------------------------------------------------------
;Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact

;---------------------------------------------------------------------------
;Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact

;-----------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = statetime >= 7
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630 ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 


;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 


;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 


;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 






;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 






















;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 

















;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 
















;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x"  

;author = "mega_x" 