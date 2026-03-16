port_scan() {
    echo -e "\n\e[1;36m[+] Listening Ports\e[0m"
    # ใช้ ss เป็นหลัก ถ้าไม่มีให้ใช้ netstat แทน
    ss -tulpn 2>/dev/null || netstat -tulpn 2>/dev/null
}
