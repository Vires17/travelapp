import 'package:flutter/material.dart';
import 'package:travelapp/app/components/styles.dart';

class CustomOutlineButton extends StatelessWidget {
  CustomOutlineButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.text,
    this.borderRadius,
    this.backgroundColor,
    this.fontSize,
    this.textColor,
  }) : super(key: key);

  final String text;
  final double height, width;
  final GestureTapCallback onPressed;
  final double? borderRadius, fontSize;
  final Color? backgroundColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(backgroundColor ?? primaryColor),
          foregroundColor:
              MaterialStateProperty.all<Color>(textColor ?? Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              side: BorderSide(
                  color: textColor ?? Colors.black,
                  width: 1,
                  style: BorderStyle.solid),
            ),
          ),
        ),
      ),
    );
  }
}
