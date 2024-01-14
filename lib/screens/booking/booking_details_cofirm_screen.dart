// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/models/trip_model.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/screens/payment/payment_screen..dart';
import 'package:bus_booking/screens/ticket/ticket_details_screen.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../config/theme/palette.dart';

class BookingDetailsConfirmScreen extends StatefulWidget {
  final Trip trip;
  const BookingDetailsConfirmScreen({super.key, required this.trip});
  static const routeName = '/booking_details_confirm_screen';

  @override
  State<BookingDetailsConfirmScreen> createState() =>
      _BookingDetailsConfirmScreenState();
}

class _BookingDetailsConfirmScreenState
    extends State<BookingDetailsConfirmScreen> {
  bool hasPaid = false;
  Future<String?> bookTrip(
      BuildContext context, Map<String, dynamic> data, String authToken) async {
    showProgressLoader();
    try {
      final String res = await postDataToServer(Url.booking, data, context,
          authToken: authToken);

      final jresp = jsonDecode(res);
      if (jresp["success"] == true) {
        cancelLoader();
        return jresp["data"]["paymentUrl"]["data"]["authorization_url"];
      } else if (jresp["message"] == "You have already booked this trip") {
        cancelLoader();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You have already booked this trip")));
      }
    } catch (e) {
      cancelLoader();
      logs.d(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context, null),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              "${widget.trip.origin.name} - ${widget.trip.destination.name}",
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
                  padding: const EdgeInsets.all(20),
                  child: AvailableTicketCard(
                    trips: widget.trip,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 22, top: 10),
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
                            widget.trip.bus.model.toString(),
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
                            widget.trip.timeScheduled.startTime,
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
                            widget.trip.timeScheduled.endTime,
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
                            widget.trip.busCompany.name,
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
                            "${widget.trip.origin.name.toString()} VIP station",
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
                            "${widget.trip.destination.name.toString()} VIP station",
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
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 22, top: 10),
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
                            "\$${widget.trip.price}",
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
                          text: "Book",
                          onPressed: () async {
                            try {
                              final tp = context.read<TokenProvider>();
                              String? authorizationUrl = await bookTrip(
                                context,
                                {
                                  "Trip": widget.trip.id,
                                  "amount": widget.trip.price.toString(),
                                },
                                tp.getToken,
                              );

                              if (authorizationUrl != null &&
                                  authorizationUrl.isNotEmpty) {
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentScreeen(
                                      authorizationUrl: authorizationUrl,
                                      tripId: widget.trip.id,
                                    ),
                                  ),
                                );
                              } else {
                                return;
                              }
                            } catch (e) {
                              logs.d(e);
                            }
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
            decoration: const BoxDecoration(
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
  final Trip trip;
  const PaymentSuccessDialog({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
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
            const Center(
              child: Icon(
                Iconsax.tick_circle,
                color: Palette.primaryColor,
                size: 48,
              ),
            ),
            addVerticalSpace(6),
            const Text(
              'Transaction Successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 18,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketDetailsScreen(
                          trip: trip,
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }
}

class AvailableTicketCard extends StatelessWidget {
  final Trip trips;
  const AvailableTicketCard({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    OriginProvider op = Provider.of<OriginProvider>(context, listen: false);
    DestinationProvider dp =
        Provider.of<DestinationProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        // pushNamedRoute(context, SelectedScreenProceedScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 15),
        margin: const EdgeInsets.only(right: 20, bottom: 20, left: 20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE5ECF0), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trips.busCompany.name.toString(),
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.baseBlack,
                  ),
                ),
                Text(
                  "Total ${trips.bus.numberOfSeats} seats left",
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
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(color: Palette.primaryColor, width: 2),
                    ),
                  ),
                ),
                addHorizontalSpace(8),
                Text(
                  trips.timeScheduled.startTime,
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.greyText,
                  ),
                ),
                addHorizontalSpace(10),
                Text(
                  "${op.originModel.name} -  ",
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
              margin: const EdgeInsets.only(left: 8),
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
                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: Palette.primaryColor,
                ),
                addHorizontalSpace(8),
                Text(
                  trips.timeScheduled.endTime,
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.greyText,
                  ),
                ),
                addHorizontalSpace(10),
                Text(
                  "${dp.getDestination.name} -  ",
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
                      " ${(int.parse(trips.timeScheduled.endTime.toString().split(":")[0]) - int.parse(trips.timeScheduled.startTime.toString().split(":")[0])).toString()}hrs",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$${trips.price}",
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
