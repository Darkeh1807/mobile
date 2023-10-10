import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/screens/auth/signup_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:bus_booking/widgets/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  color: Palette.tertiaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              addVerticalSpace(3),
              Text(
                "Enter your details to continue",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                    color: Palette.tertiaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              addVerticalSpace(23),
               CustomTextField(
                  labelText: "Email", hinText: "example@gmail.com",
                   validator: (String? value) {
                return null;
              },
                  ),
              addVerticalSpace(20),
               CustomTextField(labelText: "Password", hinText: "",
               validator: (String? value) {
                return null;
              },
              ),
              addVerticalSpace(30),
              CustomPrimaryButton(text: "Log in", onPressed: () {}),
              addVerticalSpace(14),
              Text(
                "Don’t have an account? ",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                    color: Palette.tertiaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              addVerticalSpace(5),
              TextButton(
                onPressed: () {
                  pushNamedRoute(context, SignUpScreen.routeName);
                },
                child: Text(
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      color: Palette.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
