import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ProductDetailPage.dart';

class ItemPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Curry Rice',
      'description': 'Curry, Chicken, Potato, Carrot, Rice',
      'imagePath': 'images/kfc.jpeg',
      'price': 13.0,
      'rating': 4.2,
    },
    {
      'name': 'Cola',
      'description': 'Refreshing drink',
      'imagePath': 'images/th.jpeg',
      'price': 3.5,
      'rating': 3.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Restaurants'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background Image
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/kfc.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Overlay Details
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tags Section
                        Row(
                          children: [
                            _buildTag('Halal', Colors.green),
                            SizedBox(width: 8),
                            _buildTag('Discount 20%', Colors.purple),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ABC Restaurant',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.black),
                            SizedBox(width: 12),
                            Text('11am - 11pm'),
                            SizedBox(width: 20),
                            Icon(Icons.location_on, color: Colors.black),
                            SizedBox(width: 12),
                            Text('2.8 km'),
                            SizedBox(width: 20),
                            Icon(Icons.attach_money, color: Colors.black),
                            SizedBox(width: 12),
                            Text('RM10 - 30'),
                          ],
                        ),
                        SizedBox(height: 9),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4.2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 18,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(width: 10),
                            Text('4.2 (24 reviews)'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ...menuItems.map((item) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            name: item['name'],
                            imagePath: item['imagePath'],
                            price: item['price'],
                            rating: item['rating'],
                            description: item['description'],
                          ),
                        ),
                      );
                    },
                    child: _buildMenuItem(
                      item['name'],
                      item['description'],
                      item['imagePath'],
                      item['price'],
                      item['rating'],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMenuItem(String name, String description, String imagePath, double price, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Image.asset(imagePath, height: 80, width: 80, fit: BoxFit.cover),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(description),
                SizedBox(height: 5),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 14,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(width: 10),
                    Text('RM${price.toStringAsFixed(2)}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
