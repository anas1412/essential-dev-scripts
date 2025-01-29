# Setup-TsundereDev.ps1  
# A Tsundere Dev Environment Setup Script (¬_¬)  

<#
.DESCRIPTION
This script sets up a development environment with essential tools and scripts to boost your productivity. 
It automates the installation of useful Git scripts, configures Git aliases, and ensures your system is ready for development.

HOW IT HELPS YOU:
1. **Automates Repetitive Tasks**: Installs scripts for Git workflows (e.g., add-commit-push, create PRs, clean branches).
2. **Improves Git Productivity**: Adds handy Git aliases for common commands (e.g., `git st` for status, `git cm` for commit).
3. **Saves Time**: No need to manually download or configure scripts—everything is done for you!
4. **Customizable**: You can add or remove scripts from the GitHub repository, and the script will adapt dynamically.

EXAMPLE USAGE:
After running this script, you can use commands like:
- `git-acp "Fix bug" main` to add, commit, and push changes with a single command.
- `git panic` to quickly commit and push all changes in an emergency.
- `git st` to check the status of your repository.

Made with ❤️🔥
#>

Write-Host "`nH-Hey! Don't make me do all the work, BAKA!`n" -ForegroundColor Magenta  

try {  
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

    # GitHub repository details  
    $repoUrl = "https://api.github.com/repos/anas1412/essential-dev-scripts/contents/bin"  
    $headers = @{  
        "Accept" = "application/vnd.github.v3+json"  
    }  

    # Fetch list of files in the bin folder  
    Write-Host "Fetching scripts from GitHub...`n" -ForegroundColor Cyan  
    $response = Invoke-RestMethod -Uri $repoUrl -Headers $headers -ErrorAction Stop  
    $scripts = $response | Where-Object { $_.type -eq "file" } | ForEach-Object {  
        @{  
            Name = $_.name  
            DownloadUrl = $_.download_url  
        }  
    }  

    if (-not $scripts) {  
        throw "H-Hey! No scripts found in the bin folder! Did you break the repository?`n"  
    }  

    # Ask for confirmation before installing scripts  
    Write-Host "I found these scripts in the bin folder... Not like I was looking for you or anything!`n" -ForegroundColor Yellow  
    $scripts | ForEach-Object { Write-Host "  • $($_.Name)" -ForegroundColor Cyan }  

    $confirmInstall = Read-Host "`nDo you want to install these scripts? (yes/no)"  
    if ($confirmInstall -ne "yes") {  
        Write-Host "Fine! I won't install them... It's not like I wanted to help you anyway!`n" -ForegroundColor Magenta  
        exit  
    }  

    # Download all scripts  
    foreach ($script in $scripts) {  
        $outputPath = Join-Path $binPath $script.Name  
        try {  
            Invoke-WebRequest -Uri $script.DownloadUrl -OutFile $outputPath -ErrorAction Stop  
            Write-Host "Downloaded $($script.Name)... Happy now?`n" -ForegroundColor Green  
        }  
        catch {  
            throw "F-Failed to download $($script.Name)! Fix your internet!`n"  
        }  
    }  

    # Git Config Setup  
    $gitConfigPath = "$env:USERPROFILE\.gitconfig"  

    # Check if .gitconfig exists  
    if (Test-Path $gitConfigPath) {  
        Write-Host "`.gitconfig` already exists. Skipping user info...`n" -ForegroundColor Yellow  
    }  
    else {  
        # Get User Info  
        do {  
            $userName = Read-Host "Enter your FULL NAME (Don't make me ask again!)"  
            if ([string]::IsNullOrWhiteSpace($userName)) {  
                throw "H-Hey! I need a real name, BAKA!"  
            }  
        } while ([string]::IsNullOrWhiteSpace($userName))  

        do {  
            $userEmail = Read-Host "Enter your EMAIL (This better be valid!)"  
            if (-not ($userEmail -match '^[^@]+@[^@]+\.[^@]+$')) {  
                throw "T-That's not a real email! Try again!"  
            }  
        } until ($userEmail -match '^[^@]+@[^@]+\.[^@]+$')  

        # Create .gitconfig  
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
        Set-Content -Path $gitConfigPath -Value $gitAliases  
        Write-Host "`nCreated .gitconfig... You owe me!`n" -ForegroundColor Green  
    }  

    # Append aliases to existing .gitconfig  
    $gitAliases = @"
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
    Add-Content -Path $gitConfigPath -Value "`n$gitAliases"  
    Write-Host "`nUpdated .gitconfig with aliases... Don't break it!`n" -ForegroundColor Yellow  

    # Security Setup  
    try {  
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force  
        Get-ChildItem -Path $binPath\* | Unblock-File  
        Write-Host "Security setup complete... Not like I was worried!`n" -ForegroundColor Green  
    }  
    catch {  
        throw "H-Hey! Couldn't set permissions! Run as Admin next time!`n"  
    }  

    # Dynamically generate Available Commands section
    $availableCommands = Get-ChildItem -Path $binPath | ForEach-Object {
        $commandName = $_.Name
        $commandDescription = switch -Wildcard ($commandName) {
            "git-acp.cmd" { "Add+Commit+Push" }
            "git-pr.ps1" { "Create GitHub PR" }
            "git-cleanup.cmd" { "Clean up Git branches" }
            "git-wip.cmd" { "Work in progress commit" }
            "supabase-migrate.cmd" { "Run Supabase migrations" }
            "switch-env.cmd" { "Switch environment" }
            "dev-seed.cmd" { "Seed development database" }
            "check-rls.cmd" { "Check release status" }
            default { "No description available" }
        }
        "  • $commandName - $commandDescription"
    }

    # Git Aliases for Help Menu
    $gitAliasesMenu = @"
  • git st - Check Git status
  • git cm - Commit with a message
  • git co - Checkout a branch
  • git br - List branches
  • git df - Show differences
  • git lg - Pretty Git log
  • git new - Create a new branch
  • git done - Delete a branch after merging
  • git panic - Emergency commit and push
  • git oops - Fix the last commit
"@

    # Help Menu  
    Write-Host @"
╔══════════════════════════════════════════╗
║           TSUNDERE DEV HELP MENU         ║
╚══════════════════════════════════════════╝
(¬_¬) Available Commands:
$($availableCommands -join "`n")

(´• ω •`) Git Aliases:
$gitAliasesMenu

(´• ω •`) Notes:
  1. Always test in dev first!
  2. Never commit .env files!

(╯°□°）╯︵ ┻━┻  If you break production...
  Prepare to beg for forgiveness!

Made with ❤️🔥
"@ -ForegroundColor Cyan  
}  
catch {  
    Write-Host @"
    
(╯°□°）╯︵ ┻━┻  
F-FATAL ERROR: $($_.Exception.Message)
Script stopped! Fix the issue and try again!

Possible reasons:
1. Your internet sucks
2. URL is wrong (Check repository!)
3. GitHub is down (Blame Microsoft)
4. You didn't run as Admin

Fix it yourself! I'm done babysitting!
"@ -ForegroundColor Red  
    exit 1  
}  
