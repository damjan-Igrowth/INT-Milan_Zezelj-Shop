import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/product_model.dart";
import "package:http/http.dart" as http;
import "package:tech_byte/utils/api.dart" as api;

part "product_list_provider.g.dart";

@riverpod
class ProductList extends _$ProductList {
  Future<List<TBProductModel>> fetchProducts() async {
    await Future.delayed(Duration(seconds: 2));
    List<TBProductModel> products = [
      product1,
      product2,
      product3,
    ];
    // if (state.hasValue) {
    //   state = AsyncValue.data(state.value!);
    // }
    return products;
  }

  @override
  FutureOr<List<TBProductModel>> build() async {
    return fetchProducts();
  }
}
