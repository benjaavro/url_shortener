import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:url_shortener/core/services/api/url_shortening_api_service.dart';

void main() {
  group('shortenUrlWithAPI', () {
    test('returns shorten URL json result when http response is successful', () async {
      const requestRoute = "api/alias";

      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final Map response = {
          "alias": "13460",
          "_links": {
            "self":
                "https://www.youtube.com/watch?v=9240juCrcyo&list=WL&index=11&t=4s",
            "short": "https://url-shortener-nu.herokuapp.com/short/13460"
          }
        };

        return Response(jsonEncode(response), 200);
      });

      // Check whether urlShorteningService function returns
      // shortened URL data, which will be a Map
      expect(await urlShorteningApiService(mockHTTPClient, requestRoute),
          isA<Map>());
    });

    test('return error message when http request has no route or route is empty', () async {
      const requestRoute = "";

      // Mock the API call to return an
      // empty json response with http status 415
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });

      expect(await urlShorteningApiService(mockHTTPClient, requestRoute), {});
    });

    test('return error message when http request body is empty', () async {
      const requestRoute = "api/alias";

      // Mock the API call to return an
      // empty json response with http status 415
      final mockHTTPClient = MockClient((request) async {
        final response = {
          "error": "Please use application/json and provide a url in the url field"
        };
        return Response(jsonEncode(response), 415);
      });

      expect(
        await urlShorteningApiService(mockHTTPClient, requestRoute),
        {
          "error":
              "Please use application/json and provide a url in the url field"
        },
      );
    });
  });
}
