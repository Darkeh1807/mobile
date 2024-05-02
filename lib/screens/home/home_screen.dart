// ignore_for_file: use_build_context_synchronously

import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_slide_left.dart';
import 'package:bus_booking/screens/bus/create_bus_screen.dart';
import 'package:bus_booking/screens/locations/location_select_screen.dart';
import 'package:bus_booking/screens/notifications/notifications_screen.dart';
import 'package:bus_booking/utils/date_selector.dart';
import 'package:bus_booking/utils/snackbar.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_outlined_button.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../booking/search_results_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scafoldKey});
  final GlobalKey<ScaffoldState> scafoldKey;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _tripChoices = ["One way", "Round-trip"];
  String selectedTripType = "One way";
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    OriginProvider op = Provider.of<OriginProvider>(context, listen: true);
    DestinationProvider dp =
        Provider.of<DestinationProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text(
          'Molidom',
          style: GoogleFonts.manrope(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 1,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            addHorizontalSpace(5),
            IconButton(
              onPressed: () {
                widget.scafoldKey.currentState?.openDrawer();
              },
              // constraints: BoxConstraints.tight(const Size.square(40)),
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Iconsax.menu_1,
                  color: Palette.primaryColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              nextScreen(
                context,
                SlideLeftRoute(
                  page: const NotificationsScreen(),
                ),
              );
            },
            child: Stack(
              children: [
                Ink(
                  width: 45,
                  height: 45,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Iconsax.notification,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18 / 2,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Text("0"),
                    ),
                  ),
                )
              ],
            ),
          ),
          addHorizontalSpace(5)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _tripChoices
                      .map((e) => ChoiceChip(
                            label: Text(e),
                            backgroundColor: Colors.white,
                            elevation: 0,
                            selectedColor:
                                const Color(0xFF2276E3).withOpacity(0.1),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: selectedTripType == e
                                    ? Palette.primaryColor
                                    : Palette.greyText),
                            selected: selectedTripType == e,
                            onSelected: (bool selected) {
                              setState(() {
                                selectedTripType = selected ? e : "";
                              });
                            },
                          ))
                      .toList(),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) =>
                            const PassengerSelectBottomSheet());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: Palette.lightBorder,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Iconsax.profile_add,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 18 / 2,
                              backgroundColor: Palette.primaryLight,
                              child: Center(
                                child: Text("1"),
                              ),
                            ),
                          )
                        ],
                      ),
                      addHorizontalSpace(4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Palette.greyText,
                      ),
                    ],
                  ),
                )
              ],
            ),
            addVerticalSpace(25),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LocationButtonWidget(
                      innerLabel: op.originModel.id?.isNotEmpty ?? false
                          ? op.originModel.name.toString()
                          : "Leaving from",
                      topLabel: "Origin",
                      onTap: () {
                        pushWidgetRoute(
                          context,
                          const LocationSelectScreen(
                            selecting: "Origin",
                          ),
                        );
                      },
                    ),
                    addVerticalSpace(10),
                    LocationButtonWidget(
                      innerLabel: dp.getDestination.id?.isNotEmpty ?? false
                          ? dp.getDestination.name.toString()
                          : "Going to",
                      topLabel: "Destination",
                      onTap: () {
                        pushWidgetRoute(
                          context,
                          const LocationSelectScreen(
                            selecting: "Destination",
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Positioned(
                  top: 45,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      color: Colors.white,
                      shadows: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.1),
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.swap_vert,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            addVerticalSpace(10),
            LocationButtonWidget(
              innerLabel: selectedDate != null
                  ? selectedDate.toString()
                  : "Sat, 20 May",
              topLabel: "Departure",
              leading: const Icon(
                Iconsax.calendar_1,
                color: Palette.greyText,
              ),
              onTap: () async {
                final date = await showDate(context);
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                  });
                } else {
                  showSnackBar(context, "No date selected");
                }
              },
            ),
            addVerticalSpace(30),
            CustomPrimaryButton(
              text: "Search",
              onPressed: () {
                if (op.getOrigin.id != null && dp.getDestination.id == null) {
                  showSnackBar(context, "Destionation is required");
                } else if (dp.getDestination.id != null &&
                    op.getOrigin.id == null) {
                  showSnackBar(context, "Origin is required");
                } else if (op.getOrigin.id != null &&
                    dp.getDestination.id != null &&
                    selectedDate == null) {
                  showSnackBar(context, "Departure date is required");
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultsScreen(
                          departureTime: selectedDate,
                          destinationId: dp.getDestination.id,
                          originId: op.originModel.id,
                        ),
                      ));
                }
              },
            ),
            addVerticalSpace(50),
            Text(
              'Are you a bus company?',
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            addVerticalSpace(8),
            const Divider(),
            Text(
              'Unlock the potential of your bus business with our streamlined ticketing platform. Sign up now and revolutionize the way you manage bookings, maximize your revenue, and provide a seamless experience for your passengers.',
              style: GoogleFonts.quicksand(
                  color: Colors.black,
                  fontSize: 14,
                  height: 16 / 12,
                  fontWeight: FontWeight.w400),
            ),
            addVerticalSpace(50),
            CustomOutlinedButton(
              onPressed: () {
                nextScreen(
                    context, SlideLeftRoute(page: const CreateBusScreen()));
              },
              text: "Register",
            )
          ],
        ),
      ),
    );
  }
}

class PassengerSelectBottomSheet extends StatelessWidget {
  const PassengerSelectBottomSheet({
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
                  "Add Passengers",
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          addVerticalSpace(42),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Adults",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Palette.primaryColor,
                        ),
                      ),
                      Text(
                        "26+ years",
                        style: GoogleFonts.quicksand(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          width: 24,
                          height: 24,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Palette.primaryColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.remove,
                            color: Palette.primaryColor,
                            size: 16,
                          )),
                        ),
                      ),
                      addHorizontalSpace(16),
                      const Text(
                        "1",
                        style: TextStyle(color: Palette.greyText),
                      ),
                      addHorizontalSpace(16),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          width: 24,
                          height: 24,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Palette.primaryColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            color: Palette.primaryColor,
                            size: 16,
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              addVerticalSpace(10),
              const Divider(
                height: 1,
              )
            ],
          ),
          addVerticalSpace(12),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Youth",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Palette.primaryColor,
                        ),
                      ),
                      Text(
                        "0-25 years",
                        style: GoogleFonts.quicksand(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          width: 24,
                          height: 24,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Palette.primaryColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.remove,
                            color: Palette.primaryColor,
                            size: 16,
                          )),
                        ),
                      ),
                      addHorizontalSpace(16),
                      const Text(
                        "1",
                        style: TextStyle(color: Palette.greyText),
                      ),
                      addHorizontalSpace(16),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          width: 24,
                          height: 24,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Palette.primaryColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            color: Palette.primaryColor,
                            size: 16,
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              addVerticalSpace(10),
              const Divider(
                height: 1,
              )
            ],
          ),
          addVerticalSpace(12),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Senior",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Palette.primaryColor,
                        ),
                      ),
                      Text(
                        "58+ years",
                        style: GoogleFonts.quicksand(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Palette.greyText,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          width: 24,
                          height: 24,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Palette.primaryColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.remove,
                            color: Palette.primaryColor,
                            size: 16,
                          )),
                        ),
                      ),
                      addHorizontalSpace(16),
                      const Text(
                        "1",
                        style: TextStyle(color: Palette.greyText),
                      ),
                      addHorizontalSpace(16),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          width: 24,
                          height: 24,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Palette.primaryColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            color: Palette.primaryColor,
                            size: 16,
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              addVerticalSpace(10),
              const Divider(
                height: 1,
              )
            ],
          ),
          addVerticalSpace(60),
          CustomPrimaryButton(text: "Confirm", onPressed: () {}),
        ],
      ),
    );
  }
}

class LocationButtonWidget extends StatelessWidget {
  const LocationButtonWidget({
    super.key,
    required this.onTap,
    required this.innerLabel,
    required this.topLabel,
    this.leading,
  });
  final VoidCallback onTap;
  final String innerLabel;
  final String topLabel;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.only(
            top: 7,
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 30,
                ),
                side: const BorderSide(
                  color: Palette.lightBorder,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft),
            onPressed: onTap,
            child: Row(
              children: [
                if (leading != null) leading!,
                addHorizontalSpace(leading != null ? 10 : 0),
                Text(
                  innerLabel,
                  style: GoogleFonts.quicksand(
                      color: Palette.greyText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 20,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              topLabel,
              style: const TextStyle(
                color: Palette.greyText,
                fontSize: 14,
                height: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
