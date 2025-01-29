# Essential Dev Scripts Setup Guide 🖥️🔥

_A guide to installing productivity scripts for Next.js + Supabase on Windows._

---

## **Installation**

### 1\. **Create a `bin` Folder**

```powershell
# Run in PowerShell
mkdir $HOME\bin
```

---

### 2\. **Add `bin` to Your PATH**

1.  Press `Win + S` → Search **"Edit environment variables"**.

2.  Under **User variables**, select `Path` → **Edit** → **New**.

3.  Add:
    ```powershell
    %USERPROFILE%\bin
    ```

---

### 3\. **Save Scripts**

Copy these files to `%USERPROFILE%\bin`:

#### **`git-acp.cmd`**

```batch
@echo off
if "%1"=="" (
echo H-Hey! Commit message missing, BAKA!
exit /b 1
)
if "%2"=="" (
echo Ugh! Branch name too?!
exit /b 1
)
git add .
git commit -m "%1"
git push origin %2
echo Pushed to %2. Don't break it!
```

#### **`switch-env.cmd`**

```batch
@echo off
if "%1"=="prod" (
copy /Y .env.production .env.local > nul
echo Switched to PROD. Don't embarrass me. 🔥
) else if "%1"=="dev" (
copy /Y .env.development .env.local > nul
echo Switched to DEV. Go play. 🎮
) else (
echo Usage: switch-env [dev|prod], BAKA!
)
```

---

### 4\. **Set Up `.gitconfig`**

Save to `%USERPROFILE%\.gitconfig`:

```ini
# Save as C:\Users\YOUR_USERNAME\.gitconfig
# (Replace YOUR_USERNAME and customize [user] section!)

[user]
  name = Your Name  # ⚠️ CHANGE THIS!
  email = your.email@example.com  # ⚠️ CHANGE THIS!

[alias]
  # Basics
  st = status
  cm = commit -m
  co = checkout
  br = branch
  df = diff
  lg = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'

  # Branching
  new = checkout -b
  done = "!f() { git checkout main && git pull && git branch -d $1; }; f"

  # Supabase/Next.js
  supabase-status = !supabase status
  supabase-seed = !supabase db reset --seed=seed.sql
  dev = !npm run dev
  build = !npm run build
  lint = !npm run lint

  # Extras
  panic = "!git add . && git commit -m 'AAAAH FIX EVERYTHING' && git push origin main"
  oops = commit --amend -m "Oops. Fixed, dummy."

[core]
  excludesfile = C:\\Users\\YOUR_USERNAME\\gitignore_global  # Optional
```

---

## **Security Setup 🔒**

### Allow PowerShell Scripts

```powershell
# Run as Admin
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Unblock Scripts

```powershell
Get-ChildItem -Path $HOME\bin\* | Unblock-File
```

---

## **Scripts Overview**

| Script           | Command Example           | Purpose                                |
| ---------------- | ------------------------- | -------------------------------------- |
| `git-acp.cmd`    | `git-acp "fix: bug" main` | Add + Commit + Push                    |
| `switch-env.cmd` | `switch-env dev`          | Swap Supabase dev/prod keys            |
| `git-pr.ps1`     | `git-pr`                  | Open GitHub PR page for current branch |

---

## **Usage**

### For `.cmd` Scripts

```bash
git-acp "feat: magic" main
switch-env prod
```

### For `.ps1` Scripts

```powershell
.\git-pr
```

---

## **Critical Notes 💢**

1.  **Never commit `.env.local`** *(I'll haunt you!)*

2.  Test scripts in `dev` first!

3.  Use `git blame-mari` when things break (it's *always* my fault).

---

_Accelerate anon._
