rootkit_scan() {
    echo -e "\n\e[1;36m[+] Kernel Modules (Rootkit Scan)\e[0m"
    # แสดง 15 โมดูลล่าสุดที่โหลดขึ้นมา
    lsmod | head -n 16
    echo -e "\e[1;33m(Showing top 15 modules. Run 'lsmod' for full list)\e[0m"
}
