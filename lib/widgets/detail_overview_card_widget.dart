import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/rating_widget.dart';

class TBDetailOverviewCard extends StatelessWidget {
  final TBProduct product;
  const TBDetailOverviewCard({super.key, required this.product});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.company,
                        style: TextStyle(
                          color: TBColor.card.lightBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        product.name,
                        style: TextStyle(
                          color: TBColor.card.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      TBRating(rating: product.rating),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${product.price}\$",
                        style: TextStyle(
                          color: TBColor.card.red,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${product.discount}%",
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
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
