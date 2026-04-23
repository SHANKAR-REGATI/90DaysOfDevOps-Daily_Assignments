# 📁 Day 10 — File Permissions & File Operations Challenge

A hands-on Linux challenge covering file creation, reading, permission understanding, modification, and testing on an Ubuntu EC2 instance.

---
## Task 1 : Create Files

**Step 1:** Create an empty file
```bash
touch devops.txt
```

**Step 2:** Write content to a file
```bash
echo "This Is Shankar Regati" > notes.txt
```

**Step 3:** Create and edit a shell script
```bash
vim script.sh
```
- `echo "Hello Devops"`

**Verify:** List files with details
```bash
ls -l
```

> 📸 Output:
> 
> ![files](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/files.png)

---

## Task 2 : Read Files

**Step 1:** Read file content
```bash
cat notes.txt
```

**Step 2:** Open script in vim
```bash
vim script.sh
```

**Step 3:** View first 5 lines of `/etc/passwd`
```bash
head -n 5 /etc/passwd
```

> 📸 Output:
> 
> ![head](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/head.png)

**Step 4:** View last 5 lines of `/etc/passwd`
```bash
tail -n 5 /etc/passwd
```

> 📸 Output:
> 
> ![tail](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/tail.png)

---

## Task 3 : Understand Permissions

**Step 1:** List all files with permissions
```bash
ls -l
```

> 📸 Output:
> 
> ![files](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/files.png)

**For all three files:**

| Entity | Permission |
|--------|-----------|
| 👤 Owner | Read & Write (`rw-`) |
| 👥 Group Members | Read & Write (`rw-`) |
| 🌐 Others | Read only (`r--`) |

---

## Task 4 : Modify Permissions

**Step 1:** Add execute permission to `script.sh`
```bash
sudo chmod +x script.sh
```

**Verify:**
```bash
ls -l script.sh
```

**Execute:**
```bash
./script.sh
```

> 📸 Output:
> 
> ![chmod +x](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/chmod%20%2Bx.png)

---

**Step 2:** Set `devops.txt` to read-only for all
```bash
sudo chmod 444 devops.txt
```

**Verify:**
```bash
ls -l devops.txt
```

> 📸 Output:
> 
> ![chmod 44](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/chmod%2044.png)

---

**Step 3:** Set `notes.txt` to owner read/write, group read, others none
```bash
sudo chmod 640 notes.txt
```

**Verify:**
```bash
ls -l notes.txt
```

> 📸 Output:
> 
> ![chmod 640](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/chmod%20640.png)

---

**Step 4:** Create a directory and set permissions
```bash
mkdir -m 755 project
```

**Verify:**
```bash
ls -l
```

> 📸 Output:
> 
> ![mkdir 775](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/mkdir%20755.png)

---

## Task 5 : Test Permissions

### Q. Try writing to a read-only file — what happens?

```bash
echo "test" > devops.txt
```

> 📸 Output:
> 
> ![test 1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/test%201.png)

✅ As expected — `devops.txt` is set to `444` (read-only for all), so writing is blocked.

---

### Q. Try executing a file without execute permission — what happens?

```bash
sudo chmod -x script.sh   # remove execute permission
./script.sh
```

> 📸 Output:
> 
> ![test 2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-10/test%202.png)

✅ As expected — without the execute (`x`) bit, the shell refuses to run the script.

---

