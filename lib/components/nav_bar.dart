import 'package:flutter/material.dart';
import 'package:salon/screens/home_screen/home_screen.dart';

import '../screens/category_screen/category_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  Color _selectedIconColor = Color(0xFF024163);
  Color _unselectedIconColor = Colors.grey[700]!;

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
              if (_currentIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else if (_currentIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              }
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _currentIndex == 0 ? _selectedIconColor : _unselectedIconColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view, color: _currentIndex == 1 ? _selectedIconColor : _unselectedIconColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, color: _currentIndex == 2 ? _selectedIconColor : _unselectedIconColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, color: _currentIndex == 3 ? _selectedIconColor : _unselectedIconColor),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, color: _currentIndex == 4 ? _selectedIconColor : _unselectedIconColor),
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
            height: 2,
            color: _selectedIconColor, // Change the color of the indicator here
          ),
        ),
      ],
    );
  }
}

