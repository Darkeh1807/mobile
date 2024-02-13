import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  static const routeName = '/notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: const Text(
          'Notifications',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF190D00),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: Spacing.pageHorizontalPadding,
      //   ),
      //   child: Column(
      //     children: [
      //       addVerticalSpace(
      //         Spacing.pageTopMargin,
      //       ),
      //       // ...List.generate(
      //       //     20,
      //       //     (index) => Column(
      //       //           children: [
      //       //             const NotificationDisplayWidget(),
      //       //             addVerticalSpace(15),
      //       //           ],
      //       //         ))
      //     ],
      //   ),
      // ),
      body: const Center(
        child: Text("No notification available"),
      ),
    );
  }
}

class NotificationDisplayWidget extends StatelessWidget {
  const NotificationDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Row(
          children: [
            CircleAvatar(
              radius: 40 / 2,
              backgroundColor: const Color(0xFF5E90CC).withOpacity(0.1),
              child: const Center(
                child: Icon(
                  Iconsax.notification,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            addHorizontalSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Update',
                  style: GoogleFonts.manrope(
                    color: const Color(0xFF060C2C),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                addVerticalSpace(3),
                SizedBox(
                  width: 284,
                  child: Text(
                    'A new version is available for download.',
                    style: GoogleFonts.manrope(
                      color: const Color(0xFF858585),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
