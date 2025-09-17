@echo off

set remotedir=/home/%user%/temp_proj_cpp

.\binary\putty\PLINK.EXE %user%@%remotehost% -pw "%password%" -batch "rm -rf %remotedir% || true; mkdir -p %remotedir%;"

.\binary\putty\PSCP.EXE -r -pw "%password%" .\src %user%@%remotehost%:%remotedir%

rem .\binary\putty\PLINK.EXE %user%@%remotehost% -pw "%password%" -batch "cd %remotedir%/src ; pwd; ls -l;"

.\binary\putty\PLINK.EXE %user%@%remotehost% -pw "%password%" -batch "cd %remotedir%/src ; g++ -I %remotedir%/src/main main/Main.cpp -o output -O2 -std=c++14;"

.\binary\putty\PLINK.EXE %user%@%remotehost% -pw "%password%" -batch "cd %remotedir%/src ; CL_LOG_ERRORS=stdout ./output;"

echo 
echo Execution completed