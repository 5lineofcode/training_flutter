import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool loading = true;
  List settings = [];
  bool isAktifkanBluetooth = false;

  Color color = Colors.red[100];
  Timer timer;

  loadCategories() {
    settings = [
      {
        "label": "Bluetooth",
        "value": false,
      },
      {
        "label": "WIFI",
        "value": false,
      },
      {
        "label": "GPS",
        "value": false,
      },
      {
        "label": "Mungkin",
        "value": false,
      },
      {
        "label": "Flutter",
        "value": false,
      },
      {
        "label": "Git",
        "value": false,
      },
    ];
  }

  loadProducts() {
    settings.addAll([
      {
        "label": "Bluetooth",
        "value": false,
      },
      {
        "label": "WIFI",
        "value": false,
      },
      {
        "label": "GPS",
        "value": false,
      },
      {
        "label": "Mungkin",
        "value": false,
      },
      {
        "label": "Flutter",
        "value": false,
      },
      {
        "label": "Git",
        "value": false,
      },
    ]);
  }

  initData() {
    // Future.delayed(Duration(seconds: 2)).then((value) {});
    loadCategories();
    loadProducts();

    if (this.mounted) {
      loading = false;
      setState(() {});
    }
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Text("Loading..."),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateTime.now().toString(),
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (color == Colors.red[100]) {
                    color = Colors.green[100];
                  } else if (color == Colors.green[100]) {
                    color = Colors.red[100];
                  }
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 200.0,
                height: color == Colors.red[100] ? 200.0 : 300.0,
                color: color,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: settings.length,
                itemBuilder: (context, index) {
                  var setting = settings[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        setting["label"],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Switch(
                        value: setting["value"],
                        onChanged: (checked) {
                          setState(() {
                            setting["value"] = checked;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: <Widget>[
      //     Container(
      //       width: MediaQuery.of(context).size.width,
      //       height: 100.0,
      //       color: Colors.yellow[100],
      //       child: Text("My Stack"),
      //     ),
      //     Expanded(
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         decoration: BoxDecoration(
      //           color: Colors.blue[100],
      //           image: DecorationImage(
      //             image: NetworkImage(
      //               "https://lh3.googleusercontent.com/Wf_JnFVlDngc4Wc3d8uWniXh-g0CQWiMu1TTdbUgcsNR2nSgFKYYBxVvTmUd5sX0P_w",
      //             ),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //         child: Stack(
      //           children: <Widget>[
      //             Opacity(
      //               opacity: 0.2,
      //               child: Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 height: 300.0,
      //                 color: Colors.black,
      //                 child: Column(
      //                   children: <Widget>[
      //                     Container(
      //                       height: 50.0,
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: <Widget>[
      //                           Text("Aktifkan Bluetooth"),
      //                           Checkbox(
      //                             value: true,
      //                             onChanged: (checked) {},
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Align(
      //               alignment: Alignment.bottomRight,
      //               child: Icon(
      //                 FontAwesomeIcons.solidArrowAltCircleUp,
      //                 size: 40.0,
      //                 color: Colors.white,
      //               ),
      //             ),
      //             // Positioned(
      //             //   right: 10,
      //             //   top: 10,
      //             //   child: Container(
      //             //     width: 100.0,
      //             //     height: 100.0,
      //             //     color: Colors.red[100],
      //             //     child: Text("Hello"),
      //             //   ),
      //             // ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
