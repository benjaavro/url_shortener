import 'package:url_shortener/core/services/api/url_shortening_api_service.dart';
import 'package:http/http.dart' as http;

/// [urlShortenRequest] METHOD
/// Gets stored url and requests URL shortening to service on domain layer
///
/// 1. [storedUrl] --> Provider required to clear
Future<Map> urlShortenRequest(String storedUrl) async {
  // 1. Initialize data for request
  String requestRoute = "api/alias";
  Map<String, dynamic> requestBody = {
    "url": storedUrl,
  };

  // 2. Create request
  Map response = await urlShorteningApiService(http.Client(), requestRoute, requestBody);

  // 3. Return response got from service
  return response;
}