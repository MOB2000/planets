import 'package:flutter/material.dart';
import 'package:planets/constants/keys.dart';

class Style {
  Style._();

  static const double barHeight = 66;

  static const baseTextStyle = TextStyle(fontFamily: Keys.poppins);
  static final smallTextStyle = commonTextStyle.copyWith(fontSize: 9);
  static final commonTextStyle = baseTextStyle.copyWith(
    color: const Color(0xffb6b2df),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final titleTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
}
