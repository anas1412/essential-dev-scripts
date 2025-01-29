# Open GitHub PR page for current branch  
$branch = git branch --show-current  
$remoteUrl = git config --get remote.origin.url  

# Fix SSH/HTTPS URLs  
if ($remoteUrl -match "git@github.com") {  
  $repoPath = $remoteUrl -replace "git@github.com:(.*)\.git", '$1'  
  $repoUrl = "https://github.com/$repoPath"  
} else {  
  $repoUrl = $remoteUrl -replace "\.git$", ""  
}  

$prUrl = "$repoUrl/compare/dev...$($branch)?expand=1"  
Start-Process $prUrl  