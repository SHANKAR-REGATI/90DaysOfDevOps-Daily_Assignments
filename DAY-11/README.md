# 📁 Day 11 – File Ownership Challenge (`chown` & `chgrp`)

> Linux file ownership management using `chown` and `chgrp` commands on an Ubuntu EC2 instance.

---

## Task 1 : Understanding Ownership

- **Step 1:** `ls -l` → to see owner and group of files and folders

![task1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-11/task1.png)

---

## Task 2 : Basic `chown` Operations

- **Step 1:** `touch devops-file.txt`
- **Verify:** `ls -l` → and check current owner
- **Step 2:** `sudo useradd -m tokyo`
- **Step 3:** `sudo useradd -m berlin`
- **Step 4:** `sudo chown tokyo devops-file.txt`
- **Verify:** `ls -l`
- **Step 5:** `sudo chown berlin devops-file.txt`
- **Verify:** `ls -l`

![task2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-11/task2.png)

> The file ownership of `devops-file.txt` was successfully transferred from `ubuntu` → `tokyo` → `berlin`.

---

## Task 3 : Basic `chgrp` Operations

- **Step 1:** `touch team-notes.txt`
- **Verify:** `ls -l team-notes.txt` → and check current group
- **Step 2:** `sudo groupadd heist-team`
- **Step 3:** `sudo chgrp heist-team team-notes.txt`
- **Verify:** `ls -l team-notes.txt`

![task3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-11/task3.png)

> The group of `team-notes.txt` was successfully changed from `ubuntu` → `heist-team`.

---

## Task 4 : Combined Owner & Group Change

- **Step 1:** `touch project-config.yml`
- **Step 2:** `sudo useradd -m professor`
- **Step 3:** `sudo chown professor:heist-team project-config.yml`
- **Verify:** `ls -l project-config.yml`

![task4.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-11/task4.1.png)


- **Step 4:** `mkdir app-logs`
- **Step 5:** `sudo chown berlin:heist-team app-logs`
- **Verify:** `ls -l`

![task4.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-11/task4.2.png)

> Using `chown user:group` syntax, both owner and group can be changed in a single command. `project-config.yml` is now owned by `professor:heist-team` and `app-logs` by `berlin:heist-team`.

---

## Task 5 : Recursive Ownership

- **Step 1:** Create directory structure
```bash
mkdir -p heist-project/vault
mkdir -p heist-project/plans
touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
```

- **Step 2:** `sudo groupadd planners`
- **Step 3:** `sudo chown -R professor:planners heist-project`
- **Verify:** `ls -lR heist-project`

![task5](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-11/task5.png)

> The `-R` flag applies ownership changes recursively to all files and subdirectories inside `heist-project/`. Both `vault/` and `plans/` directories along with their contents are now owned by `professor:planners`.

---

## Task 6 : Practice Challenge

- **Step 1:** `sudo useradd -m nairobi`

- **Step 2:** Create groups
```bash
sudo groupadd vault-team
sudo groupadd tech-team
```

- **Step 3:** `mkdir bank-heist`
- **Step 4:** Create files inside `bank-heist/`
```bash
touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt
```

- **Step 5:** Assign ownership
```bash
sudo chown tokyo:vault-team bank-heist/access-codes.txt
sudo chown berlin:tech-team bank-heist/blueprints.pdf
sudo chown nairobi:vault-team bank-heist/escape-plan.txt
```

- **Verify:** `ls -lR bank-heist`

![task6](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-11/task6.png)

> Each file is now owned by a different user and group, simulating a real-world multi-user permission setup:
> - `access-codes.txt` → `tokyo : vault-team`
> - `blueprints.pdf` → `berlin : tech-team`
> - `escape-plan.txt` → `nairobi : vault-team`

---

