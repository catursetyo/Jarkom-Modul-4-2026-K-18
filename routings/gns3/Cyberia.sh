#!/bin/bash
# Cyberia Router Configuration
echo "Configuring Cyberia..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 192.220.14.1
    netmask 255.255.255.128

auto eth2
iface eth2 inet static
    address 192.220.16.57
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1
iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Route to all internal subnets via Wired (eth2)
ip route add 192.220.0.0/19 via 192.220.16.58

echo "Cyberia configured successfully!"
