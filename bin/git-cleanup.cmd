@echo off  
git fetch -p  
git branch --merged | findstr /v "main dev" > branches-to-delete  
for /f "delims=" %%i in (branches-to-delete) do git branch -d %%i  
del branches-to-delete  
echo Cleaned up branches. You’re welcome. 🗑️  