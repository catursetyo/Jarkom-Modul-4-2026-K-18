#!/bin/bash
# Wired Router Configuration
echo "Configuring Wired..."

cat <<'EOF' > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.220.16.58
    netmask 255.255.255.252
    gateway 192.220.16.57

auto eth1
iface eth1 inet static
    address 192.220.16.33
    netmask 255.255.255.248

auto eth2
iface eth2 inet static
    address 192.220.16.65
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 192.220.16.69
    netmask 255.255.255.252
EOF

sysctl -w net.ipv4.ip_forward=1

# Default Route towards Cyberia
ip route add default via 192.220.16.57 2>/dev/null || ip route replace default via 192.220.16.57

# Routes to Psyche, Copland, Schumann via Switch2 (eth1)
ip route add 192.220.0.0/22 via 192.220.16.34 # Psyche LAN (Karl, Lin)
ip route add 192.220.8.0/23 via 192.220.16.35 # Copland Masayuki
ip route add 192.220.15.0/26 via 192.220.16.35 # Copland Juri
ip route add 192.220.4.0/22 via 192.220.16.36 # Schumann > Accela LAN
ip route add 192.220.16.40/29 via 192.220.16.36 # Schumann Akashic
ip route add 192.220.16.60/30 via 192.220.16.36 # Schumann > Accela P2P

# Routes to Navi branches via Navi (eth2)
ip route add 192.220.12.0/24 via 192.220.16.66 # Alice, Reika
ip route add 192.220.13.0/24 via 192.220.16.66 # Yasuo, Miho, Kuma
ip route add 192.220.15.64/26 via 192.220.16.66 # Taro

# Routes to Tachibana and deeper via Tachibana (eth3)
ip route add 192.220.10.0/23 via 192.220.16.70 # Tachibana LAN
ip route add 192.220.14.128/25 via 192.220.16.70 # Deus LAN
ip route add 192.220.15.128/26 via 192.220.16.70 # Protocol7 LAN
ip route add 192.220.15.192/26 via 192.220.16.70 # Shibuya Lain Mika
ip route add 192.220.16.0/27 via 192.220.16.70 # Phantoma Semi
ip route add 192.220.16.48/29 via 192.220.16.70 # Knights Eiri
ip route add 192.220.16.72/29 via 192.220.16.70 # P2P links behind Tachibana
ip route add 192.220.16.80/28 via 192.220.16.70 # P2P links behind Protocol7

echo "Wired configured successfully!"
