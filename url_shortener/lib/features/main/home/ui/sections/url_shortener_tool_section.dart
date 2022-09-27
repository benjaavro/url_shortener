import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/common_widgets/buttons/filled_icon_button.dart';
import 'package:url_shortener/core/common_widgets/text_fields/full_width_text_field.dart';
import 'package:url_shortener/core/common_widgets/texts/subtitle_text.dart';
import 'package:url_shortener/core/constants/colors.dart';
import 'package:url_shortener/core/constants/strings.dart';
import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/features/main/home/logic/add_shortened_url_to_list.dart';
import 'package:url_shortener/features/main/home/logic/url_shorten_request.dart';

class URLShortenerToolSection extends StatefulWidget {
  const URLShortenerToolSection({Key? key}) : super(key: key);

  @override
  State<URLShortenerToolSection> createState() => _URLShortenerToolSectionState();
}

class _URLShortenerToolSectionState extends State<URLShortenerToolSection> {
  // Initializing this TextEditingController allows us to delete text field data from outer methods.
  final TextEditingController textEditingController = TextEditingController();
  URLsListProvider? urlsListProvider;
  URLFormProvider? urlFormProvider;

  @override
  void initState() {
    // Initialize URL Form data Provider for usage on current widget
    urlFormProvider = Provider.of<URLFormProvider>(context, listen: false);
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
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              children: [
                // URL REQUEST TEXT FIELD
                Expanded(
                  flex: 12,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FullWidthTextField(
                      hintText: AppStrings.urlTextFieldHintSubtitle,
                      fieldController: textEditingController,
                      function: (value) {
                        // 1. Store text field input on Provider to access data from other functions.
                        urlFormProvider!.storeUrlInput(value);
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
                      function: () async {
                        // 1. URL shorten request
                        Map result = await urlShortenRequest(urlFormProvider!.url);

                        // 2. Clear url stored on URL Form Provider
                        urlFormProvider!.clearUrlInput();

                        // 3. Clear Text field
                        textEditingController.clear();

                        // 4. Add URL data to URLs List on Provider
                        addApiResultoToList(urlsListProvider!, result);
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
