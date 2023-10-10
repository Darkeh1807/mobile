import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/screens/auth/otp_verify_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:bus_booking/widgets/base/custom_text_field.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  static const routeName = '/create-account';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String selectedCountryCode = "+250";
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileNumController = TextEditingController();

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 50 / 375),
                  child: Text(
                    "Provide your details to complete creating account",
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Palette.greyText,
                    ),
                  ),
                ),
                addVerticalSpace(50),
                CustomTextField(
                  labelText: "Full Name",
                  hinText: "Enter your name",
                  controller: fullNameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Full name is required';
                    }
                    return null;
                  },
                ),
                addVerticalSpace(16),
                CustomTextField(
                  labelText: "Email",
                  hinText: "example@gmail.com",
                  controller: emailController,
                  validator: (String? value) =>
                      !EmailValidator.validate(value!, true)
                          ? 'Not a valid email.'
                          : null,
                ),
                addVerticalSpace(16),
                CustomTextField(
                  labelText: "Password",
                  hinText: "enter your password",
                  controller: passwordController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password must be more than 8 characters';
                    }
                    return null;
                  },
                ),
                addVerticalSpace(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mobile Number",
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText),
                    ),
                    addVerticalSpace(8),
                    Row(
                      children: [
                        SizedBox(
                          width: 75,
                          child: DropdownButtonFormField<String>(
                              value: selectedCountryCode,
                              selectedItemBuilder: (context) =>
                                  <DropdownMenuItem<String>>[
                                    DropdownMenuItem(
                                      value: "+250",
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          addHorizontalSpace(12),
                                          Center(
                                            child: Flag.fromCode(
                                              FlagsCode.RW,
                                              height: 17,
                                              width: 23,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "+233",
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          addHorizontalSpace(12),
                                          Center(
                                            child: Flag.fromCode(
                                              FlagsCode.GH,
                                              height: 17,
                                              width: 23,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                              items: <DropdownMenuItem<String>>[
                                DropdownMenuItem(
                                  value: "+250",
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text("+250"),
                                      addHorizontalSpace(12),
                                      Center(
                                        child: Flag.fromCode(
                                          FlagsCode.RW,
                                          height: 17,
                                          width: 23,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "+233",
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text("+233"),
                                      addHorizontalSpace(12),
                                      Center(
                                        child: Flag.fromCode(
                                          FlagsCode.GH,
                                          height: 17,
                                          width: 23,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              onChanged: (String? value) {
                                setState(() {
                                  selectedCountryCode = value!;
                                });
                              }),
                        ),
                        addHorizontalSpace(7),
                        Expanded(
                          child: TextFormField(
                            controller: mobileNumController,
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
                              hintStyle: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.greyText),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 13,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  
                                  color: Color(0xFFE1E7EE),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              } else if (value.length != 10) {
                                return 'Phone number is incorrect';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                addVerticalSpace(53),
                CustomPrimaryButton(
                  text: "Create Account",
                  onPressed: () {
                    bool isValidated = _formKey.currentState!.validate();
                    if (isValidated) {
                      pushNamedRoute(
                        context,
                        OtpVerifyScreen.routeName,
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}),
                    addHorizontalSpace(3),
                    const Text(
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
                  "Already have an account? ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      color: Palette.tertiaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                addVerticalSpace(5),
                TextButton(
                  onPressed: () {
                    pushNamedRoute(context, LoginScreen.routeName);
                  },
                  child: Text(
                    "Sign in",
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
      ),
    );
  }
}
