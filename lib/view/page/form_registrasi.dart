import 'dart:typed_data';

import 'package:flutter/material.dart';

class FormRegistrasi extends StatefulWidget {
  @override
  _FormRegistrasiState createState() => _FormRegistrasiState();
}

class _FormRegistrasiState extends State<FormRegistrasi> {
  @override
  String nama = "";

  TextEditingController namaTextEditingController = TextEditingController();
  TextEditingController alamatTextEditingController = TextEditingController();
  TextEditingController keterenganTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    namaTextEditingController.text = "Henry";
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Form Regisrasi"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.yellow,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                // child: TabPageSelector(),
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: namaTextEditingController,
                decoration: InputDecoration(
                  labelText: "NAMA LENGKAP",
                  icon: Icon(Icons.print),
                  contentPadding: EdgeInsets.all(12.0),
                ),
                onChanged: (text) {
                  nama = text;
                  setState(() {});
                },
              ),
            ),
            Container(
              color: Colors.red[100],
              child: Radio(
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "My name is:\n $nama",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.green[100],
                  child: Text("Save"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.red[100],
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
