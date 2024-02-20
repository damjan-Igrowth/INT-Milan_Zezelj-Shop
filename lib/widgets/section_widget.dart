import 'package:flutter/material.dart';

class TBSection extends StatelessWidget {
  final String title;
  final Widget content;
  const TBSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        content,
      ],
    );
  }
}
