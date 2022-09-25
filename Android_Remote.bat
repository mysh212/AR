    :restart
echo off
cls
color 6b
%cmd2%
md "C:\Program Files\admin"
set cl=%USERPROFILE%\AppData\Local\212\android-remote\
set acl=%ProgramFiles%\212\android-remote\
cls
set fn=%~nx0
cd %~dp0
if EXIST "C:\Program Files\admin" set admin=#
rd "C:\Program Files\admin"
set fl=%cd%
md %cl%killtask
set ca=6
set cb=b
cls
if {%visionb%1}=={1} (goto visionb)
goto vision
:visionb
if EXIST "%ProgramFiles%\212\android-remote\backup\backup.bat" (
fc "%ProgramFiles%\212\android-remote\backup\backup.bat" "%fl%\%fn%"
) else (
fc "%fl%\%fn%" "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat"
)
if {%ERRORLEVEL%}=={1} (goto edit)
rd /S /Q %cl%tmp
:back
set a=1
cd %~dp0
cd ..
cd adb
md AppBackup
md PulledFile
md PulledBackup
set adb%z%l=%cd%
start /min adb%z% start-server>nul
color 6b&cls
if {%killtask%1}=={11} (
title 結束 執行 %ch%
color FE
::mode con cols=20 lines=9
echo %qtime%
timeout %qtime% /nobreak
md %cl%killtask\%taskpid%
)
:e
if {%l%1}=={11} (
adb %w% wait-for-device
if not {%r%}=={1} (set q8=1)
goto f
)
if {%o%1}=={11} (
if EXIST %cl%killtask\%taskpid% (rd /S /Q %cl%killtask\%taskpid%&exit)
if %times%1 GTR 999991 (set timet=%times%&goto e2)
title 執行 %ch%
color 8F
mode con cols=20 lines=9
timeout %times%
mode con cols=120 lines=30
color 6b
cls
)
:ce
if {%r%}=={1} (set t=&goto f)
if {%re%}=={1} (set t=&goto f)
if {%o%}=={1} (set t=&goto f)
goto er
:e2
title 執行 %ch%
color 8F
mode con cols=20 lines=9
timeout 99999
set /A timet=%timet% - 99999
if %timet%1 GTR 999991 (goto e2)
timeout %timet%
mode con cols=120 lines=30
color 6b
cls
goto ce
:er
set n=
if EXIST %cl%ntt.st (
set /P n=<%cl%ntt.st
set n=%n: =%
if {1%n%1}=={111} (echo ok&call set t=start /min /high )
)
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\tmode" (
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\tmode\1" set tcmd=
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\tmode\2" set tcmd=1
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\tmode\3" set tcmd=2
)
if EXIST "%ProgramFiles%\212\android-remote\tmode" (
if EXIST "%ProgramFiles%\212\android-remote\tmode\1" set tcmd=
if EXIST "%ProgramFiles%\212\android-remote\tmode\2" set tcmd=1
if EXIST "%ProgramFiles%\212\android-remote\tmode\3" set tcmd=2
)
if EXIST %acl%color goto color
if EXIST %cl%color goto color
goto scolor
:color
set colort=5
:ccolor
set randomc=%random%
set /A color=%randomc% / 100
set /A c=%randomc% / 100
set /A colorn=%randomc% - (%color% * 100)
set /A catmp=%colorn% /10
set /A ca=%colorn% / 10
set /A cb=%colorn% %% 10
set /A n=%random% %% 2
if {%n%}=={1} (
if {%cb%}=={1} (set cb=a)
if {%cb%}=={2} (set cb=b)
if {%cb%}=={3} (set cb=c)
if {%cb%}=={4} (set cb=d)
if {%cb%}=={5} (set cb=e)
if {%cb%}=={6} (set cb=f)
)
set /A colort=%colort% - 1
color %ca%%cb%
if {%colort%}=={0} (goto scolor)
goto ccolor
cls
:scolor
if {1%1}=={1bkpautotap} (color 8F&mode con cols=20 lines=9&timeout /nobreak 3&%adbl%\adb%z% shell input tap %m1% %m2%&exit)
set iplist=1
set iplistnumber=
setlocal EnableDelayedExpansion
if not EXIST %cl%iplist\iplist.lst (goto skipipconnect)
for /f %%b in (%cl%iplist\iplist.lst) DO (
call set iplistn=%%b
if {1%%b}=={1} (goto skipit)
call set iplistn!iplist!=%%b
echo !iplist! : !iplistn!
call set iplistnumber=!iplistnumber!!iplist!
call set /A iplist=!iplist! + 1
)
:skipit
choice /c 0!iplistnumber! /m 請選擇您想要連接的ip:
set /A ipconnect=%ERRORLEVEL% - 1
echo %ipconnect%
if {%ipconnect%}=={0} (goto skipipconnect)
set connectip=1
for /f %%b in (%cl%iplist\iplist.lst) DO (
if {!connectip!}=={!ipconnect!} (
adb connect %%b
adb connect %%b:2129
set iplistn=%%b
goto choiceipspc
)
call set /A connectip=!connectip! + 1
)
)
goto skipipconnect
:choiceipspc
choice /c 120 /n /m 請選擇第幾空間
if {%ERRORLEVEL%}=={1} (
call set zf= -s !iplistn!
call set z= -s !iplistn!
)
if {%ERRORLEVEL%}=={2} (
call set zs= -s !iplistn!
call set z= -s !iplistn!
)
:skipipconnect
if {%lcon%1}=={11} (set lcon=&goto label8)
if EXIST "%ProgramFiles%\212\android-remote" goto check
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote" goto check
xcopy /Y "%fl%\%fn%" "%USERPROFILE%\AppData\Local\212\android-remote\backup\"
del /Q "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat"
ren "%USERPROFILE%\AppData\Local\212\android-remote\backup\%fn%" "backup.bat"
cls
echo 您應該是第一次使用吧......
echo 尚未完成設定
title %admin%設定作業
echo "(1) _______________     (2)_______________    (3)_______________      "
echo "   |>_                    |>_                   |>_                   "
echo "   |______________        |______________       |______________       "
echo "   |212 }test             |212 }test            |test                 "
echo "   |done.                 |done.                |done.                "
echo "   |212 }                 |請按任意鍵繼續 . . . |請按任意鍵繼續 . . . "
choice /c 123 /n /m 請選擇您想要的模式:
set first=%ERRORLEVEL%
echo 設否將設定鎖定在系統管理員?
choice
if {%ERRORLEVEL%}=={1} (
if {%admin%}=={#} (
md %ProgramFiles%\212\android-remote\mode\%first%
goto ok)   
echo "       ^       "
echo "      /|\      "
echo "     / | \     "
echo "    /  |  \    "
echo "   /   |   \   "
echo "  /____|____\  "
echo "  \    |    /  "
echo "   \   |   /   "
echo "    \  |  /    "
echo "     \ | /     "
echo "      \|/      "
echo "       v       "
echo 您未以系統管理員執行此程式，麻煩以右鍵[以系統管理員執行[A]]。謝謝。
pause)
md %USERPROFILE%\AppData\Local\212\android-remote\mode\%first%
:ok
echo OK，設定完成。
echo 如果您要進行其他進階設定，請在Android遙控器裡輸入"set"。
timeout 5
:check
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\mode\1" set mode=1
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\mode\2" set mode=2
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\mode\3" set mode=3
if EXIST "%ProgramFiles%\212\android-remote\mode\1" set mode=1
if EXIST "%ProgramFiles%\212\android-remote\mode\2" set mode=2
if EXIST "%ProgramFiles%\212\android-remote\mode\3" set mode=3
title %admin%...
title %admin%正在連線...
cls
goto label8
:chechpd
if EXIST 1 set r=1
if EXIST 2 set r=2
if EXIST 3 set r=3
if EXIST 4 set r=4
if EXIST 5 set r=5
if EXIST 6 set r=6
if EXIST 7 set r=7
if EXIST 8 set r=8
if EXIST 9 set r=9
if EXIST 0 set r=0
goto %rt%
:password
if EXIST "%ProgramFiles%\212\android-remote\1" (
cd "%ProgramFiles%\212\android-remote\1"
set rt=udhj
goto chechpd
)
if EXIST "%USERPROFILE%\AppData\Local\212\android-remote\1" (
cd "%USERPROFILE%\AppData\Local\212\android-remote\1"
set rt=udhj
goto chechpd
)
:udhj
set ac=%r%
cd ..
cd 2
set rt=udhj2
goto chechpd
:udhj2
set bc=%r%
cd ..
cd 3
set rt=udhj3
goto chechpd
:udhj3
set cc=%r%
cd ..
cd 4
set rt=udhj4
goto chechpd
:udhj4
set dc=%r%
cls
if {%1}=={%ac%%bc%%cc%%dc%} (goto checkok)
@COLOR 4F
mode con cols=15 lines=5
echo 由於程式碼
echo  遭到更改
echo  所以請您
echo  輸入密碼
timeout 3 /nobreak>nul
mode con cols=20 lines=10
cls
echo         ***
echo       *** ***
echo      ***   ***
echo       ________
echo      /       /
echo      \       \
echo      /_______/
echo.
echo      ○○○○
choice /c 0123456789 /n>nul
cls
set /A a=%ERRORLEVEL%-1
cls
echo         ***
echo       *** ***
echo      ***   ***
echo       ________
echo      /       /
echo      \       \
echo      /_______/
echo.
echo      ●○○○
choice /c 0123456789 /n>nul
cls
set /A b=%ERRORLEVEL%-1
cls
echo         ***
echo       *** ***
echo      ***   ***
echo       ________
echo      /       /
echo      \       \
echo      /_______/
echo.
echo      ●●○○
choice /c 0123456789 /n>nul
cls
set /A c=%ERRORLEVEL%-1
cls
echo         ***
echo       *** ***
echo      ***   ***
echo       ________
echo      /       /
echo      \       \
echo      /_______/
echo.
echo      ●●●○
choice /c 0123456789 /n>nul
cls
echo         ***
echo       *** ***
echo      ***   ***
echo       ________
echo      /       /
echo      \       \
echo      /_______/
echo.
echo      ●●●●
set /A d=%ERRORLEVEL%-1
if {%a%}=={%ac%} (
if {%b%}=={%bc%} (
if {%c%}=={%cc%} (
if {%d%}=={%dc%} (
mode con cols=20 lines=6
goto checkok
)
)
)
)
echo 密碼錯誤!!
if {%pderror%}=={3} (
copy /Y "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" %fl%\%fn%
copy /Y "%ProgramFiles%\212\android-remote\backup\backup.bat" %fl%\%fn%
exit)
goto udhj
:checkok
color 6b
echo 請問您要...
echo 1.解除鎖定
echo 2.直接執行
echo 3.復原程式
choice /c 123
if {%ERRORLEVEL%}=={1} (goto 000)
if {%ERRORLEVEL%}=={2} (mode con cols=90 lines=9001&goto back)
if {%ERRORLEVEL%}=={3} (copy /Y "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" "%fl%\%fn%"&copy /Y "%ProgramFiles%\212\android-remote\backup\backup.bat" "%fl%\%fn%")

:000
set visionb=backup
call %fl%\%fn%
:backup
md "%USERPROFILE%\AppData\Local\212\android-remote\backup\">nul
set /A vision=%vision% + 1
echo>>%fl%\%fn% set vision=%vision%
echo 是否鎖在系統管理員?
choice /c yn
if {%ERRORLEVEL%}=={1} (goto 001)
if {%ERRORLEVEL%}=={2} (goto 002)
:001
if {%admin%}=={#} (
del /Q "%ProgramFiles%\212\android-remote\backup\backup.bat"
copy /Y %fl%\%fn% "%ProgramFiles%\212\android-remote\backup\"
ren "%ProgramFiles%\212\android-remote\backup\%fn%" backup.bat
if {%set%1}=={51} (goto s001)
)
goto setadmin
:002
del /Q "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat"
copy /Y %fl%\%fn% "%USERPROFILE%\AppData\Local\212\android-remote\backup\"
ren "%USERPROFILE%\AppData\Local\212\android-remote\backup\%fn%" backup.bat
if {%set%1}=={51} (goto s002)
:s001
cls
goto settings
:s002
cls
goto settings
:edit
goto password
@COLOR 4F
set a=/!\
set b=ERROR
set c=%y%%i%%y%
set d=     
set t=%k%%u%
set a=
set b=
set c=
set d=
TITLE %admin%      /!\      /!\      /!\      /!\      /!\      /!\      /!\      /!\      /!\
ECHO 偵測到程式碼遭到變更
choice /c pe5 /t 1 /n /d 5 /m 即將在五秒後關閉...
if {%ERRORLEVEL%}=={2} (
xcopy "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" "%fl%\%fn%"
exit)
if {%ERRORLEVEL%}=={1} (goto password)
choice /c pe4 /t 1 /n /d 4 /m 如欲輸入密碼請按P
if {%ERRORLEVEL%}=={2} (
xcopy "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" "%fl%\%fn%"
exit)
if {%ERRORLEVEL%}=={1} (goto password)

choice /c pe3 /t 1 /n /d 3 /m 如欲輸入密碼請按P
if {%ERRORLEVEL%}=={2} (
xcopy "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" "%fl%\%fn%"
exit)
if {%ERRORLEVEL%}=={1} (goto password)

choice /c pe2 /t 1 /n /d 2 /m 如欲離開請按E
if {%ERRORLEVEL%}=={2} (
xcopy "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" "%fl%\%fn%"
exit)
if {%ERRORLEVEL%}=={1} (goto password)

choice /c pe1 /t 1 /n /d 1 /m 如欲離開請按E
if {%ERRORLEVEL%}=={2} (
xcopy "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" "%fl%\%fn%"
exit)
if {%ERRORLEVEL%}=={1} (goto password)
if {%ERRORLEVEL%}=={3} (
xcopy /Y "%USERPROFILE%\AppData\Local\212\android-remote\backup\backup.bat" "%fl%\%fn%"
pause
exit)

























:label13
if {%re%}=={1} (goto label13')
if {%r%}=={1} (goto label13')
set /P x='X座標  '
set /P y='Y座標  '
:label13'
adb%z% shell input tap %x% %y%
goto label8
:label14
set /P x='X座標  '
set /P y='Y座標  '
set /P long='時長  '
set /P x2='X座標(結束點)  '
if {%x2%}=={\} (adb%z% shell input swipe %x% %y% %x% %y% %long%&goto label8)
set /P y2='Y座標(結束點)  '
adb%z% shell input swipe %x% %y% %x2% %y2% %long%
goto label8
:label7
adb%z% shell am force-stop com.cloudtv
adb%z% shell am start com.cloudtv
timeout 5
cls
adb%z% shell input keyevent 20 22 22 23
timeout 2
cls
adb%z% shell input keyevent 23
adb%z% shell am force-stop com.cloudtv
cls
color 27
echo 衛星電視簽到成功!!
timeout 8
goto label2
:label11
if {1%re%}=={1} (set /P con=請輸入您的設備IP:192.168.)
adb%z% connect 192.168.%con%:2129
adb%z% connect 192.168.%con%
for /f %%b in (%cl%iplist\iplist.lst) DO (
if {%%b}=={192.168.%con%} (
if {1%re%}=={1} (choice /c 120 /n /m 請選擇第幾空間)
if {%ERRORLEVEL%}=={1} (set zf= -s 192.168.%con%&set z= -s 192.168.%con%)
if {%ERRORLEVEL%}=={2} (set zs= -s 192.168.%con%&set z= -s 192.168.%con%)
goto label8
)
)
if {1%re%}=={1} (choice /c 120r /n /m 請選擇第幾空間[r=記住IP])
if {%ERRORLEVEL%}=={1} (set zf= -s 192.168.%con%&set z= -s 192.168.%con%)
if {%ERRORLEVEL%}=={2} (set zs= -s 192.168.%con%&set z= -s 192.168.%con%)
if {%ERRORLEVEL%}=={4} (
echo 192.168.%con%>>%cl%iplist/iplist.lst
choice /c 120 /n /m 請選擇第幾空間
if {%ERRORLEVEL%}=={1} (set zf= -s 192.168.%con%&set z= -s 192.168.%con%)
if {%ERRORLEVEL%}=={2} (set zs= -s 192.168.%con%&set z= -s 192.168.%con%)
)
goto label8
:label3
adb%z% shell input keyevent 82 19 19 19 23
adb%z% shell input keyevent 21 23
goto label2
:ccon
set /P con=請輸入您的設備IP:
adb%z% connect %con%:2129
adb%z% connect %con%
for /f %%b in (%cl%iplist\iplist.lst) DO (
if {%%b}=={%con%} (
choice /c 120 /n /m 請選擇第幾空間
if {%ERRORLEVEL%}=={1} (set zf= -s %con%&set z= -s %con%)
if {%ERRORLEVEL%}=={2} (set zs= -s %con%&set z= -s %con%)
goto label8
)
)
choice /c 120r /n /m 請選擇第幾空間[r=記住IP]
if {%ERRORLEVEL%}=={1} (set zf= -s %con%&set z= -s %con%)
if {%ERRORLEVEL%}=={2} (set zs= -s %con%&set z= -s %con%)
if {%ERRORLEVEL%}=={4} (
echo %con%>>%cl%iplist/iplist.lst
choice /c 120 /n /m 請選擇第幾空間
if {%ERRORLEVEL%}=={1} (set zf= -s %con%&set z= -s %con%)
if {%ERRORLEVEL%}=={2} (set zs= -s %con%&set z= -s %con%)
)
goto label8
:label4
adb%z% shell input keyevent 82 19 19 19 23
adb%z% shell input keyevent 4 20 20 23
goto label2



::看不懂
:startadmin
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
cd %adbl%
goto %back%











:label16
echo 從檔案__錄影到檔案__
choice /c 0123456789 /N
cls
set /A s=%ERRORLEVEL% -1
echo 從檔案%s%_錄影到檔案__
choice /c 0123456789 /N
cls
set /A start=%s% * 10 + (%ERRORLEVEL% - 1)
echo 從檔案%start%錄影到檔案__
choice /c 0123456789 /N
cls
set /A s=%ERRORLEVEL% -1
echo 從檔案%start%錄影到檔案%s%_
choice /c 0123456789 /N
cls
set /A end=%s% * 10 + (%ERRORLEVEL% - 1)
set /A long=(%end% - %start% + 1) * 3
cls
for /L %%d in (%start% 1 %end%) DO if EXIST screenrec%%d.mp4 goto recloexist
:recloexistr
color 27
echo                                 *****
echo                                *****
echo 即將錄影%long%分鐘                *****
echo                    *****     *****
echo                     *****   *****
echo                      ***** *****
echo                       *********
echo                        *******
echo                         *****
pause
cls
choice /T 3 /c 1234567890qwertyuiopasdfghjklzxcvbnm /D z /N
if {%ERRORLEVEL%}=={30} (cls) else (goto label8)
color 6b
adb%s% shell mkdir /sdcard/.212
for /L %%a in (%start% 1 %end%) DO set /A min=3 * (%%a - %start%)&title %admin%螢幕錄影--正在錄影第%min%分鐘&adb%z% shell screenrecord --verbose /sdcard/.212/screenrec%%a.mp4
:n
for /L %%b in (%start% 1 %end%) DO set /A min=3 * (%%b - %start%)&title %admin%螢幕錄影--正在傳送第%min%分鐘&adb%z% pull /sdcard/.212/screenrec%%b.mp4
for /L %%c in (%start% 1 %end%) DO set /A min=3 * (%%c - %start%)&title %admin%螢幕錄影--正在刪除第%min%分鐘&adb%z% shell rm /sdcard/.212/screenrec%%c.mp4
goto label8
:label12
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec2.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec3.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec4.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec5.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec6.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec7.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec8.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec9.mp4
adb%z% shell screenrecord --verbose /sdcard/.212/screenrec10.mp4
adb%z% pull /sdcard/.212/screenrec.mp4
adb%z% pull /sdcard/.212/screenrec2.mp4
adb%z% pull /sdcard/.212/screenrec3.mp4
adb%z% pull /sdcard/.212/screenrec4.mp4
adb%z% pull /sdcard/.212/screenrec5.mp4
adb%z% pull /sdcard/.212/screenrec6.mp4
adb%z% pull /sdcard/.212/screenrec7.mp4
adb%z% pull /sdcard/.212/screenrec8.mp4
adb%z% pull /sdcard/.212/screenrec9.mp4
adb%z% pull /sdcard/.212/screenrec10.mp4
adb%z% shell rm /sdcard/.212/screenrec.mp4
adb%z% shell rm /sdcard/.212/screenrec2.mp4
adb%z% shell rm /sdcard/.212/screenrec3.mp4
adb%z% shell rm /sdcard/.212/screenrec4.mp4
adb%z% shell rm /sdcard/.212/screenrec5.mp4
adb%z% shell rm /sdcard/.212/screenrec6.mp4
adb%z% shell rm /sdcard/.212/screenrec7.mp4
adb%z% shell rm /sdcard/.212/screenrec8.mp4
adb%z% shell rm /sdcard/.212/screenrec9.mp4
adb%z% shell rm /sdcard/.212/screenrec10.mp4
goto label8
:recloexist
color cf 
choice /n /c ynab10vxo /m 指定的錄影範圍已存在，是否覆蓋? 
set /A tf=%ERRORLEVEL%%2
if {%tf%}=={0} (color 6b & goto label8)
goto recloexistr
:label19
title %admin%打開錄影__ 
choice /c 0123456789 /N
set /A s=%ERRORLEVEL% -1 
title %admin%打開錄影%s%_
choice /c 0123456789 /N 
set /A start=%s% * 10 + (%ERRORLEVEL% - 1) 
title %admin%打開錄影%start%
screenrec%start%.mp4
goto label8
:label18
title %admin%截圖到檔案__ 
choice /c 0123456789 /N
set /A s=%ERRORLEVEL% -1 
title %admin%截圖到檔案%s%_
choice /c 0123456789 /N 
set /A start=%s% * 10 + (%ERRORLEVEL% - 1) 
title %admin%截圖到檔案%start%
adb%z% shell mkdir /sdcard/.212>nul
adb%z% shell screencap -p /sdcard/.212/screencap%start%.png
adb%z% pull /sdcard/.212/screencap%start%.png
adb%z% shell rm /sdcard/.212/screencap%start%.png
screencap%start%.png
goto label8
:label17
title %admin%打開截圖__ 
choice /c 0123456789 /N 
set /A s=%ERRORLEVEL% -1
title %admin%打開截圖%s%_ 
choice /c 0123456789 /N 
set /A start=%s% * 10 + (%ERRORLEVEL% - 1)
title %admin%打開截圖%start%
screencap%start%.png
goto label8
:label10
adb disconnect
adb shell svc wifi enable
adb tcpip 2129
::if {%re%}=={1} (goto label8)
::if {%r%}=={1} (goto label8)
set ct=0
title %admin%等待3秒
timeout>nul 3
title %admin%Android 遙控器
:reip
set back=1
call :ip
set back=0
echo %ipa%>aoi.tmp
findstr 1 aoi.tmp>aoi2.tmp
set /P ipb=<aoi2.tmp
if {1%ipb%}=={1} (
set /A ct=%ct% + 1
if {%ct%}=={12} (goto label8)
goto reip
)
::set /p aoiip=請輸入您的IP:
set aoiip=%ipa%
echo 偵測到IP為 %ipa% 連接中...
::if {%aoiip%}=={0} (goto label8)
adb connect %aoiip%:2129
set z= -s %aoiip%
set zf= -s %aoiip%
set ipa=
set ipb=
set ipt=
goto label8


:rcon
start %fl%\loop.cmd
goto label8
:rsr
title %admin%從錄影__刪除到錄影__
choice /c 0123456789 /N
set /A s=%ERRORLEVEL% -1
title %admin%從錄影%s%_刪除到錄影__
choice /c 0123456789 /N
set /A start=%s% * 10 + (%ERRORLEVEL% - 1)
title %admin%從錄影%start%刪除到錄影__
choice /c 0123456789 /N
set /A s=%ERRORLEVEL% -1
title %admin%從錄影%start%刪除到錄影%s%_
choice /c 0123456789 /N
set /A end=%s% * 10 + (%ERRORLEVEL% - 1)
for /L %%f in (%start% 1 %end%) DO del /Q screenrec%%f.mp4
goto label8
:rsp
title %admin%從截圖__刪除到截圖__
choice /c 0123456789 /N
set /A s=%ERRORLEVEL% -1
title %admin%從截圖%s%_刪除到截圖__
choice /c 0123456789 /N
set /A start=%s% * 10 + (%ERRORLEVEL% - 1)
title %admin%從截圖%start%刪除到截圖__
choice /c 0123456789 /N
set /A s=%ERRORLEVEL% -1
title %admin%從截圖%start%刪除到截圖%s%_
choice /c 0123456789 /N
set /A end=%s% * 10 + (%ERRORLEVEL% - 1)
for /L %%f in (%start% 1 %end%) DO del /Q screencap%%f.png
goto label8
:at
set rb=%r%
set ob=%o%
set chb=%ch%
set eb=%e%
set lb=%l%
set wb=%w%
set taskpidb=%taskpid%
set /P cmd=執行?
set taskpid=android-remote-task-%random%%random%
choice /c twd /m 等待:[Time_時間/Wait_for_devices_等待裝置/wait_for_this_device_等待此裝置(D)] /n
if {%ERRORLEVEL%}=={2} (set l=1&goto atll)
if {%ERRORLEVEL%}=={3} (
set l=1
cd %adbl%
adb%z% get-serialno>at.st
call set /P w=<%adbl%\at.st
pause
echo %w%
call set w= -s !w!
echo !w!
del /S /Q at.st
goto atll
)
choice /c hms /m 單位(H-小時，M-分鐘，S-秒) /n
set hms=%ERRORLEVEL%
title %admin%時間:___
choice /c 0123456789 /N
set /A ats=%ERRORLEVEL% -1
title %admin%時間:%ats%__
choice /c 0123456789 /N
set /A atf=%ats% * 10 + (%ERRORLEVEL% - 1)
title %admin%時間%atf%__
choice /c 0123456789 /N
set /A atn=%atf% * 10 + (%ERRORLEVEL% -1)
title %admin%時間%atn%_
choice /c 0123456789 /N
set /A ata=%atn% * 10 + (%ERRORLEVEL% - 1)
echo %ata%
if {%hms%}=={1} (set /A ata=%ata% * 60 * 60)
if {%hms%}=={2} (set /A ata=%ata% * 60)
set /A ats=%ata% %% 60
set /A atm=%ata% / 60
set /A ath=%atm% / 60
set /A atm=%atm% %% 60
set /A ata=%ath% * 60 * 60 + ( %atm% * 60 ) + %ats%
echo 相當於 %ath% 小時 %atm% 分鐘 %ats% 秒後執行該動作
set times=%ata%
set o=1
:atll
set ch=%cmd%
echo 是否設定執行時間?
choice
if {%ERRORLEVEL%}=={1} (goto setquit)
:setquitback
echo 是否重複執行?
choice
if {%ERRORLEVEL%}=={1} (
set r=1
goto aty
)
:atb
start %fl%\%fn%
set e=%eb%
set r=%rb%
set l=%lb%
set o=%ob%
set w=%wb%
set ch=%chb%
set taskpid=%taskpidb%
goto label8
:aty
echo 完整重複?
choice
if {%ERRORLEVEL%}=={1} (set e=1)
if {%ERRORLEVEL%}=={2} (set e=0)
goto atb
:lsrn
if EXIST screenrec.mp4 echo screenrec.mp4
for /L %%d in (0 1 100) DO if EXIST screenrec%%d.mp4 echo screenrec%%d.png
goto label8
:lspn
if EXIST screencap.png echo screencap.png
for /L %%d in (0 1 100) DO if EXIST screencap%%d.png echo screencap%%d.png
goto label8

:setquit
choice /c hms /m 單位(H-小時，M-分鐘，S-秒) /n
set hms=%ERRORLEVEL%
title %admin%時間:___
choice /c 0123456789 /n
set /A ats=%ERRORLEVEL% -1
title %admin%時間:%ats%__
choice /c 0123456789 /n
set /A atf=%ats% * 10 + (%ERRORLEVEL% - 1)
title %admin%時間%atf%__
choice /c 0123456789 /n
set /A atn=%atf% * 10 + (%ERRORLEVEL% -1)
title %admin%時間%atn%_
choice /c 0123456789 /n
set /A ata=%atn% * 10 + (%ERRORLEVEL% - 1)
if {%hms%}=={1} (set /A ata=%ata% * 60 * 60)
if {%hms%}=={2} (set /A ata=%ata% * 60)
set /A ats=%ata% %% 60
set /A atm=%ata% / 60
set /A ath=%atm% / 60
set /A atm=%atm% %% 60
set /A ata=%ath% * 60 * 60 + ( %atm% * 60 ) + %ats%
echo 相當於 %ath% 小時 %atm% 分鐘 %ats% 秒後執行該動作
set qtime=%ata%
set killtask=1
start %fl%\%fn%
set killtask=
goto setquitback


:plr
title %admin%比對中...
cd PulledFile
dir /B *..apk>plr.tmp
set nt=0
for /f %%a in (plr.tmp) DO (
	call set /A nt=!nt! + 1
)
%adbl%\adb%z% shell pm -l>plr.st
echo.>plr2.tmp
set kk=0
for /f %%a in (plr.tmp) DO (
	call set /A kk=!kk! + 1
	title %admin%[!kk!/!nt!]比對中...
	call set temp=%%a
	findstr>nul /I !temp:..apk=! plr.st
	if {!ERRORLEVEL!}=={1} (echo !temp:..apk=!>>plr2.tmp)
)
title %admin%還原
echo 目前未安裝者:
type plr2.tmp
copy>nul plr2.tmp ..
set nt=0
for /f %%a in (plr2.tmp) DO (
	call set /A nt=!nt! + 1
)
set kk=0
for /f %%a in (plr2.tmp) DO (
	cd %adbl%\PulledFile
	call set temp=%%a
	if {!k!}=={1} (call set /A kk=!kk! + 1&&title %admin%[!kk!/!nt!]正在還原...&&dir /B !temp:..apk=!*.apk>1.tmp&&call :apks)
	if not {!k!}=={1} (
		choice /c ynaq /m 是否安裝!temp:..apk=!?
		if {!ERRORLEVEL!}=={1} (call set /A kk=!kk! + 1&&dir /B !temp:..apk=!*.apk>1.tmp&&call :apks)
		if {!ERRORLEVEL!}=={3} (call set /A kk=!kk! + 1&&call set k=1&&dir /B !temp:..apk=!*.apk>1.tmp&&call :apks)
		if {!ERRORLEVEL!}=={4} (cd ..&call set temp=&del /S /Q plr.tmp plr.st>nul&goto label8)
	)
)
set temp=
del /S /Q plr.tmp plr.st>nul
set k=
cd %adbl%
goto label8


:xapk
::dir PulledFile\*.apk
::echo.
cd PulledFile
echo 偵測到的封裝檔:
dir /B *..apk>1.tmp
dir *..apk
set /P apkst=安裝...
set apks=%apkst%
findstr %apks% 1.tmp>2.tmp
for /f %%c in (2.tmp) DO (
	cd %adbl%\PulledFile
	call set temp=%%c
	if {!k!}=={1} (dir /B !temp:..apk=!*.apk>1.tmp&&call :apks)
	if not {!k!}=={1} (
		choice /c ynaq /m 是否安裝!temp:..apk=!?
		if {!ERRORLEVEL!}=={1} (dir /B !temp:..apk=!*.apk>1.tmp&&call :apks)
		if {!ERRORLEVEL!}=={3} (call set k=1&&dir /B !temp:..apk=!*.apk>1.tmp&&call :apks)
		if {!ERRORLEVEL!}=={4} (del /S /Q %adbl%\PulledFile\1.tmp %adbl%\PulledFile\2.tmp>nul&&cd %adbl%&&goto label8)
	)
)
del /S /Q %adbl%\PulledFile\1.tmp %adbl%\PulledFile\2.tmp>nul
cd %adbl%
set k=
goto label8
:apks
set apksi=
for /f %%b in (1.tmp) DO (
	call set apksi=!apksi! %%b
)
%adbl%\adb%z% install-multiple -r -t %apksi%
cd %adbl%
goto :eof









:rrpl
type plr2.tmp
choice /m 即將刪除上述檔案，確定?
if {%ERRORLEVEL%}=={2} (goto label8)
for /f %%a in (plr2.tmp) DO (
call set web=%%a
del /S /Q PulledFile\!web!*.apk
)
goto label8








:rpl
set /P web=刪除備份:
dir /B PulledFile\!web!*.apk
choice /m 即將刪除上述檔案，確定?
if {%ERRORLEVEL%}=={1} (del /S /Q PulledFile\!web!*.apk)
goto label8

:dorestore
if EXIST %cl%bkpautotap.st (
%adbl%\adb%z% shell wm size>pl1.tmp
call set /P m=<pl1.tmp
call set m=!m:Physical size:=!
call set m=!m: =!
call set m=!m:x= !
call set m3=1
for %%b in (!m!) DO (
if {!m3!}=={1} (call set /A m1=%%b)
if {!m3!}=={2} (call set /A m2=%%b)
call set /A m3=!m3! + 1
)
call set /A m1=!m1! - 100
call set /A m2=!m2! - 100
del /s /q pl1.tmp
)

if {!restorechoice!}=={1} (
cd !p!
dir *.apk /B>pl2.tmp
for /f %%a in (pl2.tmp) DO (
title !admin!正在安裝!p!
%adbl%\adb%z% install %%a
)
)
if {!restorechoice!}=={2} (
cd !p!
dir *.ab /B>pl2.tmp
for /f %%a in (pl2.tmp) DO (
title !admin!正在還原!p!
if EXIST %cl%bkpautotap.st (start /min %fl%\%fn% bkpautotap)
%adbl%\adb%z% restore %%a>nul
)
)
if {!restorechoice!}=={3} (
cd !p!
dir *.apk /B>pl2.tmp
for /f %%a in (pl2.tmp) DO (
title !admin!正在安裝!p!
%adbl%\adb%z% install %%a
)
dir *.ab /B>pl2.tmp
for /f %%a in (pl2.tmp) DO (
title !admin!正在還原!p!
if EXIST %cl%bkpautotap.st (start /min %fl%\%fn% bkpautotap)
%adbl%\adb%z% restore %%a>nul
)
)
title !admin!Android遙控器
goto :eof





:pli
dir PulledFile\*.apk /B>pl.st
for /f %%a in (pl.st) DO (
..\adb\adb%z% install PulledFile\%%a
)

goto label8






:pl-3
setlocal EnableDelayedExpansion
adb%z% shell pm list package -3>pl.st
if {%re%}=={1} (set k=1&goto plskp)
if {%r%}=={1} (set k=1&goto plskp)
set /P n=PACKAGE:
echo   啟用   停用  檢視 安裝包 停止 移除 清除資料 啟動 備份  Play商店 更改型態 凍結
choice /c devasucrbpti /m [Enable/Disable/View/Apk/Stop/Uninstall/Clean/Run/Backup/Play/Type/Iced] /n
set pl=%ERRORLEVEL%
if {%pl%}=={2} (goto pl2)
if {%pl%}=={3} (goto pl4)
if {%pl%}=={4} (goto pl5)
if {%pl%}=={5} (goto pl6)
if {%pl%}=={6} (goto pl7)
if {%pl%}=={7} (goto pl8)
if {%pl%}=={8} (goto pl9)
if {%pl%}=={9} (goto pl10)
if {%pl%}=={10} (goto pl11)
if {%pl%}=={11} (goto plt)
if {%pl%}=={12} (goto pl14)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
%t%adb%z% shell pm disable-user !p!
)
goto pl3







:pl-s
setlocal EnableDelayedExpansion
adb%z% shell pm list package -s>pl.st
if {%re%}=={1} (set k=1&goto plskp)
if {%r%}=={1} (set k=1&goto plskp)
set /P n=PACKAGE:
echo   啟用   停用  檢視 安裝包 停止 移除 清除資料 啟動 備份  Play商店 更改型態 凍結
choice /c devasucrbpti /m [Enable/Disable/View/Apk/Stop/Uninstall/Clean/Run/Backup/Play/Type/Iced] /n
set pl=%ERRORLEVEL%
if {%pl%}=={2} (goto pl2)
if {%pl%}=={3} (goto pl4)
if {%pl%}=={4} (goto pl5)
if {%pl%}=={5} (goto pl6)
if {%pl%}=={6} (goto pl7)
if {%pl%}=={7} (goto pl8)
if {%pl%}=={8} (goto pl9)
if {%pl%}=={9} (goto pl10)
if {%pl%}=={10} (goto pl11)
if {%pl%}=={11} (goto plt)
if {%pl%}=={12} (goto pl14)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
%t%adb%z% shell pm disable-user !p!
)
goto pl3




:pl-d
setlocal EnableDelayedExpansion
adb%z% shell pm list package -d>pl.st
if {%re%}=={1} (set k=1&goto plskp)
if {%r%}=={1} (set k=1&goto plskp)
set /P n=PACKAGE:
echo   啟用   停用  檢視 安裝包 停止 移除 清除資料 啟動 備份  Play商店 更改型態 凍結
choice /c devasucrbpti /m [Enable/Disable/View/Apk/Stop/Uninstall/Clean/Run/Backup/Play/Type/Iced] /n
set pl=%ERRORLEVEL%
if {%pl%}=={2} (goto pl2)
if {%pl%}=={3} (goto pl4)
if {%pl%}=={4} (goto pl5)
if {%pl%}=={5} (goto pl6)
if {%pl%}=={6} (goto pl7)
if {%pl%}=={7} (goto pl8)
if {%pl%}=={8} (goto pl9)
if {%pl%}=={9} (goto pl10)
if {%pl%}=={10} (goto pl11)
if {%pl%}=={11} (goto plt)
if {%pl%}=={12} (goto pl14)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
%t%adb%z% shell pm disable-user !p!
)
goto pl3



:pl-e
setlocal EnableDelayedExpansion
adb%z% shell pm list package -e>pl.st
if {%re%}=={1} (set k=1&goto plskp)
if {%r%}=={1} (set k=1&goto plskp)
set /P n=PACKAGE:
echo   啟用   停用  檢視 安裝包 停止 移除 清除資料 啟動 備份  Play商店 更改型態 凍結
choice /c devasucrbpti /m [Enable/Disable/View/Apk/Stop/Uninstall/Clean/Run/Backup/Play/Type/Iced] /n
set pl=%ERRORLEVEL%
if {%pl%}=={2} (goto pl2)
if {%pl%}=={3} (goto pl4)
if {%pl%}=={4} (goto pl5)
if {%pl%}=={5} (goto pl6)
if {%pl%}=={6} (goto pl7)
if {%pl%}=={7} (goto pl8)
if {%pl%}=={8} (goto pl9)
if {%pl%}=={9} (goto pl10)
if {%pl%}=={10} (goto pl11)
if {%pl%}=={11} (goto plt)
if {%pl%}=={12} (goto pl14)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
%t%adb%z% shell pm disable-user !p!
)
goto pl3



:pl-u
setlocal EnableDelayedExpansion
adb%z% shell pm list package -u>pl.st
if {%re%}=={1} (set k=1&goto plskp)
if {%r%}=={1} (set k=1&goto plskp)
set /P n=PACKAGE:
echo   啟用   停用  檢視 安裝包 停止 移除 清除資料 啟動 備份  Play商店 更改型態 凍結
choice /c devasucrbpti /m [Enable/Disable/View/Apk/Stop/Uninstall/Clean/Run/Backup/Play/Type/Iced] /n
set pl=%ERRORLEVEL%
if {%pl%}=={2} (goto pl2)
if {%pl%}=={3} (goto pl4)
if {%pl%}=={4} (goto pl5)
if {%pl%}=={5} (goto pl6)
if {%pl%}=={6} (goto pl7)
if {%pl%}=={7} (goto pl8)
if {%pl%}=={8} (goto pl9)
if {%pl%}=={9} (goto pl10)
if {%pl%}=={10} (goto pl11)
if {%pl%}=={11} (goto plt)
if {%pl%}=={12} (goto pl14)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
%t%adb%z% shell pm disable-user !p!
)
goto pl3










:pl
setlocal EnableDelayedExpansion
adb%z% shell pm -l>pl.st
if {%re%}=={1} (set k=1&goto plskp)
if {%r%}=={1} (set k=1&goto plskp)
set /P n=PACKAGE:
echo   啟用   停用  檢視 安裝包 停止 移除 清除資料 啟動 備份  Play商店 更改型態 凍結 路徑
choice /c devasucrbptil /m [Enable/Disable/View/Apk/Stop/Uninstall/Clean/Run/Backup/Play/Type/Iced/Location] /n
set pl=%ERRORLEVEL%
:plskp
if {%pl%}=={2} (goto pl2)
if {%pl%}=={3} (goto pl4)
if {%pl%}=={4} (goto pl5)
if {%pl%}=={5} (goto pl6)
if {%pl%}=={6} (goto pl7)
if {%pl%}=={7} (goto pl8)
if {%pl%}=={8} (goto pl9)
if {%pl%}=={9} (goto pl10)
if {%pl%}=={10} (goto pl11)
if {%pl%}=={11} (goto plt)
if {%pl%}=={12} (goto pl14)
if {%pl%}=={13} (goto pl15)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
%t%adb%z% shell pm disable-user !p!
)
goto pl3
:plt
choice /c us /m [系統應用^-^-^>使用者應用^(U^)/使用者應用^-^-^>系統應用^(S^)] /n
if {%ERRORLEVEL%}=={1} (goto pl13)
if {%ERRORLEVEL%}=={2} (goto pl12)
:pl13
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
adb%z% shell pm path !p!>pl2.tmp
for /f %%b in (pl2.tmp) DO (
set r="%%b"
call set mn="%%b"
call set km=!mn::=!
call set mn=!km:package=!
set hm=!mn:/data/app=!
if {!hm!}=={!mn!} (
if {!k!}=={1} (
adb%z% root
adb%z% remount>nul
adb%z% remount system>nul
adb%z% shell cp -rf !mn! /data/app>pl4.tmp
call set /P pl4=<pl4.tmp
if {!pl4!1}=={1} (adb%z% shell rm -rf !mn!)
) ELSE (
choice /m 是否轉換!p!? /c ynaq
if {!ERRORLEVEL!}=={1} (
adb%z% root
adb%z% remount>nul
adb%z% remount system>nul
adb%z% shell cp -rf !mn! /data/app>pl4.tmp
call set /P pl4=<pl4.tmp
if {!pl4!1}=={1} (adb%z% shell rm -rf !mn!)
)
if {!ERRORLEVEL!}=={3} (
call set k=1
adb%z% root
adb%z% remount>nul
adb%z% remount system>nul
adb%z% shell cp -rf !mn! /data/app>pl4.tmp
call set /P pl4=<pl4.tmp
if {!pl4!1}=={1} (adb%z% shell rm -rf !mn!)
)
if {!ERRORLEVEL!}=={4} (set k=&del /S /Q pl2.tmp>nul&goto pl3)
)
)
)
)
echo 此操作不一定成功，執行後請重啟設備。






set k=
del /S /Q pl2.tmp>nul
goto pl3




:pl14
choice /c su /m "[Suspend 暫停/Unsuspend 解除]" /n
if {%ERRORLEVEL%}=={2} (
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
adb%z% shell pm unsuspend !p!
) ELSE (
choice /m 是否解凍!p!? /c ynaq
if {!ERRORLEVEL!}=={1} (
adb%z% shell pm unsuspend !p!
)
if {!ERRORLEVEL!}=={3} (
call set k=1
adb%z% shell pm unsuspend !p!
)
if {!ERRORLEVEL!}=={4} (
set k=
goto pl3
)
)
)
set k=
goto pl3
)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
adb%z% shell pm suspend !p!
) ELSE (
choice /m 是否凍結!p!? /c ynaq
if {!ERRORLEVEL!}=={1} (
adb%z% shell pm suspend !p!
)
if {!ERRORLEVEL!}=={3} (
call set k=1
adb%z% shell pm suspend !p!
)
if {!ERRORLEVEL!}=={4} (
set k=
goto pl3
)
)
)
set k=
goto pl3



:pl15
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
adb%z% shell pm path !p!
) ELSE (
choice /m 是否顯示!p!? /c yna
if {!ERRORLEVEL!}=={1} (
adb%z% shell pm path !p!
)
if {!ERRORLEVEL!}=={3} (
call set k=1
adb%z% shell pm path !p!
)
)
)
set k=
goto pl3




:pl12
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
adb%z% shell pm path !p!>pl2.tmp
for /f %%b in (pl2.tmp) DO (
set r="%%b"
call set mn="%%b"
call set km=!mn::=!
call set mn=!km:package=!
set hm=!mn:/system/=!
if {!hm!}=={!mn!} (
if {!k!}=={1} (
adb%z% root
adb%z% remount>nul
adb%z% remount system>nul
adb%z% shell cp -rf !mn! /system/priv-app
adb%z% shell rm -rf !mn!
) ELSE (
choice /m 是否轉換!p!? /c ynaq
if {!ERRORLEVEL!}=={1} (
adb%z% root
adb%z% remount>nul
adb%z% remount system>nul
adb%z% shell cp -rf !mn! /system/priv-app
adb%z% shell rm -rf !mn!
)
if {!ERRORLEVEL!}=={3} (
call set k=1
adb%z% root
adb%z% remount>nul
adb%z% remount system>nul
adb%z% shell cp -rf !mn! /system/priv-app
adb%z% shell rm -rf !mn!
)
if {!ERRORLEVEL!}=={4} (set k=&del /S /Q pl2.tmp>nul&goto pl3)
)
)
)
)
echo 此操作不一定成功，執行後請重啟設備。






set k=
del /S /Q pl2.tmp>nul
goto pl3

:pl11
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p=%%a
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
adb%z% shell am start -a android.intent.action.VIEW -d https://play.google.com/store/apps/details?id=!p!>nul
) ELSE (
choice /m 是否查看!p!? /c yna
if {!ERRORLEVEL!}=={1} (
adb%z% shell am start -a android.intent.action.VIEW -d https://play.google.com/store/apps/details?id=!p!>nul
)
if {!ERRORLEVEL!}=={3} (
adb%z% shell am start -a android.intent.action.VIEW -d https://play.google.com/store/apps/details?id=!p!>nul
call set k=1
)
)
)
set k=
goto pl3
:plrestore
cd %adbl%
dir AppBackup /B>pl.st
dir AppBackup
set /P appbkp=請問要還原:
findstr /I %appbkp% pl.st>pl.tmp
cd %adbl%\AppBackup
echo 請在裝置上按下[還原我的資料]鍵(如有設定密碼，請在裝置上輸入)。
for /f %%a in (%adbl%\pl.tmp) DO (
set r="%%a"
set p="%%a"
if {!k!}=={1} (
call set k=1
call :dorestore
cd ..
echo 還原!p!完畢。
) ELSE (
if not {!k!}=={1} (choice /m 是否還原!p!? /c yna&call set restoredo=!ERRORLEVEL!)
if {!restoredo!}=={1} (
choice /c adb /m 請問要還原:[App/Data資料/Both都要] /n
call set restorechoice=!ERRORLEVEL!
call :dorestore
cd ..
echo 還原!p!完畢。
)
if {!restoredo!}=={3} (
call set k=1
choice /c adb /m 請問要還原:[App/Data資料/Both都要] /n
call set restorechoice=!ERRORLEVEL!
call :dorestore
cd ..
echo 還原!p!完畢。
)
)
)
del /S /Q pl2.tmp>nul
cd ..
set k=
cd %adbl%
goto label8
:pl10
if EXIST %cl%bkpautotap.st (
adb%z% shell wm size>pl1.tmp
set /P m=<pl1.tmp
set m=%m:Physical size:=%
set m=%m: =%
set m=%m:x= %
set m3=1
for %%b in (%m%) DO (
if {!m3!}=={1} (call set /A m1=%%b)
if {!m3!}=={2} (call set /A m2=%%b)
call set /A m3=!m3! + 1
)
set /A m1=%m1% - 100
set /A m2=%m2% - 100
)
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
adb%z% shell pm path !p!>pl2.tmp
for /f %%b in (pl2.tmp) DO (
set r="%%b"
call set mn="%%b"
call set km=!mn::=!
call set mn=!km:package=!
if {!k!}=={1} (
cd AppBackup
call set c=%random%
echo "請在裝置上按下[備份我的資料]鍵(您可設定密碼)。"
if EXIST %cl%bkpautotap.st (start /min %fl%\%fn% bkpautotap)
%adbl%\adb%z% backup !bkp! !p! -f !p!.ab>nul
if EXIST !p!.ab (
md temp!c!
cd temp!c!
%adbl%\adb%z% pull !mn!
ren * !p!.apk
move !p!.apk ..>nul
cd ..
echo 備份!p!成功!!
md !p!>nul
call set /P ps=標籤:
move !p!.apk !p!>nul
move !p!.ab !p!>nul
) ELSE (
echo 備份失敗
)
rd /S /Q temp!c!
cd ..
) ELSE (
choice /m 是否備份!p!? /c ynaq
if {!ERRORLEVEL!}=={1} (
choice /m 是否"完整"備份?
if {%ERRORLEVEL%}=={1} (set bkp=-shared -keyvalue)
if {%ERRORLEVEL%}=={2} (set bkp=)
cd AppBackup
call set c=%random%
echo "請在裝置上按下[備份我的資料]鍵(您可設定密碼)。"
if EXIST %cl%bkpautotap.st (start /min %fl%\%fn% bkpautotap)
%adbl%\adb%z% backup !bkp! !p! -f !p!.ab>nul
if EXIST !p!.ab (
md temp!c!
cd temp!c!
%adbl%\adb%z% pull !mn!
ren * !p!.apk
move !p!.apk .. >nul
cd ..
echo 備份!p!成功!!
md !p!>nul
move !p!.apk !p!>nul
move !p!.ab !p!>nul
) ELSE (
echo 備份失敗
)
rd /S /Q temp!c!
cd ..
)
if {!ERRORLEVEL!}=={3} (
call set k=1
choice /m 是否"完整"備份?
if {%ERRORLEVEL%}=={1} (set bkp=-shared -keyvalue)
if {%ERRORLEVEL%}=={2} (set bkp=)
cd AppBackup
call set c=%random%
echo "請在裝置上按下[備份我的資料]鍵(您可設定密碼)。"
if EXIST %cl%bkpautotap.st (start /min %fl%\%fn% bkpautotap)
%adbl%\adb%z% backup !bkp! !p! -f !p!.ab>nul
if EXIST !p!.ab (
md temp!c!
cd temp!c!
%adbl%\adb%z% pull !mn!
ren * !p!.apk
move !p!.apk ..>nul
cd ..
echo 備份!p!成功!!
md !p!>nul
move !p!.apk !p!>nul
move !p!.ab !p!>nul
) ELSE (
echo 備份失敗
)
rd /S /Q temp!c!
cd ..
)
if {!ERRORLEVEL!}=={4} (set k=&del /S /Q pl2.tmp>nul&goto pl3)
)
)
)






set k=
del /S /Q pl2.tmp>nul
goto pl3

:pl5
findstr /I %n% pl.st>pl.tmp
set nt=0
for /f %%c in (pl.tmp) DO (
	call set /A nt=!nt! + 1
)
echo 共%nt%項
set kk=0
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
call set rp=!p!
if {!k!}=={1} (
	set /A kk=!kk! + 1
title %admin%[!kk!/!nt!]正在提取!p!
if not EXIST PulledFile\!p!..apk (
adb%z% shell pm path !p!>pl2.tmp
for /f %%b in (pl2.tmp) DO (
set r="%%b"
call set mn="%%b"
call set km=!mn::=!
call set mn=!km:package=!
cd PulledFile
call set c=%random%
md temp!c!
cd temp!c!
%adbl%\adb%z% pull !mn!
if EXIST ..\!rp!..apk (call set p=!rp!!random!)
if not EXIST ..\!rp!..apk (call set p=!rp!.)
ren * !p!.apk
move !p!.apk ..>nul
cd ..
rd /S /Q temp!c!
cd ..
)
)
) ELSE (

if {!k!}=={2} (
	set /A kk=!kk! + 1
title %admin%[!kk!/!nt!]正在提取!p!
adb%z% shell pm path !p!>pl2.tmp
for /f %%b in (pl2.tmp) DO (
set r="%%b"
call set mn="%%b"
call set km=!mn::=!
call set mn=!km:package=!
cd PulledFile
call set c=%random%
md temp!c!
cd temp!c!
%adbl%\adb%z% pull !mn!
if EXIST ..\!rp!..apk (call set p=!rp!!random!)
if not EXIST ..\!rp!..apk (call set p=!rp!.)
ren * !p!.apk
move !p!.apk ..>nul
cd ..
rd /S /Q temp!c!
cd ..
)
) ELSE (
choice /m 是否提取!p!? /c ynaq
if {!ERRORLEVEL!}=={1} (
adb%z% shell pm path !p!>pl2.tmp
for /f %%b in (pl2.tmp) DO (
set r="%%b"
call set mn="%%b"
call set km=!mn::=!
call set mn=!km:package=!
cd PulledFile
call set c=%random%
md temp!c!
cd temp!c!
%adbl%\adb%z% pull !mn!
if EXIST ..\!rp!..apk (call set p=!rp!!random!)
if not EXIST ..\!rp!..apk (call set p=!rp!.)
ren * !p!.apk
move !p!.apk ..>nul
cd ..
rd /S /Q temp!c!
cd ..
)
)
if {!ERRORLEVEL!}=={3} (
call set k=1
choice /m 重複提取?
if {!ERRORLEVEL!}=={1} (call set k=2)
adb%z% shell pm path !p!>pl2.tmp
for /f %%b in (pl2.tmp) DO (
set r="%%b"
call set mn="%%b"
call set km=!mn::=!
call set mn=!km:package=!
cd PulledFile
call set c=%random%
md temp!c!
cd temp!c!
%adbl%\adb%z% pull !mn!
if EXIST ..\!rp!..apk (call set p=!rp!!random!)
if not EXIST ..\!rp!..apk (call set p=!rp!.)
ren * !p!.apk
move !p!.apk ..>nul
cd ..
rd /S /Q temp!c!
cd ..
)
)
if {!ERRORLEVEL!}=={4} (set k=&del /S /Q pl2.tmp>nul&goto pl3)
	call set /A kk=!kk! + 1
)
)
)
)






set k=
del /S /Q pl2.tmp>nul
goto pl3
:pl6
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
adb%z% shell am force-stop !p!
echo !p! 已停止。
) ELSE (
choice /m 是否停止!p!? /c yna
if {!ERRORLEVEL!}=={1} (
adb%z% shell am force-stop !p!
echo !p! 已停止。
)
if {!ERRORLEVEL!}=={3} (
call set k=1
adb%z% shell am force-stop !p!
echo !p! 已停止。
)
)
)
set k=
goto pl3
:pl8
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
adb%z% shell pm clear !p!
echo !p! 已清除。
) ELSE (
choice /m 是否清除!p!的資料? /c yna
if {!ERRORLEVEL!}=={1} (
adb%z% shell pm clear !p!
echo !p! 已清除。
)
if {!ERRORLEVEL!}=={3} (
call set k=1
adb%z% shell pm clear !p!
echo !p! 已清除。
)
)
)
set k=
goto pl3
:pl9
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
if not EXIST plrnow.st (echo.>plrnow.st)
findstr /I !p! plrnow.st>pl9.tmp
for /f %%b in (pl9.tmp) DO (
adb%z% shell am start %%b
)
adb%z% shell am start !p!/!p!.MainActivity
adb%z% shell am start !p!
) ELSE (
choice /m 是否啟動!p!? /c yna
if {!ERRORLEVEL!}=={1} (
if not EXIST plrnow.st (echo.>plrnow.st)
findstr /I !p! plrnow.st>pl9.tmp
for /f %%b in (pl9.tmp) DO (
adb%z% shell am start %%b
)
adb%z% shell am start !p!/!p!.MainActivity
adb%z% shell am start !p!
set k=
goto pl3
)
if {!ERRORLEVEL!}=={3} (
if not EXIST plrnow.st (echo.>plrnow.st)
findstr /I !p! plrnow.st>pl9.tmp
for /f %%b in (pl9.tmp) DO (
adb%z% shell am start %%b
)
call set k=1
adb%z% shell am start !p!/!p!.MainActivity
adb%z% shell am start !p!
)
)
)
del /S /Q pl9.tmp>nul
set k=
goto pl3
:pl7
findstr /I %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
if {!k!}=={1} (
adb%z% shell pm uninstall!q! !p!
echo !p! 已移除。
) ELSE (
choice /m 是否移除!p!? /c yna
if {!ERRORLEVEL!}=={1} (
choice /m 是否保留資料?
if {!ERRORLEVEL!}=={1} (set q= -k)
if {!ERRORLEVEL!}=={2} (set q=)
adb%z% shell pm uninstall!q! !p!
echo !p! 已移除。
)
if {!ERRORLEVEL!}=={3} (
choice /m 是否保留資料?
if {!ERRORLEVEL!}=={1} (set q= -k)
if {!ERRORLEVEL!}=={2} (set q=)
call set k=1
adb%z% shell pm uninstall!q! !p!
echo !p! 已移除。
)
)
)
set q=
set k=
goto pl3
:pl4
findstr /I %n% pl.st
goto label8
:pl2
findstr %n% pl.st>pl.tmp
for /f %%a in (pl.tmp) DO (
set r="%%a"
set p="%%a"
call set a=!p:package=!
call set p=!a::=!
%t%adb%z% shell pm enable !p!
)
:pl3
del /S /Q pl.tmp>nul
cd %adbl%
goto label8


:rcsp
set /A r=%random% %% 100
title 截圖到檔案%r%
if EXIST screencap%r%.png goto rcsp
adb%z% shell mkdir /sdcard/.212>nul
adb%z% shell screencap -p /sdcard/.212/screencap%r%.png
adb%z% pull /sdcard/.212/screencap%r%.png
adb%z% shell rm /sdcard/.212/screencap%r%.png
screencap%r%.png
goto label8
:cal
timeout 27
::set /P cal=請問要撥打
%t%adb%z% shell am start -a android.intent.action.CALL -d tel:%cal%
goto label8


:ipl
set ipl=1
set ipln=
for /f %%b in (%cl%iplist\iplist.lst) DO (
echo !ipl!. %%b
call set /a ipln=!ipln!!ipl!
call set /A ipl=!ipl! + 1
)
choice /c 0!ipln! /m 請問要刪除:
if {%ERRORLEVEL%}=={1} (goto label8)
set /a ipla=%ERRORLEVEL% - 1
echo.>iplist2.st
set iplno=1
for /f %%b in (%cl%iplist\iplist.lst) DO (
if NOT {!ipla!}=={!iplno!} (echo %%b>>iplist2.st)
call set /A iplno=!iplno! + 1
)
del /S /Q %cl%iplist\iplist.lst>nul
move iplist2.st %cl%iplist\iplist.lst>nul
goto label8







:clean
title %admin%清理移除殘留
%t%adb%z%>1.tmp shell pm list package -u
%t%adb%z%>2.tmp shell pm -l
set a=0
for /f %%a in (2.tmp) DO (
	call set /A a=!a!+1
)
set b=0
for /f %%a in (2.tmp) DO (
	call set /A b=!b!+1
	title !admin![!b!/!a!]比對中
	findstr /V %%a 1.tmp>3.tmp
	type 3.tmp>1.tmp
)
set a=0
for /f %%a in (1.tmp) DO (
	call set /A a=!a!+1
)
title %admin%清理移除殘留
echo 共%a%項
type 1.tmp
choice /m 是否解除安裝
if {%ERRORLEVEL%}=={1} (
	for /f %%a in (1.tmp) DO (
		call set b=%%a
		call set b=!b:package=!
		call set b=!b::=!
		%t%adb%z% shell pm uninstall !b!
	)
)
del>nul /S /Q 1.tmp 2.tmp 3.tmp
set a=
set b=
goto label8



:settings
echo .............................
echo "請輸入...     |            "
echo "1             |修改命令模式"
echo "2             |修改指令模式"
echo "3             |修改密碼    "
echo "4             |備份        "
echo "5             |隨機啟動顏色"
echo "6             |新的運作方式"
echo "7             |備份自動同意"
echo "0             |關閉        "
echo "..........................."
choice /c 01234567 /n /m 要設定
set set=%ERRORLEVEL%
if {%set%}=={8} (goto set7)
if {%set%}=={7} (goto set6)
if {%set%}=={6} (goto set5)
if {%set%}=={5} (goto set4)
if {%set%}=={4} (goto set3)
if {%set%}=={3} (goto set2)
if {%set%}=={2} (goto set1)
if {%set%}=={1} (goto label8)


:set1
rd /S /Q "%USERPROFILE%\AppData\Local\212\android-remote\mode"&rd /S /Q "%ProgramFiles%\212\android-remote\mode"
cls
if EXIST "%ProgramFiles%\212\android-remote\mode" goto setadmin
title %admin%設定作業
echo "(1) _______________     (2)_______________    (3)_______________      "
echo "   |>_                    |>_                   |>_                   "
echo "   |______________        |______________       |______________       "
echo "   |212 }test             |212 }test            |test                 "
echo "   |done.                 |done.                |done.                "
echo "   |212 }                 |請按任意鍵繼續 . . . |請按任意鍵繼續 . . . "
choice /c 123 /n /m 請選擇您想要的模式:
set first=%ERRORLEVEL%
echo 設否將設定鎖定在系統管理員?
choice
if {%ERRORLEVEL%}=={1} (
if {%admin%}=={#} (
md "%ProgramFiles%\212\android-remote\mode\%first%"
set mode=%first%
echo 完成
pause
cls
goto settings)
goto setadmin)




:set1cb
md %USERPROFILE%\AppData\Local\212\android-remote\mode\%first%
set mode=%first%
echo 完成
pause
cls
goto settings




:set2
rd /S /Q "%USERPROFILE%\AppData\Local\212\android-remote\tmode"&rd /S /Q "%ProgramFiles%\212\android-remote\tmode"
if EXIST "%ProgramFiles%\212\android-remote\tmode" goto setadmin
title %admin%設定作業
echo "(1) _______________     (2)_______________    (3)_______________      "
echo "   |>_                    |>_                   |>_                   "
echo "   |______________        |______________       |______________       "
echo "   |212 }test             |212 c}test           |212 h}test           "
echo "   |done.                 |cmd test             |adb%z% shell test       "
echo "   |212 }                 |212 c}               |212 h}               "
choice /c 123 /n /m 請選擇您想要的模式:
set first=%ERRORLEVEL%
echo 設否將設定鎖定在系統管理員?
choice
if {%ERRORLEVEL%}=={1} (
if {%admin%}=={#} (
md %ProgramFiles%\212\android-remote\tmode\%first%
set tcmd=%first%
echo 完成
pause
cls
goto settings)
goto seetadmin)


:set2cb
md %USERPROFILE%\AppData\Local\212\android-remote\tmode\%first%
set tcmd=%first%
echo 完成
pause
cls
goto settings




:set3
rd /S /Q "%USERPROFILE%\AppData\Local\212\android-remote\1"
rd /S /Q "%USERPROFILE%\AppData\Local\212\android-remote\2"
rd /S /Q "%USERPROFILE%\AppData\Local\212\android-remote\3"
rd /S /Q "%USERPROFILE%\AppData\Local\212\android-remote\4"
rd /S /Q "%ProgramFiles%\212\android-remote\1"
rd /S /Q "%ProgramFiles%\212\android-remote\2"
rd /S /Q "%ProgramFiles%\212\android-remote\3"
rd /S /Q "%ProgramFiles%\212\android-remote\4"
cls
if EXIST "%ProgramFiles%\212\android-remote\1" goto setadmin
choice /c 0123456789 /n /m 請輸入密碼:
cls
set /A a=%ERRORLEVEL%-1
choice /c 0123456789 /n /m 請輸入密碼:
cls
set /A b=%ERRORLEVEL%-1
choice /c 0123456789 /n /m 請輸入密碼:
cls
set /A c=%ERRORLEVEL%-1
choice /c 0123456789 /n /m 請輸入密碼:
cls
set /A d=%ERRORLEVEL%-1
echo 設否將設定鎖定在系統管理員?
choice
if {%ERRORLEVEL%}=={1} (
if {%admin%}=={#} (
md %ProgramFiles%\212\android-remote\1\%a%
md %ProgramFiles%\212\android-remote\2\%b%
md %ProgramFiles%\212\android-remote\3\%c%
md %ProgramFiles%\212\android-remote\4\%d%
echo 完成
pause
cls
goto settings
set a=
set b=
set c=
set d=
)
goto setadmin)




:set3cb
md %USERPROFILE%\AppData\Local\212\android-remote\1\%a%
md %USERPROFILE%\AppData\Local\212\android-remote\2\%b%
md %USERPROFILE%\AppData\Local\212\android-remote\3\%c%
md %USERPROFILE%\AppData\Local\212\android-remote\4\%d%
set a=
set b=
set c=
set d=
echo 完成
pause
cls
goto settings





:set4
goto backup




:set4cb
copy /Y "%fl%\%fn%" "%USERPROFILE%\AppData\Local\212\android-remote\backup\"
echo 完成
pause
cls
goto settings



:set5
choice /c yn /m 是否啟用隨機啟動顏色?
if {%ERRORLEVEL%}=={1} (md %cl%color)
if {%ERRORLEVEL%}=={2} (rd /S /Q %cl%color)
set set5=%ERRORLEVEL%
choice /c yn /m 是否鎖在系統管理員?
if {%ERRORLEVEL%}=={1} (
if {%admin%}=={#} (
if {%set5%}=={1} (md %acl%color)
if {%set5%}=={2} (rd /S /Q %acl%color)
) ELSE (
goto setadmin
)
)
goto settings


:set6
choice /m 啟用?
if {%ERRORLEVEL%}=={1} (echo 1 >%cl%ntt.st) else del /S /Q %cl%ntt.st>nul
pause
goto settings


:set7
choice /m 啟用?
if {%ERRORLEVEL%}=={1} (echo 1 >%cl%bkpautotap.st) else del /S /Q %cl%bkpautotap.st>nul
pause
goto settings



:setadmin
echo "       ^       "
echo "      /|\      "
echo "     / | \     "
echo "    /  |  \    "
echo "   /   |   \   "
echo "  /____|____\  "
echo "  \    |    /  "
echo "   \   |   /   "
echo "    \  |  /    "
echo "     \ | /     "
echo "      \|/      "
echo "       v       "
echo 您未以系統管理員執行此程式，麻煩以右鍵[以系統管理員執行[A]]。謝謝。
pause
)
set /A c=%set% - 1
::if {%set%1}=={51} (goto settings)
goto settings
::goto set%c%cb

:adbsec
echo 進入第二adb...
set z=%zs%
goto label8

:adbfst
echo 返回原始adb...&cd ..&cd adb
set z=%zf%
cd %adbl%
goto label8



:deviceinfo
echo 裝置是否支援使用分割螢幕:
adb%z% shell am supports-multiwindow
echo 解析度:
adb%z% shell wm size
echo 裝置支援的最大使用者數:
adb%z% shell pm get-max-users
adb%z% shell getprop ro.build.version.release>ia.st
adb%z% shell getprop ro.product.model>ib.st
adb%z% shell getprop ro.product.brand>ic.st
adb%z% shell getprop ro.product.name>id.st
set /P ia=<ia.st
set /P ib=<ib.st
set /P ic=<ic.st
set /P id=<id.st
echo [Android 版本][裝置型號][裝置品牌][裝置名稱]:      [%ia%][%ib%][%ic%][%id%]
..\adb\adb%z% get-serialno>install.tmp
set /P id=<install.tmp
..\adb\adb%z% get-state>install.tmp
set /P type=<install.tmp
echo.
echo [裝置識別碼][裝置狀態]:                            [%id%][%type%]
echo.
del /S /Q i*.st>nul
goto label8

:now
adb%z% shell dumpsys window>now.st
findstr /I mCurrentFocus now.st>now2.st
set /P now=<now2.st
set now=%now:mCurrentFocus=%
set now=%now:Window{=%
set now=%now:}=%
set a=0
for %%a in (%now%) DO (
call set /A a=!a! + 1
echo %%a>nowing.tmp
call set /P temping=<nowing.tmp
call set temping=!temping:/= !
call set b=1
for %%c in (!temping!) DO (
if {!b!}=={1} (call set temping=%%c)
call set b=0
echo !temping!|clip
)
)
echo 正在執行%now%
del /S /Q now*.st>nul
goto label8



:nowr
adb%z% shell dumpsys window>now.st
findstr mCurrentFocus now.st>now2.st
set /P now=<now2.st
set now=%now:mCurrentFocus=%
set now=%now:Window{=%
set now=%now:}=%
set a=0
if not EXIST plrnow.st (echo.>plrnow.st)
for %%a in (%now%) DO (
call set /A a=!a! + 1
echo %%a>nowing.tmp
call set /P temping=<nowing.tmp
)
findstr /V /I !temping! plrnow.st>plrnow.tmp
type plrnow.tmp>plrnow.st
echo !temping!>>plrnow.st
echo 已記錄 !temping!
echo !temping!|clip
:nowrs
del /S /Q now*.st now.tmp>nul
goto label8









:rnow
type plrnow.st
set /P rnow=清空
findstr /V /I %rnow% plrnow.st>plrnow.tmp
type plrnow.tmp>plrnow.st
del /S /Q plrnow.tmp>nul
goto label8



:cusb
echo 目前USB狀態:
%t%adb%z% shell svc usb getFunctions
choice /c mpnicr /n /m 切換usb功能為[Mtp/Ptp/rNdis/mIdi/Charging/Reset]
if {%ERRORLEVEL%}=={1} (%t%adb%z% shell svc usb setFunctions mtp)
if {%ERRORLEVEL%}=={2} (%t%adb%z% shell svc usb setFunctions ptp)
if {%ERRORLEVEL%}=={3} (%t%adb%z% shell svc usb setFunctions rndis)
if {%ERRORLEVEL%}=={4} (%t%adb%z% shell svc usb setFunctions midi)
if {%ERRORLEVEL%}=={5} (%t%adb%z% shell svc usb setFunctions)
if {%ERRORLEVEL%}=={6} (%t%adb%z% shell svc usb resetUsbGadget)
goto label8






:ckbty
mode con cols=33 lines=5
:ckbty-c
title %nowl% %% %nowt%m°C
adb%z% shell dumpsys battery>now.st
findstr status now.st>now2.st
set /P now=<now2.st
set now=%now:status=%
set now=%now::=%
set now=%now: =%
if {%now%}=={2} (color 2F&&set charging=*)
if not {%now%}=={2} (color 6b&&set charging=)
if {%now%}=={5} (color AF&&set charging=*)
findstr level now.st>now2.st
set /P nowl=<now2.st
findstr temperature now.st>now2.st
set /P nowt=<now2.st
set nowl=%nowl: level=%
set nowt=%nowt:temperature: =%
echo.
echo.
echo 現在電池電量為%nowl%
echo.
echo 更新時間:%time% %nowt%m°C
timeout>nul 20
if not {%charging%1}=={*1} (set nowl=%nowl::=.%)
goto ckbty-c




:ip
set ipa=
set ipt=
adb shell ifconfig wlan0>ip.tmp
findstr Mask ip.tmp>ip2.tmp
set /P ipt=<ip2.tmp
set r=0
for %%a in (%ipt%) DO (
if {!r!}=={1} (call set ipa=%%a)
call set /A r=!r! + 1
)
set ipa=%ipa:addr:=%
del /S /Q ip.tmp ip2.tmp>nul
if {1%back%}=={11} (goto :eof)
echo IP為 %ipa%
echo %ipa%|clip	
goto label8





:rso
echo 1100101110000100101%t%
set t=%t%111000000110010101
goto rso
:label1
prompt $P$_212$S$T$G
echo 輸入"e"以整理畫面。
echo 輸入"c"以執行終端機。
echo 輸入"h"以執行adb shell。
echo 輸入"b"以返回。
echo 輸入"h"以返回首頁。
echo 輸入"lo"以鎖定螢幕。
echo 輸入"l["以減少音量(也可以用"l[["及"l[[[")。
echo 輸入"l]"以減少音量(也可以用"l]]"及"l]]]")。
echo "          __________                    選單                      "
echo "         |          |        |         _______          空格  ts  "
echo "方向鍵:  |     ^    |    le  | Enter   _______  lm   |________|   "
echo "         |    li    |<_______|         _______                    "
echo "_________|__________|_________                                    "
echo "|        |          |         |      |       /______              "
echo "|    <   |    v     |    >    |  lv  |按下  /  退回               "
echo "|    lj  |    lk    |    ll   |      |      \ ______ lb           "
echo "|________|__________|_________|      v       \                    "
echo 輸入"syt"以開啟YouTube。
:label8
title %admin%Android 遙控器
if {1%1}=={1nc} (color 07)
if {%mode%}=={2} (pause&cls)
if {%mode%}=={3} (pause&cls)
if {%tcmd%}=={1} (set rtcmd=c)
if {%tcmd%}=={2} (set rtcmd=h)
if {%mode%}=={3} (goto s)
if {%r%}=={1} (
if EXIST %cl%killtask\%taskpid% (exit)
goto f)
if {%e%}=={1} (goto e)
if {%q8%}=={1} (exit)
if {%re%}=={1} (goto f)
if {%o%}=={1} (exit)
set /P ch=212 %USERNAME%@%USERDOMAIN% %time% %rtcmd%}
echo 212 %USERNAME%@%USERDOMAIN% %time% %rtcmd%}%ch%>>%cl%\log.st
goto f
:s
set /P ch=
:f
set rch=%ch%
set ich=%ch: =%
set ich=%ich:!=%
set ich=%ich:@=%
set ich=%ich:#=%
set ich=%ich:$=%
set ich=%ich:^=%
set ich=%ich:(=%
set ich=%ich:)=%
set ich=%ich:_=%
set ich=%ich:+=%
set ich=%ich:`=%
set ich=%ich:-=%
set ich=%ich:{=%
set ich=%ich:}=%
set ich=%ich:\=%
set ich=%ich:/=%
set ich=%ich:?=%
set ich=%ich:>=%
set ich=%ich:<=%
set ich=%ich:,=%
set ich=%ich:.=%
set ich=%ich:;=%
set ich=%ich:'=%
set ich=%ich:"=%
if {%tcmd%}=={1} (set ch=%ich%)
if {%tcmd%}=={2} (set ch=%ich%)
if {%ch%}=={' '} (exit)
if {%ch%}=={e} (cls&goto label8)
if {%ch%}=={c} (set nd=%cd%&cmd&cd %nd%&goto label8)
if {%ch%}=={h} (adb%z% shell&goto label8)
if {%ch%}=={b} (%t%adb%z% shell input keyevent 4&goto label8)
if {%ch%}=={ho} (%t%adb%z% shell input keyevent 3&goto label8)
if {%ch%}=={lo} (%t%adb%z% shell input keyevent 26&goto label8)
if {%ch%}=={l[} (%t%adb%z% shell input keyevent 25&goto label8)
if {%ch%}=={l]} (%t%adb%z% shell input keyevent 24&goto label8)
if {%ch%}=={l[[} (%t%adb%z% shell input keyevent 25 25&goto label8)
if {%ch%}=={l]]} (%t%adb%z% shell input keyevent 24 24&goto label8)
if {%ch%}=={l[[[} (%t%adb%z% shell input keyevent 25 25 25&goto label8)
if {%ch%}=={l]]]} (%t%adb%z% shell input keyevent 24 24 24&goto label8)
if {%ch%}=={li} (%t%adb%z% shell input keyevent 19&goto label8)
if {%ch%}=={lk} (%t%adb%z% shell input keyevent 20&goto label8)
if {%ch%}=={lj} (%t%adb%z% shell input keyevent 21&goto label8)
if {%ch%}=={ll} (%t%adb%z% shell input keyevent 22&goto label8)
if {%ch%}=={lv} (%t%adb%z% shell input keyevent 23&goto label8)
if {%ch%}=={lm} (%t%adb%z% shell input keyevent 82&goto label8)
if {%ch%}=={le} (%t%adb%z% shell input keyevent 66&goto label8)
if {%ch%}=={lb} (%t%adb%z% shell input keyevent 67&goto label8)
if {%ch%}=={ts} (%t%adb%z% shell input keyevent 62&goto label8)
if {%ch%}=={bsr} (%t%adb%z% shell input keyevent 64&goto label8)
if {%ch%}=={cma} (%t%adb%z% shell input keyevent 27&goto label8)
if {%ch%}=={syt} (%t%adb%z% shell am start com.google.android.youtube.tv&goto label8)
if {%ch%}=={o2w} (cd ..&cd %fl%&explorer.exe .&cd ..&cd %adbl%&goto label8)
if {%ch%}=={gal} (cd %adbl%&goto label8)
if {%ch%}=={wta} (goto label2)
if {%ch%}=={edit} (start notepad %fl%\%fn%&goto label8)
if {%ch%}=={aoi} (goto label10)
if {%ch%}=={cssr} (goto label19)
if {%ch%}=={tap} (goto label13)
if {%ch%}=={clr} (set ca=6&set cb=b&color 6b&goto label8)
if {%ch%}=={swp} (goto label14)
if {%ch%}=={ssp} (screencap.png&goto label8)
if {%ch%}=={cssp} (goto label17)
if {%ch%}=={lcon} (set lcon=1&goto scolor)
if {%ch%}=={vi} (type %fl%\%fn%&goto label8)
if {%ch%}=={ssr} (screenrec.mp4&goto label8)
if {%ch%}=={con} (goto label11)
if {%ch%}=={tcmd} (set tcmd=1&goto label8)
if {%ch%}=={ccon} (goto ccon)
if {%ch%}=={tat} (set rtcmd=&set tcmd=&goto label8)
if {%ch%}=={tsh} (set tcmd=2&goto label8)
if {%ch%}=={sec} (goto adbsec)
if {%ch%}=={fst} (goto adbfst)
if {%ch%}=={usb} (set z= -d&goto label8)
if {%ch%}=={dsp} (set z=&goto label8)
if {%ch%}=={aaoi} (adb wait-for-device&goto label10)
if {%ch%}=={csp} (adb%z% shell mkdir /sdcard/.212>nul&adb%z% shell screencap -p /sdcard/.212/screencap.png&adb%z% pull /sdcard/.212/screencap.png&adb%z% shell rm /sdcard/.212/screencap.png&screencap.png&goto label8)
if {%ch%}=={ccsp} (goto label18)
if {%ch%}=={lsp} (dir /P /N /O N screencap*.png&goto label8)
if {%ch%}=={sn} (start /I %fl%\%fn%&goto label8)
if {%ch%}=={lsrn} (goto lsrn)
if {%ch%}=={lspn} (goto lspn)
if {%ch%}=={reset} (rd /S /Q "%USERPROFILE%\AppData\Local\212\android-remote"&rd /S /Q "%ProgramFiles%\212\android-remote"&goto restart)
if {%ch%}=={at} (goto at)
if {%ch%}=={admin} (set back=label8&goto startadmin)
if {%ch%}=={rsr} (goto rsr)
if {%ch%}=={rsp} (goto rsp)
if {%ch%}=={pmt} (prompt&goto label8)
if {%ch%}=={sspa} (for /L %%f in (0 1 100) DO if EXIST screencap%%f.png screencap%%f.png
goto label8)
if {%ch%}=={web} (set /P web=打開&%t%adb%z% shell am start -a android.intent.action.VIEW -d !web!&goto label8)
if {%ch%}=={play} (set /P web=在PLAY商店上搜尋&set web=!web: =+!&%t%adb%z% shell am start -a android.intent.action.VIEW -d https://play.google.com/store/search?q=!web!&goto label8)
if {%ch%}=={plays} (set /P web=在PLAY商店上打開&set web=!web: =+!&%t%adb%z% shell am start -a android.intent.action.VIEW -d https://play.google.com/store/apps/details?id=!web!&goto label8)
if {%ch%}=={rd} (set re=1&set /P ch=執行&start %fl%\%fn%&set re=&&goto label8)
if {%ch%}=={ntt} (set t=start /min /high &goto label8)
if {%ch%}=={ocl} (explorer %cl%&goto label8)
if {%ch%}=={oacl} (explorer %acl%&goto label8)
if {%ch%}=={pul} (set /P d=您要接收...&%t%adb%z% pull !d! %adbl%\PulledFile&goto label8)
if {%ch%}=={psh} (cd PulledFile&dir /OD&set /P d=您要傳送...&%t%%adbl%\adb%z% push !d! /sdcard/download/&cd..&goto label8)
if {%ch%}=={apk} (cd PulledFile&dir /OD&set /P d=您要安裝...&%t%%adbl%\adb%z% install !d!&cd ..&goto label8)
if {%ch%}=={sdl} (cd PulledFile&dir /OD&set /P d=刷機...&%t%%adbl%\adb%z% sideload !d!&cd..&goto label8)
if {%ch%}=={sur} (set /P d=切換到使用者[ID]...&%t%adb%z% shell am switch-user !d!&goto label8)
if {%ch%}=={fur} (echo 目前使用者ID:&%t%adb%z% shell am get-current-user&goto label8)
if {%ch%}=={cur} (set /P d=建立使用者...&%t%adb%z% shell pm create-user !d!&goto label8)
if {%ch%}=={rur} (set /P d=刪除使用者...&%t%adb%z% shell pm remove-user !d!&goto label8)
if {%ch%}=={bur} (set /P d=開始使用者...&%t%adb%z% shell am start-user !d!&goto label8)
if {%ch%}=={pur} (set /P d=結束使用者...&%t%adb%z% shell am stop-user !d!&goto label8)
if {%ch%}=={fsb} (%t%adb%z% shell reboot bootloader&goto label8)
if {%ch%}=={rvo} (%t%adb%z% shell reboot recovery&goto label8)
if {%ch%}=={rbt} (%t%adb%z% shell reboot&goto label8)
if {%ch%}=={pff} (%t%adb%z% shell reboot -p&goto label8)
if {%ch%}=={rst} (%t%adb%z% shell am restart&goto label8)
if {%ch%}=={hang} (%t%adb%z% shell am hang&goto label8)
if {%ch%}=={kal} (%t%adb%z% shell am kill-all&goto label8)
if {%ch%}=={oal} (explorer %adbl%&goto label8)
if {%ch%}=={osl} (explorer %adbl%\PulledFile&goto label8)
if {%ch%}=={rnt} (set t=&goto label8)
if {%ch%}=={lsr} (dir /P /N /O N screenrec*.mp4&goto label8)
if {%ch%}=={reclo} (goto label16&screenrec.mp4)
if {%ch%}=={chbty} (%t%adb%z% shell dumpsys battery&set /P chbty=請輸入電池電量 &%t%adb%z% shell dumpsys battery set level !chbty!&goto label8)
if {%ch%}=={rebty} (%t%adb%z% shell dumpsys battery reset&goto label8)
if {%ch%}=={ckbty} (set cmd2=goto ckbty&start %fl%\%fn%&set cmd2=&goto label8)
if {%ch%}=={lgbty} (set cmd2=goto ckbty-c&start %fl%\%fn%&set cmd2=&goto label8)
if {%ch%}=={rec30} (goto label12&screenrec.mp4)
if {%ch%}=={kpon} (start %fl%\keep-on.bat&goto label8)
if {%ch%}=={kpho} (start %fl%\keep-home.bat&goto label8)
if {%ch%}=={cedit} (set /P cedit=編輯&start notepad %fl%\!cedit!&goto label8)
if {%ch%}=={rts} (goto rso)
if {%ch%}=={rec} (adb%z% shell mkdir /sdcard/.212>nul&adb%z% shell screenrecord --verbose /sdcard/.212/screenrec.mp4&adb%z% pull /sdcard/.212/screenrec.mp4&adb%z% shell rm /sdcard/.212/screenrec.mp4&screenrec.mp4&goto label8)
if {%ch%}=={set} (goto settings)
if {%ch%}=={wtc} (start %fl%\whatscall.cmd&goto label8)
if {%ch%}=={rcsp} (goto rcsp)
if {%ch%}=={info} (goto deviceinfo)
if {%ch%}=={rcon} (goto rcon)
if {%ch%}=={star} (adb%z% shell am start tv.firelive.android/com.jyzx8.fireplayer.MainActivity&goto label8)
if {%ch%}=={log} (echo.&type %cl%\log.st&echo.&goto label8)
if {%ch%}=={cal} (goto cal)
if {%ch%}=={pl} (goto pl)
if {%ch%}=={plu} (goto pl-u)
if {%ch%}=={res} (goto plrestore)
if {%ch%}=={ip} (goto ip)
if {%ch%}=={hdo} (%t%adb%z% shell pm clear com.android.settings&goto label8)
if {%ch%}=={dpi} (%t%adb%z% shell wm density&set /P dpi=切換DPI成:&adb%z% shell wm density !dpi!&goto label8)
if {%ch%}=={ipl} (goto ipl)
if {%ch%}=={rsc} (%t%adb%z% shell rm /sdcard/.212/*&%t%adb%z% shell rmdir /sdcard/.212&goto label8)
if {%ch%}=={rr} (goto restart)
if {%ch%}=={pl3} (goto pl-3)
if {%ch%}=={pls} (goto pl-s)
if {%ch%}=={pli} (goto pli)
if {%ch%}=={pld} (goto pl-d)
if {%ch%}=={ple} (goto pl-e)
if {%ch%}=={now} (goto now)
if {%ch%}=={r} (goto nowr)
if {%ch%}=={rnow} (goto rnow)
if {%ch%}=={dock} (mode con cols=30 lines=5&goto label8)
if {%ch%}=={wifi} (%t%adb%z% shell svc wifi enable&goto label8)
if {%ch%}=={dwifi} (%t%adb%z% shell svc wifi disable&goto label8)
if {%ch%}=={data} (%t%adb%z% shell svc data enable&goto label8)
if {%ch%}=={ddata} (%t%adb%z% shell svc data disable&goto label8)
if {%ch%}=={blue} (%t%adb%z% shell svc bluetooth enable&goto label8)
if {%ch%}=={dblue} (%t%adb%z% shell svc bluetooth disable&goto label8)
if {%ch%}=={ston} (%t%adb%z% shell svc power stayon true&goto label8)
if {%ch%}=={dton} (%t%adb%z% shell svc power stayon false&goto label8)
if {%ch%}=={cusb} (goto cusb)
if {%ch%}=={srbt} (%t%adb%z% shell svc power reboot&goto label8)
if {%ch%}=={std} (%t%adb%z% shell svc power shutdown&goto label8)
if {%ch%}=={dsc} (adb disconnect&goto label8)
if {%ch%}=={cm} (ren PulledFile PulledFiles&&ren PulledBackup PulledFile&&ren PulledFiles PulledBackup&goto label8)
if {%ch%}=={plr} (goto plr)
if {%ch%}=={rpl} (goto rpl)
if {%ch%}=={rrpl} (goto rrpl)
if {%ch%}=={apks} (goto xapk)
if {%ch%}=={clean} (goto clean)
if EXIST %fl%\%ch%.stc md %cl%tmp&set sfl=%fl%\%ch%&md %cl%tmp&copy /Y %fl%\%ch%.stc %cl%tmp\%ch%.cmd&call %cl%tmp\%ch%.cmd&goto label8
if EXIST %fl%\%ch%.stcn md %cl%tmpset sfl=%fl%\%ch%md %cl%tmp&copy /Y %fl%\%ch%.stcn %cl%tmp\%ch%.bat&start %cl%tmp\%ch%.bat&goto label8
if EXIST %fl%\%ch%.cmd call %fl%\%ch%.cmd&goto label8
if EXIST %fl%\%ch%.bat start %fl%\%ch%.bat&goto label8
if {%tcmd%}=={1} (%rch%&set ch=%rch%&goto label8)
if {%tcmd%}=={2} (%t%adb%z% shell %rch% & set ch=%rch% &goto label8)
%t%adb%z% shell input text '%ch%'
goto label8
:vision
::Android remote is created by ysh(mysh212) at 2019/1/20 1:39 PM.
::作者:ysh 建立日期: 2019/1/20 下午 1:39:46
::它的前身212.bat在 2018/7/22 下午 5:43:15 建立
set vision=10
set vision=11
set vision=12
set vision=13
set vision=14
set vision=15
set vision=16
set vision=17
set vision=18
set vision=19
::新增 批次禁用應用程式
set vision=20
set vision=21
set vision=22
set vision=23
set vision=24
set vision=25
set vision=26
set vision=27
set vision=28
set vision=29
set vision=30
set vision=31
set vision=32
set vision=33
set vision=34
set vision=35
set vision=36
set vision=37
set vision=38
set vision=39
set vision=40
set vision=41
set vision=42
set vision=43
set vision=44
set vision=45
set vision=46
set vision=47
set vision=48
set vision=49
set vision=50
set vision=51
set vision=52
set vision=53
set vision=54
set vision=55
set vision=56
set vision=57
set vision=58
set vision=59
set vision=60
set vision=61
set vision=62
set vision=63
set vision=64
set vision=65
set vision=66
set vision=67
set vision=68
set vision=69
set vision=1
set vision=2
set vision=3
set vision=4
set vision=5
set vision=6
set vision=7
set vision=8
set vision=1
set vision=2
set vision=1
set vision=2
set vision=3
set vision=1
set vision=1
set vision=2
set vision=3
set vision=4
set vision=5
set vision=6
set vision=7
set vision=8
set vision=9
set vision=10
set vision=11
set vision=12
set vision=1
set vision=2
set vision=3
set vision=1
set vision=4
set vision=8
set vision=9
set vision=1
set vision=2
set vision=1
set vision=2
set vision=3
set vision=4
set vision=5
set vision=6
set vision=7
set vision=8
set vision=9
set vision=1
set vision=2
set vision=3
set vision=4
set vision=5
set vision=6
set vision=1
set vision=2
set vision=3
set vision=4
set vision=1
set vision=2
set vision=3
set vision=4
set vision=5
set vision=6
set vision=7
set vision=8
set vision=9
set vision=10
set vision=2
set vision=3
set vision=4
set vision=1
