import 'package:bus_booking/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      this.color,
      required this.child,
      this.height,
      this.radius});
  final Widget child;
  final VoidCallback onPressed;
  final Color? color;
  final double? height;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(height ?? 56),
          backgroundColor: color ?? Palette.primaryColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8))),
    );
  }
}
