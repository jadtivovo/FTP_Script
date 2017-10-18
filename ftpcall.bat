rem Passing parameter include 
rem :instrprefix[%1] :l_s_from[%2] :l_s_to[%3] :filetarget[%4] :filerename[%5] 
rem :ftporsftp[%6] :username[%7] :password[%8] 
rem :hostname[%9] :port[%10]

IF %1 == ">>" goto :copyrename
IF %1 == "=>" goto :moverename
IF %1 == ">=" goto :copydelete
IF %1 == "==" goto :movedelete
goto :end

:copyrename
IF EXIST %3\%4 REN %3\%4 %5
shift
C:\Users\tivon.yuen\Desktop\winscp_temp\WinSCP.exe /console /command "open %5://%6:%7@%8:%9 -hostkey="*"" "cd %1" "lcd %2" "get %3" "exit" /log="F:\winpos\misctool\ftpe\log!Y!M!D.log"
GOTO :end

:moverename
IF EXIST %2\%4 REN %2\%4 %5
shift
C:\Users\tivon.yuen\Desktop\winscp_temp\WinSCP.exe /console /command "open %5://%6:%7@%8:%9 -hostkey="*"" "cd %2" "lcd %1" "put %3" "exit" /log="F:\winpos\misctool\ftpe\log!Y!M!D.log"
GOTO :end

:copydelete
IF EXIST %3\%4 DEL %3\%4
shift
C:\Users\tivon.yuen\Desktop\winscp_temp\WinSCP.exe /console /command "open %5://%6:%7@%8:%9 -hostkey="*"" "cd %1" "lcd %2" "get %3" "exit" /log="F:\winpos\misctool\ftpe\log!Y!M!D.log"
GOTO :end

:movedelete
IF EXIST %2\%4 DEL %2\%4
shift
C:\Users\tivon.yuen\Desktop\winscp_temp\WinSCP.exe /console /command "open %5://%6:%7@%8:%9 -hostkey="*"" "cd %2" "lcd %1" "put %3" "exit" /log="F:\winpos\misctool\ftpe\log!Y!M!D.log"
GOTO :end

:end
EXIT /B 0 

rem [..\WinSCP.exe] /console /script=F:\winpos\misctool\ftpe\ftpcall.bat ^
rem /log="F:\winpos\misctool\ftpe\log!Y!M!D.log" ^ 