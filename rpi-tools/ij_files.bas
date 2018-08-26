#!/usr/bin/bas
    1 rem IJ_FILES.BAS - list IchigoJam RPi /files/*
    2 rem extracts first "line" from each *.bin file
    3 rem bas ij_files.bas <path> [<number> [<number>]]
   20 l=24 : if environ$("LINES")<>"" then l=val(environ$("LINES")) : ' var l = $LINES
   21 c=80 : if environ$("COLUMNS")<>"" then c=val(environ$("COLUMNS")) : ' var c = $COLUMNS
   22 width c : pl=int%(l/2) : ' var pl = pause lines
   23 pp=false : ' var pp = print extra print
   24 dt=0 : ' var dt = documentation type
   25 ash=false : ' var ash = always show help
   31 z1$=chr$(27)+"[1A" : ' var z1$ = ANSI cursor up 1 line
   32 z2$=chr$(27)+"[2A" : ' var z2$ = ANSI cursor up 2 lines
  100 a$=command$(1) : ' var a$ = pathname where *.bin are
  101 b$=command$(2) : ' var b$ = reference save number
  102 c$=command$(3) : ' var c$ = last save number
  110 fl$="" : if a$="" then gosub 10000 : else gosub 10200 : ' var fl$ = filename
  190 f$="" : ' var f$ = file line string
  191 ln=0 : ' var ln = start save number
  192 dln=0 : ' var dln = last save number
  193 nln=1 : ' var nln = next program line number
  194 pln=0 : ' var pln = program line number
  199 rem * which saves? *
  200 ln=val(b$) : dln=val(c$)
  210 if c$="" then dln=dln+20
  220 if ln>1 and c$="" then dln=ln : ln=0
  230 if dln<ln then dln=99
  250 dec ln
  260 if a$="" then a$="."
  299 rem * read lines *
  300 gosub 1010 : if fl$="" then goto 900
  310 get #1 : pln=asc(z$)
  320 get #1 : pln=(asc(z$)*256)+pln
  330 if pln=0 then close #1 : goto 901
  340 print dec$(ln,"");
  350 get #1 : nln=asc(z$)
  360 if nln=0 then close #1 : goto 902
  400 rem * print a line *
  410 for i=1 to nln : get #1 : if not asc(z$)=0 then print z$;
  415 next
  420 print
  430 get #1 : if not asc(z$)=0 then print asc(z$) : close #1 : goto 903
  440 close #1
  450 goto 300
  899 rem * save file has an issue *
  900 goto 998 : 'print " Last Save "+dec$(ln,"") : goto 998
  901 print " Error: no line number '"+fl$+"'" : goto 998
  902 print " Error: no line legnth '"+fl$+"'" : goto 998
  903 print " Error: no end of line '"+fl$+"'" : goto 998
  998 print
  999 end
 1000 rem * open file if there *
 1010 fl$="" : if ln=dln then return
 1020 inc ln : x$ = a$+"/"+edit$(dec$(ln,""),2)+".bin" : 'print x$
 1030 on error resume 1100
 1040 open x$ for input as #1
 1050 fl$=x$
 1060 close #1
 1100 on error goto 0
 1110 if fl$="" then goto 1010
 1120 open fl$ for random as #1 : field #1, 1 as z$
 1130 return 
10000 rem * interactive filename selector *
10005 pp=true
10010 shell "pwd"
10020 shell "ls -pL --group-directories-first"
10030 print spc(c-1)
10035 a$="" : print z1$;"file (quit or cd ...) "; : input a$
10036 print : print z2$
10040 if a$="" then print z1$ : goto 10030
10045 if a$="quit" or a$="QUIT" then print : end
10050 if not mid$(a$,1,2)="cd" then b$=a$ : a$="." : goto 10200
10060 if len(a$)=2 then print z1$ : print spc(c-1) : goto 10010
10070 if not len(a$)>3 then print z1$; : goto 10030
10080 if not mid$(a$,1,3)="cd " then print z1$; : goto 10030
10085 print z1$ : print spc(c-1)
10090 a$=mid$(a$,4)
10100 if a$="~" then a$="/home/sysop/devel/BASIC"
10110 rem * does directory exist *
10120 on error resume 10140
10130 chdir a$ : goto 10160
10140 on error goto 0
10150 print z2$ : print "  Error: '";a$;"' does not exist"
10160 goto 10010
10200 rem * does file exist *
10210 on error resume 10300
10215 x$="0" : if not b$="" then x$=b$
10220 open a$+"/"+x$+".bin" for input as #1
10230 fl$=a$
10250 close #1
10300 on error goto 0
10310 if fl$="" then print z1$ : print " Choose a IchigoJam save number:" : goto 10010
10320 if pp then print
10330 return
