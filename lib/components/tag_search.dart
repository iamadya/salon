import 'package:flutter/material.dart';

class TagSearch extends StatefulWidget {
  const TagSearch({Key? key}) : super(key: key);

  @override
  _TagSearchState createState() => _TagSearchState();
}

class _TagSearchState extends State<TagSearch> {
  int _selectedIndex = 0; // Defaulting to 0 (All)

  final List<String> buttonLabels = [
    'All',
    'Haircuts',
    'Make up',
    'Manicure',
    'Pedicure',
    'Massage',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttonLabels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: index == 0 ? 60 : 100, // Decreased width for 'All' button
              child: TagButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Text(buttonLabels[index]),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    _selectedIndex == index
                        ? Color(0xFF024163)
                        : Color(0xFFe9f7fe),
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    _selectedIndex == index ? Colors.white : Color(0xFF4d7c96),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
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
