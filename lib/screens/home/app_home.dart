import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/screens/home/bookings_screen.dart';
import 'package:bus_booking/screens/home/home_screen.dart';
import 'package:bus_booking/screens/home/profile_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});
  static const routeName = 'app_home';
  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _currentBottomNavIndex = 0;
  final _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(scafoldKey: _scafoldKey),
      BookingsScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      key: _scafoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                  ),
                ),
                addVerticalSpace(25),
                ListTile(
                  onTap: () {},
                  leading: Icon(MdiIcons.bus, color: Colors.black),
                  title: Text(
                    "Bus Booking",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // addVerticalSpace(20),
                ListTile(
                  onTap: () {},
                  leading: Icon(MdiIcons.car, color: Colors.black),
                  title: Text(
                    "Car Rental",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                addVerticalSpace(15),
                Divider(
                  height: 1,
                ),
                addVerticalSpace(16),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.personalcard, color: Colors.black),
                  title: Text(
                    "Car Rental",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.setting_2, color: Colors.black),
                  title: Text(
                    "Settings",
                    style: GoogleFonts.manrope(
                      color: Palette.baseBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Iconsax.logout, color: Palette.destructive600),
                  title: Text(
                    "Sign out",
                    style: GoogleFonts.manrope(
                      color: Palette.destructive600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentBottomNavIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentBottomNavIndex,
        onTap: (int value) {
          setState(() {
            _currentBottomNavIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_15), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.ticket), label: 'Bookings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
