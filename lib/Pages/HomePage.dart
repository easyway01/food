import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/CategoriesWidget.dart';
import '../Widgets/DrawerWidget.dart';
import '../Widgets/NewestItemsWidget.dart';
import '../Widgets/PopularItemsWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70), // Adjust height for the search bar
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.search,
                          color: Colors.red,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "What would you like to have?",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add some space between the search bar and the filter icon
                Icon(
                  Icons.filter_list,
                  color: Colors.white, // Set the icon color to white
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Remove AppBarWidget and Search Bar from here

          // Category Title
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // Category Widget
          CategoriesWidget(),

          // Popular Items Title
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // Popular Items Widget
          PopularItemsWidget(),

          // Newest Items Title
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Newest",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // Newest Items Widget
          NewestItemsWidget(),
        ],
      ),

      endDrawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all items are shown
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: 0, // Set the current index
        selectedItemColor: Colors.indigo,
        onTap: (index) {
          // Handle item tap
        },
      ),
    );
  }
}