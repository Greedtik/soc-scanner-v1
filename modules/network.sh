network_scan() {
    echo -e "\n\e[1;36m[+] Network Connections (Established)\e[0m"
    ss -antup | grep ESTAB || echo -e "\e[1;32mNo established connections found.\e[0m"
}
