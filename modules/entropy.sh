entropy_scan() {
    echo -e "\n\e[1;36m[+] Suspicious Files (Hidden or >10MB in temp directories)\e[0m"
    echo -e "\e[1;33mScanning /tmp, /var/tmp, /dev/shm...\e[0m"
    # หาไฟล์ที่ซ่อน (ขึ้นต้นด้วย .) หรือไฟล์ที่ใหญ่กว่า 10MB ในโฟลเดอร์ชั่วคราว
    find /tmp /var/tmp /dev/shm -type f \( -size +10M -o -name ".*" \) -exec ls -lh {} \; 2>/dev/null || echo -e "\e[1;32m[OK] No suspicious files found.\e[0m"
}
