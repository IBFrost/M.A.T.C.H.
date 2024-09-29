 ;The CMD file.
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
;-------------------------------------------------------------------------------
;-----INTELIGENCIA ARTIFICIAL --------------------------------------------------
;-------------------------------------------------------------------------------
[Command]
name = "cpu"
command = D, F, U, UF, D, F, x+y
time = 0

[Command]
name = "cpu2"
command = B, F, U, DB, D, F, a+b
time = 0

[Command]
name = "cpu3"
command = B, U, DB, D, F, D, c
time = 0

[Command]
name = "cpu4"
command = F, D, UB, F, B, D, a
time = 0

[Command]
name = "cpu5"
command = F+a, b+c+D, c+x+a+UB
time = 0

[Command]
name = "cpu6"
command = F+b+c, D, UB, c+a, c+x+UF
time = 0

[Command]
name = "cpu7"
command = F, U, B, F, UF, U, B, DF, c+z
time = 0

[Command]
name = "cpu8"
command = F, U, B, F, UF, U, B, DU, c+z
time = 0

[Command]
name = "cpu9"
command = F, U, B, F, UF, U, B, D, D, c+z
time = 0

[Command]
name = "cpu10"
command = F, U, B, F, UF, U, B, c+z+UB
time = 0

[Command]
name = "cpu11"
command = F, U, B, F, UF, U, B, c+z+UD
time = 0

[Command]
name = "cpu12"
command = F, U, B, F, UF, U, B, a+b
time = 0

[Command]
name = "cpu13"
command = F, U, B, F, UF, U, B, c+y
time = 0

[Command]
name = "cpu14"
command = F, U, B, F, UF, U, B, c+x
time = 0

[Command]
name = "cpu15"
command = F, U, B, F, UF, U, B, c+b
time = 0

[Command]
name = "cpu16"
command = F, U, B, F, UF, U, B, c+a
time = 0

[Command]
name = "cpu17"
command = F, U, B, F, UF, U, B, c+z+b
time = 0

[Command]
name = "cpu18"
command = F, U, B, F, UF, U, B, c+z+a
time = 0

[Command]
name = "cpu19"
command = F, U, B, F, UF, U, B, c+z+x
time = 0

[Command]
name = "cpu20"
command = F, U, B, F, UF, U, B, c+z+B
time = 0

[Command]
name = "cpu21"
command = F, U, B, F, UF, U, B, c+z+y
time = 0

[Command]
name = "cpu22"
command = F, U, B, F, UF, U, B, a+b
time = 0

[Command]
name = "cpu23"
command = F, U, B, F, UF, U, B, c+y
time = 0

[Command]
name = "cpu24"
command = F, U, B, F, UF, U, B, c+x
time = 0

[Command]
name = "cpu25"
command = F, U, B, F, UF, U, B, c+b
time = 0

[Command]
name = "cpu26"
command = F, U, B, F, UF, U, B, c+a
time = 0

[Command]
name = "cpu27"
command = F, U, B, F, UF, U, B, c+z+b
time = 0

[Command]
name = "cpu28"
command = F, U, B, F, UF, U, B, c+z+a
time = 0

[Command]
name = "cpu29"
command = F, U, B, F, UF, U, B, c+z+x
time = 0

[Command]
name = "cpu30"
command = F, U, B, F, UF, U, B, c+z+B
time = 0

[Command]
name = "cpu31"
command = F, UD, B, F, UF, U, B, c+z+y
time = 0

[Command]
name = "cpu32"
command = F, U, BD, F, UF, U, B, c+z+y
time = 0

[Command]
name = "cpu33"
command = F, UF, B, F, UF, U, B, c+z+y
time = 0

[Command]
name = "cpu34"
command = D, D, D, D, D, D, D, x+y+c
time = 0
;----------------------------------------------------------------
;----------------------------------------------------------------
;-| Super Motions |--------------------------------------------------------
[Command]
name = "im_dead_inside"
command = ~F, F, F,B, x+y
time = 35

[Command]
name = "�r�Ԃ��n"
command = ~D, F, D, F, a
time = 25

[Command]
name = "�r�Ԃ��n2"
command = ~D, F, D, F, b
time = 25

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
name = "SmashKFUpper"
command = ~D, DB, B, D, DB, B, x;~F, D, DF, F, D, DF, x
time = 20


[Command]
name = "SmashKFUpper" 
command = ~F, D, DF, x
time = 20

[Command]
name = "SmashKFUpper2" 
command = ~F, D, DF, y
time = 20


;-| Special Motions |------------------------------------------------------
[Command]
name = "blocking"
command = $F,x
time = 3

[Command]
name = "EX�ՙ�"
command = ~F, D, DF, x+y

[Command]
name = "blocking" ;Same name as above (buttons in opposite order)
command = x,$F
time = 3

[Command]
name = "cut_xy"
command = ~D, DB, B, y+x

[Command]
name = "cut_y"
command = ~D, DB, B, y

[Command]
name = "cut_x"
command = ~D, DB, B, x

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
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_ab"
command = ~D, DF, F, a+b

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
name = "jump"    
command = D, $U
time = 12

[Command]
name = "�ً}���O"
command = z
time= 1

[Command]
name = "�ً}�����"
command = /$B,z
time = 1

[Command]
name = "�ӂ���΂�"
command = c
time = 1

[Command]
name = "�ӂ���΂�"
command = y+b
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

[Command]
name = "holdstart"
command = /s
time = 1

;-| Super Motions |--------------------------------------------------------
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

;---------------------------------------------------------------------------
[Statedef -1]
;---------------------------------------------------------------------------
;INTELIGENCE ARTIFICIAL [PRO]
[State -1, AI Defense]
type = ChangeState
triggerall = stateno!= [120,155] 
triggerall = roundstate= 2
triggerall = AILevel != 0
triggerall = ctrl
triggerall = InGuardDist 
trigger1 = (random<999*(AILevel**2/64.0)) 
value = 120

[State -1, AI Guard Counter]
type = ChangeState
value = 291
triggerall = var(51)= 1
triggerall = roundstate=2
triggerall = power>=1000
triggerall = statetype =S
trigger1 = stateno=150||stateno=151||stateno=152||stateno=153
trigger1 = p2bodydist x=[0,65]
trigger1 = enemynear,vel x=[-2,2]
trigger1 = random<=950

;Throw
[State -1, Throw When P2 Is Close]
type = ChangeState
value = 800
triggerall = (roundstate = 2) && AILevel
triggerall = !sysfvar(4)
triggerall = !var(58)
triggerall = StateType = S
triggerall = p2statetype!=A
triggerall = p2bodydist X <= 6
triggerall = numtarget(420) = 0
trigger1 = Random < (800 * (AIlevel ** 2 / 64.0))
trigger1 = ctrl
trigger1 = p2Movetype = I
;_-------------------------------------------------------------------------
[State -1, SIdestep/Dodge]
type = ChangeState
value = Ifelse(command="holdfwd",700,Ifelse(command="holdback",710,700))
triggerall = command = "�ً}���O"
triggerall = !AILevel && RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))|| (StateNo = [110,111])
;--------------------------------------------------------------------------
[State -1, rain flame LV2]
type = changestate
value = 4001
triggerall=AIlevel&&roundstate = 2 && statetype != A &&power >= 2000
triggerall=(enemynear,Movetype!=A)&&(enemynear,stateno!=[120,155])&&(enemynear,statetype!=L)
triggerall=(p2dist x>=190)&&(p2dist y=[-70,5])&&(Ifelse(var(1),random<200,random<150)*(AIlevel ** 2 / 64.0))
triggerall = !numhelper(3005) && !numhelper(3025) && !numhelper(3045) && !numhelper(3055)
trigger1 = ctrl
trigger2 = (stateno = [200,450])&&anim!=221&&stateno!=420&&movecontact
;---------------------------------------------------------------------------
[State -1, rain flame LV2]
type = changestate
value = 2500
triggerall=AIlevel&&roundstate = 2 && statetype != A &&power >= 5000
triggerall=(enemynear,Movetype!=A)&&(enemynear,stateno!=[120,155])&&(enemynear,statetype!=L)
triggerall=(p2dist x>=185)&&(p2dist y=[-120,5])&&(Ifelse(var(1),random<400,random<450)*(AIlevel ** 2 / 64.0))
triggerall = !numhelper(3005) && !numhelper(3025) && !numhelper(3045) && !numhelper(3055)
trigger1 = ctrl
trigger2 = (stateno = [200,450])&&anim!=221&&stateno!=420&&movecontact
;---------------------------------------------------------------------------
[State -1, Crouching Strong Punch]
type = ChangeState
value = 3050
triggerall = RoundState = 2
triggerall = AILevel != 0
triggerall = random<180*(AILevel**2/64.0)
triggerall = statetype != A
triggerall = enemynear,StateType = A
Triggerall = enemynear,StateType != L
triggerall = enemynear,movetype != H
triggerall = enemynear,stateno != [5020,5040]
triggerall = enemynear(var(58)),facing != facing
triggerall =!InGuardDist
triggerall = ctrl || (stateno = [20,22]) || (stateno = [100,101]) || (stateno = [120,149])
trigger1 = p2bodydist x = [-10+floor(8*(enemynear(var(58)),vel x)),23+floor(8*(enemynear(var(58)),vel x))]
trigger1 = p2bodydist y = [-100-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(39)),0-floor(8*(enemynear(var(58)),vel y)+(8*(8+1)/2)*fvar(39))]
;---------------------------------------------------------------------------
[State -1, Bullet Full Flame]
type = changestate
value = 1000
triggerall=AIlevel&&roundstate = 2 && statetype != A
triggerall=(p2Movetype!=A)&&(p2stateno!=[120,155])&&(p2statetype!=A)&&(p2statetype!=C)&&(p2statetype!=L)
triggerall=(p2dist x>=100)&&(Ifelse(var(1),random<50,random<40)*(AIlevel ** 2 / 64.0))
trigger1 = ctrl
trigger2 = (stateno = [200,449])&&anim!=221&&stateno!=420&&movecontact
;---------------------------------------------------------------------------
[State -1, ShadowSneak]
type = ChangeState
value = 1400
triggerall = AILevel && !sysfvar(4) && numenemy&&roundstate=2&&StateType != A
triggerall =(enemynear,stateno != [120, 155]) && (p2stateno != [5120, 5250]) && (p2statetype != A) && (p2statetype != L)
triggerall =(p2dist x>=63) && (p2dist y= [-80,0]) && (p2statetype != L) && random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = ctrl
trigger2 = (StateNo = [200,450])&&movecontact
;_--------------------------------------------------------------------------
;IM DEAD INSIDE
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 2500
triggerall = command = "im_dead_inside"
triggerall = power >= 5000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 1000
;---------------------------------------------------------------------------
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3600
triggerall = command = "TripleKFPalm2"
triggerall = power >= 2000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 1000 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 1250 && movecontact
;------------------------------------------------------------------------
[State negathibu anngisshu]
type = ChangeState
value = 1150
triggerall = command = "EX�ՙ�"
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = 200 && animelem = 3,>=0
trigger3 = stateno = 210 && animelem = 4,>=0
trigger4 = stateno = 215 && movecontact
trigger5 = stateno = 230 && animelem = 3,>=0
trigger6 = stateno = 250 && movecontact
trigger7 = stateno = 400 && animelem = 3,>=0
trigger8 = stateno = 410 && movecontact
trigger9 = stateno = 430 && animelem = 3,>=0
trigger10= stateno = 290 && animelem = 6,>=0
trigger11= stateno = 440 && animelem = 4,<=0

;---------------------------------------------------------------------------
;�r�Ԃ��n
[State Araburu Daichi]
type = ChangeState
value = 2300
triggerall = command = "�r�Ԃ��n"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact
trigger6 = stateno = 440 && movecontact
trigger7 = stateno = 290 && movecontact
trigger8 = stateno = 10878 && movecontact
trigger9 = stateno = 1200 && movecontact
trigger10 = stateno = 1298 && movecontact

;�r�Ԃ��n2
[State Araburu Daichi]
type = ChangeState
value = 2390
triggerall = command = "�r�Ԃ��n2"
triggerall = power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 400 && movecontact
trigger5 = stateno = 410 && movecontact
trigger6 = stateno = 440 && movecontact
trigger7 = stateno = 290 && movecontact
trigger8 = stateno = 10878 && movecontact
trigger9 = stateno = 1200 && movecontact
trigger10 = stateno = 1298 && movecontact
;---------------------------------------------------------------------------
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "TripleKFPalm"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 1000 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 1250 && movecontact
trigger6 = stateno = 1200 && movecontact
trigger7 = stateno = 10878 && movecontact
trigger8 = stateno = 1298 && movecontact
;---------------------------------------------------------------------------
;Smash
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3050
triggerall = command = "SmashKFUpper"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
;---------------------------------------------------------------------------
;Smash Kung Fu Upper (uses one super bar)
[State -1, Smash Kung Fu Upper]
type = ChangeState
value = 3155
triggerall = command = "SmashKFUpper2"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
;---------------------------------------------------------------------------
;Fast Kung Fu Palm (1/3 super bar)
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1277
triggerall = command = "QCF_xy"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 3179
trigger3 = stateno = 1298 && movecontact
trigger4 = stateno = 210 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 450 && movecontact
;---------------------------------------------------------------------------
;Strong Kung Fu Palm
[State -1, Strong Kung Fu Palm]
type = ChangeState
value = 1250
triggerall = command = "QCF_y"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 1000 && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Palm
[State -1, Light Kung Fu Palm]
type = ChangeState
value = 1000
triggerall = command = "QCF_x"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 240 && movecontact

;----------------------------------------------------------------------------------
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1297
triggerall = command = "cut_xy"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 1278 && movecontact
;--------------------------------------------------------------------
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1388
triggerall = command = "cut_y"
triggerall = power >= 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger2 = stateno = 240 && movecontact
;---------------------------------------------------------------------------
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 1288
triggerall = command = "cut_x"
triggerall = power >= 0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger2 = stateno = 240 && movecontact
;---------------------------------------------------------------------------
;�L�����[�I�t�L�b�N/�R�������t�p�~ �~�� �K������
[State -1, a]
type = ChangeState
value = 450
triggerall = command = "a"
triggerall = command = "holdfwd"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 205 && movecontact
trigger4 = stateno = 210 && movecontact
trigger4 = animelem = 6,<0
trigger5 = stateno = 215 && movecontact
trigger6 = stateno = 235 && movecontact
trigger7 = stateno = 400 && movecontact
trigger8 = stateno = 410 && movecontact
;---------------------------------------------------------------------------
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1450
triggerall = power >= 1000
triggerall = command = "QCF_ab"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 1250 && movecontact
trigger7 = stateno = 3179
trigger8 = stateno = 450 && movecontact
;---------------------------------------------------------------------------
;Light Kung Fu Zankou
[State -1, Light Kung Fu Zankou]
type = ChangeState
value = 1400
triggerall = command = "QCF_b"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 3179
;---------------------------------------------------------------------------
;Strong Kung Fu Zankou
[State -1, Strong Kung Fu Zankou]
type = ChangeState
value = 1410
triggerall = command = "QCF_a"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 230 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 3179
;---------------------------------------------------------------------------
;�K�[�h�L�����Z���ӂ���΂��U��
[State -1, 290]
type = ChangeState
value = 291
triggerall = command = "�ӂ���΂�"
triggerall = power >= 500
trigger1 = stateno = 150
trigger2 = stateno = 151
;---------------------------------------------------------------------------
;�󒆂ӂ���΂��U��
[State -1, Jump Strong Kick]
type = ChangeState
value = 690
triggerall = command = "�ӂ���΂�"
trigger1 = statetype = A
trigger1 = stateno != 106
trigger1 = ctrl
;---------------------------------------------------------------------------
;�ӂ���΂��U��
[State -1, 290]
type = ChangeState
value = 290
triggerall = command = "�ӂ���΂�"
triggerall = statetype != A
trigger1 = ctrl
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
;�_�E�����
[State -1, Taunt]
type = ChangeState
value = 702
triggerall = command = "�ً}���O"
triggerall = alive
trigger1 = stateno = 5050
trigger1 = pos y >=-40
trigger1 = vel y > 0

;---------------------------------------------------------------------------
;�ً}�����
[State -1, Taunt]
type = ChangeState
value = 710
triggerall = command = "�ً}�����"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;�K�[�h�L�����Z���ً}�����
[State -1, 701]
type = ChangeState
value = 710
triggerall = command = "�ً}�����"
triggerall = power >= 1000
trigger1 = stateno = 150
trigger2 = stateno = 151
;---------------------------------------------------------------------------
;�ً}���O
[State -1, Taunt]
type = ChangeState
value = 700
triggerall = command = "�ً}���O"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;�K�[�h�L�����Z���ً}���O
[State -1, 700]
type = ChangeState
value = 700
triggerall = command = "�ً}���O"
triggerall = power >= 1000
trigger1 = stateno = 150
trigger2 = stateno = 151
;---------------------------------------------------------------------------
;Power Charge
[State -1, Powah power]
type = ChangeState
value = 8000
triggerall = var(51) != 1
triggerall = Power != Powermax
triggerall = command = "holdy" && command = "holda"
triggerall = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
;�N�C�b�N�O�]
[State -1, 700]
type = ChangeState
value = 700
triggerall = command = "�ً}���O"
triggerall = power >= 1000
trigger1 = stateno = [200,499]
trigger1 = movecontact
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Kung Fu Throw
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
;---------------------------------------------------------------------------
[State -1, Kung Fu Throw]
type = ChangeState
value = 830
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
trigger1 = stateno != [100, 105]
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 5
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 5
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H
;---------------------------------------------------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact

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
trigger2 = (stateno = 200) && time > 5
trigger3 = (stateno = 230) && time > 6

;---------------------------------------------------------------------------
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
trigger2 = stateno = 400 && movecontact


;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 430)
trigger2 = (time > 9) || (movecontact && time > 5)

;---------------------------------------------------------------------------
;Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 400 && movecontact
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
