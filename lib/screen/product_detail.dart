import "package:flutter/material.dart";
import "package:tugas_pbp_flutter/screen/products_list.dart";
import "package:tugas_pbp_flutter/widgets/left_drawer.dart";

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {super.key,
      required this.title,
      required this.name,
      required this.price,
      required this.stock,
      required this.description});
  final String title;
  final String name;
  final int price;
  final int stock;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        title: Text(title),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(name),
              Text("Harga: Rp.$price"),
              Text("Stok: $stock"),
              Text(description),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProductPage();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: const Text("Kembali"))
            ],
          ),
        ),
      ),
    );
  }
}
