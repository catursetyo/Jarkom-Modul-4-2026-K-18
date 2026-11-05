#!/bin/bash
# Protocol7 Router Configuration
echo "Configuring Protocol7..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.78
    netmask 255.255.255.252
    gateway 192.220.16.77

auto eth1
iface eth1 inet static
    address 192.220.15.129
    netmask 255.255.255.192

auto eth2
iface eth2 inet static
    address 192.220.16.81
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.77 2>/dev/null || ip route replace default via 192.220.16.77

# Route deeper towards Knights
ip route add 192.220.16.48/29 via 192.220.16.82 # Knights Eiri
ip route add 192.220.16.0/27 via 192.220.16.82   # Phantoma Semi
ip route add 192.220.15.192/26 via 192.220.16.82 # Shibuya Lain Mika
ip route add 192.220.16.84/30 via 192.220.16.82
ip route add 192.220.16.88/30 via 192.220.16.82

echo "Protocol7 configured successfully!"
