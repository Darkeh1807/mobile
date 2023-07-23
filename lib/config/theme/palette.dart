import 'package:flutter/material.dart';
import 'dart:math';

class Palette {
  //Primary colors theme config
  static const Color primaryColor = Color(0xFF2465C2);
  static const Color primaryLight = Color(0xFF5E90CC);

  //Success
  static const Color success600 = Color(0xFF16A34A);
  static const Color success700 = Color(0xFF15803D);
  static const Color success100 = Color(0xFFDCFCE7);
  static const Color success50 = Color(0xFFF0FDF4);

  //Secodary Color Theme config
  static const Color tertiaryColor = Color(0xFF20415B);
  static const Color baseBlack = Color(0xFF1A0E00);
  static const LinearGradient baseLinearGradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topRight,
      colors: [Color(0xFFFF0044), Color(0xFFF78400)],
      transform: GradientRotation(200 * pi / 180),
      stops: [0.5096, 0.8525]);

  static const Color neutral100 = Color(0xFFF3F4F6);
  static const Color neutral50 = Color(0xFFF9FAFB);
  static const Color neutral200 = Color(0xFFE5E7EB);
  static const Color neutral300 = Color(0xFFD1D5DB);
  static const Color neutral400 = Color(0xFF9CA3AF);
  static const Color neutral500 = Color(0xFF6B7280);
  static const Color neutral600 = Color(0xFF4B5563);
  static const Color neutral900 = Color(0xFF111827);

  // Desctructive
  static const Color destructive50 = Color(0xFFFEF2F2);
  static const Color destructive100 = Color(0xFFFEE2E2);
  static const Color destructive700 = Color(0xFFB91C1C);
  static const Color destructive600 = Color(0xFFDC2626);

  //warning
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning700 = Color(0xFFB45309);

  //Border
  static const Color lightBorder = Color(0xFFE1E7EE);

  //Text:
  static const Color greyText = Color(0xFF777777);
}
