import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});
  static const routeName = '/basic-information';

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider up = context.read<UserProvider>();

    fullNameController.text = up.userModel.fullName.toString();
    emailController.text = up.userModel.email.toString();
    mobileNumberController.text = up.userModel.phone.toString();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: Text(
          "Basic Information",
          style: GoogleFonts.manrope(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 100 / 2,
                    child: Center(
                      child: Text(
                        up.userModel.profilePic.toString(),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.25,
                            color: Color(
                              0xFF2465C2,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 16,
                        color: Palette.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            addVerticalSpace(30),
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
            addVerticalSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mobile Number',
                  style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Palette.greyText),
                ),
                addVerticalSpace(8),
                TextFormField(
                  controller: mobileNumberController,
                  style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '0242-223-457',
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
                      return 'Mobile number cannot be empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
            addVerticalSpace(16),
            const Spacer(),
            CustomPrimaryButton(
              text: "Save",
              onPressed: () {},
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
