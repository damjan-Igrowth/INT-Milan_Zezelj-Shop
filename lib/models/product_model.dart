import "package:json_annotation/json_annotation.dart";

part "product_model.g.dart";

@JsonSerializable()
class TBProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  TBProductModel(
      {required this.id,
      required this.title,
      required this.brand,
      required this.category,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.stock,
      required this.rating,
      required this.thumbnail,
      required this.images});

  factory TBProductModel.fromJson(Map<String, dynamic> json) =>
      _$TBProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$TBProductModelToJson(this);
}
