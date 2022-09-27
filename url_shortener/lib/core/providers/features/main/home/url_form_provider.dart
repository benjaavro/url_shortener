import 'package:flutter/material.dart';

class URLFormProvider with ChangeNotifier {
  String _url = "";
  bool _loading = false;

  String get url => _url;
  bool get loading => _loading;

  void storeUrlInput(String inputUrl) {
    _url = inputUrl;
    notifyListeners();
  }

  void changeLoadingValue() {
    _loading = !_loading;
    notifyListeners();
  }

  void clearUrlInput() {
    _url = "";
    notifyListeners();
  }
}