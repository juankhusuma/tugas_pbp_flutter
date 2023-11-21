import "package:flutter/material.dart";
import 'package:tugas_pbp_flutter/model/product.dart';
import 'package:tugas_pbp_flutter/widgets/left_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tugas_pbp_flutter/widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('http://localhost:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
          future: fetchProduct(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Column(
                  children: [
                    Text(
                      "Tidak ada data produk.",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    child: ProductCard(
                      name: snapshot.data![index].fields.name,
                      description: snapshot.data![index].fields.description,
                      price: snapshot.data![index].fields.price,
                      stock: snapshot.data![index].fields.amount,
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}
