import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  HeaderTitle({
    Key? key,
    required this.title,
    this.onPressed,
    this.hideViewMore = false,
  }) : super(key: key);

  final String title;
  bool? hideViewMore;
  GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: onPressed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    hideViewMore! ? "" : "View more",
                    style: TextStyle(
                      color: Color(0xff3bb9d9),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
