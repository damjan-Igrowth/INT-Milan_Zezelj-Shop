import "package:http/http.dart";
import "package:tech_byte/models/product_model.dart";
import "package:http/http.dart" as http;

String _host = "dummyjson.com";

Uri _getUrl(String path, Map<String, dynamic>? queryParameters) {
  return Uri(
    scheme: "https",
    host: "dummyjson.com",
    path: path,
    queryParameters: queryParameters,
  );
}

// Future<List<TBProductModel>> getProducts() async {
//   final response = http.get(); 
// }