1 REM ********** library includes *********
2 REM **** needed for SCREEN$ in zxbasic
# include <screen.bas>
3 REM *************************************

10 REM *********ZX Code Club***********
15 REM * ZX Breakout by G Plowman 2015*
20 REM ********************************
25 go sub 7000
30 ink 1: paper 7: border 4: CLS
35 let lives=3
40 REM ***** Initialising variables
50 print at 2,10; ink 7; bright 1; paper 2; "ZX BREAKOUT"; bright 0; paper 7; ink 1; at 6,0; "Taken from..."; at 8,0; "ZX Spectrum games Code Club Book": pause 0
100 go sub 300: REM initialise
120 go sub 500: REM menu
130 go sub 1000: REM main loop for game
200 goto 30
300 let ply=2: let win=0: dim a(9,2): dim d(30): let lvl=1: let posy=30: let x=10: let time=0: let score=0: let timer=0: let mov=11: let pos=11: let vx=0: let vy=0: let speed=1: let ball=0: let bx=0: let by=0: let score2=0
310 let b$= " "+CHR$ (147)+CHR$ (145)+ " ": let w$=CHR$(146)+CHR$(146)
400 return
500 CLS
510 let w$=CHR$ (146)
520 for n = 0 to 31
530 print ink 2; at 1,n; w$; at 21,n; w$
540 next n 
545 for n = 0 to 20:
546 print ink 2; at n,0; w$; at n,31; w$
549 next n
550 return
1000 REM main loop
1005 print at 20,x-2; " "; b$; ""
1010 let i$=inkey$: let kemp=IN 31
1020 let timer=timer+1
1030 if (i$="z" OR kemp=2) AND x>2 then let x=x-1:
1040 if (i$="x" OR kemp=1) AND x<29 then let x=x+1
1045 if i$="z" OR i$="x" OR kemp>0 then print at 20,x-2; " ";b$;" "
1050 if (i$=chr$(32) OR kemp=16) AND ball = 0 then let vx=(rnd*1.5)-(rnd*1.5): let vy=1: let ball=1: let bx=x: let by=19
1060 if timer = 5 then go sub 3000
1070 if ball=1 then go sub 4000
1080 print at 0,2; "SCORE:";score;" (lvl:";lvl;") Lives:";lives
2000 go to 1010
3000 REM draw blocks
3010 for n = 1 to 20 step 2
3020 for p = 1 to 10 step 2
3025 let ir=rnd*4+1
3030 print at p+2,n+4; ink 0; paper ir; "__":
3050 next p 
3060 next n 
3070 let timer=6
3100 return 
4000 REM ***** Ball Move
4005 print at by,bx;" "
4010 let bx=bx+vx: let by=by+vy 
4014 let y$=SCREEN$(int(by), int(bx))
4015 if y$="_" then let score = score+1: beep .008,vx+bx: let score2=score2+2: let vy=-vy*speed 
4016 if by>=19 and abs (bx-x)<2 then let vx=((rnd*2)+1)-((rnd*2)+1): let vy=-vy*speed: print at 20,x-2;" ";b$;" "
4020 print at by,bx; ink 2; chr$(144)
4040 if bx>29 then let vx=-(vx*speed)
4050 if bx<2 then let vx=-(vx*speed)
4060 if by>=20 then let ball=0: let lives =lives-1: border 2: beep 1,0: border 4
4070 if by<3 then let vy=-(vy*speed)
4080 if lives=0 then go sub 5000:
4090 if score2>70 then go sub 6000: REM next level:
4200 return 
5000 REM ***** restart
5010 print at 10,5; flash 1; paper 6; ink 2; "G A M E  O V E R"
5030 for n=1 to 200
5050 next n
5100 print at 12,5; "Press Key to Restart"
5110 if inkey$="" then go to 5110
5120 go to 30
6000 REM ***** next level
6005 let lvl=lvl+1: CLS: print at 10,10; flash 1; "L E V E L";lvl
6010 beep 1,13
6020 let timer=2
6050 for n=1 to 100
6055 beep .001,n/10
6060 next n
6070 let score2=0
6080 let ball=0
6100 goto 120
7000 REM ***** create UDG graphics!!
7010 for n=0 to 31
7020 read graph
7030 poke usr "a"+n,graph 
7050 next n 
7060 return
7190 REM ***** Ball
7200 data bin 00111100
7210 data bin 01100110
7220 data bin 01011110
7230 data bin 01011110
7240 data bin 01111110
7250 data bin 00111100
7260 data bin 00000000
7270 data bin 00000000
7280 REM *** BAT left side - using full numbers
7300 data 252,42,41,2,252,248,0,223
7370 REM ***** Wall
7400 data 231,195, 165, 24,24,165,195,231
7470 REM ***** Bat right side
7480 data 63,84,148,64,63,31,0,7