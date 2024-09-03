#!/bin/bash
# Kiểm tra port 80 và 443, hiển thị tiến trình sử dụng chúng
netstat -tuln | grep ':80\|:443' && lsof -i :80 -i :443

# Lấy tiến trình đang sử dụng cổng 80 và 443
pid_80=$(lsof -t -i :80)
pid_443=$(lsof -t -i :443)

# Hiển thị thông tin tiến trình
if [ -n "$pid_80" ]; then
    echo "Port 80 is in use by process ID: $pid_80"
else
    echo "Port 80 is not in use."
fi

if [ -n "$pid_443" ]; then
    echo "Port 443 is in use by process ID: $pid_443"
else
    echo "Port 443 is not in use."
fi

# Tự xóa file script sau khi chạy
rm -- "$0"
