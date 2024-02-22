import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/picker_list_widget.dart';
import 'package:tech_byte/widgets/rating_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.symmetric(
          horizontal: TBDimensions.app.screenMarginSize,
        ),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TBRating(rating: 5),
              TBButton(
                type: TBButtonType.filled,
                onPressed: () async {
                  _selectedCategory = await showModalBottomSheet<String?>(
                      context: context,
                      builder: (context) => TBPickerList(
                            items: const [
                              (Icons.phone, "Smartphones"),
                              (Icons.laptop, "Laptops"),
                              (Icons.gamepad, "Video Games"),
                              (Icons.audio_file, "Audio"),
                              (Icons.microwave, "Appliance")
                            ],
                            title: "Category",
                            selectedItem: _selectedCategory,
                            onIconPressed: () {
                              Navigator.of(context).pop();
                            },
                          ));
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
