import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/utils/api.dart" as api;

part "product_list_provider.g.dart";

@riverpod
class ProductList extends _$ProductList {
  @override
  FutureOr<List<TBProductModel>> build() async {
    return fetchProducts();
  }

  Future<List<TBProductModel>> fetchProducts() async {
    try {
      List<TBProductModel> products = await api.getProducts();
      state = AsyncValue.data(products);
      return products;
    } catch (error) {
      rethrow;
    }
  }
}
