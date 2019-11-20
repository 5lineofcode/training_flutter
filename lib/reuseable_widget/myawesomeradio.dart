import 'package:flutter/material.dart';

class MyAwesomeRadio extends StatefulWidget {
  final String label;
  MyAwesomeRadio({
    this.label,
  });
  @override
  _MyAwesomeRadioState createState() => _MyAwesomeRadioState();
}

class _MyAwesomeRadioState extends State<MyAwesomeRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("onTap");
      },
      child: Row(
        children: <Widget>[
          Radio(
            value: true,
            groupValue: "",
            onChanged: (value) {},
          ),
          Text(widget.label),
        ],
      ),
    );
  }
}
