import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/screens/product_detail_screen.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TBProductModel> products = [
    product1,
    product2,
    product3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: TBDimensions.homeScreen.contentPadding),
        child: const TBButton(text: "Add product", type: TBButtonType.filled),
      ),
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: TBDimensions.homeScreen.contentPadding),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(
                      top: TBDimensions.homeScreen.contentPadding,
                      bottom: TBDimensions.homeScreen.listBottomPadding),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: TBDimensions.homeScreen.separatorHeight),
                  itemCount: products.length,
                  itemBuilder: (context, index) => TBProductCard(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TBProductDetailScreen(
                              onEdit: (TBProductModel editedProduct) {
                                setState(() {
                                  products[index] = editedProduct;
                                });
                              },
                              selectedProduct: products[index]))),
                      name: products[index].name,
                      category: products[index].category,
                      price: products[index].price,
                      discount: products[index].discount,
                      image: products[index].image,
                      rating: products[index].rating,
                      onStock: products[index].onStock),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
