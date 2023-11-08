import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwipingImageGallery extends StatefulWidget {
  @override
  _SwipingImageGalleryState createState() => _SwipingImageGalleryState();
}

class _SwipingImageGalleryState extends State<SwipingImageGallery> {
  final List<String> images = [
    'https://images.pexels.com/photos/1813272/pexels-photo-1813272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/3993314/pexels-photo-3993314.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6045535/pexels-photo-6045535.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget> [
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(images[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: images.length,
              effect: ExpandingDotsEffect(
                dotWidth: 8.0,
                dotHeight: 8.0,
                dotColor: Colors.white,
                activeDotColor: Colors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
