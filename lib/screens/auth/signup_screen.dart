import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/screens/auth/create_account_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Palette.baseBlack,
          ),
          title: Text(
            "Create Account",
            style: GoogleFonts.quicksand(
                color: Palette.baseBlack,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 50 / 375),
                child: Text(
                  "Faster booking and boarding by saving your information.",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Palette.greyText,
                  ),
                ),
              ),
              addVerticalSpace(50),
              CustomButton(
                color: Color(0xFF1877F2),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/facebook_logo.svg",
                        width: 20, height: 20),
                    addHorizontalSpace(8),
                    Text(
                      "Continue with Facebook",
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              addVerticalSpace(14),
              CustomButton(
                color: Color(0xFF8FACC1).withOpacity(0.1),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/google_logo.svg",
                        width: 30, height: 30),
                    addHorizontalSpace(8),
                    Text(
                      "Continue with Google",
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Palette.tertiaryColor),
                    )
                  ],
                ),
              ),
              addVerticalSpace(16),
              CustomButton(
                color: Colors.black,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/apple_logo.svg",
                        width: 30, height: 30),
                    addHorizontalSpace(8),
                    Text(
                      "Continue with Apple",
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              addVerticalSpace(16),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Palette.tertiaryColor.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    "OR",
                    style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Palette.tertiaryColor),
                  ),
                ),
              ),
              addVerticalSpace(15),
              CustomButton(
                color: Color(0xFF2EAFFF).withOpacity(0.1),
                onPressed: () {
                  pushNamedRoute(context, CreateAccountScreen.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue with email",
                      style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Palette.primaryColor),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  addHorizontalSpace(3),
                  Text(
                    "Send me travel tips and promotions by email.",
                    style: TextStyle(
                      color: Palette.greyText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              addVerticalSpace(14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40 / 375),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "By creating an account, you accept AppName's ",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Palette.greyText,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Terms",
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Palette.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Palette.greyText,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Palette.primaryColor,
                          ),
                        ),
                      ]),
                ),
              ),
              addVerticalSpace(40),
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
