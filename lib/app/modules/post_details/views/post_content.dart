import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  const PostContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Son Doong Cave',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet congue nibh. Curabitur laoreet ligula sed tellus condimentum, nec suscipit ante mollis. Vivamus congue vulputate erat at luctus. Duis vitae sem augue. Aliquam in fermentum orci. Praesent interdum dolor a velit cursus tincidunt. Aenean massa enim, pellentesque id bibendum a, vehicula nec enim.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Image.asset(
            "assets/Hang-Son-Doong-1.jpg",
            fit: BoxFit.fill,
          ),
          SizedBox(height: 15),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet congue nibh. Curabitur laoreet ligula sed tellus condimentum, nec suscipit ante mollis. Vivamus congue vulputate erat at luctus. Duis vitae sem augue. Aliquam in fermentum orci. Praesent interdum dolor a velit cursus tincidunt. Aenean massa enim, pellentesque id bibendum a, vehicula nec enim.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
