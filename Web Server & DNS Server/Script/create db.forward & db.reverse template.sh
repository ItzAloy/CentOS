#!/bin/bash

# Meminta input dari pengguna
read -p "Masukkan nama domain (contoh: aloyserver.id): " DOMAIN
read -p "Masukkan alamat IP (contoh: 10.10.10.2): " IP

# Mendapatkan bagian terakhir dari IP untuk PTR record
IFS='.' read -r -a IP_ARRAY <<< "$IP"
LAST_OCTET=${IP_ARRAY[3]}
REVERSE_ZONE="${IP_ARRAY[2]}.${IP_ARRAY[1]}.${IP_ARRAY[0]}.in-addr.arpa"

# Direktori tempat menyimpan file konfigurasi
DNS_DIR="/etc/named/"

# Membuat file db.forward
FORWARD_FILE="$DNS_DIR/db.forward"
echo "\$TTL 86400" > $FORWARD_FILE
echo "@       IN      SOA     $DOMAIN. root.$DOMAIN. (" >> $FORWARD_FILE
echo "                2025031501      ; Serial" >> $FORWARD_FILE
echo "                3600            ; Refresh" >> $FORWARD_FILE
echo "                1800            ; Retry" >> $FORWARD_FILE
echo "                604800          ; Expire" >> $FORWARD_FILE
echo "                86400           ; Minimum TTL" >> $FORWARD_FILE
echo ")" >> $FORWARD_FILE
echo "" >> $FORWARD_FILE
echo "@       IN      NS      $DOMAIN." >> $FORWARD_FILE
echo "@       IN      A       $IP" >> $FORWARD_FILE
echo "www     IN      A       $IP" >> $FORWARD_FILE
echo "File db.forward telah dibuat di $FORWARD_FILE"

# Membuat file db.reverse
REVERSE_FILE="$DNS_DIR/db.reverse"
echo "\$TTL 86400" > $REVERSE_FILE
echo "@       IN      SOA     $DOMAIN. root.$DOMAIN. (" >> $REVERSE_FILE
echo "                2025031501      ; Serial" >> $REVERSE_FILE
echo "                3600            ; Refresh" >> $REVERSE_FILE
echo "                1800            ; Retry" >> $REVERSE_FILE
echo "                604800          ; Expire" >> $REVERSE_FILE
echo "                86400           ; Minimum TTL" >> $REVERSE_FILE
echo ")" >> $REVERSE_FILE
echo "" >> $REVERSE_FILE
echo "@       IN      NS      $DOMAIN." >> $REVERSE_FILE
echo "$LAST_OCTET       IN      PTR     $DOMAIN." >> $REVERSE_FILE
echo "File db.reverse telah dibuat di $REVERSE_FILE"
