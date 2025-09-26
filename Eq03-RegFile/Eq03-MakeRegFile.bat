echo on

set GHDL_PATH=C:\ghdl\ghdl\bin\ghdl.exe
set GTKWAVE_PATH=C:\ghdl\gtkwave\gtkwave\bin\gtkwave.exe

%GHDL_PATH% --clean
%GHDL_PATH% --remove

%GHDL_PATH% -a Eq03-reg16bits.vhd
%GHDL_PATH% -a Eq03-RegFile.vhd
%GHDL_PATH% -a Eq03-RegFile_tb.vhd

%GHDL_PATH% -r regFile_tb --stop-time=130ns --wave=Eq03-RegFile.ghw

start cmd /c %GTKWAVE_PATH% -f Eq03-RegFile.ghw -a Eq03-RegFile.gtkw
