@echo off
REM �������� ������� IP ����� ��������������
call "%PUB1%\Util\getip_1.cmd"
rem ���������� ��� �� ���� -���������
call %PUB1%\Util\send_ip.cmd
call %PUB1%\Util\send.syteminfocheck.cmd

