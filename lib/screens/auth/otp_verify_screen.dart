// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_slide_left.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/services/get_from_server.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/snackbar.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/base_outlined_input.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/theme/palette.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  List<String> otp = ['', '', '', '', '', ''];
  late int _timeRemaining;
  late Timer _timer;

  bool otpIsFilled() {
    for (var i = 0; i < otp.length; i++) {
      if (otp[i] == '') {
        return false;
      }
    }
    return true;
  }

  String getOtp() {
    return otp.join();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining -= 1;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    _timeRemaining = 5 * 60;
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tp = Provider.of<TokenProvider>(context, listen: false);
    final up = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Palette.baseBlack,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Palette.baseBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We sent you a verificaiton code",
              style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Palette.neutral900,
              ),
            ),
            addVerticalSpace(6),
            Text(
              "Kindly enter the 6-digits code we sent to ${up.getUser.phone}",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Palette.neutral500,
              ),
            ),
            addVerticalSpace(30),
            Row(
                children: List.generate(
              6,
              (index) => Expanded(
                child: Container(
                  margin: index != 5 ? const EdgeInsets.only(right: 6) : null,
                  child: BaseOutlinedinput(
                    hintText: "",
                    height: 59,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 1) {
                        setState(() {
                          otp[index] = value;
                        });
                        if (index != 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      }
                    },
                  ),
                ),
              ),
            )),
            Center(
              child: TextButton(
                onPressed: null,
                child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didnt't receive code? ",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Palette.baseBlack,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final token = tp.getToken;
                          final resp = await getFromServer(
                            '${Url.authUrl}/resendsms',
                            context,
                            authToken: token,
                          );

                          final jresp = jsonDecode(resp);

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${jresp["message"]}')));
                        },
                        child: Text(
                          " Send again",
                          style: GoogleFonts.inter(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Palette.primaryColor,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            addVerticalSpace(26),
            const Spacer(),
            SizedBox(
              width: double.maxFinite,
              child: CustomPrimaryButton(
                text: "Verify",
                onPressed: otpIsFilled() == false
                    ? null
                    : () async {
                        showProgressLoader();
                        try {
                          String otpValue = getOtp();
                          String token = tp.getToken;
                          logs.d(token);

                          final resp = await postDataToServer(
                            "${Url.authUrl}/verifyphone",
                            {
                              "code": otpValue,
                            },
                            context,
                            authToken: token,
                          );

                          final jresp = jsonDecode(resp);

                          if (jresp != null && jresp["status"] == "success") {
                            cancelLoader();
                            nextScreen(context,
                                SlideLeftRoute(page: const LoginScreen()));
                          } else if (jresp != null &&
                              jresp["message"] == "Incorrect Code") {
                            cancelLoader();
                            showSnackBar(context, "Wrong code");
                          }
                        } catch (e) {
                          cancelLoader();
                          logs.d(e);
                        }
                      },
              ),
            ),
            addVerticalSpace(10),
            Align(
              child: Text(
                'Code expires in $_timeRemaining seconds',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Palette.baseBlack,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
