import 'package:flutter/material.dart';
import 'package:tech_byte/utils/constants.dart';

class TBSection extends StatelessWidget {
  final String title;
  final Widget content;
  final double titlePadding;
  const TBSection(
      {super.key,
      required this.title,
      required this.content,
      this.titlePadding = 12});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: TBDimensions.section.titlePadding),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        content,
      ],
    );
  }
}
