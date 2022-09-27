import 'package:flutter/material.dart';

class URLFormProvider with ChangeNotifier {
  String _url = "";

  String get url => _url;

  void storeUrlInput(String inputUrl) {
    _url = inputUrl;
    notifyListeners();
  }

  void clearUrlInput() {
    _url = "";
    notifyListeners();
  }
}