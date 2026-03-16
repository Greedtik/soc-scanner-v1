user_scan() {
    echo -e "\n\e[1;36m[+] UID 0 (Privileged) Users Scan\e[0m"
    # ดึงเฉพาะ User ที่มี UID เป็น 0 (เทียบเท่า root)
    local found=$(awk -F: '($3 == "0") {print}' /etc/passwd)
    echo -e "\e[1;31m$found\e[0m"
}
