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

  TBProductModel(
      {required this.name,
      required this.company,
      required this.category,
      required this.description,
      required this.price,
      required this.discount,
      required this.onStock,
      required this.rating,
      required this.image});

  TBProductModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        company = json["company"],
        category = json["category"],
        description = json["description"],
        price = json["price"],
        discount = json["discount"],
        onStock = json["onStock"],
        rating = json["rating"],
        image = json["image"];
}

TBProductModel product1 = TBProductModel.fromJson({
  "name": "iPhone 15 Pro",
  "company": "Apple",
  "category": "Smartphone",
  "description":
      "Lorem ipsum dolor sit amet consectetur. Ornare id ullamcorper et non. Massa in urna volutpat sed sagittis eget. Nullam sollicitudin viverra egestas ante. Vitae blandit.",
  "price": 999.00,
  "discount": 12.44,
  "onStock": 12,
  "rating": 4.69,
  "image":
      "https://s3-alpha-sig.figma.com/img/3519/2361/d3a8bbe8f61d686237acaa5cebc92f6e?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EmiQa9Xf6LEv4ml2IzD243COk6psIAAvyCMz-vpa1QHyc397Nh92fX8Kxrff32NuqrkaRnuxW~L9udKZ75sS9PgAnfrTFXWLmBsp61ofRPrrIrqSngxcs6VB4qBm5HJbjHaIti9F1CXA92iy2KcQnzFe2xV6J0V2BoMb9IH8eBFVb7HSs1kG3S-PGJSaQ8Foc3QmRIr~WLZEw~n25Qxe4afR~PiPQsMXJrT6-guz7WGJx68Vk36d8o-pKpLhqcoSSPkjWoOLilB50FvbCw8jHavXPeZ53fOl2uwuoJF5~p6mUoXhseuxlmn0Wr~l9wDBeDvWfzBIrWFzztlOlBqioA__"
});

TBProductModel product2 = TBProductModel.fromJson({
  "name": "Samsung S24",
  "company": "Samsung",
  "category": "Smartphone",
  "description":
      "Lorem ipsum dolor sit amet consectetur. Ornare id ullamcorper et non. Massa in urna volutpat sed sagittis eget. Nullam sollicitudin viverra egestas ante. Vitae blandit.",
  "price": 899.00,
  "discount": 22.96,
  "onStock": 12,
  "rating": 5.00,
  "image":
      "https://s3-alpha-sig.figma.com/img/6bda/c53e/73747002d112b5221144e5b027cddd77?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=T3f5VwHWSHxcoZIMiMdT-KIzpXB8jnHTQvj0NyIEbYfGlz-FU4m7ALrE~ONPrF8GjIfFK9wffytkS-mSJFG2A6jen2Zfah~lYu0XcbRs~k0Zlzirix~D5CLUbMFa7125R7b6GX~JyIiQP32gja8my8k85-W8bvsUWYBl2X4zP0jJ~F8CIjikfkD3Vpd5PB-lovBNl3H5x8nDj5ngwSVk~LC-FdHkL8sHIMTOSsTqSnqHifUzbtNHwamFCf0WdSfLiBI-pWuH-cJesS8~jRgh22RP2gRfrYPP~4dALBTk03RjYQlWQnmx-kFNJIUv1cHPXIvLZwLiwESxaqY8aub4fQ__"
});
TBProductModel product3 = TBProductModel.fromJson({
  "name": "Xiaomi 14",
  "company": "Xiaomi",
  "category": "Laptops",
  "description":
      "Lorem ipsum dolor sit amet consectetur. Ornare id ullamcorper et non. Massa in urna volutpat sed sagittis eget. Nullam sollicitudin viverra egestas ante. Vitae blandit.",
  "price": 750.00,
  "discount": 1.50,
  "onStock": 12,
  "rating": 4.00,
  "image":
      "https://s3-alpha-sig.figma.com/img/2ec6/d7d8/8e98f319aeb11bc07b94cd0d1e1d2a68?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LD1ygeyWxf7qkRVNa30Gxz7gEmoRFToQpLpT~gqRCyEkmlApXhRGUy3mhd8Gbc6A-MUiPStuSzODRiUXajA~mTUN4BGb8F9pcwpb8Jd0I-y4hKRuAk6r6DtDayoMAnbICWG-iv8U~BfPhrh99vUdn4SU6~UNgbu7k3YOAJ5BNNGdFNt1y9JhF19Hye-CrCNrKjn27VNi7xaQc3qEUwcslukF1wQgbwgZAmWDr1ZABcJqweCc6XfUVz1ze4fOvRRZzoOCX7y7oC7DVEStWiaEuWTxmjWriYsbeZLMLH344r~J3PIcEgF3h-jEWleNz1rLIYB32eYdjUICkoER96j0Rg__"
});
