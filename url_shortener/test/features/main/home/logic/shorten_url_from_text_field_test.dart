import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/models/url_model.dart';
import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/features/main/home/logic/shorten_url_from_text_field.dart';
import 'package:url_shortener/main.dart';

void main() {
  group("shortenUrlFromTextFieldTest", () {
    testWidgets('should return a List of URLs objects on URL shorten request', (WidgetTester tester) async {
      // Init method's parameters
      URLsListProvider urLsListProvider = URLsListProvider();
      URLFormProvider urlFormProvider = URLFormProvider();
      TextEditingController textEditingController = TextEditingController();

      // Create mock HTTP Client with desired request result
      MockClient mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        Map response = {
          "alias": "13460",
          "_links": {
            "self": "https://www.youtube.com/watch?v=9240juCrcyo&list=WL&index=11&t=4s",
            "short": "https://url-shortener-nu.herokuapp.com/short/13460"
          }
        };

        return Response(jsonEncode(response), 200);
      });

      // Initialize Widget tree with required Providers
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<URLsListProvider>(create: (_) => urLsListProvider),
            ChangeNotifierProvider<URLFormProvider>(create: (_) => urlFormProvider),
          ],
          child: Builder(
            builder: (_) {
              return const MyApp();
            },
          ),
        ),
      );

      // Check whether shortenUrlFromTextField function returns
      // data, which is expected to be a List<URL>
      expect(
        await shortenUrlFromTextField(
          urLsListProvider,
          urlFormProvider,
          textEditingController,
          mockHTTPClient,
        ),
        isA<List<URL>>(),
      );

    });

    testWidgets('should have a List of URLs objects  with +1 length after URL shorten request', (WidgetTester tester) async {
      // Init method's parameters
      URLsListProvider urLsListProvider = URLsListProvider();
      URLFormProvider urlFormProvider = URLFormProvider();
      TextEditingController textEditingController = TextEditingController();

      // Create mock HTTP Client with desired request result
      MockClient mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        Map response = {
          "alias": "13460",
          "_links": {
            "self": "https://www.youtube.com/watch?v=9240juCrcyo&list=WL&index=11&t=4s",
            "short": "https://url-shortener-nu.herokuapp.com/short/13460"
          }
        };

        return Response(jsonEncode(response), 200);
      });

      // Initialize Widget tree with required Providers
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<URLsListProvider>(create: (_) => urLsListProvider),
            ChangeNotifierProvider<URLFormProvider>(create: (_) => urlFormProvider),
          ],
          child: Builder(
            builder: (_) {
              return const MyApp();
            },
          ),
        ),
      );

      // Execute a URL shorten operation to use its result for testing
      await shortenUrlFromTextField(
        urLsListProvider,
        urlFormProvider,
        textEditingController,
        mockHTTPClient,
      );


      // Check whether shortenUrlFromTextField function works as expected.
      // After being called it is expected to have a List of URLS with length
      // greater than 0
      expect(
        urLsListProvider.urlsList.length,
        greaterThan(0),
      );
    });
  });
}
