entropy_scan(){
echo "[Suspicious Large Files]"
find /tmp /var/tmp -type f -size +10M 2>/dev/null | head
}
