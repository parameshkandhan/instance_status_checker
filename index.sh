#!/bin/bash

INSTANCE_NAME=$(uname -a)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
PRIVATE_IP=$(hostname -I | awk '{print $1}')
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Instance Status</title>
</head>
<body>
    <h1>Instance Status</h1>
    <p><strong>Instance Name:</strong> $INSTANCE_NAME</p>
    <p><strong>CPU Usage:</strong> $CPU_USAGE</p>
    <p><strong>Memory Usage:</strong> $MEM_USAGE</p>
    <p><strong>Private IP:</strong> $PRIVATE_IP</p>
    <p><strong>Public IP:</strong> $PUBLIC_IP</p>
</body>
</html>
EOF
