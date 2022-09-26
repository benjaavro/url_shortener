import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/texts/regular_text.dart';
import 'package:url_shortener/core/common_widgets/texts/subtitle_text.dart';
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
          SubtitleText(
            text: "This is a bold grey subtitle",
            color: BrandColors.lightGrey,
          ),
          SubtitleText(
            text: "This is a bold white subtitle",
            color: BrandColors.white,
          ),
          RegularText(
            text: "This is dummy data text with regular format",
          ),
        ],
      ),
    );
  }
}
