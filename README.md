# Tugas 7
## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless widget bersifat statis dan tampilanya tidak dapat diubah oleh interaksi pengguna, sedangkan stateful widget bersifat dinamis dan memiliki data yang berubah-ubah dan tampilanya dapat berubah bedasarkan interaksi dari pengguna.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- Material App
Memberikan theming kepada seluruh komponen, sehingga seluruh widget memiliki styling default Material UI

- Scaffold
Sebagai fondasi dasar untuk meletakan widget-widget lain untuk membangun suatu halaman

- Text
Untuk menampilkan sebuah text

- Column
Menampilkan sekumpulan data dalam sebuah kolom

- Center
Mengatur posisi widget ke tengah

- Padding
Memberikan padding pada widget

- Container
Untuk membungkus suatu widget sehingga dapat diatur posisi dan paddingnya

- GridView
Untuk mengatur posisi beberapa widget secara horizontal, seperti grid system pada CSS

- Icon
Untuk menampilkan icon

##  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- menjalankan perintah ```flutter create tugas_pbp_flutter``` untuk membuat proyek flutter baru
- Menghapus template stateful widget
- Memodifikasi widget MyHomePage pada main.dart
- membuat folder widget untuk menampung semua widget custom baru
- membuat file card.dart untuk membuat custom card
- membuat widget ItemCard dengan icon, tulisan, pesan snackbar, serta warna yang dapat dikostumisasi
- memasukan ItemCard kedalam widget MyHomePage