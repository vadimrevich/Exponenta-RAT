@echo off
REM �������� ������� IP ����� ��������������
call "%PUB1%\Util\getip_1.cmd"
call %PUB1%\Util\get_DynDNS.cmd
rem ���������� ��� �� ���� -���������
call %PUB1%\Util\send_ip.cmd
call %PUB1%\Util\send.syteminfocheck.cmd

