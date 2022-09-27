import 'package:flutter/material.dart';

class URLFormProvider with ChangeNotifier {
  String _url = "";

  String get url => _url;
}