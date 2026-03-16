docker_scan() {
    echo -e "\n\e[1;36m[+] Docker Container Scan\e[0m"
    if command -v docker &> /dev/null; then
        docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"
    else
        echo -e "\e[1;33mDocker is not installed or not running.\e[0m"
    fi
}
