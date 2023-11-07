import 'package:flutter/material.dart';
import "widgets/card.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Game PakBepe Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: const <Widget>[
                  ItemCard(
                      icon: Icons.remove_red_eye,
                      color: Colors.green,
                      text: "Lihat Produk",
                      message: "Kamu telah menekan tombol Lihat Produk"),
                  ItemCard(
                      icon: Icons.add_box_outlined,
                      color: Colors.blue,
                      text: "Tambah Item",
                      message: "Kamu telah menekan tombol Tambah Item"),
                  ItemCard(
                      icon: Icons.logout,
                      color: Colors.red,
                      text: "Logout",
                      message: "Kamu telah menekan tombol Logout"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
