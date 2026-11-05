#!/bin/bash
# Psyche Router Configuration
echo "Configuring Psyche..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.34
    netmask 255.255.255.248
    gateway 192.220.16.33

auto eth1
iface eth1 inet static
    address 192.220.0.1
    netmask 255.255.252.0
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.33 2>/dev/null || ip route replace default via 192.220.16.33

echo "Psyche configured successfully!"
