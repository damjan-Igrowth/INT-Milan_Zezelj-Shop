import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/providers/product_category_provider.dart';
import 'package:tech_byte/providers/product_list_provider.dart';
import 'package:tech_byte/providers/product_provider.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/validators.dart';
import 'package:tech_byte/widgets/alert_dialog_widget.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/gallery_widget.dart';
import 'package:tech_byte/widgets/select_input_widget.dart';
import 'package:tech_byte/widgets/text_input_widget.dart';

class TBProductEditScreen extends ConsumerStatefulWidget {
  final int id;
  const TBProductEditScreen({super.key, required this.id});

  @override
  ConsumerState<TBProductEditScreen> createState() =>
      _TBProductEditScreenState();
}

class _TBProductEditScreenState extends ConsumerState<TBProductEditScreen> {
  late String? _companySelection;
  late String? _categorySelection;
  final TextEditingController _titleTextEditingController =
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
    _titleTextEditingController.text =
        ref.read(productProvider(widget.id)).value!.title;
    _companySelection = ref.read(productProvider(widget.id)).value!.brand;
    _categorySelection = ref.read(productProvider(widget.id)).value!.category;
    _descriptionTextEditingController.text =
        ref.read(productProvider(widget.id)).value!.description;
    _discountTextEditingController.text = ref
        .read(productProvider(widget.id))
        .value!
        .discountPercentage
        .toStringAsFixed(2);
    _priceTextEditingController.text =
        ref.read(productProvider(widget.id)).value!.price.toStringAsFixed(2);
    super.initState();
  }

  @override
  void dispose() {
    _titleTextEditingController.dispose();
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
    final productState = ref.watch(productProvider(widget.id));
    final categoriesState = ref.watch(productCategoryProvider);

    return Scaffold(
      appBar: TBAppBar(
        title: const Text("Edit product"),
      ),
      body: SafeArea(
        child: productState.when(
          data: (product) => SingleChildScrollView(
            child: Column(
              children: [
                TBGallery.url(
                  images: product.images,
                ),
                SizedBox(
                    height:
                        TBDimensions.productEditDetailsScreen.contentSpacing),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          TBDimensions.productDetailsScreen.contentPadding),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TBTextInput(
                          textEditingController: _titleTextEditingController,
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
                          suffixIcon: const Icon(Icons.business_rounded),
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
                        categoriesState.when(
                          data: (categories) => TBSelectInput(
                            label: "Category",
                            selectedItem: _categorySelection,
                            onTap: (String? value) {
                              setState(() {
                                _categorySelection = value;
                              });
                            },
                            suffixIcon: const Icon(Icons.category_outlined),
                            validator: selectInputValidator,
                            items: categories,
                          ),
                          loading: () => TBSelectInput(
                            isLoading: true,
                            label: "Category",
                            selectedItem: _categorySelection,
                            onTap: (String? value) {
                              setState(() {
                                _categorySelection = value;
                              });
                            },
                            suffixIcon: const Icon(Icons.category_outlined),
                            validator: selectInputValidator,
                            items: [],
                          ),
                          error: (error, stackTrace) => Text(
                              "Failed loading categories! ${error.toString()}"),
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
                          isLoading: switch (productState) {
                            AsyncLoading() => true,
                            _ => false,
                          },
                          text: "Save changes",
                          type: TBButtonType.filled,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(productProvider(product.id).notifier)
                                  .edit(
                                    TBProductModel(
                                      id: product.id,
                                      title: _titleTextEditingController.text
                                          .trim(),
                                      brand: _companySelection!,
                                      category: _categorySelection!,
                                      description:
                                          _descriptionTextEditingController.text
                                              .trim(),
                                      discountPercentage: double.parse(
                                          _discountTextEditingController.text
                                              .trim()),
                                      price: double.parse(
                                          _priceTextEditingController.text
                                              .trim()),
                                      thumbnail: product.thumbnail,
                                      stock: product.stock,
                                      rating: product.rating,
                                      images: product.images,
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
          error: (error, stackTrace) => Text(productState.error.toString()),
          loading: () => SizedBox(
            width: MediaQuery.textScalerOf(context).scale(100),
            height: MediaQuery.textScalerOf(context).scale(100),
            child: CircularProgressIndicator(
              color: TBColor.app.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
