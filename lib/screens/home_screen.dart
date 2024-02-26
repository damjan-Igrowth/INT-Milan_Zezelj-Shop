import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/screens/product_detail_screen.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/alert_dialog_widget.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/availability_card_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/detail_overview_card_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/product_card_widget.dart';
import 'package:tech_byte/widgets/section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TBColor.app.backgroundColor,
      appBar: TBAppBar.styled(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: TBDimensions.appBar.specialTitleFontSize,
                color: Colors.black),
            children: const [
              TextSpan(text: "Tech"),
              TextSpan(
                  text: "Byte", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              TBIcons.edit,
              color: TBColor.appBar.blueGradientColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TBProductCard(
                    category: product.category,
                    discount: product.discount,
                    image: product.image,
                    name: product.name,
                    onStock: product.onStock,
                    price: product.price,
                    rating: product.rating,
                    onTap: () {},
                  ),
                  TBSection(
                      title: "Availability",
                      content: TBAvailabilityCard(
                        category: product.category,
                        onStock: product.onStock,
                      )),
                  TBGallery.url(
                    images: const [
                      "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
                      "https://upload.wikimedia.org/wikipedia/commons/a/a8/TEIDE.JPG",
                    ],
                  ),
                  TBGallery.asset(
                    images: const [
                      "assets/iphone_image.png",
                    ],
                  ),
                  TBSection(
                    title: "Details",
                    content: TBDetailOverviewCard(
                      name: product.name,
                      company: product.company,
                      description: product.description,
                      discount: product.discount,
                      price: product.price,
                      rating: product.rating,
                    ),
                  ),
                  TBButton(
                    type: TBButtonType.filled,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TBProductDetailScreen(
                                selectedProduct: product,
                              )));
                      // showDialog(
                      //     barrierDismissible: false,
                      //     context: context,
                      //     builder: (context) => TBAlertDialog.error(
                      //           onPressed: () {
                      //             Navigator.of(context).pop();
                      //           },
                      //           message:
                      //               "Something went wrong while editing product!",
                      //         ));
                    },
                    text: "Add Product",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
