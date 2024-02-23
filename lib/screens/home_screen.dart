import 'package:flutter/material.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/alert_dialog_widget.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/availability_card_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/picker_list_widget.dart';
import 'package:tech_byte/widgets/detail_overview_card_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/product_card_widget.dart';
import 'package:tech_byte/widgets/section_widget.dart';
import 'package:tech_byte/widgets/select_input_widget.dart';
import 'package:tech_byte/widgets/text_input_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCategory;
  TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                  // TBButton(
                  //   type: TBButtonType.filled,
                  //   onPressed: () {
                  //     // Navigator.of(context).push(MaterialPageRoute(
                  //     //     builder: (context) => const HomeScreen()));
                  //     showDialog(
                  //         barrierDismissible: false,
                  //         context: context,
                  //         builder: (context) => TBAlertDialog.error(
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //               message:
                  //                   "Something went wrong while editing product!",
                  //             ));
                  //   },
                  //   text: "Add Product",
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // Form(
                  //   key: _formKey,
                  //   child: Column(
                  //     children: [
                  //       TBTextInput(
                  //         enabled: false,
                  //         suffixIcon: Icon(Icons.business_rounded),
                  //         textEditingController: _textEditingController,
                  //         label: "Text",
                  //         validator: (value) {
                  //           if (value == "") {
                  //             return "Cant be empty";
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       TBTextInput(
                  //         suffixIcon: Icon(Icons.business_rounded),
                  //         textEditingController: TextEditingController(),
                  //         label: "Text",
                  //         validator: (value) {
                  //           if (value == "") {
                  //             return "Cant be empty";
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),

                  TBSelectInput(
                    label: "Category",
                    items: [
                      TBPickerListItemModel(name: "Phone"),
                      TBPickerListItemModel(name: "Laptop"),
                      TBPickerListItemModel(name: "Apple")
                    ],
                    onTap: (value) {
                      setState(
                        () {
                          _selectedCategory = value;
                        },
                      );
                    },
                  ),

                  TBButton(
                    type: TBButtonType.filled,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }
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
