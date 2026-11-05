#!/bin/bash
# Knights Router Configuration
echo "Configuring Knights..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.82
    netmask 255.255.255.252
    gateway 192.220.16.81

auto eth1
iface eth1 inet static
    address 192.220.16.49
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.220.16.85
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.81 2>/dev/null || ip route replace default via 192.220.16.81

# Route deeper towards Phantoma
ip route add 192.220.16.0/27 via 192.220.16.86   # Semi
ip route add 192.220.15.192/26 via 192.220.16.86 # Lain Mika
ip route add 192.220.16.88/30 via 192.220.16.86

echo "Knights configured successfully!"
