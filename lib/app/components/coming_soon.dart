import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          'Coming soon, we will be update soon!',
          style: TextStyle(
            color: Color(0xff939393),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
