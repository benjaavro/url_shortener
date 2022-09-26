import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/core/constants/colors.dart';

/// Use this text widget to create regular text (paragraphs)
///
/// 1. [text] --> Text that will be displayed
class RegularText extends StatelessWidget {
  final String text;

  const RegularText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: BrandColors.white,
      ),
    );
  }
}
