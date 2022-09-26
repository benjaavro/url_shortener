import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/core/constants/colors.dart';

/// Use this text field to let user input data
///
/// 1. [function] --> It is the method it executes when onChanged
/// 2. [fieldController] --> Text Field's Controller (optional)
class FullWidthTextField extends StatefulWidget {
  final dynamic function;
  final TextEditingController? fieldController;

  const FullWidthTextField({
    Key? key,
    required this.function,
    this.fieldController,
  }) : super(key: key);

  @override
  State<FullWidthTextField> createState() => _FullWidthTextFieldState();
}

class _FullWidthTextFieldState extends State<FullWidthTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.fieldController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: BrandColors.babyBlue,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: BrandColors.babyBlue,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: BrandColors.babyBlue,
              width: 2.5,
            ),
          ),
        ),
        style: GoogleFonts.roboto(
          color: BrandColors.babyBlue,
        ),
        cursorColor: BrandColors.lightGrey,
        onChanged: widget.function,
      ),
    );
  }
}
