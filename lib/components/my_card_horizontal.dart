import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('featuredServices').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          var cardList = snapshot.data!.docs.map((doc) {
            var data = doc.data() as Map<String, dynamic>; // Explicit casting here
            return CardData(
              imageUrl: data['imageUrl'],
              title: data['title'],
              originalPrice: data['originalPrice'],
              discountedPrice: data['discountedPrice'],
            );
          }).toList();

          return ListView.builder(
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
          );
        },
      ),
    );
  }
}
