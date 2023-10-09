import 'package:bus_booking/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.height,
      this.fontWeight,
      this.radius});
  final String text;
  final double? height;
  final double? radius;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(height ?? 56),
          backgroundColor: Palette.primaryColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8))),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontWeight: fontWeight ?? FontWeight.w700,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
