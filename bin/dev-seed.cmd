@echo off  
supabase start  
supabase db reset --seed=seed.sql  
npm run dev  
echo Dev server + seed data ready. Don’t waste my time! 🌱  