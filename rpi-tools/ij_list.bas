#!/usr/bin/bas
    1 rem IJ_LIST.BAS - list IchigoJam RPi /files/*
    2 rem extracts each "line" from each *.bin file
    5 width 0
   20 l=24 : if environ$("LINES")<>"" then l=val(environ$("LINES")) : ' var l = $LINES
   21 c=80 : if environ$("COLUMNS")<>"" then c=val(environ$("COLUMNS")) : ' var c = $COLUMNS
   22 width c : pl=int%(l/2) : ' var pl = pause lines
   23 pp=false : ' var pp = print extra print
   24 dt=0 : ' var dt = documentation type
   25 ash=false : ' var ash = always show help
   31 z1$=chr$(27)+"[1A" : ' var z1$ = ANSI cursor up 1 line
   32 z2$=chr$(27)+"[2A" : ' var z2$ = ANSI cursor up 2 lines
  100 a$=command$(1) : ' var a$ = temporary command or filename
  110 fl$="" : if a$="" then gosub 10000 : else gosub 10200 : ' var fl$ = filename
  190 f$="" : ' var f$ = file line string
  191 ln=0 : ' var ln = file line number
  192 dln=0 : ' var dln = documented line count
  193 nln=0 : ' var nln = next program line number
  194 pln=0 : ' var pln = program line number
  299 rem * read lines *
  300 open fl$ for random as #1 : field #1, 1 as z$
  310 get #1 : pln=asc(z$)
  320 get #1 : pln=(asc(z$)*256)+pln
  330 if pln=0 then close #1 : goto 999
  340 inc dln : print ltrim$(dec$(pln,""));
  350 get #1 : nln=asc(z$)
  360 if nln=0 then close #1 : goto 998
  400 rem * print a line *
  410 for i=1 to nln : get #1 : if not asc(z$)=0 then print z$;
  415 next
  420 print
  430 get #1 : if not asc(z$)=0 then print asc(z$) : close #1 : goto 998
  440 goto 310
  998 print
  999 end
10000 rem * interactive filename selector *
10005 pp=true
10010 shell "pwd"
10020 shell "ls -pL --group-directories-first"
10030 print spc(c-1)
10035 a$="" : print z1$;"file (quit or cd ...) "; : input a$
10036 print : print z2$
10040 if a$="" then print z1$ : goto 10030
10045 if a$="quit" or a$="QUIT" then print : end
10050 if not mid$(a$,1,2)="cd" then goto 10200
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
10220 open a$ for input as #1
10230 fl$=a$
10250 close #1
10300 on error goto 0
10310 if fl$="" then print z1$ : print "  Error: '";a$;"' does not exist" : goto 10010
10320 if pp then print
10330 return
