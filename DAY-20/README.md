# Shell Scripting Project: Log Analyzer & Report Generator

A powerful Bash script that analyzes log files, extracts error patterns, generates summary reports, and archives processed logs.

---

## 📋 Tasks Overview

### ✅ Task 1: Input and Validation

Your script should:
- Accept the path to a log file as a command-line argument
- Exit with a clear error message if no argument is provided
- Exit with a clear error message if the file doesn't exist

---

### ✅ Task 2: Error Count

- Count the total number of lines containing the keyword `ERROR` or `Failed`
- Print the total error count to the console

---

### ✅ Task 3: Critical Events

- Search for lines containing the keyword `CRITICAL`
- Print those lines along with their line number

---

### ✅ Task 4: Top Error Messages

- Extract all lines containing `ERROR`
- Identify the **top 5 most common** error messages
- Display them with their occurrence count, sorted in descending order

---

### ✅ Task 5: Summary Report

Generate a summary report to a text file named `log_report_<date>.txt` (e.g., `log_report_2026-02-11.txt`). The report should include:

- Date of analysis
- Log file name
- Total lines processed
- Total error count
- Top 5 error messages with their occurrence count
- List of critical events with line numbers

---

### ⭐ Task 6 (Optional): Archive Processed Logs

Add a feature to:
- Create an `archive/` directory if it doesn't exist
- Move the processed log file into `archive/` after analysis
- Print a confirmation message

---

## 🚀 Steps

### 1. Create the script

```bash
vim log_analyzer.sh
```

### 2. Write the Script
```bash
#!/bin/bash

<< Notice

This Script Analyses a log file & 
Generates a Summary Report & 
Finally Moves the processed log file to a Archive directory

Notice

log_file=$1
timestamp=$(date "+%Y-%m-%d")
archive_dir=$2

[[ $# -ne 2 ]] && echo "Usage : ./log_analyzer.sh <log_file_path> <Archive_dir_path" && exit 1

[[ ! -f $log_file ]] && echo " $log_file File Doesn't Exist " && exit 1

err_count=$(grep -c "ERROR" $log_file)

critical=$(grep -n "CRITICAL" $log_file | sed 's/^\([0-9]*\):/Line \1:/')

err_occurance=$(grep "ERROR" sample.log | awk '{$1=$2=$3="";print}' | sort | uniq -c | sort -rn | head -5)

Summary_report() {
	echo " Date of Analysis : $timestamp "
	echo " Log File Name : $log_file "
	echo " Total Lines Processed : $(cat $log_file | wc -l) "
	echo " Total Error Count : $err_count "
	echo " ========= TOP 5 Error messages ======== "
	echo "$err_occurance"
	echo " ========= Critical Events ========= "
	echo "$critical"
}

Summary_report | tee log_report_$timestamp.txt

[[ -d $archive_dir ]] || mkdir -p $archive_dir

mv $log_file $archive_dir/

[[ $? -eq 0 ]] && echo " ======= Log file Moved to Archive Directory ======= "
```
---

### 3. Make the script executable

```bash
sudo chmod 700 log_analyzer.sh
```

---

### 3. Run the script

```bash
./log_analyzer.sh <log_file_path> <archive_dir_path>
```

**Output:**

![1.3](https://github.com/SHANKAR-REGATI/90DaysOfDevOps-Daily_Assignments/blob/main/DAY-20/1.3.png)

---

