# Linux Practice: Processes & Services

This Document shows a Hands-on practice focused on **processes** , **services** , **logs** using **SSH service** on **AWS EC2 Instance**.

---

## (i) Process Checks
```bash
ps -ef | grep sshd
```

![ps -ef](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-04/ps%20-ef%20.png)

#### ■ Observations:

- **Main SSH server (sshd) , PID (1014)** → running
- **Ubuntu [priv] , PID (1018)** → child process created by main sshd for handling connections.
- **PID (1128)** → created for user login session
- **Multiple sshd processes** created for each user login session.

```bash
pgrep -a sshd
```

![pgrep](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-04/pgrep.png)

#### ■ Observations:

- Shows process id's using process name.

---

## (ii) Service Checks
```bash
systemctl status ssh
```

![ssh status](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-04/ssh%20status.png)

#### ■ Observations:

- Service is **Active**
- **PID** → 1014
- Service listening on **port 22**
- Public key accepted & session opened for user ubuntu

```bash
systemctl list-units --type=service | grep ssh
```

![ssh.service](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-04/ssh.service.png)

#### ■ Observations:

- **ssh service** → running

---

## (iii) Log Checks
```bash
journalctl -u ssh -n 20
```

![journalctl](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-04/journalctl.png)

#### ■ Observations:

- **ssh.service** → starting
- service listening on **port 22**
- **Service** → started
- Public key accepted & session opened for user ubuntu ( 3 sessions created as i did ssh login 3 times)

```bash
tail -n 10 /var/log/auth.log
```

![tail](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-04/tail.png)
