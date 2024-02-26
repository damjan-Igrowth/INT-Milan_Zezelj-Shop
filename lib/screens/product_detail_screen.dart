import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/screens/product_edit_screen.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/availability_card_widget.dart';
import 'package:tech_byte/widgets/detail_overview_card_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/section_widget.dart';

class TBProductDetailScreen extends StatelessWidget {
  final void Function(TBProductModel) onEdit;
  final TBProductModel selectedProduct;

  const TBProductDetailScreen(
      {super.key, required this.selectedProduct, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TBColor.app.backgroundColor,
      appBar: TBAppBar(
        title: Text("Product details"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TBProductEditScreen(
                      selectedProduct: selectedProduct, onEdit: onEdit)));
            },
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
            TBGallery.url(images: [selectedProduct.image]),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: TBDimensions.productDetailsScreen.contentPadding),
              child: Column(
                children: [
                  TBSection(
                      title: "Overview",
                      content: TBDetailOverviewCard(
                          name: selectedProduct.name,
                          description: selectedProduct.description,
                          company: selectedProduct.company,
                          price: selectedProduct.price,
                          discount: selectedProduct.discount,
                          rating: selectedProduct.rating)),
                  TBSection(
                      title: "Availability",
                      content: TBAvailabilityCard(
                        category: selectedProduct.category,
                        onStock: selectedProduct.onStock,
                      )),
                  SizedBox(
                    height:
                        TBDimensions.productDetailsScreen.contentBottomPadding,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
