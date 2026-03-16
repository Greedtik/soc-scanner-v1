reverse_shell_scan() {
    echo -e "\n\e[1;36m[+] Reverse Shell Detection\e[0m"
    local found=$(ps auxww | grep -E "bash -i|nc -e|/dev/tcp|python.*pty" | grep -v grep)
    if [ -n "$found" ]; then
        echo -e "\e[1;31m[!] WARNING: Suspicious reverse shell patterns detected:\e[0m"
        echo "$found"
    else
        echo -e "\e[1;32m[OK] No common reverse shell patterns detected.\e[0m"
    fi
}
