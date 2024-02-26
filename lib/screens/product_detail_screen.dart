import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/availability_card_widget.dart';
import 'package:tech_byte/widgets/detail_overview_card_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/section_widget.dart';

class TBProductDetailScreen extends StatefulWidget {
  final TBProductModel selectedProduct;

  const TBProductDetailScreen({super.key, required this.selectedProduct});

  @override
  State<TBProductDetailScreen> createState() => _TBProductDetailScreenState();
}

class _TBProductDetailScreenState extends State<TBProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TBAppBar(
        title: Text("Product details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              TBIcons.edit,
              color: TBColor.appBar.blueGradientColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TBGallery.url(images: [widget.selectedProduct.image]),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: TBDimensions.productDetailsScreen.contentPadding),
              child: Column(
                children: [
                  TBSection(
                      title: "Overview",
                      content: TBDetailOverviewCard(
                          name: widget.selectedProduct.name,
                          description: widget.selectedProduct.description,
                          company: widget.selectedProduct.company,
                          price: widget.selectedProduct.price,
                          discount: widget.selectedProduct.discount,
                          rating: widget.selectedProduct.rating)),
                  TBSection(
                      title: "Availability",
                      content: TBAvailabilityCard(
                        category: widget.selectedProduct.category,
                        onStock: widget.selectedProduct.onStock,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
