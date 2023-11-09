import 'package:flutter/material.dart';
import 'package:salon/components/my_card_horizontal.dart';

import '../../components/category_card.dart';
import '../../components/image_slider.dart';
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Good Morning',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
            Text(
              'Sushma Shukla',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Hindi',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        leading: Row(
          children: [
            SizedBox(width: 14),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  'https://images.pexels.com/photos/5794945/pexels-photo-5794945.jpeg?auto=compress&cs=tinysrgb&w=600',
                  fit: BoxFit.contain,
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
                SwipingImageGallery(),
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
                CategoryCard(),
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

                // FilledButton(
                //     onPressed: () {},
                //     child: Text('All'),
                //     style: ButtonStyle(
                //         foregroundColor:
                //             MaterialStateProperty.all<Color>(Colors.white),
                //         backgroundColor:
                //             MaterialStateProperty.all<Color>(Colors.blue[900]!),
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(20),
                //                     side: BorderSide(color: Colors.blue))))),
                SizedBox(height: 20),

                TagSearch(),
                SizedBox(height: 30),

                MyCardVertical(
                  salonName: 'Tanishk Unisex Salon',
                  location: 'Janakpuri, New Delhi',
                  imageUrl:
                      'https://images.pexels.com/photos/11333875/pexels-photo-11333875.jpeg?auto=compress&cs=tinysrgb&w=600',
                  distance: '1.2km',
                  rating: '4.8 | 256 Reviews',
                  showBookmarkIcon: true,
                ),
                MyCardVertical(
                  salonName: 'Royal Touch Salon Studio',
                  location: 'Tilak Nagar, New Delhi',
                  imageUrl:
                      'https://media.istockphoto.com/id/1497806504/photo/hair-styling-in-beauty-salon-woman-does-her-hair-in-modern-beauty-salon-woman-stylist-dries.jpg?b=1&s=612x612&w=0&k=20&c=C3dJVYJDDYX5W1x9rei5Zzkd8uQ8-Q-6xUmWrhDoMW8=',
                  distance: '800m',
                  rating: '4.6 | 154 Reviews',
                  showBookmarkIcon: false,
                ),
                MyCardVertical(
                  salonName: 'Hair Direction Salon',
                  location: 'Tilak Nagar, New Delhi',
                  imageUrl:
                      'https://images.pexels.com/photos/5584461/pexels-photo-5584461.jpeg?auto=compress&cs=tinysrgb&w=600',
                  distance: '900m',
                  rating: '4.6 | 154 Reviews',
                  showBookmarkIcon: false,
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
