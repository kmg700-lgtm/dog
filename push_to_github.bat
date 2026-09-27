@echo off
chcp 65001 > nul
set "GIT_EXE=C:\Program Files\Git\cmd\git.exe"

echo ========================================================
echo   PawMatch AI - GitHub 푸시 도우미
echo ========================================================
echo.
echo 대상 레포지토리: https://github.com/kmg700-lgtm/dog.git
echo 브랜치: main
echo.
echo --------------------------------------------------------
echo 원격 저장소(origin) 확인 및 설정 중...
"%GIT_EXE%" init
"%GIT_EXE%" branch -M main
"%GIT_EXE%" config user.name "User" 2>nul
"%GIT_EXE%" config user.email "user@example.com" 2>nul
"%GIT_EXE%" remote remove origin 2>nul
"%GIT_EXE%" remote add origin "https://github.com/kmg700-lgtm/dog.git"
"%GIT_EXE%" add index.html README.md run.bat push_to_github.bat .gitignore
"%GIT_EXE%" commit -m "feat: Add PawMatch AI dog breed classification web application" 2>nul

echo.
echo GitHub로 main 브랜치 푸시를 시작합니다...
echo.
echo [안내] 브라우저에 GitHub 로그인 또는 인증 창이 뜨면
echo 'Sign in with your browser'를 클릭하여 승인해주세요!
echo --------------------------------------------------------
echo.

"%GIT_EXE%" push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================================
    echo  🎉 GitHub(https://github.com/kmg700-lgtm/dog.git) 푸시 성공!
    echo ========================================================
) else (
    echo.
    echo --------------------------------------------------------
    echo [안내] 푸시 도중 거부되었거나 원격에 기존 커밋이 존재하는 경우,
    echo 강제 푸시(overwrite)를 진행할 수 있습니다.
    echo --------------------------------------------------------
    echo 강제 푸시(--force)를 진행하시겠습니까? (y/n)
    set /p FORCE_CHOICE=">> 선택: "
    if /i "%FORCE_CHOICE%"=="y" (
        "%GIT_EXE%" push -u origin main --force
    )
)

echo.
pause
