import 'package:flutter/material.dart';

class TagSearch extends StatefulWidget {
  const TagSearch({Key? key}) : super(key: key);

  @override
  _TagSearchState createState() => _TagSearchState();
}

class _TagSearchState extends State<TagSearch> {
  int _selectedIndex = 0; // Defaulting to 0 (All)

  final List<String> buttonLabels = ['All', 'Haircuts', 'Make up', 'Manicure', 'Spa'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TagButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Text(buttonLabels[index]), // Use label from the list
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  _selectedIndex == index ? Colors.blue[900]! : Colors.blue.withAlpha(50),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TagButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle style;

  const TagButton({
    Key? key,
    this.onPressed,
    required this.child,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: style,
    );
  }
}
