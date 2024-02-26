import 'package:flutter/material.dart';

import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

class TBAvailabilityCard extends StatelessWidget {
  final String category;
  final int onStock;
  const TBAvailabilityCard(
      {super.key, required this.category, required this.onStock});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TBDimensions.card.borderRadius)),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(TBDimensions.card.contentPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: TBDimensions.card.availabilityTitlePadding),
              child: Row(
                children: [
                  const Expanded(
                    child: Text("Category",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 14)),
                  ),
                  Text(
                    category,
                    style: TextStyle(
                        color: TBColor.card.lightBlue,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: TBDimensions.card.iconSpacing),
                  child: Icon(
                    Icons.location_on,
                    color: TBColor.card.lightBlue,
                  ),
                ),
                Expanded(
                  child: Text(
                    "On stock: $onStock",
                    style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
