import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/texts/regular_text.dart';
import 'package:url_shortener/core/common_widgets/texts/subtitle_text.dart';
import 'package:url_shortener/core/constants/colors.dart';

/// Use this widget to display a detail about a URL with formatted texts
///
/// 1. [labelText] --> Detail label text (subtitle)
/// 2. [detailText] --> Detail data
class URLDetailText extends StatefulWidget {
  final String labelText;
  final String detailText;

  const URLDetailText({
    Key? key,
    required this.labelText,
    required this.detailText,
  }) : super(key: key);

  @override
  State<URLDetailText> createState() => _URLDetailTextState();
}

class _URLDetailTextState extends State<URLDetailText> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 5.0,),
            child: SubtitleText(
              text: widget.labelText,
              color: BrandColors.white,
            ),
          ),

          LimitedBox(
            maxWidth: 300,
            child: RegularText(
              text: widget.detailText,
            ),
          ),
        ],
      ),
    );
  }
}
