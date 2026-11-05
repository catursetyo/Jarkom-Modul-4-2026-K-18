#!/bin/bash
# Copland Router Configuration
echo "Configuring Copland..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.35
    netmask 255.255.255.248
    gateway 192.220.16.33

auto eth1
iface eth1 inet static
    address 192.220.15.1
    netmask 255.255.255.192

auto eth2
iface eth2 inet static
    address 192.220.8.1
    netmask 255.255.254.0
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.33 2>/dev/null || ip route replace default via 192.220.16.33

echo "Copland configured successfully!"
