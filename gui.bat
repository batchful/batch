<!-- :: Batch section
color 0a
@echo off
setlocal

for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTAreply=%%a"
echo End of HTA window, reply: "%HTAreply%"
goto :EOF
-->


<HTML>
<HEAD>
    <HTA:APPLICATION SCROLL="no" SYSMENU="no" >

    <TITLE>batchfull</TITLE>
    <SCRIPT language="JavaScript">
    window.resizeTo(300,300);

    function closeHTA(){
        window.close();
    }

    </SCRIPT>
</HEAD>
<BODY>
   <button onclick="">First option</button>
   <button onclick="">Second option</button>
   <button onclick="closeHTA();">Close</button>
</BODY>
</HTML>
