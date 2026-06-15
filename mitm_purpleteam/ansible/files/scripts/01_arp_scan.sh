#!/bin/bash
# ============================================================
# 01_arp_scan.sh - Descubrimiento de red
# CTF-FLAG-NET-01
# ============================================================
source /opt/mitm-scripts/targets.sh

echo "[*] Descubriendo hosts en la red..."
nmap -sn $(ip route | grep -oP '\d+\.\d+\.\d+\.\d+/\d+' | head -1) \
  -oN /tmp/hosts_discovery.txt

echo ""
echo "[*] Tabla ARP actual:"
arp -a

echo ""
echo "[*] Resultado:"
cat /tmp/hosts_discovery.txt | grep "report for"

echo ""
echo "[+] FLAG: $(cat /opt/flag_net.txt 2>/dev/null || echo 'Ejecuta en workstation: cat /opt/flag_net.txt')"
