# Day 18 — Shell Scripting : Functions & Intermediate Concepts
This Document shows a Hands-on practice covering
- Functions
- local & global variables in functions
- Finally wrote a script which prints OS,hostname,uptime,disk usage,RAM usage,CPU usage
---

## ➤ Task 1: Basic Functions

### 1. Create `functions.sh` with:
- A function `greet` that takes a name as argument and prints `Hello, <name>!`
- A function `add` that takes two numbers and prints their sum
- Call both functions from the script

**Step 1:** `vim functions.sh`

**Step 2:** Write the script

![1.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-18/1.1.png)

**Step 3:** `sudo chmod 755 functions.sh`

**Step 4:** `./functions.sh`

>
> ![1.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-18/1.2.png)

---

## ➤ Task 2: Function with Return Values

### 1. Create `disk_check.sh` with:
- A function `check_disk` that checks disk usage of `/` using `df -h`
- A function `check_memory` that checks free memory using `free -h`
- A main section that calls both and prints the results

**Step 1:** `vim disk_check.sh`

**Step 2:** Write the script

![2.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-18/2.1.png)

**Step 3:** `sudo chmod 755 disk_check.sh`

**Step 4:** `./disk_check.sh`

>
> ![2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-18/2.2.png)

---

## ➤ Task 3: Strict Mode — `set -euo pipefail`

1. Create `strict_demo.sh` with `set -euo pipefail` at the top
2. Try using an **undefined variable** — what happens with `set -u`?
3. Try a command that **fails** — what happens with `set -e`?
4. Try a **piped command** where one part fails — what happens with `set -o pipefail`?

### 📋 Document: What does each flag do?

| Flag | Behaviour WITHOUT flag | Behaviour WITH flag |
|------|------------------------|---------------------|
| `set -e` | If any command fails, error is shown & moves to the next line | Script **exits** when there is an error. Very useful when any command depends on the previous command |
| `set -u` | When an undefined variable is used, it is printed as blank | An **error is thrown** |
| `set -o pipefail` | If any command in a pipeline fails but the last command succeeds, it is considered a success and moves forward | We can **catch failures** anywhere in the pipeline |

---

## ➤ Task 4: Local Variables

### 1. Create `local_demo.sh` with:
- A function that uses `local` keyword for variables
- Show that `local` variables don't leak outside the function
- Compare with a function that uses regular (global) variables

**Step 1:** `vim local_demo.sh`

**Step 2:** Write the script

![4.1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-18/4.1.png)

**Step 3:** `sudo chmod 755 local_demo.sh`

**Step 4:** `./local_demo.sh`

>
>![4.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-18/4.2.png)

### 📝 Note:
1. In the **`Addition`** function, variables are declared as `local`, so they are accessible only within the function and **cannot be used outside it**.
2. In the **`product`** function, variables are **global**, so they can be accessed and modified outside the function, which is why their values are printed and can change.

---

## ➤ Task 5: Build a Script — System Info Reporter

### Create `system_info.sh` that uses functions for everything:
- A function to print **hostname and OS info**
- A function to print **uptime**
- A function to print **disk usage** (top 5 by size)
- A function to print **memory usage**
- A function to print **top 5 CPU-consuming processes**
- A `main` function that calls all of the above with section headers
- Use `set -euo pipefail` at the top

**Step 1:** `vim system_info.sh`

**Step 2:** Write the script

```bash
#!/bin/bash

<<Notice
This Script uses various functions to print system INFO
Notice

set -euo pipefail

Host_OS_INFO() {
        host=$(hostname -I)
        echo "Current Host : $host"

        os=$(uname)
        echo "Current OS : $os"
}

get_uptime() {
        echo "Uptime : $(uptime)"
}

disk_usage() {
        {
                df -h | head -n1 | awk '{print $1,$3,$6}'
                df -h | tail -n +2 | sort -k3 -rh | awk 'NR<=5 {print $1,$3,$6}'
        } | column -t
}

memory_usage() {
        free -h | awk 'NR==2 {print $7}'
}

CPU_usage() {
        {
                ps -e -o pid,pcpu,comm | head -n1
                ps -e -o pid,pcpu,comm | tail -n +2 | sort -k2 -rh | awk 'NR<=5'
        }
}

System_info() {
        echo "=====System INFO======"
        echo "=====Host & OS INFO======"
        Host_OS_INFO
        echo "=====Uptime INFO======"
        get_uptime
        echo "=====Top 5 Disk Usage====="
        disk_usage
        echo "====Available RAM======"
        memory_usage
        echo "====Top 5 CPU Consuming processes"
        CPU_usage
}

System_info
```

**Step 3:** `sudo chmod 755 system_info.sh`

**Step 4:** `./system_info.sh`

>
> ![5.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-18/5.2.png)

---



