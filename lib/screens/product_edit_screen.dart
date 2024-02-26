import 'package:flutter/material.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/alert_dialog_widget.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/select_input_widget.dart';
import 'package:tech_byte/widgets/text_input_widget.dart';

class TBProductEditScreen extends StatefulWidget {
  final void Function(TBProductModel) onEdit;
  final TBProductModel selectedProduct;
  const TBProductEditScreen(
      {super.key, required this.selectedProduct, required this.onEdit});

  @override
  State<TBProductEditScreen> createState() => _TBProductEditScreenState();
}

class _TBProductEditScreenState extends State<TBProductEditScreen> {
  late String? _companySelection;
  late String? _categorySelection;
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();
  final TextEditingController _discountTextEditingController =
      TextEditingController();
  final TextEditingController _priceTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameTextEditingController.text = widget.selectedProduct.name;
    _companySelection = widget.selectedProduct.company;
    _categorySelection = widget.selectedProduct.category;
    _descriptionTextEditingController.text = widget.selectedProduct.description;
    _discountTextEditingController.text =
        widget.selectedProduct.discount.toStringAsFixed(2);
    _priceTextEditingController.text =
        widget.selectedProduct.price.toStringAsFixed(2);

    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TBAppBar(
        title: Text("Edit product"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TBGallery.url(
                images: [widget.selectedProduct.image],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        TBDimensions.productDetailsScreen.contentPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TBTextInput(
                        textEditingController: _nameTextEditingController,
                        label: "Product name",
                        validator: (value) {
                          if (value == null) {
                            return "Cannot be empty!";
                          } else if (value.isEmpty) {
                            return "Cannot be empty!";
                          } else if (value.contains(" ") &&
                              !value.contains(RegExp(r'[A-Z]|[a-z]|[1-9]'))) {
                            return "Cannot be empty!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TBSelectInput(
                        label: "Company",
                        selectedItem: _companySelection,
                        onTap: (String? value) {
                          setState(() {
                            _companySelection = value;
                          });
                        },
                        suffixIcon: Icon(Icons.business_rounded),
                        validator: (value) {
                          if (value == null) {
                            return "Cannot be empty!";
                          } else if (value.isEmpty) {
                            return "Cannot be empty!";
                          }
                          return null;
                        },
                        items: [
                          TBPickerListItemModel(name: "Apple"),
                          TBPickerListItemModel(name: "Samsung"),
                          TBPickerListItemModel(name: "Xiaomi"),
                          TBPickerListItemModel(name: "Realme"),
                          TBPickerListItemModel(name: "Oneplus")
                        ],
                      ),
                      const SizedBox(height: 20),
                      TBSelectInput(
                        label: "Category",
                        selectedItem: _categorySelection,
                        onTap: (String? value) {
                          setState(() {
                            _categorySelection = value;
                          });
                        },
                        suffixIcon: Icon(Icons.category_outlined),
                        validator: (value) {
                          if (value == null) {
                            return "Cannot be empty!";
                          } else if (value.isEmpty) {
                            return "Cannot be empty!";
                          }
                          return null;
                        },
                        items: [
                          TBPickerListItemModel(name: "Smartphones"),
                          TBPickerListItemModel(name: "Laptops"),
                          TBPickerListItemModel(name: "Video Games"),
                          TBPickerListItemModel(name: "Audio"),
                          TBPickerListItemModel(name: "Appliances")
                        ],
                      ),
                      const SizedBox(height: 20),
                      TBTextInput(
                        maxLines: 6,
                        minLines: 6,
                        textEditingController:
                            _descriptionTextEditingController,
                        label: "Description",
                        validator: (value) {
                          if (value == null) {
                            return "Cannot be empty!";
                          } else if (value.isEmpty) {
                            return "Cannot be empty!";
                          } else if (value.contains(" ") &&
                              !value.contains(RegExp(r'[A-Z]|[a-z]|[1-9]'))) {
                            return "Cannot be empty!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TBTextInput(
                              textEditingController:
                                  _discountTextEditingController,
                              label: "Discount",
                              suffixText: "%",
                              validator: (value) {
                                if (value == null) {
                                  return "Cannot be empty!";
                                } else if (value.isEmpty) {
                                  return "Cannot be empty!";
                                } else if (value.contains(" ") &&
                                    !value.contains(
                                        RegExp(r'[A-Z]|[a-z]|[1-9]'))) {
                                  return "Cannot be empty!";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TBTextInput(
                              textEditingController:
                                  _priceTextEditingController,
                              label: "Price",
                              suffixText: "\$",
                              validator: (value) {
                                if (value == null) {
                                  return "Cannot be empty!";
                                } else if (value.isEmpty) {
                                  return "Cannot be empty!";
                                } else if (value.contains(" ") &&
                                    !value.contains(
                                        RegExp(r'[A-Z]|[a-z]|[1-9]'))) {
                                  return "Cannot be empty!";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TBButton(
                        text: "Save changes",
                        type: TBButtonType.filled,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.onEdit.call(
                              TBProductModel(
                                name: _nameTextEditingController.text.trim(),
                                company: _companySelection!,
                                category: _categorySelection!,
                                description: _descriptionTextEditingController
                                    .text
                                    .trim(),
                                discount: double.parse(
                                    _discountTextEditingController.text.trim()),
                                price: double.parse(
                                    _priceTextEditingController.text.trim()),
                                image: widget.selectedProduct.image,
                                onStock: widget.selectedProduct.onStock,
                                rating: widget.selectedProduct.rating,
                              ),
                            );
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => TBAlertDialog.success(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                  },
                                  message:
                                      "The product has been successfully edited!"),
                            );
                          } else {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => TBAlertDialog.error(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  message:
                                      "Something went wrong while editing product!"),
                            );
                          }
                        },
                      ),
                    ],
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
