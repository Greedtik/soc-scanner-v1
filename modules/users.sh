user_scan(){
echo "[UID 0 Users]"
awk -F: '$3==0 {print}' /etc/passwd
}
