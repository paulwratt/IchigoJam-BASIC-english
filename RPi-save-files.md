# IchigoJam BASIC RPi Save Files

In the `rpi-tools` folder there are some utilities to access, load and save `*.bin` files. They are written for BAS by Michel Haardt (of _cpmtools_ fame), and ANSI BASIC interpreter.  

You can get an armv7 binary or compile an up-to-date version of BAS from either [my standard](https://github.com/paulwratt/bas-2.5-plus) or [my enhanced](https://github.com/paulwratt/bas-2.5-pw) repo. The enhanced `BAS-2.5-pw` supports some other things like 256 colors (with `$TERM` set to `xterm-256color` or `fbterm`).  


# RPi Save File Tools

You can use the following info to rewrite the `rpi-tools` in another language, like Python, or as a Shell Script (if you are confident).

I have tried to keep the command format as close to IchigoJam BASIC as possible. `ij_save` will ignore source code lines that do not start with a number. If the save file does not exist then it is created. If for some reason your save file ends up being larger than _1024 bytes_, delete it first before creating it again. `ij_file` requires the package `nkf`, which can convert a text file to _Shift-JIS_, the format of character codes used by IchigoJam BASIC.

If the source text file only contains ASCII characters less than 127 (english), then it does not need to be converted first. I am not sure about Phonetic Chinese, Mongolian or French, which are only available via Firmware upgrades on IchogoJam (please let me know), but they will follow the same rules, with special characters needing to be remapped.

```
./ij_files.bas [<path> [<save number> [<last save number>]]]
./ij_list.bas <save number> [> <text file name>]
./ij_save.bas <save number> <source text file>
./ij_file.sh <in text file> <out text file>
```


# RPi Save File Format

Each _.bin_ file is a zero padded file of 1024 length, with no header information.

Each file starts with the first line number of the BASIC listing. It is a 16 bit little endian number (ie written in reverse as two 8 bit bytes). I always start my programs with line number `1`, so `hexdump -C _n_.bin` will show `01 00` as the first two bytes, which equals hex `0001`.

The next 8 bit byte is an _EVEN_ number between 2 and 254, which represents the number of characters till the end of the line, where a hex `00` is located. If the _actual_ line length is _ODD_, then there will be extra padding, so hex `00 00`, otherwise the last character will be hex `00`, before the next line number.

This _EVEN_ line length value is because the ARM CPU will read in 16 bit values, so when it reads the line lenght it also already has the first letter of that line, and since each line is _zero terminated_ it will need two zeros for odd numbered line lengths.

The first "line" is the same line that is printed in a `FILES` command. The next line repeats the same format, unless the line number is equal to `0`. IchigoJam BASIC is not case sensitive, and does not validate line contents until execution time.


# Example RPi Save File
```
/IchigoJam-BASIC-english/rpi-tools> hexdump -C 4.bin
00000000  01 00 0e 27 20 44 75 6d  70 20 4d 65 6d 6f 72 79  |...' Dump Memory|
00000010  00 00 05 00 08 43 4c 56  3a 43 4c 53 00 00 06 00  |.....CLV:CLS....|
00000020  16 41 3d 30 3a 27 3c 3d  20 73 74 61 72 74 20 61  |.A=0:'<= start a|
00000030  64 64 72 65 73 73 00 00  0a 00 06 4c 43 20 30 2c  |ddress.....LC 0,|
00000040  30 00 0b 00 0e 46 4f 52  20 4a 3d 30 20 54 4f 20  |0....FOR J=0 TO |
00000050  32 30 00 00 14 00 16 43  3d 22 22 3a 3f 48 45 58  |20.....C="":?HEX|
00000060  24 28 41 2c 34 29 3b 3a  3f 22 20 22 3b 00 16 00  |$(A,4);:?" ";...|
00000070  0c 46 4f 52 20 49 3d 30  20 54 4f 20 37 00 1e 00  |.FOR I=0 TO 7...|
00000080  0c 42 3d 50 45 45 4b 28  41 2b 49 29 00 00 28 00  |.B=PEEK(A+I)..(.|
00000090  12 3f 48 45 58 24 28 42  2c 32 29 3b 3a 27 3f 22  |.?HEX$(B,2);:'?"|
000000a0  20 22 3b 00 2a 00 04 4e  45 58 54 00 32 00 06 3f  | ";.*..NEXT.2..?|
000000b0  22 20 22 3b 00 00 34 00  0c 46 4f 52 20 49 3d 30  |" ";..4..FOR I=0|
000000c0  20 54 4f 20 37 00 3c 00  0c 42 3d 50 45 45 4b 28  | TO 7.<..B=PEEK(|
000000d0  41 2b 49 29 00 00 46 00  22 49 46 20 42 3c 33 32  |A+I)..F."IF B<32|
000000e0  20 54 48 45 4e 20 3f 22  2e 22 3b 20 45 4c 53 45  | THEN ?"."; ELSE|
000000f0  20 3f 43 48 52 24 28 42  29 3b 00 00 50 00 20 49  | ?CHR$(B);..P. I|
00000100  46 20 42 3e 30 20 41 4e  44 20 42 3c 38 20 54 48  |F B>0 AND B<8 TH|
00000110  45 4e 20 3f 43 48 52 24  28 38 2c 42 29 3b 00 00  |EN ?CHR$(8,B);..|
00000120  5a 00 18 49 46 20 42 3d  32 32 20 54 48 45 4e 20  |Z..IF B=22 THEN |
00000130  3f 43 48 52 24 28 38 2c  42 29 3b 00 64 00 22 49  |?CHR$(8,B);.d."I|
00000140  46 20 42 3e 32 34 20 41  4e 44 20 42 3c 32 38 20  |F B>24 AND B<28 |
00000150  54 48 45 4e 20 3f 43 48  52 24 28 38 2c 42 29 3b  |THEN ?CHR$(8,B);|
00000160  00 00 6e 00 0a 27 3f 43  48 52 24 28 42 29 3b 00  |..n..'?CHR$(B);.|
00000170  70 00 04 4e 45 58 54 00  78 00 08 41 3d 41 2b 38  |p..NEXT.x..A=A+8|
00000180  3a 3f 00 00 79 00 04 4e  45 58 54 00 00 00 00 00  |:?..y..NEXT.....|
00000190  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000400
```
The last line `00000400` is the hexidecimal value for the file legnth `1024`.
