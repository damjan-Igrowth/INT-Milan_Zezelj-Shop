import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_byte/models/picker_list_item_model.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/providers/edit_product_provider.dart';
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
    final productState = ref.read(productProvider(widget.id));

    productState.whenOrNull(data: (product) {
      _nameTextEditingController.text = product.name;
      _companySelection = product.company;
      _categorySelection = product.category;
      _descriptionTextEditingController.text = product.description;
      _discountTextEditingController.text = product.discount.toStringAsFixed(2);
      _priceTextEditingController.text = product.price.toStringAsFixed(2);
    });

    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    _discountTextEditingController.dispose();
    _priceTextEditingController.dispose();

    _formKey.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productProvider(widget.id));
    final editProductState = ref.watch(editProductProvider(widget.id));
    ref.listen(
      editProductProvider(widget.id),
      (previous, next) {
        if (next == EditProductStateType.error) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => TBAlertDialog.error(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                message: "Something went wrong while editing product!"),
          );
        } else if (next == EditProductStateType.success) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => TBAlertDialog.success(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                message: "The product has been successfully edited!"),
          );
        }
      },
    );

    final enabled =
        editProductState == EditProductStateType.loading ? false : true;
    final isLoading = !enabled;

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
                  images: [product.image],
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
                          enabled: enabled,
                          textEditingController: _nameTextEditingController,
                          label: "Product name",
                          validator: textInputValidator,
                        ),
                        SizedBox(
                            height: TBDimensions
                                .productEditDetailsScreen.contentSpacing),
                        TBSelectInput(
                          enabled: enabled,
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
                        TBSelectInput(
                          enabled: enabled,
                          label: "Category",
                          selectedItem: _categorySelection,
                          onTap: (String? value) {
                            setState(() {
                              _categorySelection = value;
                            });
                          },
                          suffixIcon: const Icon(Icons.category_outlined),
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
                          enabled: enabled,
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
                                enabled: enabled,
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
                                  enabled: enabled,
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
                          isLoading: isLoading,
                          text: "Save changes",
                          type: TBButtonType.filled,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ref
                                  .read(
                                      editProductProvider(product.id).notifier)
                                  .edit(
                                    TBProductModel(
                                      id: product.id,
                                      name: _nameTextEditingController.text
                                          .trim(),
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
                                      image: product.image,
                                      onStock: product.onStock,
                                      rating: product.rating,
                                    ),
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
          error: (error, stackTrace) =>
              const Text("Oops, something went wrong!"),
          skipLoadingOnReload: true,
          loading: () => Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: TBColor.app.lightBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
