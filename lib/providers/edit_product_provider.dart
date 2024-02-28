import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/providers/product_list_provider.dart";
import "package:tech_byte/providers/product_provider.dart";

part "edit_product_provider.g.dart";

enum EditProductStateType { idle, loading, success, error }

@riverpod
class EditProduct extends _$EditProduct {
  @override
  EditProductStateType build(int id) {
    return EditProductStateType.idle;
  }

  void edit(TBProductModel newProduct) async {
    state = EditProductStateType.loading;
    try {
      await Future.delayed(const Duration(seconds: 3));
      ref.read(productProvider(newProduct.id).notifier).fetchProduct(id);

      ref.read(productListProvider.notifier).update((products) => products = [
            for (final product in products)
              product.id == newProduct.id ? newProduct : product
          ]);
      state = EditProductStateType.success;
    } catch (error) {
      state = EditProductStateType.error;
    }
  }
}
