import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/common_widgets/buttons/simple_icon_button.dart';
import 'package:url_shortener/core/common_widgets/texts/subtitle_text.dart';
import 'package:url_shortener/core/common_widgets/texts/title_text.dart';
import 'package:url_shortener/core/constants/colors.dart';
import 'package:url_shortener/core/constants/strings.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  URLsListProvider? urlsListProvider;

  @override
  void initState() {
    // Initialize URL Form data Provider for usage on current widget
    urlsListProvider = Provider.of<URLsListProvider>(context, listen: false);

    super.initState();
  }

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
                    // 1. List Delete on click
                    urlsListProvider!.clearUrlsList();
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
