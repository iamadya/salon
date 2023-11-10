import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../components/category_card.dart';
import '../../components/nav_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category',
            style: TextStyle(
                fontFamily: 'Hindi',
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800])),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          var categoryData =
              snapshot.data!.docs.map((doc) => doc.data()).toList();

          return CategoryCard(categoryData: categoryData);
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
