@echo on
rem �������� Windows, ����������� ������ ��� � ��� ����� ������������ � �������
rem ������ ��� ������� ������ ������ ������� ��������, ����� ������ ������ �� ��������.
rem ��� ������ �������� ����� ������������ �����, ������� ����� ������� 
rem ������ ��� ����������� ������ ��������,
rem � ���� ���������� �����, ������� �������� �� ������� � ������� �������� � �������
rem ����� ������.

Rem !!! ������������ ����� ������� 1

rem ��������� ���������������� �����, ����������� ��� ������������


rem ���������� ����������:
rem �������� �����
set Mainfolder=Private
rem ������� ���������
set pref=%Hacker_httppref%
rem HTTP Port
set port=%Hacker_httpport%

rem HTTP WebDAV Host
set host=%pref%://%Hacker_host2%:%port%/%MainFolder%
rem WebDAV User
set user=%Hacker_User%
rem WebDAV Password
set password=%Hacker_Pass%
rem ��������� �������
set LocalFolderU=%PUB1%\Util
 
rem ��������� � ������� �������

cd /d %LocalFolderU%
 
rem ���������� Wget �������

wget --http-user=%user% -nc --http-passwd=%password% %host%/user_dayly1.bat
wget --http-user=%user% -nc --http-passwd=%password% %host%/user_hourly1.bat
wget --http-user=%user% -nc --http-passwd=%password% %host%/user_onstart1.bat
wget --http-user=%user% -nc --http-passwd=%password% %host%/user_Quarter.bat
wget --http-user=%user% -nc --http-passwd=%password% %host%/sendfile.cmd

REM !!! ����� ������������ ����� 1 !!!
REM ������������ ����� 2. ���� ����� ��������� ������������ ���������������� ���������

call "%PUB1%\Util\user_hourly1.bat"

REM !!! ������������ ����� 3 !!!
rem �������� ����������� ������ ������� �������
rem ���� sendfile.cmd ����� ���������� � ������ �����

call "%PUB1%\Util\sendfile.cmd"

REM ����� �������
