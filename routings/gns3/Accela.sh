#!/bin/bash
# Accela Router Configuration
echo "Configuring Accela..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.62
    netmask 255.255.255.252
    gateway 192.220.16.61

auto eth1
iface eth1 inet static
    address 192.220.4.1
    netmask 255.255.252.0
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.61 2>/dev/null || ip route replace default via 192.220.16.61

echo "Accela configured successfully!"
