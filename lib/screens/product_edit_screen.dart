import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/providers/product_list_provider.dart';
import 'package:tech_byte/providers/product_provider.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/validators.dart';
import 'package:tech_byte/widgets/alert_dialog_widget.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/select_input_widget.dart';
import 'package:tech_byte/widgets/text_input_widget.dart';

class TBProductEditScreen extends ConsumerStatefulWidget {
  final void Function(TBProductModel) onEdit;
  final TBProductModel selectedProduct;
  const TBProductEditScreen(
      {super.key, required this.selectedProduct, required this.onEdit});

  @override
  ConsumerState<TBProductEditScreen> createState() =>
      _TBProductEditScreenState();
}

class _TBProductEditScreenState extends ConsumerState<TBProductEditScreen> {
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
    _descriptionTextEditingController.dispose();
    _discountTextEditingController.dispose();
    _priceTextEditingController.dispose();
    if (_formKey.currentState != null) {
      _formKey.currentState!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<TBProductModel> selectedProduct =
        ref.watch(productProvider(widget.selectedProduct.id));
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
              SizedBox(
                  height: TBDimensions.productEditDetailsScreen.contentSpacing),
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
                        validator: textInputValidator,
                      ),
                      SizedBox(
                          height: TBDimensions
                              .productEditDetailsScreen.contentSpacing),
                      TBSelectInput(
                        label: "Company",
                        selectedItem: _companySelection,
                        onTap: (String? value) {
                          setState(() {
                            _companySelection = value;
                          });
                        },
                        suffixIcon: Icon(Icons.business_rounded),
                        validator: selectInputValidator,
                        items: [
                          TBPickerListItemModel(name: "Apple"),
                          TBPickerListItemModel(name: "Samsung"),
                          TBPickerListItemModel(name: "Xiaomi"),
                          TBPickerListItemModel(name: "Realme"),
                          TBPickerListItemModel(name: "Oneplus")
                        ],
                      ),
                      SizedBox(
                          height: TBDimensions
                              .productEditDetailsScreen.contentSpacing),
                      TBSelectInput(
                        label: "Category",
                        selectedItem: _categorySelection,
                        onTap: (String? value) {
                          setState(() {
                            _categorySelection = value;
                          });
                        },
                        suffixIcon: Icon(Icons.category_outlined),
                        validator: selectInputValidator,
                        items: [
                          TBPickerListItemModel(name: "Smartphones"),
                          TBPickerListItemModel(name: "Laptops"),
                          TBPickerListItemModel(name: "Video Games"),
                          TBPickerListItemModel(name: "Audio"),
                          TBPickerListItemModel(name: "Appliances")
                        ],
                      ),
                      SizedBox(
                          height: TBDimensions
                              .productEditDetailsScreen.contentSpacing),
                      TBTextInput(
                        maxLines: 6,
                        minLines: 6,
                        textEditingController:
                            _descriptionTextEditingController,
                        label: "Description",
                        validator: textInputValidator,
                      ),
                      SizedBox(
                          height: TBDimensions
                              .productEditDetailsScreen.contentSpacing),
                      Row(
                        children: [
                          Expanded(
                            child: TBTextInput(
                              textEditingController:
                                  _discountTextEditingController,
                              label: "Discount",
                              suffixText: "%",
                              validator: textInputValidator,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TBTextInput(
                                textEditingController:
                                    _priceTextEditingController,
                                label: "Price",
                                suffixText: "\$",
                                validator: textInputValidator),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: TBDimensions
                              .productEditDetailsScreen.contentSpacing),
                      TBButton(
                        isLoading: switch (selectedProduct) {
                          AsyncLoading() => true,
                          _ => false,
                        },
                        text: "Save changes",
                        type: TBButtonType.filled,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(productProvider(widget.selectedProduct.id)
                                    .notifier)
                                .edit(
                                  TBProductModel(
                                    id: widget.selectedProduct.id,
                                    name:
                                        _nameTextEditingController.text.trim(),
                                    company: _companySelection!,
                                    category: _categorySelection!,
                                    description:
                                        _descriptionTextEditingController.text
                                            .trim(),
                                    discount: double.parse(
                                        _discountTextEditingController.text
                                            .trim()),
                                    price: double.parse(
                                        _priceTextEditingController.text
                                            .trim()),
                                    image: widget.selectedProduct.image,
                                    onStock: widget.selectedProduct.onStock,
                                    rating: widget.selectedProduct.rating,
                                  ),
                                )
                                .then((value) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => TBAlertDialog.success(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .popUntil((route) => route.isFirst);
                                      ref
                                          .read(productListProvider.notifier)
                                          .fetchProducts();
                                    },
                                    message:
                                        "The product has been successfully edited!"),
                              );
                            });
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
