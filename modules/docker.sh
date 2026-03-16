docker_scan(){
echo "[Docker Scan]"
if command -v docker >/dev/null 2>&1; then
 docker ps
 docker images
else
 echo "Docker not installed"
fi
}
