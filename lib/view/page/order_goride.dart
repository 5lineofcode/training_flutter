import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/reuseable_widget/map/map_viewer.dart';

class OrderGoRidePage extends StatefulWidget {
  @override
  _OrderGoRidePageState createState() => _OrderGoRidePageState();
}

class _OrderGoRidePageState extends State<OrderGoRidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.green[100],
              child: Stack(
                children: <Widget>[
                  MapViewer(),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: CircleAvatar(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: CircleAvatar(
                      child: Icon(FontAwesomeIcons.iCursor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Where would you like to go?",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
