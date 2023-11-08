import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key});

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
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: categoryData.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryItem(
          icon: categoryData[index]['icon'],
          title: categoryData[index]['title'],
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String? icon;
  final String? title;

  CategoryItem({Key? key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.all(12.0),
            child: ClipRRect(
              child: Image.asset(
                icon!,
                width: 50,
                height: 50,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
