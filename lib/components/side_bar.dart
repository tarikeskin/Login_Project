// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 0, 53, 54),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 20.0),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Moviby",
                  style: TextStyle(
                      color: Colors.white38,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
            ),
            SizedBox(height: 20),
            defaultListTile(
              "Account info",
              Icon(
                Icons.home_outlined,
                size: 35,
                color: Colors.white38,
              ),
            ),
            Divider(
              color: Colors.white38,
              thickness: 0.5,
            ),
            defaultListTile(
              "Liked movies",
              Icon(
                Icons.favorite_outline,
                size: 35,
                color: Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile defaultListTile(String message, Icon icon) {
    return ListTile(
      leading: icon,
      title: Text(
        message,
        style: TextStyle(
            color: Colors.white38, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
