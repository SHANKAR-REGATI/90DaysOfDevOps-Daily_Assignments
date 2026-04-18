# Linux Troubleshooting Drill: CPU, Memory & Logs

This document shows a Hands-on Practice, where I ran a basic **Nginx-alpine** container and inspected the **docker** service.

---

## Target Process/Service

| Field | Value |
|-------|-------|
| **Process** | `dockerd (PID - 1937)` |
| **Service** | `docker` |

---

## CPU/Memory Snapshot
**(i)** `ps -o pid,pcpu,pmem,comm -p 1937`

![ps -o](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/ps%20-o.png)

**Observations:**
- `0%` of CPU used → `dockerd` is idle, not doing any active work
- `11.2%` of RAM used by `dockerd`


**(ii)** `free -h`

![free -h](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/free%20-h.png)

**Observations:**
- `dockerd` utilizing `11.2%` of `911MB` → `102MB` → Normal
- `468MB` available → free for other processes → fine

---

## Disk/IO Snapshot

**(i)** `df -h`

![df -h](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/df%20-h.png)


**Observations:**
- Root filesystem is using `36% (2.4GB)` of disk space & `4.4GB` available → fine
- Now let's check how much disk space docker is using


**(ii)** `sudo du -sh /var/lib/docker`

![du -sh](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/du%20-sh.png)

**Observations:**
- Docker is using `64MB`

---

## Network Snapshot


**(i)** `sudo ss -tulpn`

![ss -tulpn](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/ss%20-tulpn.png)

**Observations:**
- Nginx Container running → **port 80 exposed to public**


**(ii)** `curl -I http://localhost:80`

![curl -I](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/curl%20-I.png)

---

## Logs

**(i)** `journalctl -u docker -n 20`

![journalctl](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/journalctl.png)

**Observations:**
- ✅ No errors in last 20 logs


**(ii)** `docker logs <container-id>`

![container logs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-05/container%20logs.png)

---

## ✅ Summary

| Category | Status | Notes |
|----------|--------|-------|
| **CPU** | ✅ Healthy | `dockerd` idle at `0%` CPU |
| **Memory** | ✅ Normal | `102MB` used (`11.2%` of `911MB`), `468MB` free |
| **Disk** | ✅ Fine | Root at `36%`, Docker using only `64MB` |
| **Network** | ✅ Active | Nginx serving on port `80`, responding `HTTP 200 OK` |
| **Logs** | ✅ Clean | No errors in system or container logs |
