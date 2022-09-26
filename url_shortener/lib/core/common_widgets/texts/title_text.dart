import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/core/constants/colors.dart';

/// Use this text widget to create titles
///
/// 1. [text] --> Text that will be displayed
class TitleText extends StatelessWidget {
  final String text;

  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: BrandColors.babyBlue,
      ),
    );
  }
}
