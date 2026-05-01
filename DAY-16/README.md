# Shell Scripting Basics

This document demonstrates hands-on practice in Linux Shell Scripting, focusing on 
- User input (read)
- variable usage
- conditional statements (if)
---

## ➤ Task 1: Your First Script

### Steps:
1. Create a file `hello.sh`
2. Add the shebang line `#!/bin/bash` at the top
3. Print `Hello, DevOps!` using `echo`
4. Make it executable and run it

**Step 1:** `vim hello.sh`

**Step 2 – Script content:**

![1.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/1.1.png)

**Step 3:** `sudo chmod 755 hello.sh`

**Step 4:** `./hello.sh`

> **Output:**
>
> ![1.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/1.2.png)

---

## ➤ Task 2: Variables

### Steps:
1. Create `variables.sh` with:
   - A variable for your `NAME`
   - A variable for your `ROLE` (e.g., "DevOps Engineer")
   - Print: `Hello, I am <NAME> and I am a <ROLE>`

**Step 1:** `vim variables.sh`

**Step 2 – Script content:**

![2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/2.1.png)

**Step 3:** `sudo chmod 755 variables.sh`

**Step 4:** `./variables.sh`

> **Output:**
> 
> ![2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/2.2.png)

---

## ➤ Task 3: User Input with `read`

### Steps:
1. Create `greet.sh` that:
   - Asks the user for their name using `read`
   - Asks for their favourite tool
   - Prints: `Hello <name>, your favourite tool is <tool>`

**Step 1:** `vim greet.sh`

**Step 2 – Script content:**

![3.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/3.1.png)

**Step 3:** `sudo chmod 755 greet.sh`

**Step 4:** `./greet.sh`

> **Output:**
>
> ![3.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/3.2.png)

---

## ➤ Task 4: If-Else Conditions

### 4.1 – Check Number (Positive / Negative / Zero)

1. Create `check_number.sh` that:
   - Takes a number using `read`
   - Prints whether it is **positive**, **negative**, or **zero**

**Step 1:** `vim check_number.sh`

**Step 2 – Script content:**

![4.1.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/4.1.1.png)

**Step 3:** `sudo chmod 755 check_number.sh`

**Step 4:** `./check_number.sh`

> **Output:**
>
> ![4.1.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/4.1.2.png)

---

### 4.2 – File Check (Exists or Not)

2. Create `file_check.sh` that:
   - Asks for a filename
   - Checks if the file **exists** using `-f`
   - Prints appropriate message

**Step 1:** `vim file_check.sh`

**Step 2 – Script content:**

![4.2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/4.2.1.png)

**Step 3:** `sudo chmod 755 file_check.sh`

**Step 4:** `./file_check.sh`

> **Output:**
>
> ![4.2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/4.2.2.png)

---

## ➤ Task 5: Combine It All – Server Check

1. Create `server_check.sh` that:
   - Stores a service name in a variable (e.g., `nginx`, `sshd`)
   - Asks the user: `"Do you want to check the status? (y/n)"`
   - If `y` — runs `systemctl status <service>` and prints whether it's **active** or **not**
   - If `n` — prints `"Skipped."`

**Step 1:** `vim server_check.sh`

**Step 2 – Script content:**

![5.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/5.1.png)

**Step 3:** `sudo chmod 755 server_check.sh`

**Step 4:** `./server_check.sh`

> **Output (y):**
>
> ![5.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/5.2.png)

> **Output (n):**
>
> ![5.3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-16/5.3.png)

---




