#!/bin/sh
# Client Semi Configuration
echo "Configuring Semi..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.2
    netmask 255.255.255.224
    gateway 192.220.16.1
EOF

cat <<'EOF' > /etc/resolv.conf
nameserver 192.168.122.1
nameserver 8.8.8.8
EOF

ip route add default via 192.220.16.1 2>/dev/null || ip route replace default via 192.220.16.1

echo "Semi configured with IP 192.220.16.2 successfully!"
