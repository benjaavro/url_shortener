import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/cards/url_details_card/url_details_card.dart';
import 'package:url_shortener/core/common_widgets/texts/title_text.dart';
import 'package:url_shortener/core/constants/colors.dart';

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
          TitleText(
            text: "URL Shortener App",
          ),
          URLDetailsCard(
            alias: "654987",
            original: "https://www.youtube.com/watch?v=9240juCrcyo&list=WL&index=11&t=4s",
            shortened: "https://url-shortener-nu.herokuapp.com",
          ),
        ],
      ),
    );
  }
}
