import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              accountName: Text(
                "Programmer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "dearprogrammer@etc.com",
                style: TextStyle(fontSize: 16),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/th.jpeg"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.indigo),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/HomePage');
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.person, color: Colors.indigo),
            title: Text(
              "My Account",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Implement navigation for My Account
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.cart_fill, color: Colors.indigo),
            title: Text(
              "My Orders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/cartPage');
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings, color: Colors.indigo),
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Implement navigation for Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.indigo),
            title: Text(
              "Log Out",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}
