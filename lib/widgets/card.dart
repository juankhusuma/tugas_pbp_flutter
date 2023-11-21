import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:tugas_pbp_flutter/screen/form.dart';
import 'package:tugas_pbp_flutter/screen/login.dart';
import 'package:tugas_pbp_flutter/screen/products_list.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.message,
      required this.color});
  final IconData icon;
  final String text;
  final String message;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: color,
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(message)),
            );
          if (text == "Lihat Produk") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductPage(),
              ),
            );
          } else if (text == "Tambah Item") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ItemForm(),
              ),
            );
          } else if (text == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(3),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
