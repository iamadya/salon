import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key});

  // Sample data for icons and their corresponding titles
  final List<Map<String, dynamic>> categoryData = [
    {'icon': 'assets/icons/haircut.png', 'title': 'Hair cut'},
    {'icon': 'assets/icons/makeup.png', 'title': 'Makeup'},
    {'icon': 'assets/icons/hair_straightener.png', 'title': 'Straightening'},
    {'icon': 'assets/icons/nail.png', 'title': 'Meni-Pedi'},
    {'icon': 'assets/icons/massage.png', 'title': 'Spa/Massage'},
    {'icon': 'assets/icons/beard_trimming.png', 'title': 'Beard Trimming'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: categoryData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: ClipRRect(
                  child: Image.asset(
                    categoryData[index]['icon'],
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Text(categoryData[index]['title']),
            ],
          );
        },
      ),
    );
  }
}
