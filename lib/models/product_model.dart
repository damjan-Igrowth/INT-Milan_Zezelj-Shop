class TBProduct {
  String name;
  String company;
  String category;
  String description;
  double price;
  double discount;
  double rating;
  int onStock;
  String image;

  TBProduct.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        company = json["company"],
        category = json["category"],
        description = json["description"],
        price = json["price"],
        discount = json["discount"],
        rating = json["rating"],
        onStock = json["onStock"],
        image = json["image"];
}

TBProduct product = TBProduct.fromJson({
  "name": "iPhone 15 Pro",
  "company": "Apple",
  "category": "Smartphone",
  "description":
      "Lorem ipsum dolor sit amet consectetur. Ornare id ullamcorper et non. Massa in urna volutpat sed sagittis eget. Nullam sollicitudin viverra egestas ante. Vitae blandit.",
  "price": 999.0,
  "discount": 12.5,
  "rating": 3.67,
  "onStock": 17,
  "image":
      "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png"
});
