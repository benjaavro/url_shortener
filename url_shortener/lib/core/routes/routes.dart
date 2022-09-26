import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_shortener/core/constants/routes_names.dart';
import 'package:url_shortener/features/main/home/ui/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => const CircularProgressIndicator());
  }
}