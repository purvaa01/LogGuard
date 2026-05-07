# LogGuard – Log Operations System

A production-oriented DevOps project focused on automated log management, monitoring, cleanup, and archival.  
LogGuard helps prevent disk space issues caused by continuously growing logs by automating log generation, monitoring, rotation, cleanup, and cloud archival using AWS S3.

---

# 📌 Project Overview

- Simulates real-world continuously generated application logs
- Automates log monitoring and disk usage tracking
- Identifies old logs and archives them to AWS S3
- Frees up local server storage automatically
- Uses Bash scripting for automation workflows
- Designed with Linux + AWS + DevOps operational practices
- Built phase-by-phase to simulate real production log operations

---

# ⚙️ How It Works (Workflow)

1. Application continuously generates logs
2. Logs are stored inside the local logs directory
3. Monitoring scripts track log size and disk usage
4. Old logs are identified based on retention policy
5. Logs older than defined days are moved temporarily
6. Archive script uploads logs to AWS S3
7. Archived logs are removed locally after successful upload
8. Disk space gets recovered automatically

---

# 🛠️ Tech Stack

| Category | Technologies |
|---|---|
| Operating System | Linux (Ubuntu) |
| Scripting | Bash |
| Cloud | AWS S3 |
| Version Control | Git, GitHub |
| Automation | Cron Jobs |
| Monitoring | Linux Disk Monitoring |
| Logging | Custom Log Simulation |
| DevOps Concepts | Log Rotation, Archival, Automation |

---

# ✅ What Is Covered In This Project

- Bash scripting automation
- Linux file handling
- Log generation simulation
- Log monitoring
- Disk usage monitoring
- Automated cleanup workflows
- AWS S3 archival
- Cron job automation
- Production-style log management concepts
- Cloud-based log storage
- End-to-end operational workflow

---

# 🚀 Future Improvements

## 1. Email / Slack Notifications
Send alerts when:
- Disk usage crosses threshold
- Log archival succeeds/fails
- Cleanup process fails

## 2. Centralized Log Monitoring
Integrate:
- Elasticsearch
- Kibana
- Grafana dashboards

for advanced log visualization and analysis.

---

# 📂 Folder Structure

```bash
logguard/
│
├── logs/
├── archived_logs/
├── temp_logs/
├── scripts/
│   ├── generate_logs.sh
│   ├── monitor_logs.sh
│   ├── cleanup_logs.sh
│   ├── archive_logs.sh
│
├── README.md


# 📥 Clone The Repository

```bash
git clone https://github.com/your-username/logguard.git

cd logguard

# ▶️ Run The Project

## 1️⃣ Give Execute Permission

```bash
chmod +x scripts/*.sh
```

---

## 2️⃣ Generate Logs

```bash
./scripts/generate_logs.sh
```

This script continuously generates sample logs inside the `logs/` directory.

---

## 3️⃣ Monitor Logs

```bash
./scripts/monitor_logs.sh
```

This script monitors:
- Log file growth
- Disk usage
- Storage consumption

---

## 4️⃣ Cleanup Old Logs

```bash
./scripts/cleanup_logs.sh
```

This script identifies and removes logs older than the configured retention period.

---

## 5️⃣ Archive Logs To AWS S3

```bash
./scripts/archive_logs.sh
```

This script:
- Moves old logs
- Uploads them to AWS S3
- Clears local storage after successful archival

---

# ☁️ AWS S3 Setup

## Configure AWS CLI

```bash
aws configure
```

Enter:
- AWS Access Key
- AWS Secret Key
- Region
- Output format

---

## Create S3 Bucket

```bash
aws s3 mb s3://your-bucket-name
```

---

## Update Bucket Name

Open:

```bash
scripts/archive_logs.sh
```

Replace:

```bash
your-bucket-name
```

with your actual S3 bucket name.

---

# ⏰ Automate Using Cron Job

Open crontab:

```bash
crontab -e
```

Example cleanup automation:

```bash
0 2 * * * /home/ubuntu/logguard/scripts/cleanup_logs.sh
```

This runs the cleanup script daily at 2 AM.

---

## ⭐ Conclusion

LogGuard demonstrates how automated log management can help maintain server health, optimize storage usage, and improve operational efficiency using DevOps practices and cloud integration.

---
