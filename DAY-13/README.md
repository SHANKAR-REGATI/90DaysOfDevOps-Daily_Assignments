# Linux Volume Management

This project demonstrates a practical hands-on implementation of Linux storage management using **LVM** on an **AWS EC2 instance** with **three attached EBS volumes (10GB, 12GB, and 14GB)**. It covers creating **physical volumes, volume groups, logical volumes, mounting storage, directly mounting EBS volumes**, and **extending logical volume capacity**.

---

## STEP 1 : Create an AWS EC2 Instance, SSH to it & Switch to sudo

### (i) Launch EC2 Instance

![EC2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/EC2%20.png)

### (ii) SSH to it & switch to sudo

![udo switch](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/sudo%20swith.png)

> **NOTE :** Only root user can operate LVM (Logical Volume Manager)

### (iii) View Current Storage

- `lsblk` → shows the list of attached volumes

![lsblk-ini](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk-ini.png)

> **Note :** root volume (8GB) attached by default to instance

- `df -h` → shows disk usage & mount points

![df -h-ini](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/df-h-ini.png)

> **Note:** root volume mounted at /

---

## STEP 2 : Create & Attach EBS volumes, Verify

![EBS Volumes](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/EBS%20volumes.png)

- `lsblk` 

![lsblk-attach](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk-attach.png)

> **Note:** On Nitro-Based EC2 Instances(t3.micro) attached volumes appear as NVMe devices.

---

## STEP 3 : Make Raw Volumes as Physical Volumes

- `pvcreate /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1`

![pvcreate](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/pvcreate.png)

- `pvs`

![pvs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/pvs.png)

---

## STEP 4 : Create Volume Groups From Physical volumes (/dev/nvme1n1 & /dev/nvme2n1)

- `vgcreate practice_vg /dev/nvme1n1 /dev/nvme2n1`

![vgcreate](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/vgcreate.png)

- `vgs`

![vgs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/vgs.png)

---

## STEP 5 : Create a Logical Volume of 10GB

- `lvcreate -L 10G -n practice_lv practice_vg`

![lvcreate](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lvcreate.png)

- `lvs`

![lvs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lvs.png)

---

## STEP 6 : Mount the Logical volume

### (i) format it

- Logical volume device location → `/dev/practice_vg/practice_lv`
- `mkfs.ext4 /dev/practice_vg/practice_lv`

![format-lv](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/format-lv.png)

### (ii) Create a Folder to mount

- `mkdir /mnt/practice_lv_mount`

### (iii) mount the logical volume & verify

- `mount /dev/practice_vg/practice_lv /mnt/practice_lv_mount`
- `lsblk`

![lsblk-lv](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk-lv.png)

---

## STEP 7 : Mount the 3rd physical volume (/dev/nvme3n1)

### (i) format it

- Physical volume device location → `/dev/nvme3n1`
- `mkfs -t ext4 /dev/nvme3n1`

![disk-format](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/disk-format.png)

### (ii) Create a Folder to mount

- `mkdir /mnt/practice_disk_mount`

### (iii) mount the logical volume & verify

- `mount /dev/nvme3n1 /mnt/practice_disk_mount`
- `lsblk`

![lsblk-disk](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk-disk.png)

---

## STEP 8 : Extend the Logical Volume storage by 5GB

- `lvextend -L +5G /dev/practice_vg/practice_lv`

![lvextend](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lvextend.png)

- `lsblk`

![lsblk-extend](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk-extend.png)
