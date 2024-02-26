import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/colors.dart';
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
            TBGallery.url(images: [
              "https://s3-alpha-sig.figma.com/img/e080/4553/e660b4c310e55a59d265cfb29c466b10?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=pOR2~llyW8yQX4nVQSzu7b22KAY6bgo0i8UfObQK81BUdLup2wSKDhrnQKmrrB7N1mWKGY--ne0k-t5OcwuvGHu1NRL8isTU8Y2MrhT46OdP7K0kk080QRCiaj5qocGoitMBoVP2D3scHzg0tgSDMKMaJM6h3l1PrI~VX8Z5r~kUnfj3CNyZOFGQ6xnv22F1BByEnmndnMYjleVp6btHxSdRfxxqwrkdTF~4NkFnZiFXta8lQLeIlrBWls956srnUXUj0XA16xO0HFWl02eyRXsHYsDDEMUoyL-jGnvrjcwfJjt4qWZ4yeHHA~rpPq5neqazyPAfDD5DUMXqOULBSg__"
            ]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
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
