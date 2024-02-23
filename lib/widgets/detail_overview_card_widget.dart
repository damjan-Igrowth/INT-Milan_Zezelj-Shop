import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/rating_widget.dart';

class TBDetailOverviewCard extends StatelessWidget {
  final String name;
  final String description;
  final String company;
  final double price;
  final double discount;
  final double rating;

  const TBDetailOverviewCard(
      {super.key,
      required this.name,
      required this.description,
      required this.company,
      required this.price,
      required this.discount,
      required this.rating});

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
                  bottom: TBDimensions.card.contentHeaderPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          company,
                          style: TextStyle(
                            color: TBColor.card.lightBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: TBColor.card.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        TBRating(rating: rating),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${price}\$",
                        style: TextStyle(
                          color: TBColor.card.red,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "-${discount}%",
                        style: TextStyle(
                          color: TBColor.card.green,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
