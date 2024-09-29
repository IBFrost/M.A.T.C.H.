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
name = "Dash Barrage"
command = ~D,F, z
time = 20

[Command]
name = "Shinku Tatsumaki"   ;Same name as above
command = ~D,B, z
time = 20

[Command]
name = "Boob Blast"   ;Same name as above
command = ~B,F, z
time = 20

[Command]
name = "Rock Out"
command = ~D,F, c
time = 20

[Command]
name = "Shin Shoryuken"
command = ~D,B, c
time = 20

[Command]
name = "Sex Bom-Omb"
command = ~B,F, c
time = 20

;-| Special Motions |------------------------------------------------------
[Command]
name = "Dash Punch"
command = ~D,F, y
time = 20

[Command]
name = "Tatsumaki"
command = ~D,B, y
time = 20

[Command]
name = "Boob Punch"
command = ~B,F, y
time = 20

[Command]
name = "Bamboozle"
command = z
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
;=============================================
[Statedef -1]

[State -1, AI ON] ; Turn the AI on when
Type = VarSet
TriggerAll = Var(59) < 1; it is not on yet and
TriggerAll = RoundState=2 ; the fight has started and is not over yet and
Trigger1 = AILevel>0 ; the computer is playing the character
v = 59
value= 1 ; value of 1 will mean the AI is on
Ignorehitpause=1

[State -1, AI OFF] ; Turn the AI off when
Type=VarSet
Trigger1=var(59)>0 ; it is on and
Trigger1=RoundState!=2 ; the round is not started yet or is already over
Trigger2=!IsHelper ; OR if we are a player, but
Trigger2=AILevel=0 ; the computer is not in control
v=59
value=0 ; value of 0 will mean the AI is off. values other than 0 and 1 are not used in this example, we have only one AI mode, the normal one.
Ignorehitpause=1

[State -1]
Type=VarSet
Trigger1=1
var(50)=(AILevel=1)*3+(AILevel=2)*7+(AILevel=3)*16+(AILevel=4)*30+(AILevel=5)*58+(AILevel=6)*90+ (AILevel=7)*150+(AILevel=8)*300

;=============================================
;                                      SUPER COMMANDS
;=============================================
;Rock Out
[State -1, Rock Out]
type = ChangeState
value =  3000
triggerall = power>= 1000
triggerall = command = "Rock Out"
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl

;Shin Shoryuken
[State -1, Shin Shoryuken]
type = ChangeState
value =  3010
triggerall = power>= 2000
triggerall = command = "Shin Shoryuken"
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl

;Sex Bom-Omb
[State -1, Sex Bom-Omb]
type = ChangeState
value = 3020
triggerall = power>= 3000
triggerall = command = "Sex Bom-Omb"
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl

;=============================================
;                                             EX COMMANDS
;=============================================
;Boob Blast
[State -1, Boob Blast]
type = ChangeState
value = 1025
triggerall = command = "Boob Blast"
triggerall = power >= 500
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl

;Shinku Tatsumaki
[State -1, Shinku Tatsumaki]
type = ChangeState
value = 1015
triggerall = command = "Shinku Tatsumaki"
triggerall = power >= 500
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger3 = stateno = 1000
trigger1 = ctrl

;Dash Barrage
[State -1, Dash Barrage]
type = ChangeState
value = 1005
triggerall = command = "Dash Barrage"
triggerall = power >= 500
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl
;=============================================
;                                      SPECIAL COMMANDS
;=============================================
;Dash Punch
[State -1, Dash Punch]
type = ChangeState
value = 1000
triggerall = command = "Dash Punch"
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl

;Tatsumaki
[State -1, Tatsumaki]
type = ChangeState
value =  1010
triggerall = command = "Tatsumaki"
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl

;Boob Punch
[State -1, Boob Punch]
type = ChangeState
value = 1020
triggerall = command = "Boob Punch"
trigger1 = statetype = S
trigger1 = statetype != A
trigger2 = stateno = [200,500]
trigger1 = ctrl

;Bamboozle
[State -1, Bamboozle]
type = ChangeState
value = 300
triggerall = command = "Bamboozle"
trigger1 = statetype = S
trigger1 = statetype != A
trigger1 = ctrl

;Striker 1
[State -1, Stiker]
type = ChangeState
value = 2000
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = numhelper(2001)=0
trigger1 = statetype = S
trigger1 = ctrl

;Striker 2
[State -1, Stiker]
type = ChangeState
value = 2010
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = numhelper(2001)=0
trigger1 = statetype = S
trigger1 = ctrl

;Striker 3
[State -1, Stiker]
type = ChangeState
value = 2020
triggerall = command = "c"
;triggerall = !command = "holddown"
triggerall = numhelper(2001)=0
trigger1 = statetype = S
trigger1 = ctrl

;Striker 4
[State -1, Stiker]
type = ChangeState
value = 2030
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = numhelper(2001)=0
trigger1 = statetype = C
trigger1 = ctrl

;=============================================
;                                      GENERAL COMMANDS
;=============================================
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;Grab
[State -1, Kung Fu Throw]
type = ChangeState
value = 800
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;=============================================
;                                        BASIC COMMANDS
;=============================================
;Light Attack
[State -1, Light Attack]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;Heavy Attack
[State -1, Attack]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;Crouching Light Attack
[State -1, Crouching Light Attack]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;Crouching Heavy
[State -1, Crouching Heavy Attack]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;Jump Light Attack
[State -1, Jump Light Attack]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 610

;Jump Strong Attack
[State -1, Jump Strong Attack]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

;=============================================
;                                          AI BEHAVIOR
;=============================================

; CHASING AFTER
[State -1, CHASING AFTER]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=abs(P2Bodydist X)>25 
Triggerall=P2StateType=S
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.1
Triggerall=anim !=100 && stateno!=100
Trigger1 = ctrl
value=100

; COMBO 1
[State -1, COMBO 1]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=abs(P2Bodydist X)<10
Triggerall=P2StateType=S
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.1
Trigger1 = ctrl
value=200
; COMBO 1
[State -1, COMBO 1]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=abs(P2Bodydist X)<25 
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.1
Trigger1 = stateno = 200 && movehit && hitshakeover
value=201
; COMBO 1
[State -1, COMBO 1]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=abs(P2Bodydist X)<25 
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.2
Trigger1 = stateno = 201 && movehit && hitshakeover
value=202
; COMBO 1
[State -1, COMBO 1]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S 
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.3
Trigger1 = stateno = 202 && movehit && hitshakeover
value=203
; COMBO 1
[State -1, COMBO 1]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.4
Trigger1 = stateno = 203 && movehit && hitshakeover
value=204
; COMBO 1
[State -1, COMBO 1]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.5
Trigger1 = stateno = 204 && movehit && hitshakeover
value=210

; COUNTER
[State -1, COMBO 2]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=abs(P2Bodydist X)<50 
Triggerall=P2MoveType = A
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.4
Trigger1 = ctrl
value=300

; KIM REACTION
[State -1, KIM REACTION]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=abs(P2Bodydist X)<25
Triggerall=numhelper(2011)=1
Triggerall=P2StateType=S
Triggerall=random<var(50)*1.5
Triggerall = var(10)>=3
Trigger1 = ctrl
value=195

; ANTI AIR
[State -1, ANTI AIR]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.5
Trigger1 = var(1)>0 && abs(P2Bodydist X)<50 
trigger2 = P2statetype = A && ctrl && abs(P2Bodydist X)<20
value=1020

; ANTI AIR
[State -1, ANTI AIR]
Type=Changestate
Triggerall=var(59)>0 
Triggerall=Statetype=S
Triggerall=!Inguarddist
Triggerall=random<var(50)*1.5
Trigger1 = var(1)>0 && abs(P2Bodydist X)<50 
value=1000