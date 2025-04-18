**Ownix Chain Whitepaper**

---

## Pendahuluan

Ownix Chain adalah blockchain inovatif yang memperkenalkan algoritma konsensus baru bernama **Proof of Data Usage (PoDU)**. PoDU memungkinkan partisipasi dalam konsensus jaringan berdasarkan penggunaan data internet, membuka peluang baru untuk inklusivitas dan distribusi koin secara adil tanpa memerlukan perangkat keras mahal atau proses teknis yang rumit.

## Visi dan Misi

- **Visi:** Menjadi jaringan blockchain pertama yang memberikan insentif berdasarkan penggunaan internet sehari-hari.
- **Misi:** Memberdayakan pengguna digital dengan reward transparan dan adil atas kontribusi data yang mereka gunakan.

## Arsitektur Jaringan

Ownix Chain dibangun di atas ekosistem **TON (The Open Network)** dan memiliki chain tersendiri (Layer 1 Hybrid). Ini memberikan fleksibilitas tinggi dan skalabilitas, serta memungkinkan interoperabilitas melalui TON.

- Kompatibel dengan wallet **TON Wallet** untuk pengalaman pengguna yang mudah.
- Menggunakan **TON** untuk komunikasi data cepat dan efisien.
- Block Explorer memanfaatkan **TON Scan** dan dashboard internal untuk statistik PoDU.

## Algoritma Konsensus: Proof of Data Usage (PoDU)

PoDU adalah algoritma konsensus yang mengukur dan memberi reward berdasarkan jumlah kuota internet yang digunakan oleh perangkat pengguna.

### Nama Algoritma: **DURA (Data Usage Reward Algorithm)**

### Mekanisme Kerja:

1. Pengguna menginstal aplikasi **TON Wallet**.
2. Pengguna melakukan generate wallet address untuk jaringan Ownix melalui TON Wallet.
3. Setelah wallet dibuat, sistem PoDU aktif secara otomatis — tidak perlu mengunduh atau menjalankan aplikasi tambahan.
4. Penggunaan data internet (total kuota) dicatat oleh sistem lokal secara anonim.
5. Data ini kemudian dienkripsi dan dikirim ke jaringan Ownix untuk diproses.
6. Algoritma DURA menghitung reward berdasarkan total data yang digunakan.
7. Reward dikirim otomatis ke alamat wallet pengguna secara berkala.

## Tokenomics

- **Nama Coin:** OWNIX (native coin dari Ownix Chain)
- **Total Suplai:** 8.000.000.000 OWNIX

### Distribusi Coin:

- **80%** untuk reward PoDU (didistribusikan selama 5 tahun)
- **20%** untuk pemilik (owner), tersedia untuk dibeli melalui **TON Wallet**, yang terdiri dari:
  - **10%** untuk tim pengembang
  - **5%** untuk cadangan ekosistem dan komunitas
  - **5%** untuk operasional dan pemasaran awal

## Wallet dan Akses

- Pengguna menggunakan **TON Wallet** untuk mengakses Ownix Chain.
- Wallet ini digunakan untuk menerima reward PoDU dan bertransaksi di jaringan Ownix.
- Setelah generate wallet address, sistem mining PoDU berjalan otomatis tanpa aplikasi tambahan.

## Block Explorer

- Ownix Chain menggunakan **TON Scan** untuk transparansi transaksi.
- Juga tersedia block explorer internal untuk melacak statistik PoDU dan aktivitas node.

## Proses Pengguna

1. Unduh dan instal aplikasi **TON Wallet**.
2. Generate alamat wallet Ownix melalui jaringan TON.
3. Sistem PoDU otomatis aktif dan mulai merekam penggunaan data.
4. Reward dikirim otomatis ke wallet sesuai dengan jumlah data yang digunakan.

## Keamanan dan Privasi

- Data penggunaan hanya direkam dalam bentuk **total kuota** yang digunakan.
- Informasi detail seperti nama aplikasi, domain, atau aktivitas spesifik **tidak direkam atau dipublikasikan**.
- Semua data **dienkripsi** secara lokal sebelum dikirim ke jaringan untuk dihitung dengan DURA.

## Diagram Arsitektur

```
+-------------+        +----------------+        +------------------+
| Pengguna    |<-----> |  TON Wallet    |<-----> | Ownix Chain Node |
+-------------+        +----------------+        +------------------+
                              |                          |
                              |                          |
                         +---------+              +----------------+
                         | DURA    |<-------------| Data Enkripsi  |
                         +---------+              +----------------+
```

## Roadmap (Ringkasan)

- **Q2 2025**: Peluncuran jaringan Ownix Testnet
- **Q3 2025**: Integrasi penuh dengan TON Wallet
- **Q4 2025**: Launch Mainnet + Distribusi Awal Token
- **2026 - 2030**: Distribusi reward PoDU berlangsung (80% dari total suplai)

## Penutup

Ownix Chain merevolusi cara kita melihat blockchain dengan membayar pengguna atas konektivitas mereka, bukan hanya kekuatan komputasi. Dengan fokus pada privasi, efisiensi, dan inklusivitas, Ownix menciptakan masa depan baru untuk web3 melalui kekuatan TON.

---

**Repositori Resmi:** [https://github.com/felelau/Ownix_WalletWeb3](https://github.com/felelau/Ownix_WalletWeb3)

**Website:** [https://ton.org](https://ton.org)

**Lisensi:** MIT
