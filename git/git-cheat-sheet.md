# Git Cheat sheet
## A Cheat sheet for git commands and git related topics

### Concepts
#### Git commits
Git doesn't store deltas or what changed in a commit, it stores a snapshot of the entire project. This allows git to quickly restore to an old version. This also means that the staging area does not just contain changed or deleted files, it stores the snapshot of commit of the project. As you add changes to it, it simply updates the files in the staging area.

### Commands - Basic
```bash
git config --global user.name <username>
git config --global user.email <email>
```
Sets your username and email which will be reflected in commits

```bash
git init
```
Initializes a git repo in current directory

```bash
git status
```
Shows status of local repository. Includes staged files, unstaged files, etc.

```bash
git add <file/directory>
```
Adds a file or changed files in a directory to staging

```bash
git commit -m "<commit message">
```
Creates a commit from files in staging.

```bash
git push
```
Pushes changes to a remote repository

```bash
git pull
```
Pulls and merges changes from a remote repository

```bash
git branch <branchname>
```
Creates a new branch with the name provided

```bash 
git branch
```
Lists branches

```bash
git checkout <branchname>
```
Checks out a branch

```bash
git revert <commit>
```
Reverts a specific commit

### Commands - Advanced
```bash
git diff --name-status <commit1> <commit2>
```
Gives you a diff with just the name and status of changes from the first commit to the second commit.  
Order matters. It will list changes FROM commit1 TO commit2. So if the first commit is the head of a branch and the second commit is further behind, any new files will appear as deleted.

```bash
git stash
```
Stashes changes

```bash
git reset --hard HEAD
git clean -df
```
This will reset local repo completely to the latest commit it has pulled down. This will discard any changes. It is ggod for resetting before pulling down. 

### Commands - Specific use cases

```bash
git log --format=%B -n 1 <commit>
```
Get's the commit message for a specific commit 

```bash
git rev-list --ancestry-path <commit1> <commit2>
```
Gives a list of all commit hashes between two commits 