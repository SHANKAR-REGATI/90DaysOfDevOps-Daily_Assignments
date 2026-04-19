#  Linux User & Group Management Challenge

A hands-on Linux administration challenge covering user creation, group management, directory permissions, and access control.

---

## Task 1 : Create Users → `tokyo` , `berlin` , `professor`

**Step 1:** `sudo useradd -m -s /usr/bin/bash tokyo`  
Set Password: `sudo passwd tokyo`

**Step 2:** `sudo useradd -m -s /usr/bin/bash berlin`  
Set Password: `sudo passwd berlin`

**Step 3:** `sudo useradd -m professor` → not adding beautiful shell  
Set Password: `sudo passwd professor`

**Verify:** users → `cat /etc/passwd`

![passwd](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/passwd.png)

**Verify:** home directories → `ls -l /home`

![user-folders](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/user-folders.png)

---

## Task 2 : Create Groups → `developers` , `admins`

**Step 1:** `sudo groupadd developers`  
**Step 2:** `sudo groupadd admins`

**Verify:** groups → `cat /etc/group`

![group](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/group.png)

---

## Task 3 : Assign Users to Groups

**Step 1:** `sudo usermod -aG developers tokyo`  
**Step 2:** `sudo usermod -aG developers,admins berlin`  
**Step 3:** `sudo usermod -aG admins professor`

**Verify:** users → `cat /etc/group`

![grp-usr-add](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/grp-usr-add.png)

---

## Task 4 : Create Shared Directory

**Step 1:** create directory → `sudo mkdir -p /opt/dev-project`

Verify: `ls -l /opt`

![dev-project](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/dev-project.png)

**Step 2:** change group → `sudo chgrp developers /opt/dev-project`

Verify: `ls -l /opt`

![chgrp1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/chgrp1.png)

**Step 3:** change permissions → `sudo chmod 775 /opt/dev-project`

Verify: `ls -l /opt`

![chmod1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/chmod1.png)

**Step 4:** Test by creating a file as **tokyo**
![tokyo](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/tokyo.png)

> ✅ **"File Created As Tokyo User as he is a part of developers group"**

**Step 5:** Test by creating a file as **berlin**

![berlin](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/berlin.png)

> ✅ **"File Created As Berlin User as he is a part of developers group"**

**Step 6:** Test by creating a file as **professor**

![professor](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/professor.png)

> ❌ **Permission Denied** — Professor is not in the `developers` group
---

## Task 5 : Team Workspace

**Step 1:** `sudo useradd -m nairobi`  
**Step 2:** `sudo groupadd project-team`  
**Step 3:** `sudo usermod -aG project-team tokyo`  
**Step 4:** `sudo usermod -aG project-team nairobi`  
**Step 5:** `sudo mkdir -p /opt/team-workspace`  
**Step 6:** `sudo chgrp project-team /opt/team-workspace`  
**Step 7:** `sudo chmod 775 /opt/team-workspace`

![team-workspace](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/team-workspace.png)

**Step 8:** `sudo -u nairobi touch /opt/team-workspace/test_as_nairobi.txt`

![nairobi](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/nairobi.png)

> ✅ **File created successfully as nairobi**

**Step 9:** `sudo -u berlin touch /opt/team-workspace/test_as_berlin.txt`

![berlin2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-09/berlin2.png)

> ❌ **Permission Denied** — berlin is not part of `project-team`

