#!/usr/bin/bas
    1 rem IJ_SAVE.BAS - save IchigoJam RPi /files/*
    2 rem convert a text file to *.bin file with padding
    3 rem bas ij_save.bas <number> <listing>
   20 l=24 : if environ$("LINES")<>"" then l=val(environ$("LINES")) : ' var l = $LINES
   21 c=80 : if environ$("COLUMNS")<>"" then c=val(environ$("COLUMNS")) : ' var c = $COLUMNS
   22 width c : pl=int%(l/2) : ' var pl = pause lines
   23 pp=false : ' var pp = print extra print
   24 dt=0 : ' var dt = documentation type
   25 ash=false : ' var ash = always show help
   31 z1$=chr$(27)+"[1A" : ' var z1$ = ANSI cursor up 1 line
   32 z2$=chr$(27)+"[2A" : ' var z2$ = ANSI cursor up 2 lines
  100 a$=command$(2) : ' var a$ = filename
  101 b$=command$(1) : ' var b$ = .bin number
  102 c$="" : ' var c$ = first character
  103 s=0 : ' var s = first space character
  110 fl$="" : if a$="" then gosub 10000 : else gosub 10200 : ' var fl$ = filename
  190 f$="" : ' var f$ = file line string
  191 ln=0 : ' var ln = file line number
  192 dln=0 : ' var dln = document length count
  193 nln=0 : ' var nln = next program line number
  194 pln=0 : ' var pln = program line number
  195 w$="" : ' var w$ = write file line string
  299 rem * read lines *
  300 open fl$ for input as #1
  301 open b$+".bin" for random as #2 : field #2, 1 as z$
  310 while not eof(1)
  320   line input #1,f$
  330   f$=ltrim$(f$) : c$=left$(f$,1)
  340   if val(c$)=0 then goto 440 : ' not a line number
  350   s=instr(f$," ")
  360   if s=0 then goto 440 : ' no space after line number
  400   pln=val(left$(f$,s-1))
  410   w$=mid$(f$,s+1,len(f$)-s)
  420   c$=hex$(pln,4)
  430   gosub 1010 : gosub 3010 : ' write line
  440 wend
  450 gosub 4010 : ' write padding
  500 close #1
  910 print "SAVE ";b$
  920 print "Saved ";dln;"bytes"
  930 if dln>1024 then print "Bad Save: too long (1024)"
  998 print
  999 end
 1000 rem * write line number, line length *
 1010 x$=chr$(val("&h"+right$(c$,2)))
 1020 rset z$=x$
 1021 put #2 : inc dln
 1030 x$=chr$(val("&h"+left$(c$,2)))
 1040 rset z$=x$
 1041 put #2 : inc dln
 1050 if (len(w$) mod 2)=1 then x$=chr$(len(w$)+1)  else x$=chr$(len(w$))
 1060 rset z$=x$
 1061 put #2 : inc dln
 1099 return
 3000 rem * write line to file *
 3010 for i=1 to len(w$)
 3020   x$=mid$(w$,i,1)
 3030   rset z$=x$
 3031   put #2 : inc dln
 3040 next
 3050 rset z$=chr$(0)
 3051 put #2 : inc dln
 3060 if (len(w$) mod 2)=1 then rset z$=chr$(0) : put #2 : inc dln
 3099 return
 4000 rem * write zero padding to 1024 *
 4010 for i=dln to 1023
 4020   rset z$=chr$(0)
 4021   put #2
 4030 next
 4099 return
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
