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
        title: Text('Good Morning'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
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
                SizedBox(height: 20),

                // Featured Services
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Featured Services',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),

                MyCardHorizontal(),
                SizedBox(height: 40),

                // Category Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Category',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                  child: Text('Most Popular Services',
                      style: TextStyle(fontWeight: FontWeight.bold)),
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



                TagSearch(),

                MyCardVertical(),
                MyCardVertical(),
                MyCardVertical(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
