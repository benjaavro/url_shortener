import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/buttons/simple_icon_button.dart';
import 'package:url_shortener/core/common_widgets/cards/url_details_card/url_detail_text.dart';
import 'package:url_shortener/core/constants/colors.dart';
import 'package:url_shortener/core/constants/strings.dart';

/// Use this card to display URLs data in Home Screen
///
/// 1. [alias] --> URL shorten alias (ID)
/// 2. [original] --> Original URL as String
/// 3. [shortened] --> Shortened URL as String
class URLDetailsCard extends StatefulWidget {
  final String alias;
  final String original;
  final String shortened;

  const URLDetailsCard({
    Key? key,
    required this.alias,
    required this.original,
    required this.shortened,
  }) : super(key: key);

  @override
  State<URLDetailsCard> createState() => _URLDetailsCardState();
}

class _URLDetailsCardState extends State<URLDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: BrandColors.darkGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  URLDetailText(
                    labelText: AppStrings.aliasLabel,
                    detailText: widget.alias,
                  ),
                  URLDetailText(
                    labelText: AppStrings.originalLabel,
                    detailText: widget.original,
                  ),
                  URLDetailText(
                    labelText: AppStrings.shortenedLabel,
                    detailText: widget.shortened,
                  ),
                ],
              ),
              SimpleIconButton(
                function: () {
                  // TODO Add copy to clipboard functionality
                },
                icon: Icons.copy,
                iconColor: BrandColors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
