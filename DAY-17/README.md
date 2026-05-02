# Day 17 — Shell Scripting: Loops, Arguments & Error Handling
This Document shows a hand-on practice on linux shell scripting covering
- Loops (**for**, **While**)
- Arguments
- Error Handling
---

## ➤ Task 1: For Loop

### 1. `for_loop.sh` — Loops through a list of 5 fruits and prints each one

**Step 1:** `vim for_loop.sh`

**Step 2:**

![1.1.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/1.1.1.png)

**Step 3:** `sudo chmod 755 for_loop.sh`

**Step 4:** `./for_loop.sh`

> **Output:**
>
> ![1.1.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/1.1.2.png)

---

### 2. `count.sh` — Prints numbers 1 to 10 using a for loop

**Step 1:** `vim count.sh`

**Step 2:**

![1.2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/1.2.1.png)

**Step 3:** `sudo chmod 755 count.sh`

**Step 4:** `./count.sh`

> **Output:**
>
> ![1.2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/1.2.2.png)

---

## ➤ Task 2: While Loop

### 1. `countdown.sh` — Takes a number from the user, counts down to 0, prints "Done!" at the end

**Step 1:** `vim countdown.sh`

**Step 2:**

![2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/2.1.png)

**Step 3:** `sudo chmod 755 countdown.sh`

**Step 4:** `./countdown.sh`

> **Output:**
>
> ![2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/2.2.png)

---

## ➤ Task 3: Command-line Arguments

### 1. `greet.sh` — Accepts a name as `$1`, prints `Hello, <name>!`; if no argument is passed, prints usage message

**Step 1:** `vim greet.sh`

**Step 2:**

![3.1.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/3.1.1.png)

**Step 3:** `sudo chmod 755 greet.sh`

**Step 4:** `./greet.sh`

> **Output:**
>
> ![3.1.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/3.1.2.png)

---

### 2. `args_demo.sh` — Prints total number of arguments (`$#`), all arguments (`$@`), and the script name (`$0`)

**Step 1:** `vim args_demo.sh`

**Step 2:**

![3.2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/3.2.1.png)

**Step 3:** `sudo chmod 755 args_demo.sh`

**Step 4:** `./args_demo.sh`

> **Output:**
>
> ![3.2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/3.2.2.png)

---

## ➤ Task 4: Installing Packages via Script

### 1. `install_packages.sh` — Defines a list of packages (`nginx`, `curl`, `wget`), loops through, checks if installed, installs if missing

**Step 1:** `vim install_packages.sh`

**Step 2:**

![4.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/4.1.png)

**Step 3:** `sudo chmod 755 install_packages.sh`

**Step 4:** `./install_packages.sh`

> **Output:**
>
> ![4.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/4.2.png)

---

## ➤ Task 5: Error Handling

### 1. `safe_script.sh` — Uses `set -e`, creates a directory, navigates into it, creates a file, uses `||` operator for error messages

**Step 1:** `vim safe_script.sh`

**Step 2:**

![5.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/5.1.png)

**Step 3:** `sudo chmod 755 safe_script.sh`

**Step 4:** `./safe_script.sh`

> **Output (first run):**
>
> ![5.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-17/5.2.png)

---

