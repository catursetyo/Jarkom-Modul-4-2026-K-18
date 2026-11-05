#!/bin/sh
# Client Taro Configuration
echo "Configuring Taro..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.15.66
    netmask 255.255.255.192
    gateway 192.220.15.65
EOF

cat <<'EOF' > /etc/resolv.conf
nameserver 192.168.122.1
nameserver 8.8.8.8
EOF

ip route add default via 192.220.15.65 2>/dev/null || ip route replace default via 192.220.15.65

echo "Taro configured with IP 192.220.15.66 successfully!"
