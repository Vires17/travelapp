import 'package:flutter/material.dart';

class TagContact extends StatelessWidget {
  TagContact({
    required this.backgroundColor,
    this.color = Colors.white,
    required this.text,
    required this.icon,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final Color color, backgroundColor;
  final String text;
  final IconData icon;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 34,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
