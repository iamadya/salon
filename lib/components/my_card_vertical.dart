import 'package:flutter/material.dart';

class MyCardVertical extends StatelessWidget {
  final String salonName;
  final String location;
  final String imageUrl;
  final String distance;
  final String rating;
  final bool showBookmarkIcon;

  MyCardVertical({
    required this.salonName,
    required this.location,
    required this.imageUrl,
    required this.distance,
    required this.rating,
    required this.showBookmarkIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 110,
                height: 120,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        salonName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      if (showBookmarkIcon) // Conditionally show the bookmark icon
                        Icon(
                          Icons.bookmark_added,
                          color: Colors.red,
                        ),
                    ],
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFF024163),
                      ),
                      Text(
                        distance,
                        style: TextStyle(
                          color: Colors.grey[700],
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star_half,
                        size: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 5),
                      Text(
                        rating,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
