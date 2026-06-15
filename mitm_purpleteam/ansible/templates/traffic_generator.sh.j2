#!/bin/bash
WEBSERVER_IP="10.0.1.7"
WEBSERVER_DNS="corp.local"
DNS_SERVER="10.0.1.6"
echo "nameserver $DNS_SERVER" > /etc/resolv.conf
COUNTER=0
while true; do
    curl -s -o /dev/null -X POST "http://$WEBSERVER_IP/login.php" \
      -d "username=jperez&password=empresa2024" > /dev/null 2>&1
    curl -s -o /dev/null "http://$WEBSERVER_DNS/login.php" > /dev/null 2>&1
    COUNTER=$((COUNTER + 1))
    if [ $((COUNTER % 6)) -eq 0 ]; then
        curl -s -o /dev/null -X POST "http://$WEBSERVER_IP/login.php" \
          -d "username=admin&password=password123" > /dev/null 2>&1
    fi
    sleep 30
done
