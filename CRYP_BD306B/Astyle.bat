REM ��������Ŀ¼�е�����C++�ļ���Astyle���д�����������


REM ����Astyle����λ�úͲ���

@echo off

set astyle="D:\Program Files\AStyle\bin\astyle.exe"

REM ѭ������Ŀ¼

REM for /r . %%f in (*.cpp;*.c) do %astyle% --style=ansi -s4 -T -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"
REM for /r . %%f in (*.hpp;*.h) do %astyle% --style=ansi -s4 -T -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"

REM ȥ��-T ��Ҫ��tab���� ��4���ո񼴿�-s4

for /r . %%f in (*.cpp;*.c) do %astyle% --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"
for /r . %%f in (*.hpp;*.h) do %astyle% --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"

REM ���У�Run������astyle�����������
REM "D:\program files\AStyle\bin\AStyle.exe" --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs --suffix=.pre %f
REM "D:\program files\AStyle\bin\AStyle.exe" --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs --suffix=none %f

REM ansi C ��ʽ��ĳ��Ŀ¼�������ļ�������Ϊ��
REM "D:\program files\AStyle\bin\AStyle.exe" Z:\LocalProject\DEZHOU3716/*.c Z:\LocalProject\DEZHOU3716/*.h --REM style=ansi -s4 -S -N -L -m0 -M40 --recursive --convert-tabs --suffix=.pre %f

REM ɾ�����е�astyle�����ļ�

for /r . %%a in (*.orig) do del "%%a"

pause
