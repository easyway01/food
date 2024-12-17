import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';
import 'Pages/ItemPage.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String routeHomePage = "/";
  static const String routeCartPage = "cartPage";
  static const String routeItemPage = "itemPage";

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F3),
      ),
      routes: {
        routeHomePage: (context) => HomePage(),
        routeItemPage: (context) => ItemPage(),
      },
      // Handle undefined routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("Page Not Found"),
            ),
            body: Center(
              child: Text(
                "Oops! This page does not exist.",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      },
    );
  }
}
