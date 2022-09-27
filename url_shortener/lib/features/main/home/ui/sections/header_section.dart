import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/buttons/simple_icon_button.dart';
import 'package:url_shortener/core/common_widgets/texts/subtitle_text.dart';
import 'package:url_shortener/core/common_widgets/texts/title_text.dart';
import 'package:url_shortener/core/constants/colors.dart';
import 'package:url_shortener/core/constants/strings.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // APP'S TITLE ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TitleText(
                text: AppStrings.appTitle,
              ),
            ],
          ),

          // APP'S HEADER ROW
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // RECENTLY SHORTENED LIST SUBTITLE
                const SubtitleText(
                  text: AppStrings.shortenedListSubtitle,
                  color: BrandColors.lightGrey,
                ),

                // CLEAR URLS LIST ICON BUTTON
                SimpleIconButton(
                  function: () {
                    // TODO Create List Deletion Feature
                  },
                  icon: Icons.delete,
                  iconColor: BrandColors.lightGrey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
