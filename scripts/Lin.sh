#!/bin/sh
# Client Lin Configuration
echo "Configuring Lin..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.0.3
    netmask 255.255.252.0
    gateway 192.220.0.1
EOF

cat <<'EOF' > /etc/resolv.conf
nameserver 192.168.122.1
nameserver 8.8.8.8
EOF

ip route add default via 192.220.0.1 2>/dev/null || ip route replace default via 192.220.0.1

echo "Lin configured with IP 192.220.0.3 successfully!"
