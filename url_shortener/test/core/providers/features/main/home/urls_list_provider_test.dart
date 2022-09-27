import 'package:flutter_test/flutter_test.dart';
import 'package:url_shortener/core/models/url_model.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';

void main() {
  group("URLs List Provider", () {
    test('should add URL object successfully to Provider list', () async {
      URLsListProvider urlsListProvider = URLsListProvider();

      urlsListProvider.addUrlDataToList(URL("", "", ""));

      expect(urlsListProvider.urlsList.length == 1, true);
    });

    test('should delete URLs list on Provider', () async {
      URLsListProvider urlsListProvider = URLsListProvider();

      urlsListProvider.clearUrlsList();

      expect(urlsListProvider.urlsList.isEmpty, true);
    });
  });
}