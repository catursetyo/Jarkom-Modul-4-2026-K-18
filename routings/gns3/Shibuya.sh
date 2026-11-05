#!/bin/bash
# Shibuya Router Configuration
echo "Configuring Shibuya..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.90
    netmask 255.255.255.252
    gateway 192.220.16.89

auto eth1
iface eth1 inet static
    address 192.220.15.193
    netmask 255.255.255.192
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.89 2>/dev/null || ip route replace default via 192.220.16.89

echo "Shibuya configured successfully!"
