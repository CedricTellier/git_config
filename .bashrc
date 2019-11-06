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

# create release zip archive file and store the m into NAS and dropBox
release()
{
    git release "$*"
}

# logging last modification on the current branch
gl()
{
    git log
}