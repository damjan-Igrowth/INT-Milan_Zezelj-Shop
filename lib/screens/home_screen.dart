import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
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
  GlobalKey buttonGlobalKey = GlobalKey();
  List<TBProductModel> products = [
    product,
    product,
    product,
    product,
    product,
    product,
    product,
    product,
    product
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TBButton(
            key: buttonGlobalKey,
            text: "Add product",
            type: TBButtonType.filled),
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: products.length,
                  itemBuilder: (context, index) => TBProductCard(
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
