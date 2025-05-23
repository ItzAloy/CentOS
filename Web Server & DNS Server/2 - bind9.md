## 2. Instalasi dan Konfigurasi DNS Server

### **2.1 Instalasi Bind (DNS Server)**
Jalankan perintah berikut untuk menginstal paket yang diperlukan:
```sh
yum install nano bind bind-utils -y
```

### **2.2 Mengaktifkan dan Mengecek Status DNS Server**
```sh
systemctl start named
systemctl enable named
systemctl status named
```

### **2.3 Konfigurasi DNS Server**
Cek alamat IP server:
```sh
ip -c a
```

Backup file konfigurasi sebelum mengedit:
```sh
cd /etc
cp named.conf named.conf.backup
```

Edit file konfigurasi utama:
```sh
nano /etc/named.conf
```
Tambahkan atau ubah konfigurasi berikut:
```txt
listen-on port 53 { 127.0.0.1; 192.168.190.131; };
allow-query { localhost; 192.168.56.50; any; };
allow-query-cache { localhost; 192.168.56.50; any; };

zone "your-domain.id" {
    type master;
    file "/etc/named/db.your-domain";
};

zone "100.168.192.in-addr.arpa" IN {
    type master;
    file "/etc/named/db.reverse";
};
```

Masuk ke direktori named:
```sh
cd /etc/named
```

Buat dan edit file zona forward:
```sh
nano db.your-domain
```
Isi dengan konfigurasi berikut:
```txt
$TTL    86400
@       IN      SOA     your-domain.id. root.your-domain.id. (
                2018092501      ; Serial
                3600            ; Refresh
                1800            ; Retry
                604800          ; Expire
                86400           ; Minimum TTL
)

@       IN      NS      your-domain.id.
@       IN      A       your_ip
www     IN      A       your_ip
```

Buat dan edit file zona reverse:
```sh
nano db.reverse
```
Isi dengan konfigurasi berikut:
```txt
$TTL    86400
@       IN      SOA     your-domain.id. root.your-domain.id. (
                2018092501      ; Serial
                3600            ; Refresh
                1800            ; Retry
                604800          ; Expire
                86400           ; Minimum TTL
)

@       IN      NS      your-domain.id.
last-ip IN      PTR     your-domain.id.
```

### **2.4 Konfigurasi Firewall untuk DNS Server**
Izinkan akses DNS melalui firewall:
```sh
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="your_ip.0/24" port protocol="udp" port="53" accept'
firewall-cmd --reload
```

### **2.5 Restart DNS Server dan Flush DNS**
```sh
systemctl restart named
```
Jika websitenya tidak bisa di akses, silahkan untuk flushdns anda lewat powershell dengan command:
```
ipconfig /flushdns
```

