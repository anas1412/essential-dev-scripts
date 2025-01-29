@echo off  
if "%1"=="" (  
  echo H-Hey! Where's your commit message, idiot?!  
  exit /b 1  
)  
if "%2"=="" (  
  echo Ugh! Branch name missing too?!  
  exit /b 1  
)  
git add .  
git commit -m "%1"  
git push origin %2  
echo T-There! Pushed to %2. Don’t break it!  