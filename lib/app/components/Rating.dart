import 'package:flutter/material.dart';

// typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  // final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({
    required this.starCount,
    required this.rating,
    // required this.onRatingChanged,
    required this.color,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Colors.grey,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color,
      );
    }
    return new InkResponse(
      // onTap:
      //     onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      onTap: () {
        //
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
