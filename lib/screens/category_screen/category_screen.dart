import 'package:flutter/material.dart';

import '../../components/category_card.dart';
import '../../components/nav_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
      body: CategoryCard(
        categoryData: [
          {'icon': 'assets/icons/haircut.png', 'title': 'Hair cut'},
          {'icon': 'assets/icons/makeup.png', 'title': 'Makeup'},
          {
            'icon': 'assets/icons/hair_straightener.png',
            'title': 'Straightening'
          },
          {'icon': 'assets/icons/nail.png', 'title': 'Meni-Pedi'},
          {'icon': 'assets/icons/massage.png', 'title': 'Spa/Massage'},
          {'icon': 'assets/icons/beard_trimming.png', 'title': 'Bear Trimming'},
          {'icon': 'assets/icons/hair-dye.png', 'title': 'Hair Coloring'},
          {'icon': 'assets/icons/wax.png', 'title': 'Waxing'},
          {'icon': 'assets/icons/sheet-mask.png', 'title': 'Facial'},
        ],
      ),
      bottomNavigationBar: NavBar(
      ),
    );
  }
}
