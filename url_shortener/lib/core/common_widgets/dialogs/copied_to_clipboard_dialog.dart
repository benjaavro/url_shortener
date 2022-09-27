import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/core/common_widgets/texts/subtitle_text.dart';
import 'package:url_shortener/core/constants/colors.dart';
import 'package:url_shortener/core/constants/strings.dart';

Future<void> copiedToClipboardDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 55.0),
                child: Text(
                  AppStrings.copiedToClipboardMessage,
                  style: GoogleFonts.roboto(
                    color: BrandColors.darkGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const SubtitleText(
              text: AppStrings.goBackLabel,
              color: BrandColors.babyBlue,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
