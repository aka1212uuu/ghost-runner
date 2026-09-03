@echo off
echo ========================================================
echo   GHOST-WDA 1000X: PUSH TO GITHUB ACTIONS BUILDER
echo ========================================================
echo.
set /p REPO_NAME=Nhap ten Repo ban vua tao tren GitHub (Vi du: ghost-runner): 

if "%REPO_NAME%"=="" (
    echo Ten repo khong duoc de trong!
    pause
    exit /b
)

echo.
echo [*] Cau hinh remote origin: https://github.com/aka1212uuu/%REPO_NAME%.git
git remote set-url origin https://github.com/aka1212uuu/%REPO_NAME%.git

echo [*] Dang day ma nguon len GitHub...
git push -u origin master

echo.
echo ========================================================
echo [OK] DA DAY MA NGUON LEN GITHUB THANH CONG!
echo.
echo Truy cap: https://github.com/aka1212uuu/%REPO_NAME%/actions
echo De xem qua trinh Apple Silicon Mac tu dong bien dich file GhostRunner_iOS18.ipa!
echo ========================================================
pause
