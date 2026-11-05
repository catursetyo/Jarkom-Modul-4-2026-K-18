#!/bin/bash
# Tachibana Router Configuration
echo "Configuring Tachibana..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.70
    netmask 255.255.255.252
    gateway 192.220.16.69

auto eth1
iface eth1 inet static
    address 192.220.10.1
    netmask 255.255.254.0

auto eth2
iface eth2 inet static
    address 192.220.16.73
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.69 2>/dev/null || ip route replace default via 192.220.16.69

# Route deeper towards Deus
ip route add 192.220.14.128/25 via 192.220.16.74 # Deus LAN
ip route add 192.220.15.128/26 via 192.220.16.74 # Protocol7 LAN
ip route add 192.220.15.192/26 via 192.220.16.74 # Shibuya Lain Mika
ip route add 192.220.16.0/27 via 192.220.16.74 # Phantoma Semi
ip route add 192.220.16.48/29 via 192.220.16.74 # Knights Eiri
ip route add 192.220.16.76/30 via 192.220.16.74
ip route add 192.220.16.80/28 via 192.220.16.74

echo "Tachibana configured successfully!"
