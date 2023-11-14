import "package:flutter/material.dart";
import "package:tugas_pbp_flutter/screen/form.dart";
import "package:tugas_pbp_flutter/screen/home.dart";

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Drawer Header',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(title: "Home")));
            },
          ),
          ListTile(
            title: const Text('Tambah Item'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ItemForm()));
            },
          )
        ],
      ),
    );
  }
}
