import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/_helper/page.dart';
import 'package:training_app/reuseable_widget/awesome_list/awesome_list.dart';
import 'package:training_app/reuseable_widget/map/map_viewer.dart';
import 'package:training_app/view/page/order_goride.dart';

class GojekPage extends StatefulWidget {
  @override
  _GojekPageState createState() => _GojekPageState();
}

class _GojekPageState extends State<GojekPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getMenuIcon({
      IconData icon,
      String text,
      Color color: Colors.white,
      Color textColor: Colors.white,
      dynamic onTap,
    }) {
      return Expanded(
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: color,
                    size: 42.0,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    getAppBarContent() {
      return Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                ),
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[400],
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Where do you want to go?",
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      top: 10.0,
                    ),
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey[400],
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FontAwesomeIcons.seedling,
                            color: Colors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Promos",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 10.0,
                      child: Text(
                        "6",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    getGopayCard() {
      return Container(
        height: 120.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 40.0,
              decoration: BoxDecoration(
                // color: Colors.red,
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.indigo[800],
                    Colors.indigo[700],
                    Colors.indigo[600],
                    Colors.indigo[400],
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  Text(
                    "Gopay",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Rp546.210",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    getMenuIcon(
                      icon: Icons.account_balance_wallet,
                      text: "Pay",
                    ),
                    getMenuIcon(
                      icon: Icons.pause_circle_outline,
                      text: "Promo",
                    ),
                    getMenuIcon(
                      icon: FontAwesomeIcons.plusSquare,
                      text: "Topup",
                    ),
                    getMenuIcon(
                      icon: Icons.more,
                      text: "More",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    getMenu() {
      return Container(
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        height: 180.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    getMenuIcon(
                      icon: Icons.account_balance_wallet,
                      text: "GoRide",
                      color: Colors.green,
                      textColor: Colors.grey[800],
                      onTap: () {
                        Page.show(context, OrderGoRidePage());
                      },
                    ),
                    getMenuIcon(
                      icon: FontAwesomeIcons.car,
                      text: "GoCar",
                      color: Colors.green,
                      textColor: Colors.grey[800],
                      onTap: () {},
                    ),
                    getMenuIcon(
                      icon: FontAwesomeIcons.utensilSpoon,
                      text: "GoFood",
                      color: Colors.red,
                      textColor: Colors.grey[800],
                    ),
                    getMenuIcon(
                      icon: FontAwesomeIcons.taxi,
                      text: "BlueBird",
                      color: Colors.blue,
                      textColor: Colors.grey[800],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    getMenuIcon(
                      icon: FontAwesomeIcons.box,
                      text: "GoSend",
                      color: Colors.green,
                      textColor: Colors.grey[800],
                    ),
                    getMenuIcon(
                      icon: Icons.phone_iphone,
                      text: "GoPulsa",
                      color: Colors.green,
                      textColor: Colors.grey[800],
                    ),
                    getMenuIcon(
                      icon: FontAwesomeIcons.trophy,
                      text: "GoPoints",
                      color: Colors.red,
                      textColor: Colors.grey[800],
                    ),
                    getMenuIcon(
                      icon: FontAwesomeIcons.chevronCircleDown,
                      text: "MOre",
                      color: Colors.blue,
                      textColor: Colors.grey[800],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    List topPickItems = [
      {
        "label": "All",
        "is_selected": true,
      },
      {
        "label": "Promos",
        "is_selected": false,
      },
      {
        "label": "Transport",
        "is_selected": false,
      },
      {
        "label": "Food",
        "is_selected": false,
      },
      {
        "label": "Payments",
        "is_selected": false,
      },
      {
        "label": "Life",
        "is_selected": false,
      },
      {
        "label": "Technology",
        "is_selected": false,
      },
      {
        "label": "Other",
        "is_selected": false,
      },
    ];

    getTopPicks() {
      return AwesomeList(
        items: topPickItems,
      );
    }

    getBestPickImages() {
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          FontAwesomeIcons.utensilSpoon,
                          size: 16.0,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "Go Food",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Best Picks in Town",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 140.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topPickItems.length,
                itemBuilder: (context, index) {
                  var item = topPickItems[index];
                  return Container(
                    width: 140.0,
                    height: 120.0,
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    margin: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(
                        width: item["is_selected"] ? 0.0 : 1.0,
                        color: Colors.grey[400],
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://awsimages.detik.net.id/community/media/visual/2018/04/05/1dfe9453-bde0-4ed3-be5b-de7981d15392.jpeg",
                        ),
                        fit: BoxFit.cover,
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: getAppBarContent(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              getGopayCard(),
              getMenu(),
              getTopPicks(),
              getBestPickImages(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: Colors.green,
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.green,
        ),
        unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidListAlt),
            title: Text('Orders'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            title: Text('Account'),
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (selectedIndex) {},
      ),
    );
  }
}
