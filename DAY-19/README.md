# Shell Scripting Project: Log Rotation, Backup & Crontab
This document shows a hands-on practice on linux Shell scripting covering
- log Rotation Script
- Server Backup script
- maintenance script
- Automatic Execution of these scripts using cronjob

---

## ✅ Task 1: Log Rotation Script

### Overview

Create `log_rotate.sh` that:

- Takes a log directory as an argument (e.g., `/var/log/myapp`)
- Compresses `.log` files older than 7 days using `gzip`
- Deletes `.gz` files older than 30 days
- Prints how many files were compressed and deleted
- Exits with an error if the directory doesn't exist

### Steps

**Step 1:** Create the script file
```bash
vim log_rotate.sh
```

**Step 2:** Write the script

```bash
#!/bin/bash

<< Notice
This Script Creates a Backup of log files older than 7 days &
deletes backup files older than 30 days
Notice

log_dir=$1

[[ $# -ne 1 ]] && echo "Usage : ./log_rotate.sh <log_dir_path>" && exit 1

[[ ! -d $log_dir ]] && echo "======== $log_dir Directory Doesn't Exist =========" && exit 1

compress_files() {
        local count=$(find $log_dir -name "*.log" -mtime +7 | wc -l)
        find $log_dir -name "*.log" -mtime +7 -exec gzip {} \;
        echo "=========== Compressed $count files Successfully ==========="
}

delete_files() {
        local count=$(find $log_dir -name "*.gz" -mtime +30 | wc -l)
        find $log_dir -name "*.gz" -mtime +30 -exec rm {} \;
        echo "=========== Deleted $count .gz files Successfully ==========="
}

compress_files
delete_files
```

**Step 3:** Make it executable
```bash
sudo chmod 700 log_rotate.sh
```

**Step 4:** Run the script
```bash
sudo ./log_rotate.sh <path-to-log-directory>
```

### Output

![1.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-19/1.2.png)

> **Note:** Since there are no log files older than 7 days, 0 were compressed & since there are no backup files older than 30 days, 0 were deleted.

---

## ✅ Task 2: Server Backup Script

### Overview

Create `backup.sh` that:

- Takes a source directory and backup destination as arguments
- Creates a timestamped `.tar.gz` archive (e.g., `backup-2026-05-11.tar.gz`)
- Verifies the archive was created successfully
- Prints archive name and size
- Deletes backups older than 14 days from the destination
- Handles errors — exit if source doesn't exist

### Steps

**Step 1:** Create the script file
```bash
vim backup.sh
```

**Step 2:** Write the script

```bash
#!/bin/bash

<< Notice
This Script Creates an Archive of a folder &
deletes backups older than 14 days
Notice

source_dir=$1
backup_dir=$2
timestamp=$(date "+%Y-%m-%d")

[[ $# -ne 2 ]] && echo "Usage : ./backup.sh <source_path> <backup_path>" && exit 1

[[ ! -d $source_dir ]] && echo "============= $source_dir Directory Doesn't Exist =============" && exit 1

create_backup() {
        tar -czf $backup_dir/backup_$timestamp.tar.gz $source_dir 2>/dev/null
        tar -tzf $backup_dir/backup_$timestamp.tar.gz >/dev/null && echo "======== Archive Successfully Created ========"
        echo "======== Archive Details =========="
        echo "Archive_Name : $(du -h $backup_dir/backup_$timestamp.tar.gz | awk '{print $2}')"
        echo "Archive_Size : $(du -h $backup_dir/backup_$timestamp.tar.gz | awk '{print $1}')"
}

delete_backup() {
        find $backup_dir -name "*.tar.gz" -mtime +14 -exec rm {} \;
        echo "========== Deleted Backup files older than 14 days ============"
}

create_backup
delete_backup
```

**Step 3:** Make it executable
```bash
sudo chmod 700 backup.sh
```

**Step 4:** Run the script
```bash
sudo ./backup.sh <path-to-source> <path-to-backup>
```

### Output

![2.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-19/2.2.png)

---

## ✅ Task 3: Crontab

### Overview

Write cron entries for:

- Run `log_rotate.sh` every day at 2 AM
- Run `backup.sh` every Sunday at 3 AM
- Run a health check script every 5 minutes

### Health Check Script

```bash
#!/bin/bash

<< Notice
This Script Checks The Server Health
Notice

disk_usage() {
        {
                df -h | head -n1 | awk '{print $1,$4,$6}'
                df -h | tail -n +2 | sort -k3 -rh | awk 'NR<=5 {print $1,$4,$6}'
        }| column -t
}

memory_usage() {
        free -h | awk 'NR==2 {print $7}'
}

CPU_usage() {
        {
                ps -e -o pid,pcpu,comm | head -n1
                ps -e -o pid,pcpu,comm | tail -n +2 | sort -k2 -rh | awk 'NR<=5'
        }| column -t
}

get_uptime() {
        echo "Uptime : $(uptime)"
}

Server_check() {
        echo "========== Top 5 disk Usage ========="
        disk_usage
        echo "========== Available RAM =========="
        memory_usage
        echo "========== Top 5 CPU consuming processes =========="
        CPU_usage
        echo "======== Uptime Info =========="
        get_uptime
}

Server_check
```

### Health Check Output

![3.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-19/3.2.png)

### Cron Entries

```cron
# Run log_rotate.sh every day at 2 AM
0 2 * * * /home/ubuntu/log_rotate.sh /var/log >> /tmp/log_rotate.log

# Run backup.sh every Sunday at 3 AM
0 3 * * 0 /home/ubuntu/backup.sh /home/ubuntu/project /home/ubuntu/backups >> /tmp/backup.log

# Run health_check.sh every 5 minutes
*/5 * * * * /home/ubuntu/health_check.sh >> /tmp/health_check.log
```

![ct1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-19/ct1.png)

---

## ✅ Task 4: Scheduled Maintenance Script

### Overview

Create `maintenance.sh` that:

- Calls your log rotation function
- Calls your backup function
- Logs all output to `/var/log/maintenance.log` with timestamps
- Write the cron entry to run it daily at 1 AM

### Steps

**Step 1:** Create the script file
```bash
vim maintenance.sh
```

**Step 2:** Write the script

```bash
#!/bin/bash

<< Notice
This Script Creates a backup of a folder &
Maintains only the latest 5 backups
Notice

source_dir=$1
backup_dir=$2
timestamp=$(date "+%Y-%m-%d-%H-%M-%S")

[[ $# -ne 2 ]] && echo "Usage : ./maintenance.sh <source_path> <backup_path> " && exit 1

[[ ! -d $source_dir ]] && echo " $source_dir Directory Doesn't Exist " && exit 1

create_backup() {
        tar -czf $backup_dir/backup_$timestamp.tar.gz $source_dir 2>/dev/null

        [[ $? -eq 0 ]] && echo "========== Backup created Successfully for $timestamp ==========="
}

perform_rotation() {
        backups=($(ls -t $backup_dir/backup_*))
        if [ "${#backups[@]}" -gt 5 ];then
                echo "========== Performing Rotation ==========="
                backups_to_remove=(${backups[@]:5})
                for backup in "${backups_to_remove[@]}"
                do
                        rm $backup
                done
        fi
}

Output() {
        create_backup
        perform_rotation
}

echo " $(date) : $(Output) " >> /var/log/maintenance.log
```

**Step 3:** Make it executable
```bash
sudo chmod 700 maintenance.sh
```

**Step 4:** Run the script
```bash
sudo ./maintenance.sh <path-to-source> <path-to-backup>
```

### Output

![4.2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-19/4.2.png)

### Cron Entry for Maintenance Script

```cron
# Run maintenance.sh daily at 1 AM
0 1 * * * /home/ubuntu/maintenance.sh /home/ubuntu/project /home/ubuntu/backups
```

### Final Crontab Configuration

```cron
0 2 * * * /home/ubuntu/log_rotate.sh /var/log >> /tmp/log_rotate.log
0 3 * * 0 /home/ubuntu/backup.sh /home/ubuntu/project /home/ubuntu/backups >> /tmp/backup.log
*/5 * * * * /home/ubuntu/health_check.sh >> /tmp/health_check.log
0 1 * * * /home/ubuntu/maintenance.sh /home/ubuntu/project /home/ubuntu/backups
```

![ct2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-19/ct2.png)

---
