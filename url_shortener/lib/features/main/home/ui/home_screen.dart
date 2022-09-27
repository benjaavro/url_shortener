import 'package:flutter/material.dart';
import 'package:url_shortener/core/constants/colors.dart';
import 'package:url_shortener/features/main/home/ui/sections/header_section.dart';
import 'package:url_shortener/features/main/home/ui/sections/url_shortener_tool_section.dart';
import 'sections/urls_list_section.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          // APP HEADER
          Expanded(
            flex: 3,
            child: HeaderSection(),
          ),

          // URLs LIST
          Expanded(
            flex: 14,
            child: URLsListSection(),
          ),

          // URLs SHORTENER TOOL
          Expanded(
            flex: 4,
            child: URLShortenerToolSection(),
          ),
        ],
      ),
    );
  }
}
