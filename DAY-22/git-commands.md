# GIT commands Cheat Sheet

## 1. View git version
- `git --version`

## 2. Set GIT Configuration & View it
- `git config --global user.name "<username>"` - set username for GIT

```bash
git config --global user.name "abc123"
```
- `git config --global user.email "<email>"` - set email for GIT

```bash
git config --global user.email "abc123@gmail.com"
```
- `git config --list` - view configuration

## 3. GIT Repository setup 
- `git init` - Initialize a GIT repository

## 4. View Status & History
- `git status` - show untracked files , staged files , anything to commit

- `git log` - shows the commit history

- `git log --oneline` - shows commit history in compact format

- `git log <branch-name>` - shows commit history of another branch without switching to it

- `git log <branch-name> --oneline` - shows commit history of another branch in compact format

- `git diff` - shows the changes done

## 5. Adding & Committing 
- `git add <file_name>` - Add files to staging

```bash
git add app.py
```
- `git add .` - Add all changed files

- `git commit -m "<commit_message>"` - save staged changes as a new commit in local repository

```bash
git commit -m "fixed bug"
```
- `git commit --amend -m "<edited_message>"` - Edit the Last Commit Message

```bash
git commit --amend -m "Fixed bug in Database Service"
```
## 6. Branching
- `git branch` - Shows Local Branches List & * indicates Current Branch

- `git branch -r ` - Shows Remote Branches

- `git branch <branch-name>` - Creates a New Branch

```bash
git branch feature
```
- `git checkout <branch-name>` - Used to Switch Between Branches

```bash
git checkout feature
```
- `git checkout -b <branch-name>` - Creates & Switches to New branch

```bash
git checkout -b feature
```
- `git branch -d <branch-name>` - Delete a local branch only if it is Already Merged

```bash
git branch -d feature
```
- `git branch -D <branch-name>` - Force Delete A Local Branch even if it not merged

```bash
git branch -D feature
```
- `git push origin --delete <branch-name>` - delete a Remote branch


