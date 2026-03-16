reverse_shell_scan(){
echo "[Reverse Shell Detection]"
ps aux | grep -E "bash -i|nc -e|/dev/tcp|python.*pty" | grep -v grep
}
