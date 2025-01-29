@echo off  
if "%1"=="prod" (  
  echo WARNING: Migrating PROD DB. Type 'y' if you’re sure!  
  set /p confirm=  
  if "%confirm%"=="y" (  
    supabase db push --project-id YOUR_PROD_PROJECT_ID  
    echo Prod migrated… You’re welcome. 🛠️  
  )  
) else (  
  supabase db push  
  echo Dev migrated. Happy now?  
)  