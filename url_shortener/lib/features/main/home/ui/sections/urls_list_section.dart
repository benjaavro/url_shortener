import 'package:flutter/material.dart';
import 'package:url_shortener/core/common_widgets/cards/url_details_card/url_details_card.dart';

class URLsListSection extends StatefulWidget {
  const URLsListSection({Key? key}) : super(key: key);

  @override
  State<URLsListSection> createState() => _URLsListSectionState();
}

class _URLsListSectionState extends State<URLsListSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: const [
        URLDetailsCard(
          alias: "654987",
          original: "https://www.youtube.com/watch?v=9240juCrcyo &list=WL&index=11&t=4s",
          shortened: "https://url-shortener-nu.herokuapp.com/short/33819",
        ),
      ],
    );
  }
}
