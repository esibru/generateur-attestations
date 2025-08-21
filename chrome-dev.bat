@echo off
setlocal

:: Dossier de profil temporaire
set PROFILE_DIR=%TEMP%\devprofile

:: Vérifie si le dossier existe sinon le crée
if not exist "%PROFILE_DIR%" (
    mkdir "%PROFILE_DIR%"
)

:: Lance Chrome avec les sécurités désactivées et URL en HTTP
start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ^
  --disable-web-security ^
  --allow-running-insecure-content ^
  --user-data-dir="%PROFILE_DIR%" ^
  --disable-site-isolation-trials ^
  --disable-features=IsolateOrigins,site-per-process ^
  http://youngfrog.lavnir.be/generateur-attestations/

endlocal

