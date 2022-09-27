import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:url_shortener/core/models/url_model.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/features/main/home/logic/add_shortened_url_to_list.dart';

class MockURLsListProvider extends Mock implements URLsListProvider {}
class MockBuildContext extends Mock implements BuildContext {}

void main() {
  // test('should return urls list when added new shortened url', () async {
  //   MockURLsListProvider mockURLsListProvider = MockURLsListProvider();
  //
  //   final Map mockResponse = {
  //     "alias": "13460",
  //     "_links": {
  //       "self":
  //           "https://www.youtube.com/watch?v=9240juCrcyo&list=WL&index=11&t=4s",
  //       "short": "https://url-shortener-nu.herokuapp.com/short/13460"
  //     }
  //   };
  //
  //   dynamic actual = addApiResultoToList(mockURLsListProvider, mockResponse);
  //   expect(actual, isA<List<URL>>());
  // });
}
