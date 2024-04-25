import 'package:bus_booking/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSignUpButtonType extends StatelessWidget {
  final VoidCallback? voidCallback;
  final String title;
  final bool? isSelected;
  const CustomSignUpButtonType({
    super.key,
    this.voidCallback,
    required this.title,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.3,
        color: isSelected == true ? Palette.primaryColor : Palette.primaryLight,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
