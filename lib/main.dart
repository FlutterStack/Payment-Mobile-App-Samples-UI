/*
 * I know this is pretty obvious colouring
 * yeah i'm bad at selecting or defining colors, hail! ColorZilla,
 * it helped a lot,
 * Some of it's code can be use as reusable function (some stands for 1-2 widgets)
 * This one without any help of google or Stackoverflow
 * Only googled images, Felling proud gonna reward myself :P
 */
import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.transparent,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeIndex = 0;
  int _totalCards = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 200, 183, 1.0),
              ),
            ),
          ),
          Positioned(
            bottom: 250.0,
            right: -10.0,
            child: Container(
              height: 500.0,
              width: 500.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(250),
                    bottomRight: Radius.circular(250),
                    topLeft: Radius.circular(250),
                    topRight: Radius.circular(250)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(255, 197, 134, 1.0), Color.fromRGBO(255, 197, 134, 1.0), Color.fromRGBO(255, 89, 135, 1.0)],
                  tileMode: TileMode.repeated,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 430.0,
            right: 130.0,
            child: Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(250),
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromRGBO(255, 197, 134, 1.0), Color.fromRGBO(255, 197, 134, 1.0), Color.fromRGBO(255, 89, 135, 0.9)],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.menu, color: Colors.white),
                      Expanded(child: Column()),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/person.jpg'), // Yup this is India's Pm Narendra Modi,
                          radius: 15.0,
                        ),
                        radius: 17.0,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Cards",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Expanded(child: Column()),
                      Text(
                        "Add More +",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, top: 20.0),
                  child: Container(
                    height: 200,
                    child: PageView.builder(
                      onPageChanged: ((_page) {
                        setState(() {
                          _activeIndex = _page;
                        });
                      }),
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: _totalCards,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: creditCardView(),
                        );
                      },
                    ),
                  ),
                ),
                paginator(),
                Padding(
                  padding: EdgeInsets.only(top: 70.0, right: 40.0, left: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "YOUR BALANCE",
                            style: TextStyle(
                              color: Color.fromRGBO(144, 142, 143, 1.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "\$175,900.00",
                            style: TextStyle(color: Color.fromRGBO(254, 110, 148, 1.0), fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "INCOME",
                                style: TextStyle(
                                  color: Color.fromRGBO(144, 142, 143, 1.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "EXPENSE",
                                style: TextStyle(
                                  color: Color.fromRGBO(144, 142, 143, 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "+ \$6,520.00",
                              style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "- \$3,420.00",
                              style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect creditCardView() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(17.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/mastercard.png",
                          height: 40,
                        ),
                        Expanded(child: Column()),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        /**
                         * This card are totally fictional if it matches with yours that's pure coincidence
                         * Resolve it yourself ¯\(°_o)/¯
                         */
                        children: <Widget>[
                          Text("5500", style: TextStyle(color: Colors.white, fontSize: 20)),
                          Expanded(child: Column()),
                          Text("4726", style: TextStyle(color: Colors.white, fontSize: 20)),
                          Expanded(child: Column()),
                          Text("9983", style: TextStyle(color: Colors.white, fontSize: 20)),
                          Expanded(child: Column()),
                          Text("1283", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text("Card Holder", style: TextStyle(color: Colors.white, fontSize: 16)),
                        Expanded(child: Column()),
                        Text("Expires", style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Text("Tom Cruise", style: TextStyle(color: Colors.white, fontSize: 20)),
                          // yeah! I understand there is image of Pm Modi, who cares Tom Cruise might gave him his cards :P
                          Expanded(child: Column()),
                          Text("11/26", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Grammar Nazis.... offended yourself here :P
  Widget paginator() {
    // While writing this i wasn't sure it'll work or not, and here is a secret!!
    // i know 4 ways in which it won't work: inspired From Thomas Alva Edison
    // Ahh... i know that quote is taken from Mr. Edison but I'm sure no one gonna read this comment.
    // If you read this keep it between us ¯\_(ツ)_/¯
    var pager = <Widget>[];
    for (int i = 0; i <= (_totalCards - 1); i++) {
      pager.add(
        Opacity(
          opacity: _getOpacity(i),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(backgroundColor: Colors.white, radius: 5),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: 20.0, left: 40.0),
      child: Row(
        children: pager,
      ),
    );
  }

  double _getOpacity(int i) {
    if (i == _activeIndex) {
      return 1.0;
    }
    return 0.5;
  }
}

/**
 * You made it here!! here are 2 headaches for you!
 * 1) Why GreenLand is called GreenLand even when it don't have Greenery or GreenLantern???
 * 2) How world's first clock know what time is it?
 */
