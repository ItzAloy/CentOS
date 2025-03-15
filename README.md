# **Panduan Instalasi dan Konfigurasi CentOS**

**Dokumentasi Lengkap Instalasi, Skrip, dan Write-Up untuk Operasi Sistem CentOS**

CentOS adalah salah satu distribusi Linux berbasis Red Hat yang banyak digunakan untuk server karena kestabilan dan keamanan yang tinggi. Panduan ini mencakup langkah-langkah instalasi, penggunaan skrip otomatisasi, serta write-up untuk pengelolaan sistem.

## 📝 **Write-Up untuk Pengelolaan CentOS**

### 1️⃣ **Manajemen Pengguna dan Hak Akses**

- Tambah pengguna baru:
  ```bash
  sudo useradd username  
  sudo passwd username  
  ```
- Tambahkan pengguna ke grup sudo:
  ```bash
  sudo usermod -aG wheel username  
  ```
- Hapus pengguna:
  ```bash
  sudo userdel -r username  
  ```

### 2️⃣ **Manajemen Paket dengan DNF**

- Perbarui sistem: `sudo dnf update -y`
- Instal paket: `sudo dnf install paket -y`
- Hapus paket: `sudo dnf remove paket -y`

### 3️⃣ **Konfigurasi Firewall**

- Tambah layanan: `sudo firewall-cmd --permanent --add-service=http`
- Restart firewall: `sudo firewall-cmd --reload`

### 4️⃣ **Pengelolaan Sistem dan Log**

- Cek status sistem: `systemctl status`
- Lihat log sistem: `journalctl -xe`
- Monitor proses: `top` atau `htop`

## 🛠️ **Kontribusi dan Pengembangan**

Kami menyambut kontribusi dari komunitas! Jika Anda memiliki saran atau ingin menambahkan fitur dalam panduan ini, silakan:

1. Fork repository ini.
2. Buat branch baru untuk perubahan Anda.
3. Ajukan pull request dengan deskripsi perubahan yang Anda lakukan.

## 📜 **Lisensi**

Dokumentasi ini dirilis di bawah lisensi [MIT License](https://opensource.org/licenses/MIT). Anda bebas untuk menggunakan, memodifikasi, dan mendistribusikan ulang dengan syarat yang sesuai.

---

Dengan panduan ini, Anda dapat menginstal dan mengelola sistem operasi CentOS dengan lebih mudah dan efisien. 🚀

