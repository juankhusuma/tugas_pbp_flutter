import "package:flutter/material.dart";
import "package:tugas_pbp_flutter/screen/product_detail.dart";

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.stock,
      required this.description});
  final String name;
  final int price;
  final int stock;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return ProductDetail(
              title: name,
              name: name,
              price: price,
              stock: stock,
              description: description);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Rp. $price",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Stock: $stock",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
