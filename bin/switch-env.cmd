@echo off  
if "%1"=="prod" (  
  copy /Y .env.production .env.local > nul  
  echo Switched to PROD. Don’t embarrass me. 🔥  
) else if "%1"=="dev" (  
  copy /Y .env.development .env.local > nul  
  echo Switched to DEV. Go play, I guess. 🎮  
) else (  
  echo Usage: switch-env [dev|prod], BAKA!  
)  