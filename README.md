# IchigoJam-BASIC-english
IchigoJam BASIC command list command reference (English) (https://ichigojam.github.io/RPi/) 

This repo is an English translation of the Japanese text available from [IchigoJam-BASIC repo](https://github.com/fu-sen/IchigoJam-BASIC) by [fu-sen](https://github.com/fu-sen). It also replicates the http://ijprg.netlify.com/ access too, at http://prjij.netlify.com, used with MixJuice and the PanCake board. It should also work with IchigoLatte.

See [IchigoJam.md](./IchigoJam.md) for more info about the armv6 LPC1114FN28 project. The original README.md follows ...

## IchigoJam BASIC RPi Pinouts
<img src="https://ichigojam.github.io/RPi/image/pin.png" alt="IchigoJam BASIC RPi Pinouts" title="IchigoJam BASIC RPi Pinouts">

---

## IchigoJam BASIC command list

IchigoJam BASIC command reference (from Japanese to English)

IchigoJam BASIC instructions are listed, some text may need studying to interpret properly.

You can download the file list as a ZIP. If you are using GitHub / Git, you may use Clone.

When referring with RAW, when downloading a file again, The .txt file will be UTF-8 character code, CR + LF linefeed code (I changed the character code from May 14, 2016). On Windows it is possible to use Notepad.

* IchigoJam (Official) https://ichigojam.net/
* Strawberry Jam Recipe (Publisher) https://15jamrecipe.jimdo.com/

## PDF version

Mr. Masato Nishizawa made a PDF to the IchigoJam + PanCake command reference, It is open to the Facebook group IchigoJam-FAN. If you want to list it on the page, please print this and use it.

https://www.facebook.com/groups/ichigojam/626631837476573/

## MixJuice version

There is also a version that Mr. Kazuhiro Oshium made MixJuice compatible from this list.

https://www.facebook.com/groups/ichigojam/permalink/718904794915943/  
`? "MJ GET www.openspc2.org/data/m/ (command name in capital letter) .txt`  
For example? `"MJ GET www.openspc2.org/data/m/ABS.txt`  

## Notes on version notation

Corresponding version is listed under upper command name. In particular, "IchigoJam BASIC" without version notation is all version compatible. It does not correspond to "non-compliant" such as "IchigoJam BASIC RPi not supported" etc.

0.9.8 and 0.9.9 have no official release, only the RC version exists. If it is described as 0.9.8 or 0.9.9, it refers to those RC versions in general. In 1.0.0 and 1.1 and later, beta versions are sometimes written collectively.

1.1 beta (including 1.1.0 beta 1) inherits additional functions up to 1.0.2 beta 11. Therefore, some commands in 1.1 beta notation will work with 1.0.2 beta 11. (... → 1.0.2 beta 11 → 1.1.0 beta 1 → 1.1 beta 2 → 1.1 beta 3 → ... ). ".0" has been removed as a result of having published the Mongolian version with 1.1 beta 2) 1.0.2 Since beta12 is inheriting from 1.0.1 again, please note the difference in behavior (1.0.2 beta 12 has a function that does not include part of contents up to beta 11). However, in fact 1.0.2 is not officially released, 1.1.1 is officially released.

IchigoJam BASIC RPi has operation depending on the difference between version and hardware specification, Separately supported version is indicated at the top. The official version version notation of IchigoJam BASIC RPi is different from the original version of IchigoJam BASIC. IchigoJam BASIC 1.2.0 RPi ~ 1.2.4 RPI is based on IchigoJam BASIC 1.2.3. Please note that IchigoJam BASIC 1.2.5 RPi ~ 1.2.6 RPi is equivalent to IchigoJam BASIC 1.2b 56 ~ 1.2b 57 IoT.

Since IchigoJam PC has its own version notation, separately corresponding version is indicated on the top. IchigoJam PC 0.1 beta 1 ~ 0.1 beta 12 is based on IchigoJam BASIC 1.1, Basically we inherit the specification of 1.1.

IchigoJam BIG is based on regular IchigoJam BASIC 1.2.0. IchigoJam BIG does not describe when the operation is different, If there is no description, it will be the same as normal IchigoJam. Equivalent display is supported by the `VIDEO` command from 1.2.2.

IchigoJam website reflects the latest beta version. It can be confirmed with `VER()`. Ichigojam has an app distribution version running on Windows and macOS, linked on their site. These are common with IchigoJam BASIC, so we do not specifically consider it, There are restrictions such as incompatibility of input / output by PC operation, no body buttons, etc.

## license

This document is "IchigoJam BASIC Reference" which is officially published in CC, And "IchigoJam BASIC RPi document", Based on information such as the Facebook group "IchigoJam-FAN" is writing on its own, by Keiichi Shiga (@fu-sen), and translated by Paul Wratt (@paulwratt).

IchigoJam BASIC Reference: CC BY https://ichigojam.net/  
ver 1.2  
https://ichigojam.net/IchigoJam-1.2.html  
ver 1.1  
https://ichigojam.net/IchigoJam-1.1.html  
ver 1.0.1  
https://ichigojam.net/IchigoJam-1.0.1.html  
ver 0.9.9  
https://ichigojam.net/IchigoJam-0.9.9.html  
ver 0.9.7 (PDF)  
https://ichigojam.net/IchigoJam-BASIC-reference.pdf 

IchigoJam BASIC RPi document  
https://ichigojam.github.io/RPi/index_en.html  

Facebook group IchigoJam-FAN (Japanese)  
https://www.facebook.com/groups/ichigojam/  
Facebook group IchigoJam - FAN @ en (English)  
https://www.facebook.com/groups/ichigojamfan/  

Maded by Keiichi Shiga (Fu-sen.) | Keiichi SHIGA (BALLOON aka Fu-sen.), 2015-2018.

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License style="border-width:0" src="https://licensebuttons.net/l/by/4.0/88x31.png" /></a>

This sentence is provided under the [Creative Commons display 4.0](http://creativecommons.org/licenses/by/4.0/) international (CC BY 4.0) license.

[IchigoJam](https://ichigojam.net/) is a registered trademark of [jig.jp Corporation .](https://jig.jp/)
