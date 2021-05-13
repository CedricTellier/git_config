# get status of my files
gs()
{
    git status
}

# list all local branches
gb()
{
    git branch
}

# get logs
gl()
{
    git log
}

# stage all modified files
ga()
{
    git add .
}

# pull specific branch to remote last commit value
gp()
{
    git pull
}

# Commit and push files
gcp()
{
    git commit -m "$*" && git push
}

# commit files with message
gc()
{
    git commit -m "$*"
}

# See differences for local modified files
gd()
{
    git diff
}

# reset all local modified files
grh()
{
    git reset --hard
}

# Clear cache
grmc() 
{
    git add .
    git rm -r --cached .
    git add .gitignore
    git add .
    git status
}

# Personnal display in git bash
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u \[\e[32m\]\w \[\e[33m\]\$(parse_git_branch)\[\e[34m\] "
