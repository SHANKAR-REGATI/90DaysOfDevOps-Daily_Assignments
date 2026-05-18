# Day 23 — Git Branching & Working with GitHub

This Document Shows a Hands-on Practice on Git Covering:
- Git Branching
- Push to GitHub
- Pull from GitHub
- Clone & Fork

---

## Task 1: Understanding Branches

**1. What is a branch in Git?**  
> **A branch is a separate line of development in Git, which allows us to work on features or fixes without affecting the main branch.**

**2. Why do we use branches instead of committing everything to `main`?**  
> **Branches keep the work safe and organized. We can test changes separately and merge them into main only when ready.**

**3. What is `HEAD` in Git?**  
> **`HEAD` shows the latest commit in the current branch.**

**4. What happens to your files when you switch branches?**
> **Git changes files in the working directory to match the selected branch's latest commit.**

---

## Task 2: Branching Commands — Hands-On

Performed in the `devops-git-practice` repo:

| Step | Command | Description |
|------|---------|-------------|
| 1 | `git branch` | List all branches |
| 2 | `git branch feature-1` | Create `feature-1` branch |
| 3 | `git checkout feature-1` | Switch to `feature-1` |
| 4 | `git checkout -b feature-2` | Create and switch to `feature-2` in one command |
| 5 | `git switch feature-1` | Switch back using `git switch` |
| 6 | `git add file1.txt && git commit -m "Added file1.txt"` | Commit on `feature-1` that doesn't exist on `main` |
| 7 | `git switch master` | Switch back to `main` — `file1.txt` is not there |
| 8 | `git branch -d feature-2` | Delete a branch no longer needed |

### Output
> ![2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/2.1.png)

**2. `git switch` vs `git checkout`:**

| Command | Description |
|---------|-------------|
| `git switch` | Newer command — used **only** to switch branches |
| `git checkout` | Older command — used for switching branches, restoring files, and checking out commits |

> 📸 **Switching branches and verifying commits:**
> 
> ![2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/2.2.png)

> **After switching to `master`, only `git-commands.md` is visible — `file1.txt` (committed on `feature-1`) is absent. ✅**

**3. Deleted `feature-2`:**

> ![2.3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/2.3.png)

**9.** All branching commands added to **DAY-22/git-commands.md**. ✅

---

## Task 3: Push to GitHub

**1.** Created a new repository on GitHub (without initializing with a README).

> ![3.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/3.1.png)

**2. Connect local repo to GitHub remote:**

> ![3.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/3.2.png)

**3. Push `main` branch to GitHub:**

**4. Push `feature-1` branch to GitHub:**

> ![3.3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/3.3.png)

**5. Verified both branches are visible on GitHub:**

> ![3.4](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/3.4.png)

**6. What is the difference between `origin` and `upstream`?**

| Term | Description |
|------|-------------|
| `origin` | Default name given to the remote repository connection (GitHub URL via HTTPS or SSH). We can also use a custom name: `git remote add myrepo <GitHub URL>` |
| `upstream` | Default branch tracking setup used when running `git push` / `git pull` without mentioning branch names |

---

## Task 4: Pull from GitHub

**1.** Made a change to `file1.txt` directly using the GitHub editor (on `feature-1` branch):

> ![4.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/4.1.png)

**2. Pulled the change to local repo:**

> ![4.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/4.2.png)

**3. What is the difference between `git fetch` and `git pull`?**

| Command | Behavior |
|---------|----------|
| `git fetch` | Downloads the latest changes from the remote repository, but the current branch/files in local **remain unchanged**. You then manually merge or rebase: `git merge origin/main` or `git rebase origin/main` |
| `git pull` | Downloads the latest changes **and immediately updates** your current branch/files in local by rebase or merge |

---

## Task 5: Clone vs Fork

**1. Cloned a public repository:**

> ![5.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/5.1.png)

**2. Forked the same repository on GitHub, then cloned the fork:**

> ![5.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/5.2.png)

> ![5.3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-23/5.3.png)

**3. Answers**

**a)** **What is the difference between clone and fork?**

| Operation | Description |
|-----------|-------------|
| `clone` | Creates a copy of a repository on your **local computer** |
| `fork` | Creates a copy of someone else's repository in **your GitHub account**. It's a GitHub concept, not a Git concept |

**b)** **When would you clone vs fork?**

| Use Case | Operation |
|----------|-----------|
| You only want to use or work on the project locally | `clone` |
| You want to make changes to someone else's project and contribute through your own GitHub account | `fork` |

**c)** **After forking, how do you keep your fork in sync with the original repo?**  
> **By clicking **Sync Fork** on GitHub. ✅**

---

