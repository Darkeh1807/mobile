import 'package:bus_booking/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData? theme(String thememode, BuildContext context) {
  if (thememode == "l") {
    return ThemeData(
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Palette.primaryColor,
            secondary: Palette.tertiaryColor,
          ),
          useMaterial3:false,
      appBarTheme: AppBarTheme.of(context).copyWith(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
          color: Palette.baseBlack,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(
          color: Palette.baseBlack,
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme.copyWith(),
      ).apply(
        bodyColor: Palette.baseBlack,
        displayColor: Palette.baseBlack,
      ),
    );
  } else {
    return null;
  }
}
