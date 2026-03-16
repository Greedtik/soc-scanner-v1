#!/bin/bash

# ตรวจสอบว่าผู้ใช้รันด้วยสิทธิ์ root (sudo) หรือไม่
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script as root (sudo bash install.sh)"
  exit 1
fi

INSTALL_DIR="/opt/soc_scanner"
BIN_PATH="/usr/local/bin/socscan"

echo "Installing SOC Scanner to $INSTALL_DIR..."

# สร้างโฟลเดอร์และคัดลอกไฟล์ทั้งหมดไปที่ /opt
mkdir -p "$INSTALL_DIR"
cp -r ./* "$INSTALL_DIR/"

# ตั้งค่าให้สคริปต์หลักสามารถรันได้
chmod +x "$INSTALL_DIR/socscan.sh"

# สร้าง Symbolic Link ให้เรียกใช้งานด้วยคำสั่ง 'socscan' ได้ทันที
ln -sf "$INSTALL_DIR/socscan.sh" "$BIN_PATH"

echo "Installation complete!"
echo "----------------------------------------"
echo "You can now run the scanner using: sudo socscan --all"
