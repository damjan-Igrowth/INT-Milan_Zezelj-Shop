import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";

part "product_list_provider.g.dart";

@riverpod
class ProductList extends _$ProductList {
  @override
  FutureOr<List<TBProductModel>> build() async {
    return fetchProducts();
  }

  Future<List<TBProductModel>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<TBProductModel> products = [
      product1,
      product2,
      product3,
    ];
    state = AsyncValue.data(products);
    return products;
  }
}
