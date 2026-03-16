persistence_scan(){
echo "[Persistence Scan]"
crontab -l 2>/dev/null
ls /etc/cron.* 2>/dev/null
systemctl list-unit-files | grep enabled 2>/dev/null
}
