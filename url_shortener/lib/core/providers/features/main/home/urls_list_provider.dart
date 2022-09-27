import 'package:flutter/material.dart';
import 'package:url_shortener/core/models/url_model.dart';

class URLsListProvider with ChangeNotifier {
  List<URL> _urlsList = [];

  List<URL> get urlsList => _urlsList;
}