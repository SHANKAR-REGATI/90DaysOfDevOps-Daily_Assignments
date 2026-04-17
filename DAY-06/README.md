# Linux Fundamentals: Read & Write Text Files

This Document Shows a Hands-on Practice focused on Creating a file, writing it using redirection concept & tee command & viewing it using cat, head, tail commands.

---

## ❖ Step 1 : Create a file

```bash
touch notes.txt
```

![touch](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-06/touch.png)

---

## ❖ Step 2 : Write it

```bash
echo "This is Shankar Regati" > notes.txt
```

![echo 1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-06/echo%201.png)

```bash
echo "I am Learning Devops With Subham Bhaiya" >> notes.txt
```

![echo 2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-06/echo%202.png)

```bash
echo "In Online Mode
Currently doing Day-6 task
at Home" | tee -a notes.txt
```

![tee](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-06/tee.png)

---

## ❖ Step 3 : View it

```bash
cat notes.txt
```

![cat](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-06/cat.png)

```bash
head -n 3 notes.txt
```

![head](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-06/head.png)

```bash
tail -n 3 notes.txt
```

![tail](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-06/tail.png)
