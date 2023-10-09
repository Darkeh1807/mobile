import 'package:bus_booking/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseOutlinedinput extends StatefulWidget {
  const BaseOutlinedinput(
      {super.key,
      required this.hintText,
      this.width,
      this.height,
      this.keyboardType,
      this.textAlign,
      this.onChanged,
      this.prefix,
      this.inputFormatters});
  final double? width;
  final double? height;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  @override
  State<BaseOutlinedinput> createState() => _BaseOutlinedinputState();
}

class _BaseOutlinedinputState extends State<BaseOutlinedinput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      textAlign: widget.textAlign ?? TextAlign.start,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          color: Palette.neutral500,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.prefix,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixStyle: const TextStyle(
          color: Palette.neutral500,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        constraints: BoxConstraints(
          minHeight: widget.height ?? 48,
          minWidth: widget.width ?? 0,
          maxHeight: widget.height ?? 48,
          maxWidth: widget.width ?? double.infinity,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Palette.neutral200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Palette.primaryColor,
          ),
        ),
      ),
    );
  }
}
