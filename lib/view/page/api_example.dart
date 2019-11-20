import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:overlay_support/overlay_support.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:training_app/_helper/local_storage.dart';
import 'package:training_app/model/post.dart';

class ApiExamplePage extends StatefulWidget {
  @override
  _ApiExamplePageState createState() => _ApiExamplePageState();
}

class _ApiExamplePageState extends State<ApiExamplePage> {
  List items = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void showAlert() async {
    LocalStorage.save("username", "Deniansyah");
    var username = await LocalStorage.load("username");

    // toast("Hello World");
    // showSimpleNotification(
    //   Container(
    //     child: Text("Hello"),
    //   ),
    //   contentPadding: EdgeInsets.all(0.0),
    //   background: Colors.red[100],
    // );

    // Alert(
    //   context: context,
    //   type: AlertType.warning,
    //   title: "RFLUTTER ALERT",
    //   desc: "Flutter is more awesome with RFlutter Alert.",
    //   style: AlertStyle(
    //     animationType: AnimationType.fromTop,
    //   ),
    //   buttons: [
    //     DialogButton(
    //       child: Text(
    //         "COOL",
    //         style: TextStyle(color: Colors.white, fontSize: 20),
    //       ),
    //       onPressed: () => Navigator.pop(context),
    //       width: 120,
    //     )
    //   ],
    // ).show();

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text('Material Dialog'),
    //       content: Text('This is the content of the material dialog'),
    //       actions: <Widget>[
    //         FlatButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: Text('Close'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  loadData() async {
    var url = "https://jsonplaceholder.typicode.com/todos";
    var response = await http.get(url);

    items = json.decode(response.body);
    // items.forEach((item) {
    //   Post post = Post.fromJson(item);
    // });

    setState(() {});
  }

  createData() async {
    var url = "https://jsonplaceholder.typicode.com/todos";
    var response = await http.post(url, body: {
      "userId": 202,
      "id": 2,
      "title": "delectus aut autem",
      "completed": false
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Example"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // createData();
          showAlert();
        },
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CircularProgressIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: () {},
        onLoading: () {},
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            var item = items[index];
            Post post = Post.fromJson(item);
            
            return Card(
              child: ListTile(
                title: Text(post.title),
                subtitle: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: Switch(
                        value: post.completed,
                        onChanged: (checked) {},
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
