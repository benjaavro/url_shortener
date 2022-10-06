import 'package:flutter/material.dart';
import 'package:url_shortener/core/models/url_model.dart';
import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/features/main/home/logic/url_shorten_request.dart';
import 'package:http/http.dart' as http;

/// [shortenUrlFromTextField] METHOD
/// Gets stored url and requests URL shortening to service on domain layer
///
/// 1. [urLsListProvider] --> Provider required edit URLs List
/// 2. [urlFormProvider] --> Provider required to get data from form.
/// 3. [textEditingController] --> Controller required to clear text field.
/// 4. [httpClient] --> Http Client required for API Request
Future<List<URL>> shortenUrlFromTextField(URLsListProvider urLsListProvider, URLFormProvider urlFormProvider, TextEditingController textEditingController, http.Client httpClient) async {
  // Show Loading Indicator
  urlFormProvider.changeLoadingValue();

  // 1. URL shorten request
  Map apiResult = await urlShortenRequest(httpClient, urlFormProvider.url);

  // 2. Clear url stored on URL Form Provider
  urlFormProvider.clearUrlInput();

  // 3. Clear Text field
  textEditingController.clear();

  // 4. Parse from JSON to URL Model
  URL newUrlObject = URL.fromJson(apiResult);

  // 5. Add new object to URLs list
  urLsListProvider.addUrlDataToList(newUrlObject);

  // 6. Return newest list
  List<URL> updatedList = urLsListProvider.urlsList;

  // Hide Loading Indicator
  urlFormProvider.changeLoadingValue();

  return updatedList;
}