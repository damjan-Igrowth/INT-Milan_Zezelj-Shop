import "dart:convert";

import "package:http/http.dart";
import "package:tech_byte/models/product_model.dart";
import "package:http/http.dart" as http;

String _host = "dummyjson.com";

Uri _getUrl(String path, {Map<String, dynamic>? queryParameters}) {
  return Uri(
    scheme: "https",
    host: "dummyjson.com",
    path: path,
    queryParameters: queryParameters,
  );
}

Future<List<TBProductModel>> getProducts() async {
  final response = await http.get(_getUrl("/products"));

  return [
    for (final product in jsonDecode(response.body)["products"])
      TBProductModel.fromJson(product)
  ];
}

Future<TBProductModel> getProduct(int id) async {
  final response = await http.get(_getUrl("/products/$id"));

  return TBProductModel.fromJson(jsonDecode(response.body));
}
