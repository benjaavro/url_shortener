import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/common_widgets/cards/url_details_card/url_details_card.dart';
import 'package:url_shortener/core/models/url_model.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';

class URLsListSection extends StatefulWidget {
  const URLsListSection({Key? key}) : super(key: key);

  @override
  State<URLsListSection> createState() => _URLsListSectionState();
}

class _URLsListSectionState extends State<URLsListSection> {
  @override
  Widget build(BuildContext context) {
    // 1. Consumer Widget allows to active listen every change occurred on URLsListProvider,
    // this allow us to display on real time any change on list with easy state management.
    return Consumer<URLsListProvider>(
      builder: (context, providerData, _) {
        // 2. Use provider read data to display list of shortened URLs
        return ListView.builder(
          itemCount: providerData.urlsList.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            // 3. Use each list element to display a details Card
            URL urlData = providerData.urlsList[index];

            return URLDetailsCard(
              alias: urlData.alias,
              original: urlData.originalURL,
              shortened: urlData.shortenedURL,
            );

          },
        );
      },
    );
  }
}
