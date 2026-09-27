@echo off
chcp 65001 > nul
echo ========================================================
echo   PawMatch AI - 반려견 10대 품종 AI 분류기
echo ========================================================
echo.
echo 로컬 웹 서버를 실행합니다...
echo 브라우저에서 웹캠 및 이미지 업로드 기능을 원활하게 사용하려면
echo 로컬 서버(http://localhost:8080) 접속을 권장합니다.
echo.

where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Python 웹 서버를 포트 8080에서 시작합니다...
    start http://localhost:8080
    python -m http.server 8080
    goto end
)

where npx >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo npx serve를 포트 8080에서 시작합니다...
    start http://localhost:8080
    npx serve -l 8080
    goto end
)

echo [안내] Python 또는 Node.js가 감지되지 않아 기본 브라우저로 index.html을 직접 엽니다.
echo (참고: 웹캠 기능은 보안 정책상 http://localhost 환경에서 가장 안정적으로 동작합니다)
start index.html

:end
pause
