import 'package:flutter/material.dart';

class CardData {
  final String imageUrl;
  final String title;
  final int originalPrice;
  final int discountedPrice;

  CardData({
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
  });
}

class MyCardHorizontal extends StatefulWidget {
  @override
  State<MyCardHorizontal> createState() => _MyCardHorizontalState();
}

class _MyCardHorizontalState extends State<MyCardHorizontal> {
  List<CardData> cardList = [
    CardData(
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/02/22/17/16/barber-3173437_1280.jpg',
      title: 'Beard Trimming',
      originalPrice: 300,
      discountedPrice: 200,
    ),
    CardData(
      imageUrl:
          'https://images.pexels.com/photos/3738338/pexels-photo-3738338.jpeg?auto=compress&cs=tinysrgb&w=600',
      title: 'Hair Straightening',
      originalPrice: 2100,
      discountedPrice: 1000,
    ),
    CardData(
      imageUrl:
          'https://media.istockphoto.com/id/1296431297/photo/a-beautiful-young-woman-with-long-hair-doing-makeup-for-a-wedding-or-photo-shoot.webp?b=1&s=612x612&w=0&k=20&c=l5dy1ed2fC6KstCWHaHf90DrUzDqI9l-EASclnBz8xQ=',
      title: 'Makeup',
      originalPrice: 1000,
      discountedPrice: 800,
    ),
    CardData(
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/08/05/13/13/people-2583493_1280.jpg',
      title: 'Manicure',
      originalPrice: 2000,
      discountedPrice: 1800,
    ),
    CardData(
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/07/20/06/34/woman-6479874_1280.jpg',
      title: 'Massage',
      originalPrice: 2700,
      discountedPrice: 2500,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: SizedBox(
                    width: 150,
                    height: 100,
                    child: Image.network(
                      cardList[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cardList[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Rs ${cardList[index].discountedPrice} ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(width: 5),
                            ),
                            TextSpan(
                              text: 'Rs ${cardList[index].originalPrice}',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
