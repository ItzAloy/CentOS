# Panduan Instalasi dan Konfigurasi Web Server & DNS Server

## 1. Instalasi dan Konfigurasi Web Server (Apache)

### **1.1 Instalasi Apache**
Jalankan perintah berikut untuk menginstal dan mengaktifkan layanan Apache:
```sh
yum install httpd -y
systemctl start httpd
systemctl enable httpd
systemctl status httpd
```

### **1.2 Konfigurasi Firewall**
Izinkan akses HTTP dan HTTPS melalui firewall:
```sh
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --zone=public --permanent --add-port=80/tcp
firewall-cmd --reload
```
