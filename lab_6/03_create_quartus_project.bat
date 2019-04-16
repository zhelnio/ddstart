
set BOARD=epm_240

rem delete existing project folder
rd /s /q %BOARD%

rem create folder for new project
mkdir %BOARD%

rem copy template files
copy ..\common\%BOARD% .\%BOARD%

rem create Quartus project file
echo # > .\%BOARD%\top.qpf
