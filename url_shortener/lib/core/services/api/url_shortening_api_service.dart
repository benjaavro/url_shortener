import 'package:http/http.dart' as http;
import 'dart:convert';

/// [urlShorteningApiService] METHOD
/// Receives API request data and executes HTTPS request with POST method.
///
/// 1. [http] --> http client used for request
/// 2. [requestRoute] --> API route of method to request
/// 3. [requestBody] --> Request body as Map<String, dynamic>
Future<Map> urlShorteningApiService(http.Client http, String requestRoute, Map<String, dynamic> requestBody) async {
  // 1. Create API Request URI with given route and API's URL
  Uri urlShorteningApiUri = Uri.parse("https://url-shortener-nu.herokuapp.com/$requestRoute");

  // 2. Execute HTTPS POST Request with given data
  final response = await http.post(
    urlShorteningApiUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(requestBody),
  );

  // 3.A Return success
  if (response.statusCode == 200) {
    final Map urlJSON = jsonDecode(response.body);
    return urlJSON;

  } else if (response.statusCode == 415) {
    // 3.B Return this error when body request is empty or incorrect
    return {
      "error": "Please use application/json and provide a url in the url field"
    };

  } else {
    // 3.C Return this error when requested route is empty or incorrect
    return {};
  }
}
