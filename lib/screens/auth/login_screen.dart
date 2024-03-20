// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/hive/token_hive_methods.dart';
import 'package:bus_booking/hive/user_hive_methods.dart';
import 'package:bus_booking/models/user_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_fade.dart';
import 'package:bus_booking/route_transitions/route_transition_slide_left.dart';
import 'package:bus_booking/screens/auth/create_account_screen.dart';
import 'package:bus_booking/screens/home/app_home.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/snackbar.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final up = Provider.of<UserProvider>(context, listen: false);
    final tp = Provider.of<TokenProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 18,
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
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
                            return 'email is required';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  addVerticalSpace(20),
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
                            color: Palette.greyText,
                          ),
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
                  addVerticalSpace(30),
                  CustomPrimaryButton(
                    text: "Log in",
                    onPressed: () async {
                      bool isValidForm = _formKey.currentState!.validate();
                      if (isValidForm) {
                        showProgressLoader();
                        try {
                          var resp = await postDataToServer(
                            '${Url.authUrl}/signin-user',
                            {
                              "email": emailController.text.trim(),
                              "password": passwordController.text.trim(),
                            },
                            context,
                          );

                          final jresp = jsonDecode(resp);
                          logs.d(jresp);

                          if (jresp != null && jresp["status"] == "success") {
                            cancelLoader();
                            User userModel =
                                User.fromJson(jresp["data"]["user"]);
                            var token = jresp["data"]["token"];

                            await UserHiveMethods().addUser(userModel);
                            await TokenHiveMethods().addToken(token);

                            up.setUser = userModel;
                            tp.setToken = token;

                            nextScreenClosePrev(
                                context, SlideLeftRoute(page: const AppHome()));
                          } else if (jresp["message"] == "User not found") {
                            showSnackBar(context, "User not found");
                            cancelLoader();
                          } else if (jresp["message"] == "Wrong Password") {
                            showSnackBar(context, "incorrect password");
                            cancelLoader();
                          } else {
                            showSnackBar(
                                context, "Error logging in, Try again");
                            cancelLoader();
                          }
                        } on Exception catch (e) {
                          cancelLoader();

                          showSnackBar(
                              context, "Error: please check your internet");
                          logs.d("Error: $e");
                        }
                      }
                    },
                  ),
                  addVerticalSpace(14),
                  Text(
                    "Don’t have an account?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                        color: Palette.tertiaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  addVerticalSpace(5),
                  TextButton(
                    onPressed: () {
                      nextScreen(context,
                          FadeRoute(page: const CreateAccountScreen()));
                    },
                    child: Text(
                      "Sign up",
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
      ),
    );
  }
}
