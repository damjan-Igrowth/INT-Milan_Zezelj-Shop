import 'package:flutter/material.dart';

import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/rating_widget.dart';

class TBProductCard extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  final String category;
  final double price;
  final double discount;
  final String image;
  final double rating;
  final int onStock;

  const TBProductCard(
      {super.key,
      required this.name,
      required this.category,
      required this.price,
      required this.discount,
      required this.image,
      required this.rating,
      required this.onStock,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(TBDimensions.productCard.borderRadius)),
        child: Container(
          padding: EdgeInsets.all(TBDimensions.productCard.contentPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.textScalerOf(context)
                    .scale(TBDimensions.productCard.imageSize),
                width: MediaQuery.textScalerOf(context)
                    .scale(TBDimensions.productCard.imageSize),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: TBColor.card.border,
                      width: TBDimensions.productCard.imageBorderWidth,
                    ),
                    borderRadius: BorderRadius.circular(
                        TBDimensions.productCard.imageBorderRadius)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      TBDimensions.productCard.imageBorderRadius),
                  child: Image.network(image,
                      loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      if (loadingProgress.expectedTotalBytes != 0) {
                        return Container(
                            padding: EdgeInsets.all(
                              MediaQuery.textScalerOf(context).scale(
                                  TBDimensions
                                      .productCard.circularIndicatorSize),
                            ),
                            child: CircularProgressIndicator(
                                strokeWidth: TBDimensions
                                    .productCard.circularIndicatorWidth,
                                color: TBColor.app.lightBlue));
                      }
                    }
                    return child;
                  }),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(category,
                                  style: TextStyle(
                                      color: TBColor.app.lightBlue,
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              TBRating(rating: rating),
                              Text("On stock: ${onStock}",
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "-${discount.toStringAsFixed(2)}%",
                          style: TextStyle(
                              color: TBColor.card.green,
                              fontFamily: "Inter",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${price.toStringAsFixed(2)} \$",
                          style: TextStyle(
                              color: TBColor.card.red,
                              fontFamily: "Inter",
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
