# Cloud Server Setup 

This document demonstrates a hands-on practice covering the following tasks:
- Setting up a cloud server
- Connecting to the server using SSH
- Installing Nginx web server
- Viewing Nginx logs
- Downloading logs to the local machine

---

## **(i)** Launch Cloud Instance & SSH Access

### ➤ Step 1: Create a Cloud Instance

![ec2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/ec2.png)

### ➤ Step 2: SSH to It

**Set permission:**
```bash
sudo chmod 400 devops-practice-key.pem
```

**Command:**
```bash
ssh -i ~/Downloads/Practice-key.pem ubuntu@ec2-65-1-132-58.ap-south-1.compute.amazonaws.com
```

![ssh](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/ssh.png)

---

## **(ii)** Install Nginx

### ➤ Step 1:
```bash
sudo apt update
```

### ➤ Step 2:
```bash
sudo apt install nginx
```

**Verify:**
```bash
systemctl status nginx
```

![nginx-status](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/nginx-status.png)
> `systemctl status nginx` showing nginx service as **active (running)***

---

## **(iii)** Setup Security Configuration

### ➤ Step 1: Go to Instance Security Group → Inbound Rules → Add Port 80

![allow port](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/allow%20port.png)

**Verify:**
```
http://<instance-public-ip:port> 
```
**Example** : http://13.235.19.40:80

![webpage](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/webpage.png)

---

## **(iv)** Extract Nginx Logs

### ➤ Step 1: View Nginx Logs
```bash
journalctl -u nginx
```

![logs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/logs.png)

### ➤ Step 2: Save Logs to a File
```bash
journalctl -u nginx > nginx-logs.txt
```

![save-logs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/save-logs.png)

### ➤ Step 3: Download `nginx-logs.txt` File to Local Machine

**Command:**
```bash
scp -i ~/Downloads/devops-practice-key.pem ubuntu@ec2-65-1-132-58.ap-south-1.compute.amazonaws.com:~/nginx-logs.txt .
```

![download-logs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-08/download-logs.png)

**What each part of command means:**

| Part | Description |
|------|-------------|
| `scp` | Secure file copy command |
| `-i ~/Downloads/devops-practice-key.pem` | Uses key and public DNS to connect |
| `ubuntu@ec2-...amazonaws.com` | Remote server address |
| `~/nginx-logs.txt` | Source file path on the server |
| `.` | Destination path on local machine (`.` = current directory / `pwd`) |

> Used to **securely copy a file from a remote server to a local system**

