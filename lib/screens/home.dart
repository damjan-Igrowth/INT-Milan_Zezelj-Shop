import 'package:flutter/material.dart';
import 'package:tech_byte/utils/constants.dart';
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
                onPressed: () {},
                text: "Add Product",
              ),
            ],
          )),
        ),
      ),
    );
  }
}
