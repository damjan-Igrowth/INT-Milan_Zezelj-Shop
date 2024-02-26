import 'package:flutter/material.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/picker_list_widget.dart';
import 'package:tech_byte/widgets/select_input_widget.dart';
import 'package:tech_byte/widgets/text_input_widget.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: TBTextInput(
                      enabled: false,
                      textEditingController: _textEditingController,
                      label: "Text",
                      validator: (p0) {
                        if (p0 == "") {
                          return "cant be empty";
                        }
                        return null;
                      },
                      suffixIcon: Icon(Icons.abc),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TBSelectInput(
                    label: "Category",
                    enabled: true,
                    selectedItem: "Apple",
                    suffixIcon: Icon(Icons.business),
                    // suffixText: "%",
                    items: [
                      TBPickerListItemModel(name: "Phone"),
                      TBPickerListItemModel(name: "Laptop"),
                      TBPickerListItemModel(
                          name: "Apple", iconData: Icons.business_sharp)
                    ],
                    onTap: (value) {
                      setState(
                        () {
                          _selectedCategory = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
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
