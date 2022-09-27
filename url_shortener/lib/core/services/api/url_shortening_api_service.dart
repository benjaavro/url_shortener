import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> urlShorteningApiService(http.Client http, String requestRoute) async {
  Uri urlShorteningApiUri = Uri.parse("https://url-shortener-nu.herokuapp.com/$requestRoute");
  final response = await http.get(urlShorteningApiUri);

  if (response.statusCode == 200) {
    final Map urlJSON = jsonDecode(response.body);
    return urlJSON;

  } else if(response.statusCode == 415) {
    return {
      "error": "Please use application/json and provide a url in the url field"
    };
  } else {
    return {};
  }
}