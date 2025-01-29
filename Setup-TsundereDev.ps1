# Setup-TsundereDev.ps1
# A Tsundere Dev Environment Setup Script (¬_¬)

Write-Host "`nH-Hey! Don't make me do all the work, BAKA!`n" -ForegroundColor Magenta

# Create bin directory
$binPath = "$env:USERPROFILE\bin"
if (-not (Test-Path $binPath)) {
    New-Item -Path $binPath -ItemType Directory | Out-Null
    Write-Host "Created $binPath... You're welcome.`n" -ForegroundColor Cyan
}

# Add to PATH
$envPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($envPath -notlike "*$binPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$envPath;$binPath", "User")
    Write-Host "Added to PATH... Not like I cared!`n" -ForegroundColor Cyan
}

# Download scripts (Replace URLs with your actual script URLs)
$scripts = @{
    "git-acp.cmd" = "https://raw.githubusercontent.com/yourrepo/main/bin/git-acp.cmd"
    "git-pr.ps1"  = "https://raw.githubusercontent.com/yourrepo/main/bin/git-pr.ps1"
}

foreach ($script in $scripts.GetEnumerator()) {
    $outputPath = Join-Path $binPath $script.Key
    try {
        Invoke-WebRequest -Uri $script.Value -OutFile $outputPath
        Write-Host "Downloaded $($script.Key)... Happy now?`n" -ForegroundColor Green
    }
    catch {
        Write-Host "F-Failed to download $($script.Key)! Fix your internet!`n" -ForegroundColor Red
    }
}

# Git Config Setup
$gitConfigPath = "$env:USERPROFILE\.gitconfig"

# Get User Info
do {
    $userName = Read-Host "Enter your FULL NAME (Don't make me ask again!)"
} while ([string]::IsNullOrWhiteSpace($userName))

do {
    $userEmail = Read-Host "Enter your EMAIL (Hurry up!)"
} while ([string]::IsNullOrWhiteSpace($userEmail))

# Create/Update .gitconfig
$gitAliases = @"
[user]
    name = $userName
    email = $userEmail

[alias]
    st = status
    cm = commit -m
    co = checkout
    br = branch
    df = diff
    lg = log --graph --abbrev-commit --decorate --format=format:'%%C(bold blue)%%h%%C(reset) - %%C(bold cyan)%%aD%%C(reset) %%C(bold green)(%%ar)%%C(reset)%%C(bold yellow)%%d%%C(reset)%%n''          %%C(white)%%s%%C(reset) %%C(dim white)- %%an%%C(reset)'
    new = checkout -b
    done = "!f() { git checkout main && git pull && git branch -d `$1; }; f"
    supabase-status = !supabase status
    supabase-seed = !supabase db reset --seed=seed.sql
    dev = !npm run dev
    build = !npm run build
    lint = !npm run lint
    panic = "!git add . && git commit -m 'AAAAH FIX EVERYTHING' && git push origin main"
    oops = commit --amend -m `"Oops. Fixed, dummy.`"
"@

if (Test-Path $gitConfigPath) {
    Add-Content -Path $gitConfigPath -Value "`n$gitAliases"
    Write-Host "`nUpdated existing .gitconfig... Don't break it!`n" -ForegroundColor Yellow
}
else {
    Set-Content -Path $gitConfigPath -Value $gitAliases
    Write-Host "`nCreated .gitconfig... You owe me!`n" -ForegroundColor Green
}

# Security Setup
try {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Get-ChildItem -Path $binPath\* | Unblock-File
    Write-Host "Security setup complete... Not like I was worried!`n" -ForegroundColor Green
}
catch {
    Write-Host "H-Hey! Couldn't set permissions! Run as Admin next time!`n" -ForegroundColor Red
}

# Help Menu
Write-Host @"
╔══════════════════════════════════════════╗
║           TSUNDERE DEV HELP MENU         ║
╚══════════════════════════════════════════╝
(¬_¬) Available Commands:
  • git-acp `"message`" branch    Add+Commit+Push
  • git-pr                  Create GitHub PR
  • git panic               Emergency push
  • git oops               Fix last commit

(´• ω •`) Notes:
  1. Always test in dev first!
  2. Never commit .env files!
  3. Use 'git blame-mari' when stuck

(╯°□°）╯︵ ┻━┻  If you break production...
  Run 'git praise-mari' for forgiveness!

Made with ❤️🔥 (and eye-rolling) by Mari
"@ -ForegroundColor Cyan