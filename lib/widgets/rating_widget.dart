import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

class TBRating extends StatelessWidget {
  final double rating;
  const TBRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating.toStringAsFixed(2),
          style: TextStyle(
              color: TBColor.rating.yellow,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontFamily: "Poppins"),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) =>
              LinearGradient(colors: TBColor.rating.gradientColors, stops: [
            0,
            rating / 5 +
                ((TBDimensions.rating.gapSize / bounds.width) * rating / 5),
            rating / 5 +
                ((TBDimensions.rating.gapSize / bounds.width) * rating / 5)
          ]).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Row(
            children: [
              SizedBox(width: TBDimensions.rating.gapSize),
              Icon(
                Icons.star_rounded,
                size: TBDimensions.rating.size,
              ),
              SizedBox(width: TBDimensions.rating.gapSize),
              Icon(
                Icons.star_rounded,
                size: TBDimensions.rating.size,
              ),
              SizedBox(width: TBDimensions.rating.gapSize),
              Icon(
                Icons.star_rounded,
                size: TBDimensions.rating.size,
              ),
              SizedBox(width: TBDimensions.rating.gapSize),
              Icon(
                Icons.star_rounded,
                size: TBDimensions.rating.size,
              ),
              SizedBox(width: TBDimensions.rating.gapSize),
              Icon(
                Icons.star_rounded,
                size: TBDimensions.rating.size,
              ),
            ],
          ),
        )
      ],
    );
  }
}
