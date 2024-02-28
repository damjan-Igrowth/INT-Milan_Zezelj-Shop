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
  List<String> images;

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
        price = json["price"],
        discountPercentage = json["discountPercentage"],
        rating = json["rating"],
        stock = json["stock"],
        brand = json["brand"],
        category = json["category"],
        thumbnail = json["thumbnail"],
        images = json["images"];
}
