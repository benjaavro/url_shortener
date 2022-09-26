import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Use this text widget to create subtitles
///
/// 1. [text] --> Text that will be displayed
/// 2. [color] --> Color of displayed text
class SubtitleText extends StatelessWidget {
  final String text;
  final Color color;

  const SubtitleText({
    Key? key,
    required this.text,
    required this.color,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
