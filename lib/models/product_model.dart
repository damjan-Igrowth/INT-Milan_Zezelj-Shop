class TBProductModel {
  String name;
  String company;
  String category;
  String description;
  double price;
  double discount;
  int onStock;
  double rating;
  String image;

  TBProductModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        company = json["company"],
        category = json["company"],
        description = json["description"],
        price = json["price"],
        discount = json["discount"],
        onStock = json["onStock"],
        rating = json["rating"],
        image = json["image"];
}

TBProductModel product = TBProductModel.fromJson({
  "name": "iPhone 15 Pro",
  "company": "Apple",
  "category": "Smartphone",
  "description":
      "Lorem ipsum dolor sit amet consectetur. Ornare id ullamcorper et non. Massa in urna volutpat sed sagittis eget. Nullam sollicitudin viverra egestas ante. Vitae blandit.",
  "price": 999.0,
  "discount": 12.5,
  "onStock": 1700000,
  "rating": 3.85,
  "image":
      "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png"
});
