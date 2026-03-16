process_tree() {
    echo -e "\n\e[1;36m[+] Process Tree\e[0m"
    # ใช้ pstree ดูง่ายสุด ถ้าเครื่องไม่ได้ติดตั้งไว้ จะสลับไปใช้ ps auxf
    if command -v pstree &> /dev/null; then
        pstree -p -T
    else
        ps auxf
    fi
}
