import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseExamplePage extends StatefulWidget {
  @override
  _FirebaseExamplePageState createState() => _FirebaseExamplePageState();
}

class _FirebaseExamplePageState extends State<FirebaseExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Example"),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Firestore.instance.collection('books').document().setData({
                'title': 'Konimex History',
                'author': "User ${Random().nextInt(1000)}",
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              return ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  return ListTile(
                    title: Text(document['title']),
                    subtitle: Text(document['author']),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
