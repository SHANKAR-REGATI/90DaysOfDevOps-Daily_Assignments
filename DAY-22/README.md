# Introduction to Git: Your First Repository

This Document Shows a Hands-on Practice on GIT covering :
- Checking Whether GIT Installed or Not
- Configuring GIT using Username & Email
- Initializing a GIT Repository
- Creating a git-commands.md file
- Adding Changes for staging & Committing Changes with a Message
- Viewing Commit History
- Finally Answered a Few Questions

---

## ✅ Task 1: Install and Configure Git

1. Verify Git is installed on your machine
2. Set up your Git identity — name and email
3. Verify your configuration

> ![1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-22/1.png)

---

## ✅ Task 2: Create Your Git Project

1. Create a new folder called `devops-git-practice`
2. Initialize it as a Git repository
3. Check the status — read and understand what Git is telling you
4. Explore the hidden `.git/` directory — look at what's inside


> ![2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-22/2.1.png)
>
> ![2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-22/2.2.png)
> 
> **Note:** **Currently on Master Branch & there are no changes to be committed.**
> 
> ![2.3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-22/2.3.png)
> 
> **Note:** **`.git` contains files & folders using which GIT maintains Tracking History, commits, branches, and configuration.**

---

## ✅ Task 3: Create Your Git Commands Reference

1. Create a file called `git-commands.md` inside the repo
2. Add the Git commands used so far, organized by category:
3. For each command, write:
   - What it does (1 line)
   - An example of how to use it

[GIT Commands Cheat Sheet](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-22/git-commands.md)

---

## ✅ Task 4: Stage and Commit

1. Stage your file
2. Check what's staged
3. Commit with a meaningful message
4. View your commit history

> ![4](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-22/4.png)

---

## ✅ Task 5: Make More Changes and Build History

1. Edit `git-commands.md` — add more commands as you discover them
2. Check what changed since your last commit
3. Stage and commit again with a different, descriptive message
4. Repeat this process at least **3 times** so you have multiple commits in your history
5. View the full history in a compact format


> ![5](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-22/5.png)

---

## ✅ Task 6 (Optional): Understand the Git Workflow

### 1. What is the difference between `git add` and `git commit`?

> - **`git add`** → Moves selected file changes from the Working Directory to the Staging Area so they are prepared for the next commit.
> - **`git commit`** → Saves the staged changes permanently as a snapshot in the Local Repository with a commit message.

### 2. What does the staging area do? Why doesn't Git just commit directly?

> The Staging Area acts like a temporary checkpoint where you choose and review exactly which changes should go into the next commit.

> Git does not commit directly because:
> - You may not want all modified files in one commit.
> - It helps create clean, organized commits feature-by-feature.

### 3. What information does `git log` show you?

> `git log` shows the commit history of the repository, including:
> - Commit ID (hash)
> - Author name
> - Date/time
> - Commit message

### 4. What is the `.git/` folder and what happens if you delete it?

> - The `.git` folder contains files & folders using which GIT maintains tracking history, commits, branches, and configuration.
> - If we delete `.git/`, the project stops being a Git repository and **all Git history/tracking is permanently lost**.

### 5. What is the difference between Working Directory, Staging Area, and Repository?

| Area | Description |
|------|-------------|
| **Working Directory** | The actual project files where you create and modify code. |
| **Staging Area** | A temporary area where selected changes are prepared for commit using `git add`. |
| **Repository** | The `.git` database where committed history, branches, and snapshots are permanently stored. |

---
