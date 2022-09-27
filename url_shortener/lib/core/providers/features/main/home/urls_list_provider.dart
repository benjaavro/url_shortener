import 'package:flutter/material.dart';
import 'package:url_shortener/core/models/url_model.dart';

class URLsListProvider with ChangeNotifier {
  final List<URL> _urlsList = [];

  List<URL> get urlsList => _urlsList;

  void addUrlDataToList(URL newUrlData) {
    _urlsList.insert(0, newUrlData);
    notifyListeners();
  }

  void clearUrlsList() {
    _urlsList.clear();
    notifyListeners();
  }
}