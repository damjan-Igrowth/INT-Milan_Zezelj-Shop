class TBProductModel {
  int id;
  String title;
  String description;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  late List<String> images;

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

  TBProductModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        description = json["description"],
        price = json["price"].toDouble(),
        discountPercentage = json["discountPercentage"].toDouble(),
        rating = json["rating"].toDouble(),
        stock = json["stock"].toInt(),
        brand = json["brand"],
        category = json["category"],
        thumbnail = json["thumbnail"] {
    images = [for (final image in json["images"]) image.toString()];
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "price": price.toStringAsFixed(2),
      "discountPercentage": discountPercentage.toStringAsFixed(2),
      "brand": brand,
      "category": category,
    };
  }
}
