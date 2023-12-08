REM 批量将本目录中的所有C++文件用Astyle进行代码美化操作


REM 设置Astyle命令位置和参数

@echo off

set astyle="D:\Program Files\AStyle\bin\astyle.exe"

REM 循环遍历目录

REM for /r . %%f in (*.cpp;*.c) do %astyle% --style=ansi -s4 -T -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"
REM for /r . %%f in (*.hpp;*.h) do %astyle% --style=ansi -s4 -T -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"

REM 去掉-T 不要用tab缩进 用4个空格即可-s4

for /r . %%f in (*.cpp;*.c) do %astyle% --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"
for /r . %%f in (*.hpp;*.h) do %astyle% --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs "%%f"

REM 其中，Run中输入astyle的命令参数：
REM "D:\program files\AStyle\bin\AStyle.exe" --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs --suffix=.pre %f
REM "D:\program files\AStyle\bin\AStyle.exe" --style=ansi -s4 -S -N -Y -m2 -M40 -f -p --convert-tabs --suffix=none %f

REM ansi C 格式化某个目录下所有文件的命令为：
REM "D:\program files\AStyle\bin\AStyle.exe" Z:\LocalProject\DEZHOU3716/*.c Z:\LocalProject\DEZHOU3716/*.h --REM style=ansi -s4 -S -N -L -m0 -M40 --recursive --convert-tabs --suffix=.pre %f

REM 删除所有的astyle生成文件

for /r . %%a in (*.orig) do del "%%a"

pause
