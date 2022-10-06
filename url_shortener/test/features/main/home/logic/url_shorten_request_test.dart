import 'package:flutter_test/flutter_test.dart';
import 'package:url_shortener/features/main/home/logic/url_shorten_request.dart';
import 'package:http/http.dart' as http;

void main() {
  group('shortenUrlRequest', () {
    test('should return Map from API service request', () async {
      // Mock the data that is required by urlShortenRequest method
      const String mockUrl = "https://google.com";

      // Check whether urlShortenRequest function returns
      // data, which is expected to be a Map
      expect(await urlShortenRequest(http.Client(), mockUrl), isA<Map>());
    });
  });
}