#!/bin/bash
# Deus Router Configuration
echo "Configuring Deus..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.74
    netmask 255.255.255.252
    gateway 192.220.16.73

auto eth1
iface eth1 inet static
    address 192.220.14.129
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.220.16.77
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.73 2>/dev/null || ip route replace default via 192.220.16.73

# Route deeper towards Protocol7
ip route add 192.220.15.128/26 via 192.220.16.78
ip route add 192.220.15.192/26 via 192.220.16.78
ip route add 192.220.16.0/27 via 192.220.16.78
ip route add 192.220.16.48/29 via 192.220.16.78
ip route add 192.220.16.80/28 via 192.220.16.78

echo "Deus configured successfully!"
