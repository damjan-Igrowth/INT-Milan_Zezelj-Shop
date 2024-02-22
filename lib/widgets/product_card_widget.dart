import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/rating_widget.dart';

class TBProductCard extends StatelessWidget {
  final TBProduct product;
  final void Function() onTap;
  const TBProductCard({super.key, required this.product, required this.onTap});

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
                  child: Image.network(
                    product.image,
                    loadingBuilder: (context, child, loadingProgress) =>
                        Container(
                            padding: EdgeInsets.all(
                              MediaQuery.textScalerOf(context).scale(
                                  TBDimensions
                                      .productCard.circularIndicatorSize),
                            ),
                            child: CircularProgressIndicator(
                                strokeWidth: TBDimensions
                                    .productCard.circularIndicatorWidth,
                                color: TBColor.app.lightBlue)),
                  ),
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
                            product.name,
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.category,
                                  style: TextStyle(
                                      color: TBColor.app.lightBlue,
                                      fontFamily: "Inter",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              TBRating(rating: product.rating),
                              Text("On stock: ${product.onStock}",
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
                          "-${product.discount.toStringAsFixed(2)}%",
                          style: TextStyle(
                              color: TBColor.card.green,
                              fontFamily: "Inter",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${product.price.toStringAsFixed(2)} \$",
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
