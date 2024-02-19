import 'package:flutter/material.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: TBDimensions.app.screenMarginSize,
        ),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TBButton(
                type: TBButtonType.filled,
                onPressed: () {},
                text: "Add ProductProduct",
              ),
            ],
          )),
        ),
      ),
    );
  }
}
