import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:tech_byte/utils/api.dart" as api;

part "product_list_provider.g.dart";

@riverpod
class ProductList extends _$ProductList {
  Future<List<TBProductModel>> fetchProducts() async {
    List<TBProductModel> products = await api.getProducts();
    return products;
  }

  @override
  FutureOr<List<TBProductModel>> build() async {
    return fetchProducts();
  }
}
