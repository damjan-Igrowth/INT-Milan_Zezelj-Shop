import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/tb_app_bar.dart';
import 'package:tech_byte/widgets/tb_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tbBackgroundColor,
      appBar: TBAppBar(
        title: "Product details",
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/edit_icon.png",
                height: kIconSize,
                width: kIconSize,
              ))
        ],
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: kEdgeInsetSize, right: kEdgeInsetSize),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TBButton(
                type: TBButtonType.primary,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                text: "Add Product",
              ),
            ],
          )),
        ),
      ),
    );
  }
}
