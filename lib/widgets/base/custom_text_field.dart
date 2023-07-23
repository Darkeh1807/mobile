import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.labelText, required this.hinText});
  final String labelText;
  final String hinText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Palette.greyText),
        ),
        addVerticalSpace(8),
        TextFormField(
          style: GoogleFonts.manrope(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
          decoration: InputDecoration(
            hintText: hinText,
            hintStyle: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Palette.greyText),
            contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 2,
                color: Color(0xFFE1E7EE),
              ),
            ),

            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            //   borderSide: BorderSide(
            //     width: 2,
            //   ),
            // ),
            // disabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            //   borderSide: BorderSide(
            //     width: 2,

            //   ),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            //   borderSide: BorderSide(
            //     width: 2,
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
