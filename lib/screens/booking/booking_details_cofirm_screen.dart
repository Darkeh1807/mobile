import 'package:bus_booking/screens/booking/payment_success_screen.dart';
import 'package:bus_booking/screens/ticket/ticket_details_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../config/theme/palette.dart';

class BookingDetailsConfirmScreen extends StatefulWidget {
  BookingDetailsConfirmScreen({super.key});
  static const routeName = '/booking_details_confirm_screen';

  @override
  State<BookingDetailsConfirmScreen> createState() =>
      _BookingDetailsConfirmScreenState();
}

class _BookingDetailsConfirmScreenState
    extends State<BookingDetailsConfirmScreen> {
  bool hasPaid = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context, null),
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              "Accra, Ghana - Lagos, Nigeria",
              style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: AvailableTicketCard(),
                ),
                Divider(
                  height: 1,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 22, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details",
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      addVerticalSpace(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bus Type",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Palette.greyText,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Air conditioning",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Departure Time",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Palette.greyText,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "12am - 6am",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Arrival Time",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Palette.greyText,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "12am - 6am",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bus Operator",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Palette.greyText,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "VIP Transport",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Boarding Point",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Palette.greyText,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Boarding  point ",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dropping Point",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Palette.greyText,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Dropping  point ",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Seat",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Palette.greyText,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "A1, B3",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 22, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.manrope(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "\$100.00",
                            style: GoogleFonts.manrope(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(20),
                      CustomPrimaryButton(
                          text: "Pay",
                          onPressed: () {
                            setState(() {
                              hasPaid = true;
                            });
                            showDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(0.0),
                              barrierDismissible: false,
                              builder: (context) => PaymentSuccessDialog(),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (hasPaid)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/blur_bg.png',
                ),
              ),
            ),
          )
      ],
    );
  }
}

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 10, 18, 32),
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
            Center(
              child: Icon(
                Iconsax.tick_circle,
                color: Palette.primaryColor,
                size: 48,
              ),
            ),
            addVerticalSpace(6),
            Text(
              'Transaction Successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 18,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Payment for ticket has successfully been completed',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1D1D1F),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            addVerticalSpace(25),
            CustomPrimaryButton(
                text: "Continue",
                radius: 4,
                fontWeight: FontWeight.w500,
                height: 44,
                onPressed: () {
                  pushNamedRoute(context, TicketDetailsScreen.routeName);
                })
          ],
        ),
      ),
    );
  }
}

class AvailableTicketCard extends StatelessWidget {
  const AvailableTicketCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // pushNamedRoute(context, SelectedScreenProceedScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 12, 15, 15),
        // margin: EdgeInsets.only(right: 20, bottom: 20, left: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE5ECF0), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "VIP BUS",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.baseBlack,
                  ),
                ),
                Text(
                  "Total 23 seats left",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Palette.greyText,
                  ),
                ),
              ],
            ),
            addVerticalSpace(22),
            Row(
              children: [
                addHorizontalSpace(4),
                Container(
                  width: 10,
                  height: 10,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(color: Palette.primaryColor, width: 2),
                    ),
                  ),
                ),
                addHorizontalSpace(8),
                Text(
                  "06:30AM",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.greyText,
                  ),
                ),
                addHorizontalSpace(10),
                Text(
                  "Selected Trip",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "VIP Bus Station",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Palette.greyText,
                  ),
                ),
              ],
            ),
            Container(
              height: 18,
              margin: EdgeInsets.only(left: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.string(
                    '''<svg width="2" height="10" viewBox="0 0 2 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect x="0.474587" y="0.474587" width="0.949173" height="9.05083" stroke="#2465C2" stroke-width="0.949173" stroke-dasharray="3 3"/>
                    </svg>
                  '''),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Palette.primaryColor,
                ),
                addHorizontalSpace(8),
                Text(
                  "06:30AM",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.greyText,
                  ),
                ),
                addHorizontalSpace(10),
                Text(
                  "Accra, Ghana -  ",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "VIP Bus Station",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Palette.greyText,
                  ),
                ),
              ],
            ),
            addVerticalSpace(16.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      MdiIcons.bus,
                      size: 20,
                      color: Palette.primaryColor,
                    ),
                    addHorizontalSpace(4),
                    Text(
                      "Bus",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Palette.primaryColor,
                      ),
                    ),
                    addHorizontalSpace(10),
                    Icon(
                      MdiIcons.clock,
                      size: 20,
                      color: Palette.primaryColor,
                    ),
                    addHorizontalSpace(4),
                    Text(
                      "7hrs 50m",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$50",
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
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
