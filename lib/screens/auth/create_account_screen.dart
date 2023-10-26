import 'dart:convert';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/hive/token_hive_methods.dart';
import 'package:bus_booking/hive/user_hive_methods.dart';
import 'package:bus_booking/models/user_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/screens/auth/otp_verify_screen.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/snackbar.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  static const routeName = '/create-account';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String selectedCountryCode = "250";
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final mobileNumController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final up = context.watch<UserProvider>();
    final tp = context.watch<TokenProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              goBack(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Palette.baseBlack,
            ),
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
                addVerticalSpace(45),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full name',
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText),
                    ),
                    addVerticalSpace(8),
                    TextFormField(
                      controller: fullNameController,
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 13),
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
                          return 'Enter your full name';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                addVerticalSpace(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email(optional)',
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText),
                    ),
                    addVerticalSpace(8),
                    TextFormField(
                      controller: emailController,
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        hintStyle: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
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
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'email is required';
                      //   } else if (!EmailValidator.validate(value)) {
                      //     return 'Please enter a valid email';
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
                addVerticalSpace(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText),
                    ),
                    addVerticalSpace(8),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 13),
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
                          return 'Passaword cannot be empty';
                        } else if (value.length < 8) {
                          return 'Password mus be longer than 8 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                addVerticalSpace(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirm Password',
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText),
                    ),
                    addVerticalSpace(8),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.greyText),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 13),
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
                          return 'Passaword cannot be empty';
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
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
                                  value: "250",
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
                                  value: "233",
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
                              } else if (value.length >= 10) {
                                return "Enter phone number without the zero";
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
                  onPressed: () async {
                    bool isValidated = _formKey.currentState!.validate();
                    if (isValidated) {
                      showProgressLoader();

                      try {
                        var resp = await postDataToServer(
                          "${Url.authUrl}/signup",
                          {
                            "fullName": fullNameController.text.trim(),
                            "email": emailController.text.trim(),
                            "password": passwordController.text.trim(),
                            "phone":
                                "$selectedCountryCode${mobileNumController.text.trim()}",
                          },
                          context,
                        );

                        final jresp = jsonDecode(resp);
                        // logs.d(jresp);
                        if (jresp != null) {
                          User userModel = User.fromJson(jresp["user"]);
                          var token = jresp['token'];

                          await UserHiveMethods().addUser(userModel);
                          await TokenHiveMethods().addToken(token);

                          up.setUser = userModel;
                          tp.setToken = token;
                          cancelLoader();
                          // ignore: use_build_context_synchronously
                          await Navigator.of(context)
                              .pushNamed(OtpVerifyScreen.routeName);
                        } else {
                          cancelLoader();
                        }
                      } on Exception catch (e) {
                        // ignore: use_build_context_synchronously
                        showSnackBar(context,'An error occured');
                        cancelLoader();
                        logs.d("Error: $e");
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        }),
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
                      fontWeight: FontWeight.w700,
                    ),
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
