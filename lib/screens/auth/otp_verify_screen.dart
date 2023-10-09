import 'package:bus_booking/screens/home/app_home.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/base_outlined_input.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme/palette.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});
  static const routeName = '/otp_verify_screen';

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  List<String> otp = ['', '', '', '', '', ''];

  bool otpIsFilled() {
    for (var i = 0; i < otp.length; i++) {
      if (otp[i] == '') {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              "Kindly enter the 6-digits code we sent to +233554276833",
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
            addVerticalSpace(26),
            const Spacer(),
            SizedBox(
              width: double.maxFinite,
              child: CustomPrimaryButton(
                text: "Next",
                onPressed: otpIsFilled() == false
                    ? null
                    : () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppHome.routeName, (route) => false);
                      },
              ),
            ),
            addVerticalSpace(10),
            Center(
              child: TextButton(
                onPressed: () {},
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
                      Text(
                        " Send again",
                        style: GoogleFonts.inter(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Palette.primaryColor,
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
        ));
  }
}
