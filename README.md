# Tugas 7
## 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless widget bersifat statis dan tampilanya tidak dapat diubah oleh interaksi pengguna, sedangkan stateful widget bersifat dinamis dan memiliki data yang berubah-ubah dan tampilanya dapat berubah bedasarkan interaksi dari pengguna.

## 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
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

## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- menjalankan perintah ```flutter create tugas_pbp_flutter``` untuk membuat proyek flutter baru
- Menghapus template stateful widget
- Memodifikasi widget MyHomePage pada main.dart
- membuat folder widget untuk menampung semua widget custom baru
- membuat file card.dart untuk membuat custom card
- membuat widget ItemCard dengan icon, tulisan, pesan snackbar, serta warna yang dapat dikostumisasi
- memasukan ItemCard kedalam widget MyHomePage

# Tugas 8
## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

pushReplacement akan menukar alamat/screen pada top of stack, sementara push akan menambahkan screen baru kedalam stack

Contoh penggunaan pushReplacement:
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => SecondRoute()),
);
```

Visualisasi stack
```
[Screen 1] [Screen 2]
```
```
[Screen 1] [Screen 3] <- pushReplacement [Screen 3]
```

Akibat dari penggunaan pushReplacement adalah ketika kita menekan tombol back, maka aplikasi akan langsung keluar, karena screen sebelumnya sudah diganti dengan screen baru.

Contoh penggunaan push:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondRoute()),
);
```

Visualisasi stack
```
[Screen 1] [Screen 2]
```
```
[Screen 1] [Screen 2] [Screen 3] <- push [Screen 3]
```

Akibat dari penggunaan push adalah ketika kita menekan tombol back, maka aplikasi akan kembali ke screen sebelumnya, karena screen sebelumnya masih ada di dalam stack.

## 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- Align: Untuk mengatur posisi widget berdasarkan posisi parent widget
- Center: Untuk mengatur posisi widget ke tengah
- Container: Untuk membungkus suatu widget sehingga dapat diatur posisi dan paddingnya
- Padding: Memberikan padding pada widget
- Column: Menampilkan sekumpulan data dalam sebuah kolom
- GridView: Untuk mengatur posisi beberapa widget secara horizontal, seperti grid system pada CSS
- ListView: Untuk menampilkan sekumpulan data dalam bentuk list
- Row: Menampilkan sekumpulan data dalam sebuah baris

## 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
TextFormField: Untuk membuat input secara umum, hal ini karena TextFormField memiliki fitur validasi input yang lengkap dan mudah digunakan, dan dapat dikostumisasi sesuai kebutuhan tipe inputnya
tipe input yang digunakan adalah TextInputType.number, karena input yang dimasukan adalah angka, ini digunakan untuk memunculkan keyboard khusus angka pada smartphone, digunakan untuk field harga dan jumlah
tipe input multiline digunakan untuk deskripsi, karena deskripsi dapat memiliki lebih dari satu baris

## 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean architecture membagi aplikasi menjadi 3 layer, yaitu presentation, domain, dan data. Layer presentation berisi widget-widget yang berhubungan dengan tampilan aplikasi, layer domain berisi business logic, dan layer data berisi data yang digunakan oleh aplikasi. Layer-layer tersebut saling berhubungan dengan menggunakan repository sebagai penghubungnya.
Domain Layer:
- Repository: Interface yang digunakan untuk menghubungkan layer domain dengan layer data
- Entity: Class yang berisi data yang digunakan oleh aplikasi
- Usecase: Class yang berisi business logic

Data Layer:
- Repository: Class yang mengimplementasikan repository pada layer domain
- Model: Class yang berisi data yang digunakan oleh aplikasi
- Data Source: Class yang berisi data yang digunakan oleh aplikasi
- Mapper: Class yang berfungsi untuk mengubah data dari model ke entity dan sebaliknya

Presentation Layer:
- View: Widget yang berisi tampilan aplikasi
- Presenter: Class yang berisi business logic
- Model: Class yang berisi data yang digunakan oleh aplikasi

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
- Membuat widget Drawer baru
- Memindahkan MyHomeScreen ke folder screen dan file sendiri
- Menambahkan drawer pada MyHomeScreen
- Menambahkan home pada drawer
- Membuat screen untuk menampilkan form
- Menambahkan form pada drawer
- Menambahkan drawer pada screen form
- Menambahkan validasi pada form
- Menambahkan routing pada drawer