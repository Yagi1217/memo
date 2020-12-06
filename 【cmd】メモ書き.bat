rem ネットワーク上のMACアドレスを確認する
arp -a

rem PCをワークグループ「WORKGROUP」へ参加させる
wmic ComputerSystem where "name='%computername%'" call JoinDomainOrWorkgroup Name="WORKGROUP"

rem PCの名前「%computername%」を変更する
wmic computersystem where name="%computername%" call rename name="NEW_PC_NAME"

rem ファイルコピー---------------------------------------------------------------------------
@echo off
rem ---------copySource:コピー元 / copyTarget:コピー先 / 繰り返し回数----------
set logOutputTarget="./log.txt"
set copySource[1]="D:/test/001"
set copySource[2]="D:/test/002"

set copyTarget[1]="D:/test/002"
set copyTarget[2]="D:/test/003"

set repeatTimes=2
rem -----------------------------------------------------------------------------------

SETLOCAL enabledelayedexpansion
rem 管理者権限があるかどうかチェック
whoami /PRIV | find "SeLoadDriverPrivilege" >NUL
if not errorlevel 1 goto start

powershell start-process %~0 -ArgumentList '%USERPROFILE% %APPDATA%' -verb runas
goto :EOF

:start
for /l %%i IN (1,1,%repeatTimes%) do (
	robocopy !copySource[%%i]! !copyTarget[%%i]! /e /tee /np /zb /r:10 /w:1 /log+:%logOutputTarget%
)

pause >nul
rem ファイルコピー---------------------------------------------------------------------------
