import "package:flutter/material.dart";
import "package:pbp_django_auth/pbp_django_auth.dart";
import "package:tugas_pbp_flutter/screen/home.dart";
import "package:tugas_pbp_flutter/widgets/left_drawer.dart";
import "package:provider/provider.dart";
import "dart:convert";

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});
  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  int _amount = 0;
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Tambah Item",
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: "Nama Item",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama Item tidak boleh kosong";
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    _name = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: "Deskripsi Item",
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi Item tidak boleh kosong";
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    _description = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: "Jumlah Item",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah Item tidak boleh kosong";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    _amount = int.parse(value!);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: "Harga Item",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga Item tidak boleh kosong";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    _price = int.parse(value!);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode(<String, String>{
                            'name': _name,
                            'price': _price.toString(),
                            'description': _description,
                            'amount': _amount.toString(),
                          }));
                      if (response['status'] == 'success') {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Produk baru berhasil disimpan!"),
                          ));
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage(
                                      title: "Home",
                                    )),
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("Terdapat kesalahan, silakan coba lagi."),
                          ));
                        }
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
