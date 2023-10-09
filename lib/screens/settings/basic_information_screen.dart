import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:bus_booking/widgets/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({super.key});
  static const routeName = '/basic-information';
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 100 / 2,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
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
            const CustomTextField(labelText: "Full Name", hinText: "Enter your name"),
            addVerticalSpace(16),
            const CustomTextField(labelText: "Email", hinText: "example@gmail.com"),
            addVerticalSpace(16),
            const CustomTextField(
                labelText: "Mobile Number", hinText: "024 000 0000"),
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
