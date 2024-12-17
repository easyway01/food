import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: [
            CategoryButton("Restaurants", true),
            SizedBox(width: 10),
            CategoryButton("Recipes", false),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          RestaurantCard(
            imagePath: "assets/restaurant1.jpg",
            title: "ABC Restaurant",
            foodType: "Western Food",
            time: "20 mins",
            rating: "4.2",
            tag1: "Halal",
            tag2: "24/7",
            dishes: [
              DishItem("Chicken Chop", "assets/chicken_chop.jpg"),
              DishItem("Fried Chicken", "assets/fried_chicken.jpg"),
            ],
          ),
          RestaurantCard(
            imagePath: "assets/restaurant2.jpg",
            title: "ABC Restaurant",
            foodType: "Western Food",
            time: "20 mins",
            rating: "3.2",
            tag1: "Vegetarian",
            tag2: "Promotion",
            dishes: [
              DishItem("Grilled Veggie Steak", "assets/veggie_steak.jpg"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  CategoryButton(this.title, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.pinkAccent : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String imagePath, title, foodType, time, rating, tag1, tag2;
  final List<DishItem> dishes;

  RestaurantCard({
    required this.imagePath,
    required this.title,
    required this.foodType,
    required this.time,
    required this.rating,
    required this.tag1,
    required this.tag2,
    required this.dishes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(foodType),
                Row(
                  children: [
                    Text("$time • "),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(" $rating"),
                  ],
                ),
                Row(
                  children: [
                    TagChip(tag1),
                    SizedBox(width: 5),
                    TagChip(tag2, color: Colors.purple),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: dishes,
          ),
        ],
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  final String label;
  final Color color;

  TagChip(this.label, {this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }
}

class DishItem extends StatelessWidget {
  final String name, imagePath;

  DishItem(this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(name),
    );
  }
}
