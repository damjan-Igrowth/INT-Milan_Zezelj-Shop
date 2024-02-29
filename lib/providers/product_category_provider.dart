import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:tech_byte/models/picker_list_item_model.dart";
import "package:tech_byte/utils/api.dart" as api;

part "product_category_provider.g.dart";

@riverpod
class ProductCategory extends _$ProductCategory {
  @override
  FutureOr<List<TBPickerListItemModel>> build() {
    return fetchCategories();
  }

  Future<List<TBPickerListItemModel>> fetchCategories() async {
    final categoriesRaw = await api.getProductCategories();
    final categories = [
      for (final category in categoriesRaw)
        TBPickerListItemModel(name: category)
    ];
    return Future.value(categories);
  }
}
