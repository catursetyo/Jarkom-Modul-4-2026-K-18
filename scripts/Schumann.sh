#!/bin/bash
# Schumann Router Configuration
echo "Configuring Schumann..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.36
    netmask 255.255.255.248
    gateway 192.220.16.33

auto eth1
iface eth1 inet static
    address 192.220.16.41
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.220.16.61
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1
ip route add default via 192.220.16.33 2>/dev/null || ip route replace default via 192.220.16.33

# Route to Accela LAN via Accela
ip route add 192.220.4.0/22 via 192.220.16.62

echo "Schumann configured successfully!"
