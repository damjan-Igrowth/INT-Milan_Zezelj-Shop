import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/utils/api.dart" as api;

part "product_provider.g.dart";

@riverpod
class Product extends _$Product {
  @override
  FutureOr<TBProductModel> build(int id) async {
    return fetchProduct(id);
  }

  Future<TBProductModel> fetchProduct(int id) async {
    try {
      TBProductModel product = await api.getProduct(id);
      state = AsyncValue.data(product);
      return product;
    } catch (error) {
      rethrow;
    }
  }
}
