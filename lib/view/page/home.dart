import 'package:flutter/material.dart';
import 'package:training_app/_helper/handle_messaging.dart';
import 'package:training_app/_helper/page.dart';
import 'package:training_app/config/style.dart';
import 'package:training_app/reuseable_widget/myawesomeradio.dart';
import 'package:training_app/view/page/api_example.dart';
import 'package:training_app/view/page/firebase_example.dart';
import 'package:training_app/view/page/form_registrasi.dart';
import 'package:training_app/view/page/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List employeeList = [
    {
      "nama": "Budi",
      "umur": 25,
    },
    {
      "nama": "Henry",
      "umur": 44,
    },
    {
      "nama": "Harry",
      "umur": 21,
    },
    {
      "nama": "Septian",
      "umur": 30,
    }
  ];

  loadData() {
    setState(() {});
  }

  initSetup() async {
    await HandleMessaging.requestPermissionAndInit();
    await HandleMessaging.firebaseSignInAndGetFcmToken();
  }

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    getColorByStatus(employee) {
      if (employee["nama"] == "Henry") {
        return Colors.blue[100];
      }
      return employee["umur"] < 30 ? Colors.red[100] : Colors.pink[100];
    }

    getListView() {
      return Container(
        padding: EdgeInsets.all(10.0),
        height: 600.0,
        color: Colors.grey[200],
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: employeeList.length,
          itemBuilder: (context, index) {
            var employee = employeeList[index];

            if (employee["nama"] == "Henry") {
              return Container(
                // width: 250.0,
                child: Card(
                  color: getColorByStatus(employee),
                  child: ListTile(
                    title: Text(employee["nama"]),
                    subtitle: Text((employee["umur"] ?? "-").toString()),
                  ),
                ),
              );
            } else {
              return Container(
                // width: 250.0,
                child: Card(
                  color: getColorByStatus(employee),
                  child: ListTile(
                    title: Text(employee["nama"]),
                    subtitle: Text((employee["umur"] ?? "-").toString()),
                  ),
                ),
              );
            }
          },
        ),
      );
    }

    var children2 = <Widget>[
      Container(
        color: Colors.white,
        child: TextField(),
      ),
      MyAwesomeRadio(
        label: "PAJAK",
      ),
      Row(
        children: <Widget>[
          Radio(
            value: true,
            onChanged: (value) {},
          ),
          Text("BPJS"),
        ],
      ),
      Checkbox(
        value: true,
        onChanged: (value) {},
      ),
      RaisedButton(
        child: Text("Ok"),
        onPressed: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.yellow,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    loadData();
                  },
                  child: Text("Load Data"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => FormRegistrasi(),
                      ),
                    );

                    // Page.show(context, FormRegistrasi());
                  },
                  child: Text("Open Form"),
                ),
                RaisedButton(
                  onPressed: () {
                    Page.show(context, SettingsPage());
                  },
                  child: Text("Open Setting"),
                ),
                RaisedButton(
                  onPressed: () {
                    Page.show(context, ApiExamplePage());
                  },
                  child: Text("Api Example"),
                ),
                RaisedButton(
                  onPressed: () {
                    Page.show(context, FirebaseExamplePage());
                  },
                  child: Text("Firebase Example"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Show Notification"),
                ),
                getListView(),
                Row(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 70.0,
                      color: Color.fromRGBO(
                        255,
                        100,
                        100,
                        0.5,
                      ),
                    ),
                    Container(
                      width: mediaQuery.size.width / 2,
                      height: 70.0,
                      color: Color(0xffd0d0d0),
                    ),
                    Container(
                      width: 50.0,
                      height: 70.0,
                      color: Colors.blue,
                    ),
                    Expanded(
                      child: Container(
                        width: 50.0,
                        height: 70.0,
                        color: Colors.purple[900],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: mediaQuery.size.width,
                  height: 250.0,
                  color: Colors.green,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: AppConfig.smallPadding,
                          ),
                          width: 150.0,
                          height: 170.0,
                          color: Colors.blue,
                          child: Text(
                            "Hello",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQuery.size.width / 2,
                        height: 70.0,
                        color: Color(0xffd0d0d0),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 10,
                        child: Container(
                          width: 50.0,
                          height: 70.0,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: mediaQuery.size.width,
                  height: 250.0,
                  child: Column(
                    children: children2,
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        color: Colors.red,
      ),
    );
  }

  getMethodBaru() {}
}
