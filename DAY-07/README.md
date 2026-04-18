# Linux File System Hierarchy & Scenario-Based Practice

---

## Part 1: Linux File System Hierarchy (Must Know Directories)

| Directory | Purpose |
|-----------|---------|
| `/` | Starting point of every file and folder |
| `/etc` | Contains Configuration files — System conf., network config., passwd, group |
| `/var` | Contains variable files — Logs, Cache etc. |
| `/home` | User's home directory — Users & respective files and folders |
| `/root` | Root user home directory |
| `/bin` | Contains Essential Commands for all users — `ls`, `cp`, `apt`, `chgrp`, `chown`, `chmod` |
| `/sbin` | System Binaries — Used by System Administrator → `cron`, `init`, `ip` |
| `/tmp` | Temporary files |

## 🛠️ Hands-on Task

### Q. Find the largest log file in `/var/log`

```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -n 5
```

### Command Breakdown

| Part | Meaning |
|------|---------|
| `du -sh /var/log` | Shows size of folder (Normal output & Error output) |
| `1` | Normal output (stdout) |
| `2` | Error output (stderr) |
| `/dev/null` | Throw away output |
| `du -sh /var/log 1>/dev/null` | Throws away normal output |
| `du -sh /var/log 2>/dev/null` | Throws away error output |
| `du -sh /var/log/* 2>/dev/null` | Shows sizes of **all** files and folders inside log folder |
| `... \| sort -h` | Shows sizes in ascending order by default |
| `... \| tail -n 5` | Shows only the last 5 lines of ascending order output |

### Command Output

![du -sh](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-07/du%20-sh.png)

**✅ Result → Largest file: `/var/log/journal` → 295MB**

---

## Part 2: Scenario-Based Practice

---

### 🔴 Scenario 1 — Check if `nginx` service is running

> **Problem:** How do you check if the `nginx` service is running?

**Step 1:** Check service status
```bash
systemctl status nginx
```
> **Why:** Shows whether nginx service is `active`, `failed`, or `stopped`.

**Step 2:** If service not found — list all services
```bash
systemctl list-units --type=service
```
> **Why:** Shows list of all services that exist on the system.

**Step 3:** If not found — check if enabled on boot
```bash
systemctl is-enabled nginx
```
> **Why:** Shows whether nginx is enabled on boot or not.

---

### 🔴 Scenario 2 — Web app `myapp` failed to start after reboot

> **Problem:** A web application service called `myapp` failed to start after a server reboot. What commands would you run to diagnose the issue?

**Step 1:** Check service status
```bash
systemctl status myapp
```
> **Why:** Shows whether myapp service is `active`, `failed`, or `stopped`.

**Step 2:** Check if enabled on boot
```bash
systemctl is-enabled myapp
```
> **Why:** Shows whether myapp is enabled on boot or not.

**Step 3:** If enabled → Check logs
```bash
journalctl -u myapp -n 10 -f
```
> **Why:** To view live logs of the service.

---

### 🔴 Scenario 3 — Application server is slow (High CPU)

> **Problem:** Your manager reports that the application server is slow. You SSH into the server. What commands would you run to identify which process is using a high CPU?

**Step 1:** List top CPU-consuming processes
```bash
ps -e -o pid,pcpu,comm --sort=-pcpu | head -5
```
> **Why:** Shows CPU usage in descending order. Collect the PID for further investigation.

---

### 🔴 Scenario 4 — Find logs for `docker` service (managed by systemd)

> **Problem:** A developer asks: "Where are the logs for the `docker` service?" The service is managed by systemd. What commands would you use?

> 💡 **Key Concept:** Services managed by **systemd** write logs to **journald** and can be read using **journalctl**.

**Step 1:** View service logs
```bash
journalctl -u docker -n 20 -f
```
> **Why:** Shows live logs of the service.

---

### 🔴 Scenario 5 — Script not executing: `Permission denied`

> **Problem:** A script at `/home/user/backup.sh` is not executing. When you run `./backup.sh`, you get: **"Permission denied"**. What commands would you use to fix this?

**Step 1:** Check file permissions
```bash
ls -l /home/shankar_regati/backup.sh
```
> **Why:** To view file permissions.

**Terminal Output (before fix):**

![initial per.](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-07/initial%20per..png)

> Output shows `-rw-rw-r--` → **no `x` (not executable)**

**Step 2:** Add executable permission
```bash
chmod +x /home/shankar_regati/backup.sh
```
> **Why:** To add executable permission.

**Step 3:** Verify the change
```bash
ls -l /home/shankar_regati/backup.sh
```
> **Why:** To verify the permission was added.

**Terminal Output (after fix):**

![per. updated](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-07/per.%20updated.png)

> Output shows `-rwxrwxr-x` → **`x` exists → executable ✅**

**Step 4:** Execute the script
```bash
cd /home/shankar_regati
```
```bash
./backup.sh
```
> **Why:** To execute the script.

---

