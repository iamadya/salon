import 'package:flutter/material.dart';

class MyCardVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 110,
                height: 120,
                child: Image.network(
                  'https://images.pexels.com/photos/1813272/pexels-photo-1813272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
                        'Tanishk Unisex Salon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.bookmark_added,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Text(
                    'Janakpuri, New Delhi',
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
                        color: Colors.blueAccent,
                      ),
                      Text(
                        '1.2km',
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
                        '4.8 | 256 Reviews',
                        style: TextStyle(
                          color: Colors.grey[700],
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

