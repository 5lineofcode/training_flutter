import 'package:flutter/material.dart';

class AwesomeList extends StatefulWidget {
  final List items;
  AwesomeList({
    this.items,
  });
  @override
  _AwesomeListState createState() => _AwesomeListState();
}

class _AwesomeListState extends State<AwesomeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Top picks for you",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 40.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                var item = widget.items[index];
                return Container(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    color: item["is_selected"] ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(
                      width: item["is_selected"] ? 0.0 : 1.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  child: Text(
                    item["label"],
                    style: TextStyle(
                      color:
                          item["is_selected"] ? Colors.white : Colors.grey[800],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
