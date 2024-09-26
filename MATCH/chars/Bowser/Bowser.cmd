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
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------

[Command]
name = "QCB_ab"
command = ~D, DB, B, a+b

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b

[Command]
name = "DDD_ab"
command = ~D, D, a+b

[Command]
name = "DDD_ab"
command = D, D, a+b

;-| Special Motions |------------------------------------------------------

[Command]
name = "DD_a"
command = ~D, D, a

[Command]
name = "DD_b"
command = ~D, D, b

[Command]
name = "DD_c"
command = ~D, D, c

[Command]
name = "DP_a"
command = ~F, D, DF, a

[Command]
name = "DP_b"
command = ~F, D, DF, b

[Command]
name = "QCB_a"
command = ~D, DB, B, a

[Command]
name = "QCB_b"
command = ~D, DB, B, b

[Command]
name = "QCB_c"
command = ~D, DB, B, c

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_c"
command = ~D, DF, F, c

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
command = a
time = 1

[Command]
name = "recovery";Required (do not remove)
command = b
time = 1

[Command]
name = "recovery";Required (do not remove)
command = c
time = 1

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
command = z
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

[Command]
name = "a+b"
command = a+b
time = 1

[Command]
name = "b+c"
command = b+c
time = 1

[Command]
name = "y+z"
command = y+z
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
name = "hold_c"
command = /$c
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
;===========================================================================
[State -1, The Grand Finale]
type = ChangeState
value = 3900
triggerall = !ishelper
triggerall = command = "DDD_ab"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = roundstate = 2
triggerall = p2life <= lifemax/4
triggerall = var(21) = 0
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = (stateno = 830) && animelemtime(6) >= 0
trigger7 = (stateno = [1000,1401]) && movecontact
trigger7 = var(13) = 1
;---------------------------------------------------------------------------
[State -1, Banzai Bill]
type = ChangeState
value = 3000
triggerall = !fvar(19)
triggerall = !ishelper
triggerall = command = "QCB_ab"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = (stateno = 830) && animelemtime(6) >= 0
trigger7 = (stateno = [1000,1401]) && movecontact
trigger7 = var(13) = 1

[State -1, Shy Guy Airtub DX]
type = ChangeState
value = 3022
triggerall = fvar(19)
triggerall = !ishelper
triggerall = command = "QCB_ab"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = (stateno = 830) && animelemtime(6) >= 0
trigger7 = (stateno = [1000,1401]) && movecontact
trigger7 = var(13) = 1
;---------------------------------------------------------------------------
[State -1, Fire Breath]
type = ChangeState
value = 3050
triggerall = !fvar(19)
triggerall = !ishelper
triggerall = command = "QCF_ab"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = (stateno = 830) && animelemtime(6) >= 0
trigger7 = (stateno = [1000,1401]) && movecontact
trigger7 = var(13) = 1

[State -1, Fire Breath]
type = ChangeState
value = 3052
triggerall = !ishelper
triggerall = fvar(19)
triggerall = command = "QCF_ab"
triggerall = power >= 1000
triggerall = statetype != A
triggerall = roundstate = 2
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = (stateno = 830) && animelemtime(6) >= 0
trigger7 = (stateno = [1000,1401]) && movecontact
trigger7 = var(13) = 1
;---------------------------------------------------------------------------
[State -1, Bowser bomb]
type = ChangeState
value = 1200
triggerall = !ishelper
triggerall = command = "DP_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = stateno = 5120 && time >= 3

;---------------------------------------------------------------------------
[State -1, Air Sunrise]
type = null;ChangeState
value = 1202
triggerall = !ishelper
triggerall = command = "DP_b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 410) && movecontact && animelemtime(5) >= 0
trigger3 = (stateno = [600,611]) && movecontact

;---------------------------------------------------------------------------
[State -1, Burst of Embers]
type = null;ChangeState
value = 1000
triggerall = !ishelper
triggerall = command = "QCB_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact

;---------------------------------------------------------------------------
[State -1, Rising Fire]
type = ChangeState
value = 1010
triggerall = !ishelper
triggerall = command = "a"
trigger1 = stateno = 1001
trigger1 = movecontact

;---------------------------------------------------------------------------
[State -1, Too Hot to Handle]
type = ChangeState
value = 1015
triggerall = !ishelper
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = stateno = 1001
trigger1 = movecontact

;---------------------------------------------------------------------------
[State -1, Fire Sweep]
type = ChangeState
value = 1016
triggerall = !ishelper
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = stateno = 1001
trigger1 = movecontact

;---------------------------------------------------------------------------
[State -1, Raging Inferno]
type = ChangeState
value = 1017
triggerall = !ishelper
triggerall = command = "c"
triggerall = power >= 500
trigger1 = stateno = 1001
trigger1 = movecontact

;---------------------------------------------------------------------------
[State -1, Cold Shoulder]
type = null;ChangeState
value = 1100
triggerall = !ishelper
triggerall = command = "QCB_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact
;---------------------------------------------------------------------------
[State -1, Fireball]
type = ChangeState
value = 1300
triggerall = !ishelper
triggerall = command = "QCF_a" || command = "QCF_b"
triggerall = statetype != A
triggerall = !numhelper(1350)
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact

;---------------------------------------------------------------------------
[State -1, Air Fireball]
type = ChangeState
value = 1301
triggerall = !ishelper
triggerall = command = "QCF_a" || command = "QCF_b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,611]) && movecontact

;---------------------------------------------------------------------------

[State -1, EX Fireball]
type = ChangeState
value = 1370
triggerall = !ishelper
triggerall = command = "QCF_c"
triggerall = power >= 500
triggerall = statetype != A
triggerall = !numhelper(1350)
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact

;---------------------------------------------------------------------------
[State -1, EX Air Fireball]
type = ChangeState
value = 1371
triggerall = !ishelper
triggerall = command = "QCF_c"
triggerall = power >= 500
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,611]) && movecontact

;---------------------------------------------------------------------------

[State -1, Perfect Bombshell]
type = null;ChangeState
value = 1400
triggerall = !ishelper
triggerall = command = "QCB_c"
triggerall = power >= 500
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 420) && movecontact

;---------------------------------------------------------------------------
[State -1, Gooooooo!!!]
type = ChangeState
value = 1500
triggerall = !ishelper
triggerall = numhelper (1501)= 0 || numhelper (1503)= 0 
triggerall = command = "QCB_a" || command = "QCB_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [400,420]) && movecontact
trigger3 = (stateno = [200,201]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 810) && movecontact
trigger6 = (stateno = 202) && movecontact && animelemtime(8) >= 0
trigger7 = (stateno = 203)
trigger8 = (stateno = 819) && movecontact

;---------------------------------------------------------------------------

[State -1, Gooooooo!!!]
type = ChangeState
value = 1520
triggerall = !ishelper
triggerall = numhelper (1510)= 0
triggerall = command = "QCB_c"
triggerall = power >= 500
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [400,420]) && movecontact
trigger3 = (stateno = [200,201]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
trigger5 = (stateno = 810) && movecontact
trigger6 = (stateno = 202) && movecontact && animelemtime(8) >= 0
trigger7 = (stateno = 203)
trigger8 = (stateno = 819) && movecontact

;===========================================================================
;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !ishelper
trigger1 = command = "FF"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Back Dash]
type = ChangeState
value = 105
triggerall = !ishelper
trigger1 = command = "BB"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Ultra Burst]
type = ChangeState
value = 8050
triggerall = !ishelper
triggerall = !AIlevel
triggerall = Var(50) != 1
triggerall = command = "y+z"
triggerall = alive && Roundstate = 2
trigger1 = ctrl
trigger2 = stateno = 100

;---------------------------------------------------------------------------
[State -1, Grab]
type = ChangeState
value = 800
triggerall = !ishelper
triggerall = command = "z"
triggerall = statetype != A
triggerall = ctrl
trigger1 = stateno != 100

[State -1, Running Grab]
type = ChangeState
value = 820
triggerall = !ishelper
triggerall = command = "z"
triggerall = statetype != A
trigger1 = stateno = 100

[State -1, Air Grab]
type = ChangeState
value = 840
triggerall = !ishelper
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl



;===========================================================================
;---------------------------------------------------------------------------
[State -1, 5A]
type = ChangeState
value = 200
triggerall = !ishelper
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = 400) && Movecontact && animelem= 7

;---------------------------------------------------------------------------
[State -1, 5AA]
type = ChangeState
value = 201
triggerall = !ishelper
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = stateno = 200
trigger1 = Movecontact

;---------------------------------------------------------------------------
[State -1, 5AAA]
type = ChangeState
value = 202
triggerall = !ishelper
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = stateno = 201
trigger1 = Movecontact

;---------------------------------------------------------------------------
[State -1, 5AAAA]
type = null;ChangeState
value = 203
triggerall = !ishelper
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = stateno = 202
trigger1 = Movecontact

;---------------------------------------------------------------------------
[State -1, 5B]
type = ChangeState
value = 210
triggerall = !ishelper
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = [200,202]) && Movecontact
trigger3 = (Stateno = 400) && Movecontact

;---------------------------------------------------------------------------
[State -1, 5BB]
type = ChangeState
value = 211
triggerall = !ishelper
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = stateno = 210
trigger1 = Movecontact && animelemtime(4) >= 0

;---------------------------------------------------------------------------
[State -1, 5C]
type = ChangeState
value = 220
triggerall = !ishelper
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = [200,211]) && Movecontact
trigger3 = (Stateno = 400) && Movecontact
trigger4 = stateno = 100

;---------------------------------------------------------------------------
[State -1, 66A]
type = ChangeState
value = 240
triggerall = !ishelper
triggerall = command = "a"
trigger1 = statetype != A
trigger1 = Stateno = 100

;---------------------------------------------------------------------------
[State -1, 66B]
type = ChangeState
value = 230
triggerall = !ishelper
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = Stateno = 100

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !ishelper
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, 2A]
type = ChangeState
value = 400
triggerall = !ishelper
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = [200,201]) && Movecontact
trigger3 = (stateno = 400) && animelem= 3 && time > 7
;---------------------------------------------------------------------------
[State -1, 2B]
type = ChangeState
value = 410
triggerall = !ishelper
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact
trigger3 = (stateno = [200,202]) && movecontact
trigger4 = (stateno = [210,211]) && movecontact
;---------------------------------------------------------------------------
[State -1, 2C]
type = ChangeState
value = 420
triggerall = !ishelper
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (Stateno = [200,202]) && Movecontact
trigger3 = (Stateno = [210,211]) && Movecontact
trigger4 = (Stateno = 400) && Movecontact
trigger5 = Stateno = 100
;---------------------------------------------------------------------------
[State -1, jA]
type = ChangeState
value = 600
triggerall = !ishelper
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, jAA]
type = ChangeState
value = 601
triggerall = !ishelper
triggerall = command = "a"
trigger1 = stateno = 600
trigger1 = movecontact

;---------------------------------------------------------------------------
[State -1, jB]
type = ChangeState
value = 610
triggerall = !ishelper
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact

;---------------------------------------------------------------------------
[State -1, jBB]
type = ChangeState
value = 611
triggerall = !ishelper
triggerall = command = "b"
trigger1 = stateno = 610
trigger1 = movecontact

;---------------------------------------------------------------------------
[State -1, jC]
type = ChangeState
value = 620
triggerall = !ishelper
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 410) && movecontact && animelemtime(5) >= 0
trigger3 = (stateno = [600,611]) && movecontact

;---------------------------------------------------------------------------
[State -1, Jump Cancel]
type = ChangeState
value = 40
triggerall = !ishelper
triggerall = command = "holdup"
trigger1 = Stateno = 100
trigger2 = (Stateno = [200,202]) && Movecontact
trigger3 = (Stateno = [210,211]) && Movecontact

;---------------------------------------------------------------------------
[State -1, Air Jump]
type = ChangeState
value = 45
triggerall = !ishelper
triggerall = command = "holdup"
triggerall = statetype = A
triggerall = var(11) = 1
trigger1 = ctrl && vel y > 0
trigger2 = (stateno = [600,611]) && movecontact

;---------------------------------------------------------------------------
[State -1, Air Dash]
type = ChangeState
value = 102
triggerall = !ishelper
triggerall = command = "FF"
triggerall = statetype = A
triggerall = var(11) = 1
trigger1 = ctrl
trigger2 = (stateno = [600,611]) && movecontact

;---------------------------------------------------------------------------
[State -1, Air Dash Back]
type = ChangeState
value = 103
triggerall = !ishelper
triggerall = command = "BB"
triggerall = statetype = A
triggerall = var(11) = 1
trigger1 = ctrl
trigger2 = (stateno = [600,611]) && movecontact

;---------------------------------------------------------------------------
[State -1, backdash alternate command]
type = ChangeState
value = 105
triggerall = !ishelper
triggerall = command = "y"
triggerall = command = "holdback"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 5120 && time >= 3

;---------------------------------------------------------------------------
[State -1, Dodge]
type = ChangeState
value = 160
triggerall = !ishelper
triggerall = command = "y"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Forward Dodge]
type = ChangeState
value = 161
triggerall = !ishelper
triggerall = command = "y"
triggerall = command != "holdback"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100
trigger3 = stateno = 5120 && time >= 3

;---------------------------------------------------------------------------
[State -1, Air Dodge]
type = ChangeState
value = 162
triggerall = !ishelper
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Roman Cancel]
type = ChangeState
value = 6060
triggerall = !ishelper
triggerall =  movetype != H
triggerall = statetype != A
triggerall = command = "x" && power >= 1000
triggerall = stateno != 8000
triggerall = !ctrl
trigger1 = movecontact
trigger2 = stateno = 621
trigger2 = var(7) = 1
trigger3 = stateno = 1300 && animelemtime(7) > 0
trigger3 = helper(1350),var(1)=1
trigger4 = stateno = 1370 && animelemtime(7) > 0
trigger4 = helper(1380),var(1)=1

;---------------------------------------------------------------------------
[State -1, Air Roman Cancel]
type = ChangeState
value = 6061
triggerall = !ishelper
triggerall =  movetype != H
triggerall = statetype = A
triggerall = command = "x" && power >= 1000
triggerall = stateno != 8000
triggerall = !ctrl
trigger1 = movecontact
trigger2 = stateno = 1301 && animelemtime(7) > 0
trigger2 = helper(1350),var(1)=1
trigger3 = stateno = 1371 && animelemtime(7) > 0 && (var(5) < 2)
trigger3 = helper(1380),var(1)=1
trigger4 = stateno = 1371 && animelemtime(7) > 0 && (var(5) >= 2)
trigger4 = helper(1385),var(1)=1

;---------------------------------------------------------------------------
[State -1, Force Roman Cancel]
type = ChangeState
value = 6060
triggerall = !ishelper
triggerall =  movetype != H
triggerall = statetype != A
triggerall = command = "x" && power >= 500
triggerall = !ctrl
triggerall = movecontact
triggerall = stateno != 8000
trigger1 = stateno = 3000
trigger2 = stateno = 3050
trigger3 = stateno = 3051
trigger4 = stateno = 3052

;---------------------------------------------------------------------------
[State -1, Guard Cancel]
type = ChangeState
value = 203
triggerall = !ishelper
triggerall = statetype != A
trigger1 = command = "x" || command = "b+c"
trigger1 = command = "holdfwd"
trigger1 = power >= 1000
trigger1 = StateNo = 150 || StateNo = 152 || StateNo = 151 || StateNo = 153

;---------------------------------------------------------------------------
[State -1, Burst]
type = ChangeState
value = 8000
triggerall = !ishelper
triggerall = !AIlevel
triggerall = Var(50) != 1
triggerall = command = "y+z"
triggerall = alive && Roundstate = 2
triggerall = movetype = H
triggerall = enemy,hitdefattr != SCA,HA,HP,AT
triggerall = enemy,stateno != [120,155]
triggerall = enemy,stateno != [800,899]
triggerall = enemy,stateno != [3000,4999]
trigger1 = !ctrl
trigger2 = numenemy
trigger2 = enemy,movehit && p2stateno != [3000,4999]
trigger3 = enemy,numhelper
trigger3 = movetype = H && p2stateno != [3000,4999]
trigger4 = numenemy
trigger4 = enemy,movehit && p2stateno != [800,899]


