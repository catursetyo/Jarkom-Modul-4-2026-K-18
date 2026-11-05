#!/bin/sh
# Client Specter Configuration
echo "Configuring Specter..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.14.131
    netmask 255.255.255.128
    gateway 192.220.14.129
EOF

cat <<'EOF' > /etc/resolv.conf
nameserver 192.168.122.1
nameserver 8.8.8.8
EOF

ip route add default via 192.220.14.129 2>/dev/null || ip route replace default via 192.220.14.129

echo "Specter configured with IP 192.220.14.131 successfully!"
