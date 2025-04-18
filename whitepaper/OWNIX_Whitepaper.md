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

**Repositori Resmi:** https://github.com/felelau/Ownix-Chain.git

**Website:** [https://ton.org](https://ton.org)

**Lisensi:** MIT



# Ownix Chain - Roadmap

---

## Fase 1: Launch PoDU Murni di Ownix Chain / TON (Q2 2025 - Q3 2025)

### Tujuan:
- Membangun ekosistem awal untuk **PoDU (Proof of Data Usage)**.
- Menciptakan utilitas dan meningkatkan adopsi dengan **reward system** berbasis data usage.

### Langkah-langkah:
1. **PoDU Core Smart Contract**:
   - **Penghitungan Data**: Membuat smart contract yang menghitung **total data yang digunakan** dan memberikan reward setelah mencapai **1GB**.
   - **Distribusi Reward**: Reward PoDU akan diberikan dalam bentuk **OWNIX token**. (1 GB = 1 OWNIX)
   - **Keamanan Data**: Semua data pengguna terenkripsi menggunakan **AES** atau algoritma kuat lainnya untuk memastikan **privasi**.
2. **TON Wallet Integration**:
   - Pengguna akan menggunakan **TON Wallet** untuk meng-generate address dan menyimpan reward.
3. **Komunitas Awal**:
   - Peluncuran airdrop untuk early users.
   - Kampanye edukasi dan sosial media.

---

## Fase 2: Tambah GameFi sebagai Layer di Atas PoDU (Q4 2025 - Q1 2026)

### Tujuan:
- Menambah cara mining melalui **game interaktif dan hiburan**.
- Menggabungkan aktivitas data usage dengan interaksi game untuk reward ekstra.

### Langkah-langkah:
1. **Mini Game Integration**:
   - Buat mini game on-chain menggunakan fitur TON mini-apps.
   - Reward game berdasarkan aktivitas bermain dan data usage.
2. **NFT Karakter dan Item**:
   - Perkenalkan NFT untuk karakter, skin, atau equipment yang bisa ditingkatkan berdasarkan data usage.
3. **Leaderboard dan Turnamen**:
   - Pengguna bersaing secara global untuk reward mingguan.

---

## Fase 3: Marketplace + NFT + Komunitas Creator (2026 - 2027)

### Tujuan:
- Membuka ruang monetisasi baru melalui **NFT, marketplace, dan ekosistem creator**.

### Langkah-langkah:
1. **Marketplace Terdesentralisasi**:
   - Jual beli NFT dan item game dengan OWNIX di dalam marketplace.
2. **Creator Tools**:
   - Alat untuk kreator membuat konten, karakter NFT, dan menjualnya ke pengguna lain.
3. **Komunitas DAO**:
   - Bentuk komunitas governance untuk pengambilan keputusan di Ownix Chain.

---

## Visi Akhir

Ownix Chain akan tumbuh dari proyek reward internet data menjadi **ekosistem Web3 penuh** dengan:
- PoDU
- GameFi
- NFT
- Creator Economy

Semuanya dibangun di atas TON dengan pendekatan **cepat, ringan, dan mobile-first**.

---

**Website:** [https://ton.org](https://ton.org)  

