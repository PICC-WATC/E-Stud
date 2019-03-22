@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\Ruby24\bin\ruby.exe" "C:/Users/admin/Documents/E-Stud/vendor/bundle/bin/chromedriver-helper" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\Ruby24\bin\ruby.exe" "%~dpn0" %*
