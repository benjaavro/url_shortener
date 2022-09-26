import 'package:flutter/material.dart';

class BrandColors {
  BrandColors._();


  static const _white = 0xFFF6F6F6;

  static const MaterialColor white = MaterialColor(_white, <int, Color>{
    100: Color(0x66F6F6F6),
    300: Color(0xBBF6F6F6),
    500: Color(_white),
  });


  static const _lightGrey = 0xFF9AA0A6;

  static const MaterialColor lightGrey = MaterialColor(_lightGrey, <int, Color>{
    100: Color(0x669AA0A6),
    300: Color(0xBB9AA0A6),
    500: Color(_lightGrey),
  });


  static const _darkGrey = 0xFF303134;

  static const MaterialColor darkGrey = MaterialColor(_darkGrey, <int, Color>{
    100: Color(0x66303134),
    300: Color(0xBB303134),
    500: Color(_darkGrey),
  });


  static const _black = 0xFF202124;

  static const MaterialColor black = MaterialColor(_black, <int, Color>{
    100: Color(0x66202124),
    300: Color(0xBB202124),
    500: Color(_black),
  });

  static const _babyBlue = 0xFF8AB4F89;

  static const MaterialColor babyBlue = MaterialColor(_babyBlue, <int, Color>{
    100: Color(0x668AB4F8),
    300: Color(0xBB8AB4F8),
    500: Color(_babyBlue),
  });
}
