import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/providers/product_list_provider.dart';
import 'package:tech_byte/screens/product_detail_screen.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/product_card_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(productListProvider);
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              productsState.when(
                data: (products) => Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(
                        top: TBDimensions.homeScreen.contentPadding,
                        bottom: TBDimensions.homeScreen.listBottomPadding),
                    separatorBuilder: (context, index) => SizedBox(
                        height: TBDimensions.homeScreen.separatorHeight),
                    itemCount: products.length,
                    itemBuilder: (context, index) => TBProductCard(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => TBProductDetailScreen(
                                    id: products[index].id))),
                        name: products[index].title,
                        category: products[index].category,
                        price: products[index].price,
                        discount: products[index].discountPercentage,
                        image: products[index].thumbnail,
                        rating: products[index].rating,
                        onStock: products[index].stock),
                  ),
                ),
                error: (error, stackTrace) =>
                    Text(productsState.error.toString()),
                loading: () => SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: TBColor.app.lightBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
