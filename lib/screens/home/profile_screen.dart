import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/theme/spacing.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/screens/settings/basic_information_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_button.dart';
import 'package:bus_booking/widgets/base/custom_outlined_button.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:bus_booking/widgets/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    UserProvider up = context.read<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Profile',
          style: GoogleFonts.manrope(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.pageHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(30),
            Center(
              child: CircleAvatar(
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
            ),
            addVerticalSpace(5),
            Text(
              up.userModel.fullName.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                color: Palette.baseBlack,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            addVerticalSpace(25),
            SettingTile(
              icon: const Icon(
                Iconsax.user,
                color: Colors.black,
                size: 18,
              ),
              title: "Basic Information",
              onTap: () {
                pushNamedRoute(context, BasicInformationScreen.routeName);
              },
            ),
            addVerticalSpace(20),
            SettingTile(
              icon: const Icon(
                Iconsax.ticket_2,
                color: Colors.black,
                size: 18,
              ),
              title: "Retrieve a Booking ",
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    isScrollControlled: true,
                    enableDrag: true,
                    builder: (context) => const BookingRetrieveBottomSheet());
              },
            ),
            addVerticalSpace(20),
            SettingTile(
              icon: const Icon(
                Iconsax.profile_2user,
                color: Colors.black,
                size: 18,
              ),
              title: "Refer a Friend",
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    isScrollControlled: true,
                    enableDrag: true,
                    builder: (context) => const ReferalBottomSheet());
              },
            ),
            addVerticalSpace(20),
            SettingTile(
              icon: const Icon(
                Iconsax.setting_2,
                color: Colors.black,
                size: 18,
              ),
              title: "Settings",
              onTap: () {},
            ),
            addVerticalSpace(20),
            SettingTile(
              icon: const Icon(
                Iconsax.support,
                color: Colors.black,
                size: 18,
              ),
              title: "Support",
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    isScrollControlled: true,
                    enableDrag: true,
                    builder: (context) => const SupportBottomSheet());
              },
            ),
            addVerticalSpace(20),
            SettingTile(
              icon: const Icon(
                Iconsax.logout,
                color: Palette.destructive600,
                size: 18,
              ),
              title: "Sign out",
              onTap: () {
                showDialog(
                  context: context,
                  useSafeArea: false,
                  builder: (context) => const SignoutDialog(),
                );
              },
              color: Palette.destructive600,
            ),
            addVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}

class SignoutDialog extends StatelessWidget {
  const SignoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 32),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sign out',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 18,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Are you sure you want to sign out?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1D1D1F),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            addVerticalSpace(61),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    radius: 94,
                    height: 46,
                    color: const Color(0xFFEF4444),
                    child: Text(
                      'Sign out',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                addHorizontalSpace(15),
                Expanded(
                  child: CustomOutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Cancel",
                    radius: 94,
                    color: Colors.black,
                    height: 46,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    this.color,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Color? color;
  final Widget icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
          padding: const EdgeInsets.only(bottom: 15),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE5E5E5),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              icon,
              addHorizontalSpace(13),
              Text(
                title,
                style: GoogleFonts.manrope(
                  color: color ?? Palette.baseBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Palette.baseBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingRetrieveBottomSheet extends StatelessWidget {
  const BookingRetrieveBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFF8FACC1).withOpacity(0.1),
                      ),
                      width: 32,
                      height: 32,
                      child: const Center(
                          child: Icon(
                        Icons.close,
                        color: Palette.primaryColor,
                      )),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "Retrieve Booking",
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          addVerticalSpace(35),
          CustomTextField(
            labelText: "Booking Code",
            hinText: "Enter Code or Ticket ID",
            validator: (String? value) {
              return null;
            },
          ),
          addVerticalSpace(33),
          CustomPrimaryButton(text: "Retrieve Booking", onPressed: () {}),
        ],
      ),
    );
  }
}

class ReferalBottomSheet extends StatelessWidget {
  const ReferalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 41),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFF8FACC1).withOpacity(0.1),
                      ),
                      width: 32,
                      height: 32,
                      child: const Center(
                          child: Icon(
                        Icons.close,
                        color: Palette.primaryColor,
                      )),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "Refer a friend",
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          addVerticalSpace(35),
          BottomSheetExternalActionWidget(
            title: "Choose from contact",
            onTap: () {},
          ),
          addVerticalSpace(16),
          BottomSheetExternalActionWidget(
            title: "Send invite",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SupportBottomSheet extends StatelessWidget {
  const SupportBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFF8FACC1).withOpacity(0.1),
                      ),
                      width: 32,
                      height: 32,
                      child: const Center(
                          child: Icon(
                        Icons.close,
                        color: Palette.primaryColor,
                      )),
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "Refer a friend",
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          addVerticalSpace(35),
          BottomSheetExternalActionWidget(
            title: "Get in touch via Email",
            subtitle: "admin@bookingservice.com",
            onTap: () {},
          ),
          addVerticalSpace(16),
          BottomSheetExternalActionWidget(
            title: "Message us on twitter",
            subtitle: "@bookingservice.gh",
            onTap: () {},
          ),
          addVerticalSpace(16),
          BottomSheetExternalActionWidget(
            title: "Call us",
            subtitle: "030303030303",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class BottomSheetExternalActionWidget extends StatelessWidget {
  const BottomSheetExternalActionWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
  });
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Palette.neutral100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.manrope(
                      color: const Color.fromARGB(255, 90, 82, 74),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (subtitle != null) addVerticalSpace(4),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: GoogleFonts.manrope(
                        color: const Color.fromARGB(255, 90, 82, 74),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
              SvgPicture.string("""
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11.7057 13.7071L17.9986 7.41421V11H19.9986V4H12.9986V6H16.5844L10.2915 12.2929L11.7057 13.7071Z" fill="#201F20"/>
<path d="M19.0015 18V14H17.0015V18H6.00146V7H10.0015V5H6.00146C4.8969 5 4.00146 5.89543 4.00146 7V18C4.00146 19.1046 4.8969 20 6.00146 20H17.0015C18.106 20 19.0015 19.1046 19.0015 18Z" fill="#201F20"/>
</svg>

""")
            ],
          ),
        ),
      ),
    );
  }
}
