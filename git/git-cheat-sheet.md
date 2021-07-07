# Git Cheat sheet
## A Cheat sheet for git commands and git related topics

### Commands - Basic

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

### Commands - Advanced
```bash
git diff --name-status <commit1> <commit2>
```
Gives you a diff with just the name and status of changes between 2 commits.