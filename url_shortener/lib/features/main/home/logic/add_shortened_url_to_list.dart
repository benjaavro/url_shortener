import 'package:url_shortener/core/models/url_model.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';

List<URL> addApiResultoToList(URLsListProvider urLsListProvider, Map apiResult) {
  // 1. Parse from JSON to URL Model
  URL newUrlObject = URL.fromJson(apiResult);

  // 2. Add new object to URLs list
  urLsListProvider.addUrlDataToList(newUrlObject);

  // 3. Return newest list
  List<URL> updatedList = urLsListProvider.urlsList;
  return updatedList;
}