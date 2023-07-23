import 'package:bus_booking/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.color,
      this.icon,
      this.radius,
      this.height});
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Widget? icon;
  final double? radius;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: height == null ? 16 : 0,
          ),
          fixedSize: height != null ? Size.fromHeight(height!) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          side: BorderSide(
            color: color ?? Palette.primaryColor,
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          if (icon != null)
            SizedBox(
              width: 5,
            ),
          Text(
            text,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: color ?? Palette.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
