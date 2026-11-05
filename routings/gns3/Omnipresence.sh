#!/bin/sh
# Client Omnipresence Configuration
echo "Configuring Omnipresence..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.4.2
    netmask 255.255.252.0
    gateway 192.220.4.1
EOF

cat <<'EOF' > /etc/resolv.conf
nameserver 192.168.122.1
nameserver 8.8.8.8
EOF

ip route add default via 192.220.4.1 2>/dev/null || ip route replace default via 192.220.4.1

echo "Omnipresence configured with IP 192.220.4.2 successfully!"
