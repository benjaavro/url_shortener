import 'package:flutter/material.dart';
import 'package:url_shortener/core/constants/colors.dart';

/// Use this button when you need a transparent background icon button
///
/// 1. [function] --> It is the method it executes when onPressed
/// 2. [icon] --> Icon displayed on button
class FilledIconButton extends StatelessWidget {
  final VoidCallback function;
  final IconData icon;
  final Color backgroundColor;

  const FilledIconButton({
    Key? key,
    required this.function,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
            elevation: 10,
          ),
          child: Center(
            child: Icon(
              icon,
              color: BrandColors.black,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
