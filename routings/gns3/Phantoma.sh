#!/bin/bash
# Phantoma Router Configuration
echo "Configuring Phantoma..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.86
    netmask 255.255.255.252
    gateway 192.220.16.85

auto eth1
iface eth1 inet static
    address 192.220.16.1
    netmask 255.255.255.224

auto eth2
iface eth2 inet static
    address 192.220.16.89
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.85 2>/dev/null || ip route replace default via 192.220.16.85

# Route deeper towards Shibuya
ip route add 192.220.15.192/26 via 192.220.16.90

echo "Phantoma configured successfully!"
