import 'package:flutter/material.dart';

class TravelAppBar extends StatelessWidget implements PreferredSizeWidget {
  TravelAppBar({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final GestureTapCallback onPress;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Travel App"),
      leading: InkWell(
        child: Icon(Icons.menu),
        onTap: onPress,
      ),
      backgroundColor: Color(0xFF6C6969),
    );
  }
}
