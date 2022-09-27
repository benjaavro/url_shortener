import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/buttons/filled_icon_button.dart';
import 'package:url_shortener/core/common_widgets/text_fields/full_width_text_field.dart';
import 'package:url_shortener/core/common_widgets/texts/subtitle_text.dart';
import 'package:url_shortener/core/constants/colors.dart';
import 'package:url_shortener/core/constants/strings.dart';

class URLShortenerToolSection extends StatefulWidget {
  const URLShortenerToolSection({Key? key}) : super(key: key);

  @override
  State<URLShortenerToolSection> createState() => _URLShortenerToolSectionState();
}

class _URLShortenerToolSectionState extends State<URLShortenerToolSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // URL SHORTEN HINT SUBTITLE
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SubtitleText(
                text: AppStrings.shortenHintSubtitle,
                color: BrandColors.white,
              ),
            ],
          ),

          // URL SHORTEN TOOLS ROW
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 15.0),
            child: Row(
              children: [
                // URL REQUEST TEXT FIELD
                Expanded(
                  flex: 12,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FullWidthTextField(
                      hintText: AppStrings.urlTextFieldHintSubtitle,
                      function: (value) {
                        // TODO Create URL store feature
                      },
                    ),
                  ),
                ),

                // URL REQUEST BUTTON
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FilledIconButton(
                      icon: Icons.send,
                      backgroundColor: BrandColors.babyBlue,
                      function: () {
                        // TODO Create URL shorten request feature
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // UI HELPER FOR iOS MENU BUTTON
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
