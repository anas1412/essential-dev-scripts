# Tsundere Dev Environment Setup Script 🎀

A PowerShell script to set up your development environment with essential tools, Git scripts, and aliases. Designed to save you time and make your workflow smoother... not like I care about your productivity or anything! (¬_¬)

---

## Features ✨
---

-   **Automated Script Installation**: Installs essential Git and development scripts from a GitHub repository.

-   **Git Aliases**: Adds handy Git aliases like `git st`, `git cm`, and `git panic` for faster workflows.

-   **Dynamic Setup**: Automatically detects and installs all scripts in the `bin` folder of the repository.

-   **Security Setup**: Configures execution policies and unblocks scripts for safe usage.

-   **Tsundere Personality**: Fun and engaging messages to keep you entertained while setting up your environment.



## What the Script Does 🛠️
---

This script automates the setup of a development environment by:

1.  Creating a `bin` directory in your user profile.

2.  Adding the `bin` directory to your system's `PATH`.

3.  Downloading essential Git and development scripts from a GitHub repository.

4.  Configuring Git aliases for faster and more efficient workflows.

5.  Setting up security permissions to allow script execution.



## Installation 🚀
---

You can install and run the script directly using PowerShell's `Invoke-Expression` (`iex`) and `Invoke-RestMethod` (`irm`). Here's how:

### One-Liner Installation

Run the following command in PowerShell as Administrator:

```powershell
iex (irm https://raw.githubusercontent.com/anas1412/essential-tsundere-dev-scripts/main/Setup-TsundereDev.ps1)
```

### What Happens During Installation?

1.  The script will create a `bin` directory in your user profile (if it doesn't already exist).

2.  It will download essential scripts from the GitHub repository and save them to the `bin` directory.

3.  It will configure Git aliases and update your `.gitconfig` file.

4.  It will set up security permissions to allow script execution.

## Usage Examples 🖥️
---

After running the script, you can use the following commands to boost your productivity:

### Git Scripts

-   **`git-acp "Commit message" branch`**: Add, commit, and push changes with a single command.

-   **`git-pr`**: Create a GitHub pull request.

-   **`git-cleanup`**: Clean up merged Git branches.

-   **`git-wip`**: Create a work-in-progress commit.

### Git Aliases

-   **`git st`**: Check Git status.

-   **`git cm "Commit message"`**: Commit with a message.

-   **`git co branch`**: Checkout a branch.

-   **`git panic`**: Emergency commit and push all changes.

-   **`git oops`**: Fix the last commit.



## Best Practices 💡
---

1.  **Test in Dev First**: Always test your changes in a development environment before pushing to production.

2.  **Never Commit `.env` Files**: Keep sensitive information out of your repository.

3.  **Use Git Aliases**: Take advantage of the Git aliases to speed up your workflow.

4.  **Run as Admin**: If you encounter permission issues, run the script as an administrator.

* * * * *

Help Menu ℹ️
------------

After installation, the script will display a help menu with all available commands and Git aliases. Here's a preview:

```
╔══════════════════════════════════════════╗
║           TSUNDERE DEV HELP MENU         ║
╚══════════════════════════════════════════╝
(¬_¬) Available Commands:
  - git-acp.cmd - Add+Commit+Push
  - git-pr.ps1 - Create GitHub PR
  - git-cleanup.cmd - Clean up Git branches
  - git-wip.cmd - Work in progress commit
  - supabase-migrate.cmd - Run Supabase migrations
  - switch-env.cmd - Switch environment
  - dev-seed.cmd - Seed development database
  - check-rls.cmd - Check release status

('- ω -`) Git Aliases:
  - git st - Check Git status
  - git cm - Commit with a message
  - git co - Checkout a branch
  - git br - List branches
  - git df - Show differences
  - git lg - Pretty Git log
  - git new - Create a new branch
  - git done - Delete a branch after merging
  - git panic - Emergency commit and push
  - git oops - Fix the last commit

('- ω -`) Notes:
  1. Always test in dev first!
  2. Never commit .env files!
  3. Use 'git blame' when stuck

(╯°□°）╯︵ ┻━┻  If you break production...
  Run 'git panic' for emergency fixes!

Made with ❤️🔥
```

## Troubleshooting 🛠️
---

If something goes wrong, here are some common issues and solutions:

1.  **Script Fails to Download**:

    -   Ensure your internet connection is stable.

    -   Check if the GitHub repository is accessible.

2.  **Permission Errors**:

    -   Run the script as an administrator.

3.  **Git Config Issues**:

    -   If `.gitconfig` already exists, the script will skip user info setup. You can manually add aliases if needed.


## Contributing 🤝
---
Feel free to contribute to this project! If you have suggestions, improvements, or new scripts to add, open an issue or submit a pull request. Not like I care or anything... BAKA!

## License 📄
---

This project is licensed under the MIT License.

---
_Not like I care if you use it or anything... (¬_¬)_
