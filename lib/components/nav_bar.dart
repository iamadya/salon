import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: '',
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: MediaQuery.of(context).size.width / 5 * _currentIndex +
              MediaQuery.of(context).size.width / 5 * 0.2,
          child: Container(
            width: MediaQuery.of(context).size.width / 5 * 0.6,
            height: 3,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
