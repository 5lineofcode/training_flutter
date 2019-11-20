import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:training_app/_helper/handle_messaging.dart';

import 'view/page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
