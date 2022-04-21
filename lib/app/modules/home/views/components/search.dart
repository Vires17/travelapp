import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search anything",
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff606060),
          ),
          filled: true,
          fillColor: Color(0xffEDEDED),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}
