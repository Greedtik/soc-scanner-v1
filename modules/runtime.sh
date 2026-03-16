runtime_scan(){
echo "[Runtime Scan]"
free -h
echo
ps -eo pid,user,%cpu,%mem,cmd --sort=-%cpu | head
}
