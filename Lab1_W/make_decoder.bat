echo on

set GHDL_PATH=C:\ghdl\ghdl\bin\ghdl.exe
set GTKWAVE_PATH=C:\ghdl\gtkwave\gtkwave\bin\gtkwave.exe

%GHDL_PATH% --clean
%GHDL_PATH% --remove

%GHDL_PATH% -a decoder.vhd
%GHDL_PATH% -a decoder_tb.vhd

%GHDL_PATH% -r decoder_tb --wave=sim_decoder.ghw

start cmd /c %GTKWAVE_PATH% -f sim_decoder.ghw -a sim_decoder.gtkw

