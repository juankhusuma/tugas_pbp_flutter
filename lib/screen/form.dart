import "package:flutter/material.dart";
import "package:tugas_pbp_flutter/screen/home.dart";
import "package:tugas_pbp_flutter/widgets/left_drawer.dart";

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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Proses Berhasil"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Nama Item: $_name"),
                                      Text("Deskripsi Item: $_description"),
                                      Text("Jumlah Item: $_amount"),
                                      Text("Harga Item: $_price"),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MyHomePage(title: "Home"),
                                        ),
                                      );
                                    },
                                    child: const Text("OK"),
                                  )
                                ],
                              );
                            });
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
