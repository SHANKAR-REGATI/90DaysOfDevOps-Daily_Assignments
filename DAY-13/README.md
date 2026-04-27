# Linux Storage Management on AWS EC2

This document demonstrates a practical hands-on implementation of Linux storage management using **LVM** on an **AWS EC2 instance** with **three attached EBS volumes (10GB, 12GB, and 14GB)**. It covers creating **physical volumes, volume groups, logical volumes, mounting storage, directly mounting EBS volumes**, and **extending logical volume capacity** & finally updating the filesystem configuration in `/etc/fstab`

---

## STEP 1 : Create an AWS EC2 Instance, SSH to it & Switch to sudo

### (i) Launch EC2 Instance

> Launched a `t3.micro` EC2 instance named **Devops-Practice** in the AWS console.

![ec2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/ec2.png)


### (ii) SSH to it & Switch to sudo

![ssh](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/ssh.png)

> **NOTE : Only root user can operate LVM (Logical Volume Manager)**

### (iii) View Current Storage

**`lsblk`** → shows the list of attached volumes

![lsblk1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk1.png)

> **Note:** root volume (8GB) attached by default to instance

**`df -h`** → shows list of mounted Volumes

![df-h1](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/df-h1.png)

> **Note:** root volume mounted at `/(root)`

---

## STEP 2 : Create & Attach EBS volumes, Verify

> Three EBS volumes were created and attached to the instance:
> - `vol-012c17e0ea4e8b0b4` → **10 GiB**
> - `vol-022a4823655639b41` → **12 GiB**
> - `vol-0e6f6a0976e76569c` → **14 GiB**

![EBS](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/EBS.png)

After attaching, verify with `lsblk`:

![lsblk2](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk2.png)

> **Note:** On Nitro-Based EC2 Instances (t3.micro), attached volumes appear as NVMe devices.

---

> **Now we will be creating a logical volume from a Volume group made with two physical volumes. For this we should convert the 2 raw volumes (nvme1n1, nvme2n1) to physical volumes.**

---

## STEP 3 : Make Raw Volumes (nvme1n1 , nvme2n1) as Physical Volumes

### (i) `pvcreate /dev/nvme1n1 /dev/nvme2n1`

![pvcreate](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/pvcreate.png)

### (ii) `pvs`

![pvs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/pvs.png)

---

## STEP 4 : Create Volume Group From Physical volumes (/dev/nvme1n1 & /dev/nvme2n1)

### (i) `vgcreate practice_vg /dev/nvme1n1 /dev/nvme2n1`

![vgcreate](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/vgcreate.png)

### (ii) `vgs`

![vgs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/vgs.png)

---

## STEP 5 : Create a Logical Volume of 10GB

### (i) `lvcreate -L 10G -n practice_lv practice_vg`

![lvcreate](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lvcreate.png)

### (ii) `lvs`

![lvs](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lvs.png)

---

## STEP 6 : Mount the Logical Volume

### (i) Format it

- Logical volume device location → `/dev/practice_vg/practice_lv`

```bash
mkfs -t ext4 /dev/practice_vg/practice_lv
```

![format_lv](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/format_lv.png)

### (ii) Create a Folder to mount

```bash
mkdir /mnt/practice_lv_mount
```

### (iii) Mount the logical volume & verify

```bash
mount /dev/practice_vg/practice_lv /mnt/practice_lv_mount
```
```bash
lsblk
```
![lsblk3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk3.png)

---

## STEP 7 : Mount the 3rd EBS volume (/dev/nvme3n1)

### (i) Format it

- Raw volume device location → `/dev/nvme3n1`

```bash
mkfs -t ext4 /dev/nvme3n1
```

![format_disk](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/format_disk.png)

### (ii) Create a Folder to mount

```bash
mkdir /mnt/practice_disk_mount
```

### (iii) Mount the logical volume & verify

```bash
mount /dev/nvme3n1 /mnt/practice_disk_mount
```
```bash
lsblk
```

![lsblk4](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk4.png)

---

## STEP 8 : Extend the Logical Volume storage by 5GB

### (i) `lvextend -L +5G /dev/practice_vg/practice_lv`

![lvextend](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lvextend.png)

### (ii) Verify — `lsblk`

![lsblk5](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk5.png)

---

> **When we restart the instance, EBS volumes will still be attached but they will not be mounted. In order to make the volumes mount automatically at the time of boot, we must configure the filesystem in `/etc/fstab`**

---

## STEP 9 : Configure the filesystem in /etc/fstab & restart the instance

### (i) `vim /etc/fstab`

Add the following entry using the UUID of the logical volume:

![fstab](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/fstab.png)


### (ii) Verify : `lsblk`

After restarting the instance:

![lsblk6](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-13/lsblk6.png)

> **Note:** When the instance restarted, the logical volume was mounted automatically because it was configured in `/etc/fstab`. However, the `nvme3n1` volume was **not mounted** since it wasn't added to the `fstab` configuration.

---

## 💡 Important Notes

- Only the **root user** can operate LVM
- On **Nitro-based EC2 instances** (t3.micro), attached EBS volumes appear as NVMe devices (`nvme1n1`, `nvme2n1`, etc.)
- Volumes mounted manually will **not persist after reboot** — always add them to `/etc/fstab` with `nofail` option
- Use **UUID** (not device name) in `/etc/fstab` since device names can change across reboots

---


