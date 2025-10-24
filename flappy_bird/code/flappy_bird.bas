1 REM Speccy conversion by G Plowman
2 PRINT at 10,10; "LOADING GRAPHICS"
3 go sub 3000
5 bright 1
6 paper 7
7 ink 1: cls
8 let hscore=0
10 PRINT at 1,0: ink 2: PRINT "===  =   ==== ====  ====  =  ="
20 ink 3: PRINT               "=    =   =  = =   = =   = =  ="
21 ink 4: PRINT               "===  =   ==== ====  ====  ===="
22 ink 5: PRINT               "=    =   =  = =     =      ="
24 REM ink 1: PRINT               "=    =   =  = =     =      ="
26 REM ink 3: PRINT               "=    =   =  = =     =      ="
28 ink 2: PRINT               "=    === =  = =     =      ="
30 PRINT ""
32 ink 4: PRINT                "===  == ==== ==="
34 ink 2: PRINT                "=  = == =  = =  ="
36 ink 1: PRINT                "==== == ==== =  ="
38 ink 4: PRINT                "=  = == = =  =  ="
40 REM ink 3: PRINT                "=  = == =  = =  ="
42 ink 5: PRINT                "===  == =  = ==="
43 PRINT "": ink 0
48 print "Sinclair Spectrum Conversion"
49 print "By Gary Plowman"
50 print
51 print " Press any key to start"
53 print " Controls : Any key to fly"
55 let b$="" : let c$=""
56 for n=1 to 30 : let b$=b$+CHR$(132) : let c$=c$+CHR$(136) : next n
58 ink 3: print at 19,0 ; b$
60 for n=1 to 30
62 print at 1,n; " "; CHR$(144)
64 pause 5
66 print at 1,n; " "; CHR$(145)
68 beep .02,1
70 pause 5
75 if inkey$<>"" then go to 200
80 next n
85 print at 1,n; " "
86 go to 60 
200 let score = int (0): let r = 1
202 dim x(10): dim h(10)
203 let pipes = 1 
204 let fly = 12 : let anim = 0
205 bright 1: paper 7: ink 2
206 cls
210 print at 10,10; "G E T  R E A D Y !"
220 print ""
222 ink 1: print at 12,10; "  "; chr$(144)
226 print
227 ink 2: print "      Tap to fly"
230 if inkey$="" then go to 230
300 REM ****** Start ******
302 for o=1 to 10
303 let h(o)=int (rnd * 8) + 1
305 next o
306 for l=1 to 10
308 let x(l) = 25 + (l * 5)
309 next l
310 go sub 1000
600 go sub 310
999 REM *************************
1000 REM ****** Draw pipes ******
1002 cls
1010 ink 1: print at fly,10; "  "; chr$(144): let fly = fly + 1
1011 ink 3: plot 0,20: draw 240,0
1012 if anim = 1 then ink 1: print at fly-1,10; "  "; chr$(145)
1013 let anim = 0
1016 let r = r + 1
1017 ink 3: print at 0,2; "Score: "; score: print at 0,20; "Hi-Score: "; hscore
1018 if inkey$<>"" then let fly = fly - 2: beep .01, 2
1030 for p=1 to 10 
1033 if inkey$<>"" then let anim = 1
1035 ink 4
1038 let bh = h(p) * 8: if x(p) < 30 AND x(p) > 1 AND h(p) > 0 then plot x(p) * 8, 3 * 8: draw 0,bh: draw 8,0: draw 0,-(bh)
1039 let nh = int(13-h(p) * 8): if x(p) < 30 AND x(p) > 1 AND h(p) > 0 then plot x(p) * 8,150: draw 0,-nh: draw 8,0: draw 0,nh
1041 if x(p) < 1 then let h(p) = int(rnd * 8) + 1 
1042 if x(p) < 1 then let x(p) = 40
1050 REM ink 3: if p = 4 then print at 19,0 c$
1052 let x(p) = x(p) - 1
1059 if x(p) = 9 AND h(p) > 0 then beep .02,3: let score = score + 1
1070 if x(p) = 12 AND fly > 19 - h(p) then go sub 1200
1075 if x(p) = 12 AND fly < 19 - (h(p) + 3) then go sub 1200
1076 if fly = 20 then go sub 1200
1080 next p
1100 return
1200 REM ****** Dead******
1210 print at 10,4; "Ouch!!"
1220 beep .3,7: beep .3,2: beep .5,-3
1240 print at 12,4; "Hit enter to restart"
1300 if inkey$=chr$(13) then go to 200
1310 go to 1300
3000 let daa = 0
3002 for n = 0 to 167
3005 read daa
3010 data 12, 18, 37, 193, 254, 66, 60, 0, 12, 18, 37, 193, 254, 126, 0, 0, 0, 60, 66, 64,64, 66, 60, 0, 0, 120, 68, 66, 66, 68, 120, 0, 0, 126, 64, 124, 64, 64, 126, 0, 0, 126, 64, 124, 64, 64, 64, 0, 0, 60, 66, 64, 78, 66, 60, 0, 0, 66, 66, 126, 66, 66, 66, 0, 0, 62, 8, 8, 8, 8, 62, 0, 0, 2, 2, 2, 66, 66, 60, 0, 0, 68, 72, 112, 72, 68, 66, 0, 0, 64, 64, 64, 64, 64, 126, 0, 0, 66, 102, 90, 66, 66, 66, 0, 0, 66, 98, 82, 74, 70, 66, 0, 0, 60, 66, 66, 66, 66, 60, 0, 0, 124, 66, 66, 124, 64, 64, 0, 0, 60, 66, 66, 82, 74, 60, 0, 0, 124, 66, 66, 124, 68, 66, 0, 0, 60, 64, 60, 2, 66, 60, 0, 0, 254, 16, 16, 16, 16, 16, 0, 0, 66, 66, 66, 66, 66, 60, 0, 0
3030 poke usr "a" + n, daa
3040 next n 
3050 return
