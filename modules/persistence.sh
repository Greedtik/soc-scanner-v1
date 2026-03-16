persistence_scan() {
    echo -e "\n\e[1;36m[+] Persistence Mechanisms (Cron Jobs)\e[0m"
    echo -e "\e[1;33m/etc/crontab (System-wide):\e[0m"
    cat /etc/crontab | grep -v "^#" | grep -v "^\s*$"
    echo -e "\n\e[1;33mRoot Crontab:\e[0m"
    crontab -l 2>/dev/null || echo "No crontab for root."
}
