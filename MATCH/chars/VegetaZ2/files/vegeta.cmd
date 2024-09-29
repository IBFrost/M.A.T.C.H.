
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

;-| Hyper Motions |--------------------------------------------------------

[Command]
name = "qcbf_K"
command = ~D, $B, F, a
time = 20
[Command]
name = "qcbf_K"
command = ~D, $B, F, ~a
time = 20
[Command]
name = "qcbf_K"
command = ~D, $B, F, b
time = 20
[Command]
name = "qcbf_K"
command = ~D, $B, F, ~b
time = 20
[Command]
name = "qcbf_K"
command = ~D, $B, F, c
time = 20
[Command]
name = "qcbf_K"
command = ~D, $B, F, ~c
time = 20

[Command]
name = "qcbhcf_K"
command = ~D, DB, B, D, F, a
time = 30
[Command]
name = "qcbhcf_K"
command = ~D, DB, B, D, F, ~a
time = 30
[Command]
name = "qcbhcf_K"
command = ~D, DB, B, D, F, b
time = 30
[Command]
name = "qcbhcf_K"
command = ~D, DB, B, D, F, ~b
time = 30
[Command]
name = "qcbhcf_K"
command = ~D, DB, B, D, F, c
time = 30
[Command]
name = "qcbhcf_K"
command = ~D, DB, B, D, F, ~c
time = 30

[Command]
name = "qcfhcb_K"
command = ~D, F, D, B, a
time = 30
[Command]
name = "qcfhcb_K"
command = ~D, F, D, B, ~a
time = 30
[Command]
name = "qcfhcb_K"
command = ~D, F, D, B, b
time = 30
[Command]
name = "qcfhcb_K"
command = ~D, F, D, B, ~b
time = 30
[Command]
name = "qcfhcb_K"
command = ~D, F, D, B, c
time = 30
[Command]
name = "qcfhcb_K"
command = ~D, F, D, B, ~c
time = 30

[Command]
name = "qcfhcb_P"
command = ~D, DF, F, D, B, x
time = 30
[Command]
name = "qcfhcb_P"
command = ~D, DF, F, D, B, ~x
time = 30
[Command]
name = "qcfhcb_P"
command = ~D, DF, F, D, B, y
time = 30
[Command]
name = "qcfhcb_P"
command = ~D, DF, F, D, B, ~y
time = 30
[Command]
name = "qcfhcb_P"
command = ~D, DF, F, D, B, z
time = 30
[Command]
name = "qcfhcb_P"
command = ~D, DF, F, D, B, ~z
time = 30

[Command]
name = "2qcf2p"
command = ~D, DF, F, D, DF, x+y
time = 20
[Command]
name = "2qcf2p"
command = ~D, DF, F, D, DF, x+z
time = 20
[Command]
name = "2qcf2p"
command = ~D, DF, F, D, DF, y+z
time = 20

[Command]
name = "2qcf2k"
command = ~D, DF, F, D, DF, a+b
time = 20
[Command]
name = "2qcf2k"
command = ~D, DF, F, D, DF, a+c
time = 20
[Command]
name = "2qcf2k"
command = ~D, DF, F, D, DF, b+c
time = 20

[Command]
name = "qcbf3p"
command = ~D, $B, F, x+y+z
time = 20

[Command]
name = "qcbf2p"
command = ~D, $B, F, x+y
time = 20
[Command]
name = "qcbf2p"
command = ~D, $B, F, x+z
time = 20
[Command]
name = "qcbf2p"
command = ~D, $B, F, y+z
time = 20

[Command]
name = "rage"
command = D, D, D, y+b
time = 30


;-| Super Motions |--------------------------------------------------------

[Command]
name = "qcbfx"
command = ~D, $B, F, x
time = 20
[Command]
name = "qcbfx"
command = ~D, $B, F, ~x
time = 20
[Command]
name = "qcbfy"
command = ~D, $B, F, y
time = 20
[Command]
name = "qcbfy"
command = ~D, $B, F, ~y
time = 20
[Command]
name = "qcbfz"
command = ~D, $B, F, z
time = 20
[Command]
name = "qcbfz"
command = ~D, $B, F, ~z
time = 20

[Command]
name = "2qcfx"
command = ~D, DF, F, D, DF, x
time = 20
[Command]
name = "2qcfx"
command = ~D, DF, F, D, DF, ~x
time = 20
[Command]
name = "2qcfy"
command = ~D, DF, F, D, DF, y
time = 20
[Command]
name = "2qcfy"
command = ~D, DF, F, D, DF, ~y
time = 20
[Command]
name = "2qcfz"
command = ~D, DF, F, D, DF, z
time = 20
[Command]
name = "2qcfz"
command = ~D, DF, F, D, DF, ~z
time = 20

[Command]
name = "2qcbx"
command = ~D, DB, B, D, DB, x
time = 20
[Command]
name = "2qcbx"
command = ~D, DB, B, D, DB, ~x
time = 20
[Command]
name = "2qcby"
command = ~D, DB, B, D, DB, y
time = 20
[Command]
name = "2qcby"
command = ~D, DB, B, D, DB, ~y
time = 20
[Command]
name = "2qcbz"
command = ~D, DB, B, D, DB, z
time = 20
[Command]
name = "2qcbz"
command = ~D, DB, B, D, DB, ~z
time = 20

[Command]
name = "2qcfa"
command = ~D, DF, F, D, DF, a
time = 20
[Command]
name = "2qcfa"
command = ~D, DF, F, D, DF, ~a
time = 20
[Command]
name = "2qcfb"
command = ~D, DF, F, D, DF, b
time = 20
[Command]
name = "2qcfb"
command = ~D, DF, F, D, DF, ~b
time = 20
[Command]
name = "2qcfc"
command = ~D, DF, F, D, DF, c
time = 20
[Command]
name = "2qcfc"
command = ~D, DF, F, D, DF, ~c
time = 20

[Command]
name = "2qcba"
command = ~D, DB, B, D, DB, a
time = 20
[Command]
name = "2qcba"
command = ~D, DB, B, D, DB, ~a
time = 20
[Command]
name = "2qcbb"
command = ~D, DB, B, D, DB, b
time = 20
[Command]
name = "2qcbb"
command = ~D, DB, B, D, DB, ~b
time = 20
[Command]
name = "2qcbc"
command = ~D, DB, B, D, DB, c
time = 20
[Command]
name = "2qcbc"
command = ~D, DB, B, D, DB, ~c
time = 20

;-| EX Motions |------------------------------------------------------

[Command]
name = "dp2k"
command = ~F, D, DF, a+b
[Command]
name = "dp2k"
command = ~F, D, DF, a+c
[Command]
name = "dp2k"
command = ~F, D, DF, b+c

[Command]
name = "qcf2p"
command = ~D, DF, F, x+y
[Command]
name = "qcf2p"
command = ~D, DF, F, x+z
[Command]
name = "qcf2p"
command = ~D, DF, F, y+z

[Command]
name = "qcf2k"
command = ~D, DF, F, a+b
[Command]
name = "qcf2k"
command = ~D, DF, F, a+c
[Command]
name = "qcf2k"
command = ~D, DF, F, b+c

[Command]
name = "qcb2p"
command = ~D, DB, B, x+y
[Command]
name = "qcb2p"
command = ~D, DB, B, x+z
[Command]
name = "qcb2p"
command = ~D, DB, B, y+z

[Command]
name = "qcb2k"
command = ~D, DB, B, a+b
[Command]
name = "qcb2k"
command = ~D, DB, B, a+c
[Command]
name = "qcb2k"
command = ~D, DB, B, b+c

[Command]
name = "dp2k"
command = ~F, D, DF, a+b
[Command]
name = "dp2k"
command = ~F, D, DF, a+c
[Command]
name = "dp2k"
command = ~F, D, DF, b+c

;-| Special Motions |------------------------------------------------------

[Command]
name = "fbfx"
command = ~F, B, F, x
[Command]
name = "fbfx"
command = ~F, B, F, ~x
[Command]
name = "fbfy"
command = ~F, B, F, y
[Command]
name = "fbfy"
command = ~F, B, F, ~y
[Command]
name = "fbfz"
command = ~F, B, F, z
[Command]
name = "fbfz"
command = ~F, B, F, ~z

[Command]
name = "qcfx"
command = ~D, DF, F, x
[Command]
name = "qcfx"
command = ~D, DF, F, ~x
[Command]
name = "qcfy"
command = ~D, DF, F, y
[Command]
name = "qcfy"
command = ~D, DF, F, ~y
[Command]
name = "qcfz"
command = ~D, DF, F, z
[Command]
name = "qcfz"
command = ~D, DF, F, ~z

[Command]
name = "qcfa"
command = ~D, DF, F, a
[Command]
name = "qcfa"
command = ~D, DF, F, ~a
[Command]
name = "qcfb"
command = ~D, DF, F, b
[Command]
name = "qcfb"
command = ~D, DF, F, ~b
[Command]
name = "qcfc"
command = ~D, DF, F, c
[Command]
name = "qcfc"
command = ~D, DF, F, ~c

[Command]
name = "qcbx"
command = ~D, DB, B, x
[Command]
name = "qcbx"
command = ~D, DB, B, ~x
[Command]
name = "qcby"
command = ~D, DB, B, y
[Command]
name = "qcby"
command = ~D, DB, B, ~y
[Command]
name = "qcbz"
command = ~D, DB, B, z
[Command]
name = "qcbz"
command = ~D, DB, B, ~z

[Command]
name = "qcba"
command = ~D, DB, B, a
[Command]
name = "qcba"
command = ~D, DB, B, ~a
[Command]
name = "qcbb"
command = ~D, DB, B, b
[Command]
name = "qcbb"
command = ~D, DB, B, ~b
[Command]
name = "qcbc"
command = ~D, DB, B, c
[Command]
name = "qcbc"
command = ~D, DB, B, ~c

[Command]
name = "dpa"
command = ~F, D, DF, a
[Command]
name = "dpa"
command = ~F, D, DF, ~a
[Command]
name = "dpb"
command = ~F, D, DF, b
[Command]
name = "dpb"
command = ~F, D, DF, ~b
[Command]
name = "dpc"
command = ~F, D, DF, c
[Command]
name = "dpc"
command = ~F, D, DF, ~c

[Command]
name = "dpx"
command = ~F, D, DF, x
[Command]
name = "dpx"
command = ~F, D, DF, ~x
[Command]
name = "dpy"
command = ~F, D, DF, y
[Command]
name = "dpy"
command = ~F, D, DF, ~y
[Command]
name = "dpz"
command = ~F, D, DF, z
[Command]
name = "dpz"
command = ~F, D, DF, ~z

[Command]
name = "rdpx"
command = ~B, DB, D, x
[Command]
name = "rdpx"
command = ~B, DB, D, ~x
[Command]
name = "rdpy"
command = ~B, DB, D, y
[Command]
name = "rdpy"
command = ~B, DB, D, ~y
[Command]
name = "rdpz"
command = ~B, DB, D, z
[Command]
name = "rdpz"
command = ~B, DB, D, ~z

[Command]
name = "rdpa"
command = ~B, DB, D, a
[Command]
name = "rdpa"
command = ~B, DB, D, ~a
[Command]
name = "rdpb"
command = ~B, DB, D, b
[Command]
name = "rdpb"
command = ~B, DB, D, ~b
[Command]
name = "rdpc"
command = ~B, DB, D, c
[Command]
name = "rdpc"
command = ~B, DB, D, ~c

[Command]
name = "f2p"
command = $F, x+y
;time = 1
[Command]
name = "f2p"
command = $F, x+z
;time = 1
[Command]
name = "f2p"
command = $F, y+z
;time = 1

[Command]
name = "f2k"
command = $F, a+b
;time = 1
[Command]
name = "f2k"
command = $F, a+c
;time = 1
[Command]
name = "f2k"
command = $F, b+c
;time = 1

[Command]
name = "BBz"
command = B, B, z
time = 10


;-| Dir + Button |-----------------------------------------------------------
[Command]
name = "Fc"
command = F, c
time = 1

;-| Double Tap button |-----------------------------------------------------------
[Command]
name = "FFc"
command = F, F, c
time = 15

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
name = "superjump"     ;Required (do not remove)
command = $D, U
time = 10

[Command]
name = "superjumpforward"     ;Required (do not remove)
command = $D, UF
time = 10

[Command]
name = "superjumpbackward"     ;Required (do not remove)
command = $D, UB
time = 10

[Command]
name = "tripleS"
command = s,s,s
time = 20

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
command = z
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
name = "recovery";Required (do not remove)
command = c
time = 1

[Command]
name = "xa"
command = x+a
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

[Command]
name = "down_y"
command = /$D,y
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

[Command]
name = "lp_lk"
command = x+a
time = 10

[Command]
name = "F"
command = F
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
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holdup";Required (do not remove)
command = /$U
time = 1

;===================< DIR >===================

[Command]
name = "fwd"
command = F
time = 1
[Command]
name = "back"
command = B
time = 1
[Command]
name = "up"
command = U
time = 1
[Command]
name = "down"
command = D
time = 1

;-| Hold Button |--------------------------------------------------------
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





[Statedef -1]

;--------------------------------------------------------------------------
[State -1, AI Helper]
type=changestate
trigger1= ishelper(9741)
value=9741

;===========================================================================
; HYPERS
;===========================================================================

;Air Galactic Gunfire (Rage Mode)
[State -1, air GG]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)>0
triggerall = (command = "2qcfa") || (command = "2qcfb") || (command = "2qcfc")
triggerall = statetype = A  && !WinKo
triggerall = power >= 1000 && var(33) >= 700
triggerall = stateno != 2803
trigger1 = stateno=1501 && movecontact=[1,30]
trigger2 = stateno=1551 && movecontact=[1,30]
value = 2803

;Galactic Gunfire (Rage Mode)
[State -1, GG]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)>0
triggerall = (command = "2qcfa") || (command = "2qcfb") || (command = "2qcfc")
triggerall = statetype != A  && !WinKo
triggerall = power >= 1000 && var(33) >= 700
triggerall = stateno != 2800
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger8 = stateno=1050 && AnimElemTime(3)>=0
value = 2800

;Galactic Gunfire (Normal)
[State -1, GG]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = (command = "2qcfa") || (command = "2qcfb") || (command = "2qcfc")
triggerall = statetype != A  && !WinKo
triggerall = power >= 3000
triggerall = stateno != 2600
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
value = 2600

;Final Flash
[State -1, Final Flash]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode	
triggerall = (command = "2qcbx") || (command = "2qcby") || (command = "2qcbz")
triggerall = statetype != A  && !WinKo
triggerall = power >= 3000 && stateno != 2500
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
value = 2500

;Bakuhatsuha Lv3
[State -1, Bakuhatsuha Lv3]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = command = "qcbf3p"
triggerall = statetype != A  && !WinKo
triggerall = power >= 3000 && stateno != 2340
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger8 = stateno=1120 && movecontact		;Wolvie Dash Elbow
value = 2340

;Air Bakuhatsuha Lv3
[State -1, Air Bakuhatsuha Lv3]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = command = "qcbf3p"
triggerall = statetype = A  && !WinKo
triggerall = power >= 3000 && stateno != 2350
trigger1 = Ctrl
trigger2 = (StateNo = 600) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620)
trigger2 = MoveContact
trigger3 = (StateNo = 630) || (StateNo = 640) || (StateNo = 650)
trigger3 = MoveContact
value = 2350

;===========================================================================
; SUPERS LV.2
;===========================================================================

;Chou Galick Ho
[State -1, Chou Galick Ho]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = command = "2qcf2p"
triggerall = statetype != A  && !WinKo
triggerall = power >= 2000 && stateno != 2400
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger8 = stateno=1050 && AnimElemTime(3)>=0
trigger9 = stateno=1120 && MoveContact		;Wolvie Dash Elbow
value = 2400

;Air Chou Galick Ho
[State -1, Air Chou Galick Ho]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = command = "2qcf2p"
triggerall = statetype = A  && !WinKo
triggerall = power >= 2000 && stateno != 2450
trigger1 = Ctrl
trigger2 = (StateNo = 600) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620)
trigger2 = MoveContact
trigger3 = (StateNo = 630) || (StateNo = 640) || (StateNo = 650)
trigger3 = MoveContact
trigger4 = numhelper(2102)
trigger4 = helper(2102),movecontact			;Air Galick Ho
value = 2450

;Bakuhatsuha Lv2
[State -1, Bakuhatsuha Lv2]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = command = "qcbf2p"
triggerall = statetype != A  && !WinKo
triggerall = power >= 2000 && stateno != 2320
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger8 = stateno=1050 && AnimElemTime(3)>=0
trigger9 = stateno=1120 && movecontact		;Wolvie Dash Elbow
value = 2320

;Air Bakuhatsuha Lv2
[State -1, Air Bakuhatsuha Lv2]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = command = "qcbf2p"
triggerall = statetype = A  && !WinKo
triggerall = power >= 2000 && stateno != 2330
trigger1 = Ctrl
trigger2 = (StateNo = 600) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620)
trigger2 = MoveContact
trigger3 = (StateNo = 630) || (StateNo = 640) || (StateNo = 650)
trigger3 = MoveContact
value = 2330

; Rage Mode
[State -1]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = command = "rage"
triggerall = statetype != A  && !WinKo
triggerall = power >= 2000 && stateno != 2700
trigger1 = Ctrl
trigger2 = stateno=900
value = 2700

;===========================================================================
; SUPERS LV.1
;===========================================================================

;Galick Ho
[State -1, Galick Ho]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = (command = "2qcfx") || (command = "2qcfy") || (command = "2qcfz")
triggerall = statetype != A  && !WinKo
triggerall = (power >= 1000 || var(32)>0) && stateno != 2000
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger8 = stateno=1050 && AnimElemTime(3)>=0
trigger9 = stateno=1120 && MoveContact		;Wolvie Dash Elbow
value = 2000

;Air Galick Ho
[State -1, Air Galick Ho]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = (command = "2qcfx") || (command = "2qcfy") || (command = "2qcfz")
triggerall = statetype = A  && !WinKo
triggerall = (power >= 1000 || var(32)>0) && stateno != 2100
trigger1 = Ctrl
trigger2 = (StateNo = 600) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620)
trigger2 = MoveContact
trigger3 = (StateNo = 630) || (StateNo = 640) || (StateNo = 650)
trigger3 = MoveContact
value = 2100

;Bakuhatsuha
[State -1, Bakuhatsuha]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
;triggerall = (command = "2qcbx") || (command = "2qcby") || (command = "2qcbz")
triggerall = (command = "qcbfx") || (command = "qcbfy") || (command = "qcbfz")
triggerall = statetype != A  && !WinKo
triggerall = (power >= 1000 || var(32)>0) && stateno != 2300
trigger1 = Ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno = 1300 && movecontact  ;Slash Chop
trigger4 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger5 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger6 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger7 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger8 = stateno=1050 && AnimElemTime(3)>=0
trigger9 = stateno=1120 && movecontact		;Wolvie Dash Elbow
value = 2300

;Air Bakuhatsuha
[State -1, Air Bakuhatsuha]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = (command = "qcbfx") || (command = "qcbfy") || (command = "qcbfz")
triggerall = statetype = A  && !WinKo
triggerall = (power >= 1000 || var(32)>0) && stateno != 2310
trigger1 = Ctrl
trigger2 = (StateNo = 600) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620)
trigger2 = MoveContact
trigger3 = (StateNo = 630) || (StateNo = 640) || (StateNo = 650)
trigger3 = MoveContact
value = 2310


;===========================================================================
; AIR SPECIALS
;===========================================================================

;Air EX Machine Gun Temper (only in Rage Mode)
[State -1, Air EX Machine Gun Temper]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcb2p"
triggerall = statetype=A && !WinKo
triggerall = var(32)>0
triggerall = pos Y < -60
trigger1 = ctrl
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620) || (StateNo = 640)
trigger2 = movecontact
value = 1730

;Air Machine Gun Temper (Light)
[State -1, Air Machine Gun Temper (Light)]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcbx"
triggerall = statetype=A && !WinKo
triggerall = pos Y < -60
trigger1 = ctrl
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620) || (StateNo = 640)
trigger2 = movecontact
value = 1700

;Air Machine Gun Temper (Medium)
[State -1, Air Machine Gun Temper (Medium)]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcby" && !WinKo
triggerall = statetype=A && !WinKo
triggerall = pos Y < -60
trigger1 = ctrl
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620) || (StateNo = 640)
trigger2 = movecontact
value = 1710

;Air Machine Gun Temper (Strong)
[State -1, Air Machine Gun Temper (Strong)]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcbz" && !WinKo
triggerall = statetype=A && !WinKo
triggerall = pos Y < -60
trigger1 = ctrl
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620) || (StateNo = 640)
trigger2 = movecontact
value = 1720

;Air Ki Blast (Light)
[State -1, Air Ki Blast (Light)]
type = Null ;ChangeState
triggerall = var(59)<=0 && var(52)<=0
triggerall = command = "qcfx" && !WinKo
triggerall = statetype=A && !WinKo
trigger1 = ctrl
trigger1 = pos Y < -50
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620) || (StateNo = 640)
trigger2 = movecontact
value = 1600

;Air Ki Blast (Medium)
[State -1, Air Ki Blast (Medium)]
type = Null ;ChangeState
triggerall = var(59)<=0 && var(52)<=0
triggerall = command = "qcfy" && !WinKo
triggerall = statetype=A && !WinKo
trigger1 = ctrl
trigger1 = pos Y < -50
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620) || (StateNo = 640)
trigger2 = movecontact
value = 1610

;Air Ki Blast (Strong)
[State -1, Air Ki Blast (Strong)]
type = Null ;ChangeState
triggerall = var(59)<=0 && var(52)<=0
triggerall = command = "qcfz" && !WinKo
triggerall = statetype=A && !WinKo
trigger1 = ctrl
trigger1 = pos Y < -50
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 620) || (StateNo = 640)
trigger2 = movecontact
value = 1620


;===========================================================================
; GROUND SPECIALS
;===========================================================================

;EX Ki Blast
[State -1, EX Ki Blast]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = power >= 500 || var(32)>0
triggerall = command = "qcf2p" && statetype != A  && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
value = 1050

;EX Machine Gun Temper
[State -1, EX Machine Gun Temper]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcb2p"
triggerall = power >= 500 || var(32)>0
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
value = 1450

;EX Rising Knee
[State -1, EX Rising Knee]
type = changestate
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
;triggerall = var(32)=0 ;No rage mode
triggerall = command = "dp2k"
triggerall = power >= 500
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
trigger7 = stateno = 455 && movecontact		; Sliding Kick
value = 1550

;Rising Knee
[State -1, Rising Knee]
type = changestate
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
;triggerall = var(32)=0 ;No rage mode
triggerall = (command = "dpa") || (command = "dpb") || (command = "dpc")
triggerall = var(15):=(command = "dpa") + 2*(command = "dpb") + 3*(command = "dpc")
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
trigger7 = stateno = 455 && movecontact		; Sliding Kick
value = 1500

;Ki Blast (Light) 1
[State -1, Ki Blast (Light)]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcfx" && statetype != A  && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
trigger7 = stateno = 455 && movecontact		; Sliding Kick
value = 1000

;Ki Blast (Medium) 1
[State -1, Ki Blast (Medium)]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcfy" && statetype != A  && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
value = 1010

;Ki Blast (Hard) 1
[State -1, Ki Blast (Hard)]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcfz" && statetype != A  && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
value = 1020

;Wolverine Flip (back)
[State -1, Wolverine Flip (back)]
type = changestate
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = (command = "qcba") || (command = "qcbb") || (command = "qcbc")
triggerall = var(15):=(command = "qcba") + 2*(command = "qcbb") + 3*(command = "qcbc")
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
trigger7 = stateno = 455 && movecontact		; Sliding Kick
trigger8 = stateno = 300 && movecontact		; Dash Elbow
value = 1100

;Wolverine Flip (Forward)
[State -1, Wolverine Flip (forward)]
type = changestate
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = var(32)=0 ;No rage mode
triggerall = (command = "qcfa") || (command = "qcfb") || (command = "qcfc")
triggerall = var(15):=(command = "qcfa") + 2*(command = "qcfb") + 3*(command = "qcfc")
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
trigger7 = stateno = 455 && movecontact		; Sliding Kick
trigger8 = stateno = 300 && movecontact		; Dash Elbow
value = 1200

;Machine Gun Temper Light
[State -1, Machine Gun Temper]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcbx"
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
value = 1400

;Machine Gun Temper Medium
[State -1, Machine Gun Temper]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcby"
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
value = 1401

;Machine Gun Temper Strong
[State -1, Machine Gun Temper]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "qcbz"
triggerall = statetype!=A && !WinKo
trigger1 = ctrl
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movecontact
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movecontact
trigger4 = ((stateno = 400) || (stateno = 410) || (stateno = 420) || (stateno = 421)) && movecontact
trigger5 = ((stateno = 430) || (stateno = 440)) && movecontact
trigger6 = stateno = 100 || stateno = 101
value = 1402

; Slashing Chop (aka Focus Attack)
[State -1, Slashing Chop]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = stateno !=[1300,1302]
triggerall = stateno != 106
;triggerall = command = "hold_z" && command = "hold_c"
triggerall = command = "z" && command = "c"
trigger1 = statetype = S
trigger1 = ctrl
value = 1300

;Zero Counter
[State -1, zero counter]
type = changestate
triggerall = var(32)=0 ;No rage mode
trigger1 = var(59)<=0
trigger1 = stateno=150 || stateno=152
trigger1 = command="f2k" || command="f2p"
trigger1 = roundstate=2 && power>=1000 && statetype!=A
value = 750

;Air Zero Counter
[State -1, air zero counter]
type = changestate
triggerall = var(32)=0 ;No rage mode
trigger1 = var(59)<=0
trigger1 = stateno=154  ; && animelemtime(1)<6
trigger1 = command="f2k" || command="f2p"
trigger1 = roundstate=2 && power>=1000 && statetype=A
value = 760


;===========================================================================
; COMMAND & SYSTEM MOVES
;===========================================================================

; Sliding Kick
[State -1, Launcher Kick]
type = changestate
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = statetype!=A
trigger1 = stateno = 100 || stateno = 101
trigger1 = command="c" && command!="holddown"
value = 455

;Power Charge
[State -1]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
triggerall = var(32)=0 ;No rage mode
;triggerall = roundstate = 2
triggerall = StateType != A
triggerall = Power < 3000
triggerall = stateno != 900
triggerall = Ctrl
;trigger1 = command = "b" && command = "y"
trigger1 = command = "hold_b" && command = "hold_y"
value = 900

; Punch Throw (Close Explosion)
[State -1, throw2]
type = changestate
triggerall = var(59)<=0 && var(52)<=0
trigger1 = command="xa" && command="holdfwd"
trigger1 = roundstate=2 && ctrl && statetype=S && stateno!=100
value = 800

; Kick Throw (Suplex)
[State -1, throw1]
type = changestate
triggerall = var(59)<=0 && var(52)<=0
trigger1 = command="xa" && command="holdback"
trigger1 = roundstate=2 && ctrl && statetype=S && stateno!=100
value = 810

;===========================================================================
; NORMALS
;===========================================================================

; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100 || stateno = 101
value = 200

; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A && movecontact
trigger2 = (stateno = 200) || (stateno = 230)
trigger3 = stateno = 100 || stateno = 101
trigger4 = StateType != A && movecontact
trigger4 = (stateno = 400) || (stateno = 430)
trigger5 = stateno=300 && MoveContact
value = 210

; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A && movecontact
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 210) || (stateno = 240) || (stateno = 242)
trigger3 = stateno = 100 || stateno = 101
trigger4 = StateType != A && movecontact
trigger4 = (stateno = 400) || (stateno = 430) || (stateno = 410) || (stateno = 440)
trigger5 = stateno=300 && MoveContact
value = 220

; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 100 || stateno = 101
value = 230

; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A
trigger2 = (stateno = 200) || (stateno = 230)
trigger2 = movecontact
trigger3 = stateno = 100 || stateno = 101
trigger4 = StateType != A && movecontact
trigger4 = (stateno = 400) || (stateno = 430)
trigger5 = stateno=300 && MoveContact
value = 240

; Standing Medium Kick Combo
[State -1, Standing Medium Kick Combo]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = (stateno = 240) || (stateno = 210)
trigger1 = movecontact
value = 242

; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) || (stateno = 230) || (stateno = 210) || (stateno = 240) || (stateno = 242)
trigger2 = movecontact
trigger3 = stateno = 100 || stateno = 101
trigger4 = StateType != A && movecontact
trigger4 = (stateno = 400) || (stateno = 430) || (stateno = 410) || (stateno = 440)
trigger5 = stateno=300 && MoveContact
value = 250

; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A & MoveContact
trigger2 = (stateno = 200) || (stateno = 230)
trigger3 = stateno = 100 || stateno = 101
value = 400

; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A & MoveContact
trigger2 = (StateNo = 400) || (stateno = 200) || (stateno = 230) || (stateno = 430)
trigger3 = stateno = 100 || stateno = 101
trigger4 = stateno=300 && MoveContact
value = 410

; Crouching Strong Punch = Close Uppercut combo'd
[State -1, Close Uppercut]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "z" && command = "holddown"
trigger1 = (stateno = 200) || (stateno = 230) || (stateno = 210) || (stateno = 240) || (stateno = 242)
trigger1 = movecontact
trigger2 = (stateno = 400) || (stateno = 430) || (stateno = 410) || (stateno = 440)
trigger2 = movecontact
trigger3 = stateno=300 && MoveContact
value = 421

; Crouching Strong Punch = Close Uppercut
[State -1, Close Uppercut]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "z" && command = "holddown"
triggerall = statetype !=A
trigger1 = ctrl
trigger2 = stateno = 100 || stateno = 101
trigger3 = stateno=300 && MoveContact
value = 420

; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A & MoveContact
trigger2 = (stateno = 200) || (stateno = 230)
trigger3 = stateno = 100 || stateno = 101
value = 430

; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A && MoveContact
trigger2 = (StateNo = 400) || (stateno = 200) || (stateno = 230) || (stateno = 430)
trigger3 = stateno = 100 || stateno = 101
trigger4 = stateno=300 && MoveContact
value = 440

; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = StateType != A & MoveContact
trigger2 = (StateNo = 400) || (stateno = 410) || (stateno = 430) || (stateno = 440)
trigger3 = stateno = 100 || stateno = 101
trigger4 = StateType != A & MoveContact
trigger4 = (StateNo = 200) || (stateno = 210) || (stateno = 230) || (stateno = 240) || (stateno = 242)
trigger5 = stateno=300 && MoveContact
value = 450

;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "x"
triggerall = stateno != 600
triggerall = statetype = A
trigger1 = ctrl
value = 600

;Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (StateNo = 600) || (StateNo = 630)
trigger2 = MoveContact
value = 610

;Jump Medium Punch Combo
[State -1, Jump Medium Punch Combo]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "y"
triggerall = statetype = A
trigger1 = (StateNo = 610) || (StateNo = 640)
trigger1 = MoveContact
value = 615

;Jump Strong Punch (two fists)
[State -1, Jump Strong Punch]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 640)
trigger2 = MoveContact
value = 620

;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
value = 630

;Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "b"
triggerall = statetype = A
triggerall = (stateno!=640)
trigger1 = ctrl
trigger2 = (StateNo = 600) || (StateNo = 630)
trigger2 = movecontact
value = 640

;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger1 = stateno != 650 && stateno != 660
trigger2 = (StateNo = 600) || (StateNo = 630) || (StateNo = 610) || (StateNo = 615) || (StateNo = 640)
trigger2 = MoveContact
value = 650

;===========================================================================
; SYSTEM
;===========================================================================

; Taunt
[State -1, Taunt]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "s" && stateno!=195
trigger1 = statetype != A
trigger1 = ctrl
value = 195

;Air Dash Forward
[State -1, Fwd]
type = ChangeState
value = 110
triggerall = var(59) <= 0
;triggerall = roundstate = 2
triggerall = var(10) = 0 ;limiter
trigger1 = pos Y < -20
triggerall = stateno != 105
trigger1 = (command = "FF") && (statetype = A) && (ctrl)

;Air Dash Back
[State -1, Back]
type = ChangeState
value = 115
triggerall = var(59) <= 0
;triggerall = roundstate = 2
triggerall = var(10) = 0 ;limiter
triggerall = vel x <= 0
trigger1 = pos Y < -20
triggerall = stateno != 105
trigger1 = (command = "BB") && (statetype = A) && (ctrl)

; Run Fwd
[State -1, Run Fwd]
type = ChangeState
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
trigger1 = command = "FF"
trigger1 = statetype = S && ctrl
trigger1 = roundstate=2 && (stateno!=[100,106])
value = 100

; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

; Super Jump
;This state executes only after performing the air launcher
[State -1, Jump Launcher]
type = ChangeState
value = 10230
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
triggerall = command = "holdup"
trigger1 = (stateno = 420 || stateno = 421)  && animelemtime(5)>0 && MoveHit

[State -1, Super Jump Straight Up]
type = ChangeState
value = 10231
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "superjump"

[State -1, Super Jump Forward]
type = ChangeState
value = 10232
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "superjumpforward"

[State -1, Super Jump Backward]
type = ChangeState
value = 10233
triggerall = var(59)<=0 && var(52)<=0
;triggerall = roundstate = 2
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = command = "superjumpbackward"

;____________________________________________________________________________
; AI
;____________________________________________________________________________

;===========================================================================
; SYSTEM AI
;===========================================================================
[State -1, Air Dash]
type = ChangeState
value = Ifelse(enemynear,Movetype=A&&enemynear, vel x>0&&random<150,115,110)
triggerall = var(59) >= 1 && roundstate = 2 && numenemy && var(10) = 0 && pos Y < -20
triggerall = stateno != 105 && statetype = A && (p2bodydist x>=80) && (p2bodydist y=[-40,155])
triggerall =random<=75
trigger1 = ctrl

[State -1, Fall Recovery]
type=changestate
value= ifelse((pos y>=-20), 5200, 5210)
trigger1= var(59)>=1 && numenemy
trigger1= roundstate=2 && alive
trigger1= stateno=5050 && canrecover
trigger1= vel y>=-1 && random<250

[State -1, Run]
type=changestate
value=100
trigger1= var(59)>=1 && numenemy
trigger1= roundstate=2 && statetype=S
trigger1= ctrl && (stateno!=[100,106])
trigger1= (enemynear,movetype!=A) && p2bodydist x>=70 && random<150

[State -1, Jump]
type=changestate
value=40
trigger1= var(59)>=1 && numenemy
trigger1= roundstate=2 && statetype!=A && ctrl
trigger1= enemynear,movetype=A && p2bodydist x<160 && enemynear,hitdefattr=SC,AT

[State -1, Dash Backward]
type=changestate
value=105
triggerall= var(59)>=1 && numenemy
triggerall= roundstate=2 && statetype=S
triggerall= ctrl && (stateno!=[100,106])
trigger1= (enemynear,movetype=A) && backedgedist>=80 && (p2bodydist x=[80,120]) && (enemynear,vel x)
trigger1= random<ifelse((enemynear,hitdefattr=SC,AT),150,50)
trigger2= (p2bodydist x=[0,80]) && backedgebodydist>=80
trigger2= enemynear,stateno=5120 && enemynear,animtime=-3 && random<500

[State -1, AI Walk Fwd]
type = ChangeState
value = 20
triggerall = var(59)=1 && numenemy && roundstate=2 
triggerall = stateno != 20 && stateno != 100
triggerall = statetype != A && ctrl && pos Y = 0
trigger1 = p2bodydist x >= 10 && random < 500
trigger1 = p2bodydist y = [-20,5]
trigger1 = enemynear,movetype != A
trigger2 = (p2bodydist x = [10,110])
trigger2 = p2bodydist y = [-20,5]
trigger2 = random < 700
trigger2 = (enemy,facing = facing)
trigger3 = p2bodydist x >= 10 && random < 500
trigger3 = p2bodydist y = [-20,5]
trigger3 = enemynear,movetype != A
trigger3 =(enemy,stateno = [120,155]) || moveguarded

[State -1, AI Walk Fwd Stop]
type = ChangeState
triggerall = var(59)>=1 && numenemy && roundstate=2 
triggerall = stateno = 20 
trigger1 = P2movetype = A && (enemy,facing != facing)
trigger2 = p2bodydist x < 4
value = 0
ctrl = 1

[State -1, Guard]
type=changestate
value=120
trigger1= var(59)>=1 && numenemy
trigger1= roundstate=2 && inguarddist
trigger1= ctrl && (stateno!=[120,155])&& !(enemynear,ctrl)
trigger1= !(enemynear,hitdefattr=SCA,AT) && (enemynear,time<120)
trigger1= statetype!=A || p2statetype=A
trigger1= random<ifelse((p2stateno=[200,699]), 300, ifelse((p2stateno=[1000,2999]), 650, 1000))

[State -1, Guard]
type = ChangeState
value = 120
triggerall= var(59)>=1 && numenemy&& StateNo!=[120,155]
triggerall= Ctrl||stateno = 21
triggerall= enemynear,Movetype=A && random<800
triggerall= !(enemynear,hitdefattr=SCA,AT)
trigger1 = inguarddist

[State -1, Super Jump AI]
type = ChangeState
value = 10231
triggerall = var(59)>=1 && numenemy && statetype != A && roundstate = 2 && (p2bodydist y = [-320,-40])
triggerall = stateno != 100 && pos y = 0 && (enemynear,Statetype=A)
trigger1 = ctrl && enemy,vel y < -1 && (p2bodydist x = [ 10, 70]) && enemynear,movetype != A && random<100
trigger2 = ctrl && enemy,vel y < -1 && random<50
trigger2 = enemynear,movetype = H && (enemynear,stateno=5040)
trigger2 = p2bodydist x <= 50 && random<150
trigger3 = ctrl && enemynear,MoveType != H&&P2BodyDist Y < -90&& enemy,vel y <= 0

[State -1, Super Jump AI after launcher]
type = ChangeState
value = 10230
triggerall = var(59)>=1 && numenemy && statetype != A && roundstate = 2 && (p2bodydist y = [-320,-40])
triggerall = stateno != 100 && pos y = 0 && (enemynear,Statetype=A)
trigger1 = ((stateno = 420)||(stateno = 421)) && MoveHit ;&& random<800

[State -1, Zero Counter]
type=changestate
value=750
trigger1= var(59)>=1 && numenemy && roundstate=2 && statetype!=A && power>=1000
trigger1= stateno=150 || stateno=152
trigger1= random<25
trigger1= (p2bodydist x=[0,50]) && (life<.5*lifemax)

[State -1, Air Zero Counter]
type=changestate
value=760
trigger1= var(59)>=1 && numenemy && roundstate=2 && statetype=A && power>=1000
trigger1= stateno=154
trigger1= random<25
trigger1= (p2bodydist x=[0,50]) && (life<.5*lifemax)

[State -1, Launcher Kick]
type = changestate
value = 455
triggerall = var(59)>=1 && numenemy && roundstate = 2 && statetype!=A
triggerall= (enemy,stateno!=[120,155])&&(enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L)&&(enemynear,statetype!=A)&&(enemynear,stateno!=[1000,4999])
triggerall= (enemynear,stateno!=40) && (p2bodydist x=[30,100]) && (p2bodydist y=[-30,5])
trigger1 = (stateno = 100 || stateno = 101) && random<300

[State -1, Power Charge]
type=changestate
value=900
triggerall= var(59)>=1 && numenemy && roundstate=2 && statetype!=A && !var(32)
triggerall= power<const(data.power) && enemynear,Movetype!=A && !(enemynear,ctrl)
triggerall=  power < const(data.power) && power < powermax 
triggerall= !inguarddist && p2bodydist x>=120 && random<150
triggerall = stateno != 900
triggerall = numhelper(2531) = 0
triggerall= ctrl
trigger1=(enemynear,Movetype=H||enemynear,statetype=L)
trigger2=enemynear,vel x<0
trigger3=enemynear,stateno=[120,155]

[State -1, Throw]
type = ChangeState
value = Ifelse(random<=500,800,810)
triggerall = var(59)>=1 && random < 500 && !var(32)
triggerall = roundstate=2 && statetype!=A && enemynear,statetype!=L && (enemynear,stateno!=[5120,5201])
triggerall = enemynear,movetype!=H && enemynear,statetype!=A && enemynear,Hitover && (p2bodydist x =[0,30])
triggerall = ctrl||stateno=100||stateno=52
trigger1 = random>=800
trigger2 = enemynear,stateno=[120,155]
trigger2 = random>=500
trigger3 = stateno=100
trigger4=(p2bodydist x=[0,30]) && random<250
trigger5=(p2stateno=[120,155]) && (p2bodydist x=[0,30]) && random<500

[State -1, Standing Low Punch AI]
type = ChangeState
value = 200
triggerall = var(59)>=1 && numenemy && roundstate=2 && stateType != A
triggerall =(p2bodydist x = [-10, 42])&&(p2bodydist y = [-80,5])&&P2statetype != C&&P2statetype != L
trigger1 = ctrl && random < 550
trigger2 = (stateno = [100,101]) && random < 250
trigger3 = ctrl&&(enemynear,ctrl) && random < 700

[State -1, Standing Medium Punch AI]
type = ChangeState
value = 210
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A  && P2statetype != C
triggerall = (p2bodydist x = [-15, 45]) && p2statetype != L
trigger1 = ctrl && random < 150
trigger2 = ((stateno = [200,209])|| (stateno = [230,239])||(stateno = [400,409])||(stateno = [430,439]))&& movehit
trigger2 = random < 700

[State -1, Standing High Punch AI]
type = ChangeState
value = 220
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A
triggerall = (p2bodydist x = [-10, 50]) && (p2bodydist y = [ -80, 80]) && p2statetype != L
trigger1 = ctrl && random < 200
trigger2 = ((stateno = [210,219])|| (stateno = [240,249])||(stateno = [410,419])||(stateno = [440,449]))&& movehit
trigger2 = random < 750

[State -1, Standing Low Kick AI]
type = ChangeState
value = 230
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A && (p2bodydist x = [0, 45]) && p2statetype != L
trigger1 = ctrl && random < 550
trigger2 = (stateno = [100,101]) && random < 100
trigger3 = ctrl&&(enemynear,ctrl) && random < 600

[State -1, Standing Medium Kick AI]
type = ChangeState
value = 240
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A && P2statetype != C
triggerall = (p2bodydist x = [5, 45]) && p2statetype != L
trigger1 = ctrl && random < 150
trigger2 = ((stateno = [210,219])|| (stateno = [230,239])||(stateno = [410,419])||(stateno = [430,439]))&& movehit
trigger2 = random < 550

[State -1, Standing Medium Kick AI]
type = ChangeState
value = 242
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A && P2statetype != C
triggerall = (p2bodydist x = [-10, 50]) && p2statetype != L && random < 150
trigger1 = stateno=240 && Movehit

[State -1, Standing High Kick AI]
type = ChangeState
value = 250
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A && P2statetype != C
triggerall = (p2bodydist x = [5, 44]) && (p2bodydist y = [ -70, 50]) && p2statetype != L
trigger1 = ctrl && random < 250
trigger2 = ((stateno = [240,249])|| (stateno = [440,449]))&& movehit
trigger2 = random < 200

[State -1, Crouching Low Punch]
type = ChangeState
value = 400
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A
triggerall = (p2bodydist x = [-2, 38]) &&(p2bodydist y = [-50,25]) && P2statetype != A && P2statetype != L
trigger1 = ((ctrl)|| (stateno = 100) ||(stateno = 101)) && random < 250

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A
triggerall = (p2bodydist x = [5, 40]) &&(p2bodydist y = [-50,25]) && P2statetype != A && P2statetype != L
trigger1 = ctrl && random < 100
trigger2 = ((stateno = [200,209])|| (stateno = [230,239])||(stateno = [400,409])||(stateno = [430,439]))&& movehit
trigger2 = random < 800

[State -1, Crouching High Punch]
type = ChangeState
value = 420
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A
triggerall = (p2bodydist x = [0, 35]) &&(p2bodydist y = [-90,5]) && P2statetype != L
trigger1 = ctrl && random < 100
[State -1, Launcher]
type = ChangeState
value = 421
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A
triggerall = (p2bodydist x = [0, 45]) &&(p2bodydist y = [-85,5]) && P2statetype != L
trigger1 = ((stateno = [210,219])|| (stateno = [240,249])||(stateno = [410,419])||(stateno = [440,449]))&& movehit
trigger1 = random < 800
trigger2 = ((ctrl)|| (stateno = 100) ||(stateno = 101))&& random < 300
trigger3 = stateno = 455 && movehit && random<300

[State -1, Crouching Low Kick]
type = ChangeState
value = 430
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A
triggerall = (p2bodydist x = [-6, 46]) &&(p2bodydist y = [-50,25]) && P2statetype != A
trigger1 = ((ctrl)|| (stateno = 100) ||(stateno = 101))&& random < 100 && P2statetype != L
trigger2 = ctrl && !numtarget(1098) && random < 100 &&(p2bodydist x = [-8, 22])
trigger2 = enemynear,statetype=L && enemynear,stateno!=5120 && p2dist y=0

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A
triggerall = (p2bodydist x = [20, 52]) &&(p2bodydist y = [-50,25]) && P2statetype != A
trigger1 = ctrl && random < 150 && P2statetype != L
trigger2 = ((stateno = [210,219])|| (stateno = [230,239])||(stateno = [410,419])||(stateno = [430,439]))&& movehit
trigger2 = random < 350 && P2statetype != L
trigger3 = ctrl && random < 100 && (enemynear,stateno=5110)&&(p2bodydist x = [-8, 22])
trigger3 = enemynear,statetype=L && enemynear,stateno!=5120 && p2dist y=0

[State -1, Crouching High Kick]
type = ChangeState
value = 450
triggerall = var(59)>=1 && numenemy && roundstate=2 && StateType != A && P2statetype != A
triggerall = (p2bodydist x = [20, 100]) && (p2bodydist y = [ -50, 50]) && p2statetype != L && p2statetype = S
trigger1 = ctrl && random < 25
trigger2 = ((stateno = [200,219])|| (stateno = [230,249])||(stateno = [400,419])||(stateno = [430,449]))&& movehit
trigger2 = random < 200

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerall = var(59)>=1 && numenemy && roundstate=2 && statetype = A
triggerall = (p2bodydist x = [-5, 65]) && (p2bodydist y = [ -80, -40]) && p2statetype != L
trigger1 = ctrl && random < (ifelse((vel x > 0 && p2statetype = A), 350, 150))
trigger2 = ((stateno = 600)||(stateno = 630))&& movehit && random<700

[State -1, Jumping High Punch]
type = ChangeState
value = 620
triggerall = var(59)>=1 && numenemy && roundstate=2 && statetype = A && (p2bodydist y = [ -70, -30]) && p2statetype != L
trigger1 = ctrl && random < 100 && (p2bodydist x = [10, 60])
trigger2 = (stateno = 610)&& movehit && random < 300 
trigger3 = (stateno = 640)&& movehit && random < 150 

[State -1, Jumping Low Kick]
type = ChangeState
value = 630
triggerall = var(59)>=1 && numenemy && roundstate=2 && statetype = A && enemynear,Statetype=A
triggerall = (p2bodydist x = [-5,25]) && (p2bodydist y = [ -50, 20]) && p2statetype != L
trigger1 = ctrl && random < 800

[State -1, Jumping Low Punch]
type = ChangeState
value = 600
triggerall = var(59)>=1 && numenemy && roundstate=2 && statetype = A && stateno != 600
triggerall = (p2bodydist x = [2,40]) && (p2bodydist y = [-80,-40]) && p2statetype != L
trigger1 = ctrl && random < 700

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerall = var(59)>=1 && numenemy && roundstate=2 && statetype = A
triggerall = (p2bodydist y = [ -40, 45]) && p2statetype != L
trigger1 = ctrl && random < 200 && (p2bodydist x = [-25,40]) 
trigger2 = ((stateno = 600)||(stateno = 630))&& movehit && random<700

[State -1, Jumping High Kick]
type = ChangeState
value = 650
triggerall = var(59)>=1 && numenemy && roundstate=2 && statetype = A && (p2bodydist y = [ -60, 50]) && p2statetype != L
trigger1 = ctrl && random < 150 && p2statetype != A && (p2bodydist x = [40,90])
trigger2 = (stateno = 610)&& movehit && random < 250 && enemynear,Statetype=A
trigger3 = (stateno = 640)&& movehit 

;===========================================================================
; SPECIALS
;===========================================================================

[State -1, Rising Knee AI]
type = changestate
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A
triggerall= (p2stateno != [120, 155]) && p2statetype != L && (p2bodydist x = [-5,50]) && (p2bodydist y =[-105,5]) && (enemynear, statetype != C)
trigger1 = ctrl && (enemynear, vel y > -1) && random<300
trigger2 = ((stateno = [200, 220]) || (stateno = [230, 250]) || (stateno = [400, 440])) && (movehit = [1, 16]) && random < 100
trigger3 = stateno = 455 && movehit && random<200
trigger4 = ((stateno = 420)|(stateno = 421)) && MoveHit && random<50
trigger5 = ctrl && random<150 && enemynear,stateno=652 && enemynear,movetype=H && enemynear,statetype=A
value = Ifelse((power >= 500 && random < 50), 1550, 1500)

[State -1, Wolverine Flip (Backward) AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A && !var(32) && (p2bodydist x =[-30,65]) && (p2bodydist y =[-70,5])
triggerall=(p2stateno != [120, 155]) && (enemynear,statetype = S) && (enemynear,statetype != L) && (enemynear,stateno!=[5100,5220]) 
trigger1 = ctrl && random<200 && enemynear,vel x>3 && enemynear,Movetype!=A 
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<50
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 250)) && movehit && random<50
trigger4 = ((stateno = 400) || (stateno = 410)) && movehit && random<50
trigger5 = ((stateno = 430) || (stateno = 440)) && movehit && random<50
trigger6 = stateno = 455 && movehit && random<20
trigger7 = ctrl && random<20 && enemynear,stateno=652 && enemynear,movetype=H && enemynear,statetype=A
value = 1100

[State -1, Wolverine Flip (forward) AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A && !var(32) && (p2bodydist x =[5,90]) && (p2bodydist y =[-70,5])
triggerall=(p2stateno != [120, 155]) && (enemynear,statetype = S) && (enemynear,statetype != L) ;&& (enemynear,stateno!=[5100,5220]) 
trigger1 = ctrl && random<150
trigger2 = ((stateno = [200, 220]) || (stateno = [230, 250]) || (stateno = [400, 440])) && (movehit = [1, 16]) && random < 350
trigger3 = stateno = 455 && movehit && random<100
trigger4 = ctrl && random<100 && enemynear,stateno=652 && enemynear,movetype=H && enemynear,statetype=A
value = 1200

[State -1, Air Machine Gun Temper AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype = A && pos Y < -60 && vel x>=0
triggerall= (enemy,stateno!=[120,155]) && (p2bodydist x=[0,65]) && (p2bodydist y=[40,355])
trigger1 = ctrl && random<200 && (prevstateno!=[600,650])
trigger2 = (stateno=[600,640]) && movehit && random<50
trigger3 = enemynear,statetype=L && ctrl && random<300
value = Ifelse(var(32),1730,Ifelse(p2bodydist x>=35,1720,Ifelse((p2bodydist x=[5,35]),1710,1700)))

[State -1, Ki Blast AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A
triggerall= (enemy,stateno!=[120,155])&&(enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L)&&(enemynear,Statetype!=A)
triggerall= (enemynear,stateno!=40) && (p2bodydist x>=15) && (p2bodydist y=[-70,5])
trigger1 = ctrl && (Random<70)
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && (Random<20)
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 250)) && movehit && (Random<20)
trigger4 = ((stateno = 400) || (stateno = 410)) && movehit && (Random<20)
trigger5 = ((stateno = 430) || (stateno = 440)) && movehit && (Random<20)
trigger6 = ctrl && random<500 && enemynear,stateno=652 && enemynear,movetype=H && enemynear,statetype=A
value = Ifelse(power>1000&&random<10,1050,Ifelse(random<600,1020,Ifelse(random<250,1010,1000)))

[State -1, Machine Gun Temper AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A
triggerall= (enemy,stateno!=[120,155])&&(enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L)&&(enemynear,Statetype!=A)
triggerall= (enemynear,stateno!=40) && (p2bodydist x>=15) && (p2bodydist y=[-70,5])
trigger1 = ctrl && random<200
trigger2 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<250
trigger3 = ((stateno = 230) || (stateno = 240) || (stateno = 250)) && movehit && random<170
trigger4 = ((stateno = 400) || (stateno = 410)) && movehit && random<200
trigger5 = ((stateno = 430) || (stateno = 440)) && movehit && random<150
trigger6 = ctrl && random<50 && enemynear,stateno=652 && enemynear,movetype=H && enemynear,statetype=A
value = Ifelse(power>500&&random<50,1450,Ifelse(random<600,1402,Ifelse(random<250,1401,1400)))

[State -1, Slashing Chop]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && (stateno !=[1300,1302]) && stateno != 106 && statetype = S && (enemynear, Movetype != A)
triggerall= (p2bodydist x = [45,135]) && (p2bodydist y = [ -70, 0]) && (p2statetype != L) && (enemynear, vel y >= 0)
triggerall= (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype != A)
trigger1 = ctrl && random<25
value = 1300

;===========================================================================
; SUPERS LV.2 AI
;===========================================================================

[State -1, Chou Galick Ho AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && power >= 2000 && stateno != 2400 && !var(32)
triggerall= (enemynear,stateno != [120, 155]) && (enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (enemynear,vel y>=-1) && (enemynear,vel x=[0,2))
triggerall= (p2bodydist x=[20,140]) && ((p2bodydist y=[-70,5])||(enemynear,vel y=0 && enemynear,statetype!=A))
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && random<100
trigger2 = stateno = 1300 && movehit && random<50
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<150
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && random<250
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && random<50
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && random<50
trigger7 = stateno=1050 && AnimElemTime(3)>=0 && enemynear,Movetype=H && enemynear,Statetype=S && random<100
trigger8 = stateno=1120 && Movehit && random<50		
value = 2400

[State -1, Air Chou Galick Ho AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype = A   && power >= 2000 && stateno != 2450 && !var(32)
triggerall= (enemynear,stateno != [120, 155]) && (enemy,stateno!=[5100,5120]) && (enemynear,statetype!=L)
triggerall= (p2bodydist x=[-5,25]) && (p2bodydist y=[40,355]) && (enemynear,vel x=[0,2)) && (enemynear,pos y=0||enemynear,pos y<=-30)
trigger1 = Ctrl && random<150
trigger2 = (StateNo = [600,650]) && movehit && (p2bodydist x=[-10,10]) && random<100
trigger3 = stateno=2101 && anim =2101 && animelemtime(7)>=1
trigger3 = numhelper(2102)
trigger3 = helper(2102),movehit
value = 2450

[State -1, Bakuhatsuha Lv2 AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && power >= 2000 && stateno != 2320 && !var(32)
triggerall= (enemy,stateno!=[120,155])&&(enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (enemynear,vel y>=-2)
triggerall= (p2bodydist x=[20,80]) && (p2bodydist y=[-110,5]) && (enemynear,vel x=[0,2))
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && random<150
trigger2 = stateno = 1300 && movehit && random<100
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<150
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && random<150
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && random<150
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && random<100
trigger7 = stateno=1050 && AnimElemTime(3)>=0 && enemynear,Movetype=H && enemynear,Statetype=S && random<150
trigger8 = stateno=1120 && Movehit && random<100		
value = 2320

[State -1, Air Bakuhatsuha Lv2 AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A && power >= 2000 && stateno != 2330 && !var(32)
triggerall= (enemy,stateno!=[120,155]) && (enemy,stateno!=[5100,5120]) && (enemynear,statetype!=L) && enemynear,backedgedist>50
triggerall= (enemynear,vel y>=-2) && (p2bodydist x=[20,60]) && (p2bodydist y=[-40,355]) && (enemynear,vel x=[0,2))
trigger1 = Ctrl && random<150
trigger2 = (StateNo = [600,650]) && movehit && random<100
value = 2330

[State -1, Rage Mode AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && (statetype != A) && power >= 2000 && stateno != 2700 && !var(32)
triggerall= (enemynear,Movetype!=A) && (enemynear,Statetype=L) && (p2bodydist x>=120) && random<150 
trigger1 = Ctrl
trigger2 = stateno=900
value = 2700

;===========================================================================
; SUPERS LV.1 AI
;===========================================================================

[State -1, Galick Ho AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && ((power >= 1000)||(var(32)>0)) && stateno != 2000 
triggerall= (enemynear,stateno != [120, 155]) && (enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (enemynear,vel y>=-1) && (enemynear,vel x=[0,2))
triggerall= (p2bodydist x=[20,100]) && ((p2bodydist y=[-70,5])||(enemynear,vel y=0 && enemynear,statetype!=A))
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && random<50
trigger2 = stateno = 1300 && movehit && Ifelse(var(32),random<150,random<50)
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && Ifelse(var(32),random<200,random<100)
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && Ifelse(var(32),random<250,random<150)
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && Ifelse(var(32),random<150,random<50)
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && Ifelse(var(32),random<150,random<50)
trigger7 = stateno=1050 && AnimElemTime(3)>=0 && enemynear,Movetype=H && enemynear,Statetype=S && Ifelse(var(32),random<150,random<50)
trigger8 = stateno=1120 && Movehit && random<50		
value = 2000

[State -1, Air Galick Ho AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype = A   && ((power >= 1000)||(var(32)>0)) && stateno != 2100
triggerall= (enemynear,stateno != [120, 155]) && (enemy,stateno!=[5100,5120]) && (enemynear,statetype!=L)
triggerall= (p2bodydist x=[-5,25]) && (p2bodydist y=[40,355]) && (enemynear,vel x=[0,2)) && (enemynear,pos y=0||enemynear,pos y<=-30)
trigger1 = Ctrl && Ifelse(var(32),random<250,random<100)
trigger2 = (StateNo = [600,650]) && movehit && (p2bodydist x=[-10,10]) && Ifelse(var(32),random<250,random<150)
value = 2100

[State -1, Bakuhatsuha AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && ((power >= 1000)||(var(32)>0)) && stateno != 2300 
triggerall= (enemy,stateno!=[120,155]) && (enemy,stateno!=[5100,5120]) && (enemynear,statetype!=L) && (enemynear,vel y>=-2)
triggerall= (p2bodydist x=[20,80]) && (p2bodydist y=[-110,5]) && (enemynear,vel x=[0,2))
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && Ifelse(var(32),random<200,random<100)
trigger2 = stateno = 1300 && movehit && Ifelse(var(32),random<200,random<100)
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && Ifelse(var(32),random<200,random<100)
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && Ifelse(var(32),random<250,random<150)
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && Ifelse(var(32),random<100,random<50)
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && Ifelse(var(32),random<100,random<50)
trigger7 = stateno=1050 && AnimElemTime(3)>=0 && enemynear,Movetype=H && enemynear,Statetype=S && Ifelse(var(32),random<200,random<100)
trigger8 = stateno=1120 && Movehit && random<50	
value = 2300

[State -1, Air Bakuhatsuha AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype = A   && ((power >= 1000)||(var(32)>0)) && stateno != 2310
triggerall= (enemy,stateno!=[120,155]) && (enemy,stateno!=[5100,5120]) && (enemynear,statetype!=L) 
triggerall= (enemynear,vel y>=-2) && (p2bodydist x=[20,60]) && (p2bodydist y=[-40,355]) && (enemynear,vel x=[0,2))
trigger1 = Ctrl && Ifelse(var(32),random<150,random<50)
trigger2 = (StateNo = [600,650]) && movehit && Ifelse(var(32),random<250,random<100)
value = 2310

;===========================================================================
; HYPERS
;===========================================================================

[State -1, Air Galactic Gunfire AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype = A   
triggerall= (enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (enemynear,vel y>=-1) && (enemynear,vel x=[0,2))
triggerall= (p2bodydist x=[5,60]) && (p2bodydist y=[-90,5]) && (enemynear,statetype!=C)
triggerall = var(32)>0 && power >= 1000 && var(33) >= 700 && stateno != 2803
trigger1 = stateno=1501 && (movehit=[1,30]) && random<250
trigger2 = stateno=1551 && (movehit=[1,30]) && random<250
value = 2803

[State -1, Galactic Gunfire (Rage)AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && (var(32)>0) && stateno != 2800 
triggerall= (enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (enemynear,vel y>=-1) && (enemynear,vel x=[0,2))
triggerall= (p2bodydist x=[5,60]) && (p2bodydist y=[-90,5]) && (enemynear,statetype!=C)
triggerall = power >= 1000 && var(33) >= 700
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && random<300
trigger2 = stateno = 1300 && movehit && random<200
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<200
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && random<100
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && random<150
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && random<100
trigger7 = stateno=1050 && AnimElemTime(3)>=0 && enemynear,Movetype=H && enemynear,Statetype=S && random<100
value = 2800

[State -1, Galactic Gunfire (Normal)AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && (var(32)=0) && stateno != 2600 
triggerall= (enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (enemynear,vel y>=-1) && (enemynear,vel x=[0,2))
triggerall= (p2bodydist x=[5,60]) && (p2bodydist y=[-90,5]) && (enemynear,statetype!=C)
triggerall = power >= 3000
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && random<250
trigger2 = stateno = 1300 && movehit && random<100
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<150
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && random<50
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && random<100
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && random<50
value = 2600

[State -1, Final Flash AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && (power >= 3000) && (var(32)=0) && stateno != 2500 
triggerall= (enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (p2bodydist x>=150) && (p2bodydist y=[-90,5]) && (enemynear,vel y=0) 
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && random<350
trigger2 = stateno = 1300 && movehit && random<50
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<50
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && random<50
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && random<100
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && random<50
value = 2500

[State -1, Bakuhatsuha Lv3 AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && power >= 3000 && stateno != 2340 && !var(32)
triggerall= (enemy,stateno!=[120,155])&&(enemy,stateno!=[5100,5120])&&(enemynear,statetype!=L) && (enemynear,vel y>=-2)
triggerall= (p2bodydist x=[20,90]) && (p2bodydist y=[-110,5]) && (enemynear,vel x=[0,2)) && enemynear,backedgedist>90
trigger1 = (Ctrl || stateno = 100 || stateno = 101) && random<250
trigger2 = stateno = 1300 && movehit && random<200
trigger3 = ((stateno = 200) || (stateno = 210) || (stateno = 220)) && movehit && random<250
trigger4 = ((stateno = 230) || (stateno = 240) || (stateno = 242) || (stateno = 250)) && movehit && random<250
trigger5 = ((stateno = 400) || (stateno = 410) || (stateno = 420)) && movehit && random<250
trigger6 = ((stateno = 430) || (stateno = 440)) && movehit && random<200
trigger7 = stateno=1050 && AnimElemTime(3)>=0 && enemynear,Movetype=H && enemynear,Statetype=S && random<250
trigger8 = stateno=1120 && Movehit && random<200	
value = 2340

[State -1, Air Bakuhatsuha Lv3 AI]
type = ChangeState
triggerall= var(59)>=1 && numenemy && roundstate = 2 && statetype != A   && power >= 3000 && stateno != 2350 && !var(32)
triggerall= (enemy,stateno!=[120,155]) && (enemy,stateno!=[5100,5120]) && (enemynear,statetype!=L) && enemynear,backedgedist>80
triggerall= (enemynear,vel y>=-2) && (p2bodydist x=[20,80]) && (p2bodydist y=[-40,355]) && (enemynear,vel x=[0,2))
trigger1 = Ctrl && random<300
trigger2 = (StateNo = [600,650]) && movehit && random<250
value = 2350
