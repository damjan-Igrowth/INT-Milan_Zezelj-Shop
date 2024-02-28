import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/providers/product_provider.dart';
import 'package:tech_byte/screens/product_edit_screen.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/availability_card_widget.dart';
import 'package:tech_byte/widgets/detail_overview_card_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/section_widget.dart';

class TBProductDetailScreen extends ConsumerWidget {
  final void Function(TBProductModel) onEdit;
  final int id;

  const TBProductDetailScreen(
      {super.key, required this.id, required this.onEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<TBProductModel> selectedProduct = ref.watch(productProvider(id));
    return Scaffold(
      backgroundColor: TBColor.app.backgroundColor,
      appBar: TBAppBar(
        title: Text("Product details"),
        actions: [
          IconButton(
            onPressed: () {
              switch (selectedProduct) {
                case AsyncData():
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TBProductEditScreen(
                          id: selectedProduct.value.id, onEdit: onEdit)));
                default:
                  break;
              }
            },
            icon: Icon(
              TBIcons.edit,
              color: TBColor.appBar.blueGradientColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: switch (selectedProduct) {
          AsyncData(:final value) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TBGallery.url(images: value.images),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          TBDimensions.productDetailsScreen.contentPadding),
                  child: Column(
                    children: [
                      TBSection(
                          title: "Overview",
                          content: TBDetailOverviewCard(
                              name: value.title,
                              description: value.description,
                              company: value.brand,
                              price: value.price,
                              discount: value.discountPercentage,
                              rating: value.rating)),
                      TBSection(
                          title: "Availability",
                          content: TBAvailabilityCard(
                            category: value.category,
                            onStock: value.stock,
                          )),
                      SizedBox(
                        height: TBDimensions
                            .productDetailsScreen.contentBottomPadding,
                      )
                    ],
                  ),
                ),
              ],
            ),
          AsyncError() => Text(selectedProduct.error.toString()),
          _ => Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      color: TBColor.app.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
        },
      ),
    );
  }
}
