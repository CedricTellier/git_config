Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt jandedobbeleer

function Get-GitStatus() {  
	& git status
}
NEW-Alias -Name gs -Value Get-GitStatus -Force -Option AllScope

# list all local branches
function Get-GitBranch() {
	& git branch
}
NEW-Alias -Name gb -Value Get-GitBranch -Force -Option AllScope

# get logs
function Get-GitLog() {
	& git log
}
NEW-Alias -Name gl -Value Get-GitLog -Force -Option AllScope

# stage all modified files
function Get-GitAddAll() {
	& git add .
}
NEW-Alias -Name ga -Value Get-GitAddAll -Force -Option AllScope

# pull specific branch to remote last commit value
function Get-GitPull() {
	& git pull
}
NEW-Alias -Name gp -Value Get-GitPull -Force -Option AllScope

# Commit and push files
function Get-GitCommitPush() {
	& git commit -m "$args"
	& git push
}
NEW-Alias -Name gcp -Value Get-GitCommitPush -Force -Option AllScope

# commit files with message
function Get-GitCommit() {
	& git commit -m "$args"
}
NEW-Alias -Name gc -Value Get-GitCommit -Force -Option AllScope

# See differences for local modified files
function Get-GitDiff() {
	& git diff
}
NEW-Alias -Name gd -Value Get-GitDiff -Force -Option AllScope

# reset all local modified files
function Get-GitResetHard() {
	& git reset --hard
}
NEW-Alias -Name grh -Value Get-GitResetHard -Force -Option AllScope

# Clear cache
function Get-GitClearCache() {
	& git add .
	& git rm -r --cached .
	& git add .gitignore
	& git add .
	& git status
}
NEW-Alias -Name gars -Value Get-GitClearCache -Force -Option AllScope