import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";

part "product_provider.g.dart";

@riverpod
class Product extends _$Product {
  Future<TBProductModel> fetchProduct(int id) async {
    await Future.delayed(Duration(seconds: 2));
    List<TBProductModel> products = [
      product1,
      product2,
      product3,
    ];

    return products.firstWhere((element) => element.id == id);
  }

  @override
  FutureOr<TBProductModel> build(int id) async {
    return fetchProduct(id);
  }

  Future<void> edit(TBProductModel product) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 3));
      return product;
    });
  }
}
