import 'dart:math';
import 'package:createuser/components/side_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

 
  @override
  State<HomePage> createState() => _HomePageState();
}


//asdfasdf

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _quarterWidth = _deviceWidth / 3;

    double _deviceHeight = MediaQuery.of(context).size.height;
    double _quarterHeight = _deviceHeight / 7;

    return Scaffold(
      
      drawer: NavDrawer(),
      backgroundColor: Color(0xff21254A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        actions: [
          Text(
            "LOGOUT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, "/loginPage"),
              icon: Icon(
                Icons.logout_outlined,
                size: 25,
                color: Colors.white70,
              ),
            ),
          ),
        ],
        title: Text(
          "ANASAYFA",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white70),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    movietypes(_deviceWidth, _deviceHeight, "RECENTLY PLAYED"),
                    SizedBox(height: 20),
                    movietypes(_deviceWidth, _deviceHeight, "ACTİON FİLMS"),
                    SizedBox(height: 20),
                    movietypes(_deviceWidth, _deviceHeight, "DRAMA FİLMS"),
                    SizedBox(height: 20),
                    movietypes(_deviceWidth, _deviceHeight, "HORROR FİLMS"),
                    SizedBox(height: 20),
                    movietypes(_deviceWidth, _deviceHeight, "WAR FİLMS")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container movietypes(
      double _deviceWidth, double _deviceHeight, String moviename) {
    return Container(
      color: Colors.blueGrey[500],
      // ignore: sort_child_properties_last
      child: Column(
        children: [
          Column(
            children: [
              Text(
                moviename,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey[900],
                ),
              ),
              Divider(
                thickness: 1,
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      defaultmoviecontainer(),
                      SizedBox(width: 10),
                      defaultmoviecontainer(),
                      SizedBox(width: 10),
                      defaultmoviecontainer(),
                      SizedBox(width: 10),
                      defaultmoviecontainer(),
                      SizedBox(width: 10),
                      defaultmoviecontainer(),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      width: _deviceWidth - 70,
      height: _deviceHeight / 3.5,
    );
  }

  Container defaultmoviecontainer() {
    return Container(
      width: 120,
      height: 170,
      color: Colors.blueGrey[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("movie image"),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 40,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
            ),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
