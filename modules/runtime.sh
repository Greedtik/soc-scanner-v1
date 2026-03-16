runtime_scan() {
    echo -e "\n\e[1;36m[+] Runtime Scan\e[0m"
    echo -e "\e[1;33mMemory Usage:\e[0m"
    free -h
    echo -e "\n\e[1;33mTop 5 CPU Consuming Processes:\e[0m"
    ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
}
