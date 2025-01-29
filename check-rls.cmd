@echo off  
supabase db remote ls --project-id YOUR_PROD_PROJECT_ID | findstr "RLS"  
if %errorlevel%==0 (  
  echo RLS enabled. Good job, I guess. 🛡️  
) else (  
  echo RLS MISSING! FIX IT BEFORE YOU GET HACKED! 💥  
)  