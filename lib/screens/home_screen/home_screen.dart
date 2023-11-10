import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon/components/my_card_horizontal.dart';

import '../../components/category_card.dart';
import '../../components/carousel_slider.dart';
import '../../components/my_card_vertical.dart';
import '../../components/nav_bar.dart';
import '../../components/tag_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('appBarData')
              .doc('1')
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            var data = snapshot.data!.data() as Map<String, dynamic>;
            String morningGreeting = data['morningGreeting'] ??
                'Good Morning'; // Default value if not present
            String name =
                data['name'] ?? 'Sushma Shukla'; // Default value if not present

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  morningGreeting,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Hindi',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          },
        ),
        leading: Row(
          children: [
            SizedBox(width: 14),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('appBarData')
                      .doc('1')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Show a loading indicator while data is being fetched
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    var data = snapshot.data!.data() as Map<String, dynamic>;
                    String imageUrl =
                        data['imageUrl'] ?? ''; // Default value if not present

                    return Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_rounded),
            iconSize: 30,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.card_giftcard),
            onPressed: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                CarouselSlider(), //image slider
                SizedBox(height: 30),

                // Featured Services
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Featured Services',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Hindi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                MyCardHorizontal(),
                SizedBox(height: 20),

                // Category Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Hindi',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 20),

                // Category section
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('categories')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    var categoryData = snapshot.data!.docs
                        .take(6)
                        .map((doc) => doc.data())
                        .toList();

                    return CategoryCard(categoryData: categoryData);
                  },
                ),

                SizedBox(height: 40),

                // Most Popular Services Section
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Most Popular Services',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Hindi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TagSearch(),
                SizedBox(height: 30),

                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('salons')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    var salonData = snapshot.data!.docs
                        .map((doc) => doc.data() as Map<String, dynamic>)
                        .toList();

                    return Column(
                      children: salonData.map((salons) {
                        return MyCardVertical(
                          salonName: salons['salonName'],
                          location: salons['location'],
                          imageUrl: salons['imageUrl'],
                          distance: salons['distance'],
                          rating: salons['rating'],
                          showBookmarkIcon: salons['showBookmarkIcon'],
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
