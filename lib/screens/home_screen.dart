import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/galery_widget.dart';
import 'package:tech_byte/widgets/rating_widget.dart';

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
      appBar: TBAppBar(
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
              Icons.edit,
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
                TBRating(rating: 5),
                TBGalery.url(
                  images: [
                    "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
                    "https://upload.wikimedia.org/wikipedia/commons/a/a8/TEIDE.JPG",
                  ],
                ),
                TBGalery.asset(
                  images: [
                    "assets/iphone_image.png",
                  ],
                ),
                TBButton(
                  type: TBButtonType.filled,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  text: "Add Product",
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
