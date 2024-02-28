import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/providers/product_list_provider.dart";

part "product_provider.g.dart";

@riverpod
class Product extends _$Product {
  @override
  FutureOr<TBProductModel> build(int id) async {
    return fetchProduct(id);
  }

  Future<TBProductModel> fetchProduct(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    List<TBProductModel> products = ref.read(productListProvider).value!;
    state = AsyncValue.data(products.firstWhere((element) => element.id == id));

    return products.firstWhere((element) => element.id == id);
  }
}
