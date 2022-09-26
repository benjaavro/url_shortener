import 'package:flutter/material.dart';
import 'package:url_shortener/core/constants/colors.dart';

class SimpleIconButton extends StatelessWidget {
  final VoidCallback function;
  final IconData icon;
  final Color iconColor;

  const SimpleIconButton({
    Key? key,
    required this.function,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: BrandColors.babyBlue,
      onPressed: function,
      icon: Icon(
        icon,
        color: iconColor,
        size: 28,
      ),
    );
  }
}
