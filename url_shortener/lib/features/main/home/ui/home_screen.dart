import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/buttons/filled_icon_button.dart';
import 'package:url_shortener/core/common_widgets/buttons/icon_button.dart';
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
        children: [
          const TitleText(
            text: "URL Shortener App",
          ),
          const SubtitleText(
            text: "This is a bold grey subtitle",
            color: BrandColors.lightGrey,
          ),
          const SubtitleText(
            text: "This is a bold white subtitle",
            color: BrandColors.white,
          ),
          const RegularText(
            text: "This is dummy data text with regular format",
          ),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: SimpleIconButton(
                  function: () {},
                  icon: Icons.copy,
                  iconColor: BrandColors.white,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: FilledIconButton(
                    function: () {},
                    icon: Icons.send_rounded,
                    backgroundColor: BrandColors.babyBlue,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
