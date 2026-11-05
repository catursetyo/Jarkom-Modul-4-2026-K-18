#!/bin/bash
# Navi Router Configuration
echo "Configuring Navi..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.66
    netmask 255.255.255.252
    gateway 192.220.16.65

auto eth1
iface eth1 inet static
    address 192.220.12.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 192.220.15.65
    netmask 255.255.255.192

auto eth3
iface eth3 inet static
    address 192.220.13.1
    netmask 255.255.255.0
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.65 2>/dev/null || ip route replace default via 192.220.16.65

echo "Navi configured successfully!"
