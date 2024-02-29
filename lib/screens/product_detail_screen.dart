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
  final int id;

  const TBProductDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<TBProductModel> productState = ref.watch(productProvider(id));
    return Scaffold(
      backgroundColor: TBColor.app.backgroundColor,
      appBar: TBAppBar(
        title: const Text("Product details"),
        actions: [
          IconButton(
            onPressed: () {
              productState.when(
                  data: (product) => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              TBProductEditScreen(id: product.id))),
                  error: (error, stackTrace) {},
                  loading: () {});
            },
            icon: Icon(
              TBIcons.edit,
              color: TBColor.appBar.blueGradientColor,
            ),
          ),
        ],
      ),
      body: productState.when(
        data: (product) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TBGallery.url(images: product.images),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        TBDimensions.productDetailsScreen.contentPadding),
                child: Column(
                  children: [
                    TBSection(
                        title: "Overview",
                        content: TBDetailOverviewCard(
                            name: product.title,
                            description: product.description,
                            company: product.brand,
                            price: product.price,
                            discount: product.discountPercentage,
                            rating: product.rating)),
                    TBSection(
                        title: "Availability",
                        content: TBAvailabilityCard(
                          category: product.category,
                          onStock: product.stock,
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
        ),
        error: (error, stackTrace) => const Text("Oops, something went wrong!"),
        loading: () => Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              color: TBColor.app.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
