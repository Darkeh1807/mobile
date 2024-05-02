// ignore_for_file: use_build_context_synchronously
import 'package:bus_booking/controllers/bookings_controller.dart';
import 'package:bus_booking/models/trip_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/screens/payment/payment_proceed_screen.dart';
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

  @override
  State<BookingDetailsConfirmScreen> createState() =>
      _BookingDetailsConfirmScreenState();
}

class _BookingDetailsConfirmScreenState
    extends State<BookingDetailsConfirmScreen> {
  bool hasPaid = false;
  String bookingId = "";

  @override
  Widget build(BuildContext context) {
    final tp = Provider.of<TokenProvider>(context, listen: false);
    final bc = BookingsController(); //Instance of bookings controller
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context, null),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              "${widget.trip.origin?.name} - ${widget.trip.destination?.name}",
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
                  padding: const EdgeInsets.all(15),
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
                            widget.trip.bus?.model ?? '',
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
                            widget.trip.timeScheduled?.startTime ?? '',
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
                            widget.trip.timeScheduled?.endTime ?? '',
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
                            widget.trip.busCompany?.name ?? '',
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
                            "${widget.trip.origin?.name.toString()} VIP station",
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
                            "${widget.trip.destination?.name.toString()} VIP station",
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
                              String? booked = await bc.bookTrip(
                                context,
                                {
                                  "Trip": widget.trip.id,
                                  "amount": widget.trip.price.toString(),
                                },
                                tp.getToken,
                              );

                              if (booked != null &&
                                  booked.split(" ")[0] == "booked") {
                                setState(() {
                                  bookingId = booked.split(" ")[1];
                                });
                                showDialog(
                                  context: context,
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  barrierDismissible: false,
                                  builder: (context) => SuccessDialog(
                                    trip: widget.trip,
                                    dialogtitle: 'Booked succesfully',
                                    dialogMsg:
                                        'You have successfully booked the trip',
                                    callback: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PaymentProceedScreen(
                                            trip: widget.trip,
                                            bookingId: bookingId,
                                          ),
                                        ),
                                      );
                                    },
                                    btnMsg: 'Proceed to pay',
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
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final Trip? trip;
  final String? dialogtitle;
  final String? dialogMsg;
  final VoidCallback? callback;
  final String? btnMsg;
  final String? bookingId;
  const SuccessDialog(
      {super.key,
      this.trip,
      this.dialogtitle,
      this.dialogMsg,
      this.callback,
      this.btnMsg,
      this.bookingId});

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
            Text(
              dialogtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 18,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              dialogMsg!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF1D1D1F),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            addVerticalSpace(25),
            CustomPrimaryButton(
                text: btnMsg.toString(),
                radius: 4,
                fontWeight: FontWeight.w500,
                height: 44,
                onPressed: callback)
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
    return InkWell(
      onTap: () {},
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
                  trips.busCompany?.name ?? '',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.baseBlack,
                  ),
                ),
                Text(
                  "Seats left-${trips.bus?.numberOfSeats}",
                  textScaler: const TextScaler.linear(1),
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
                  trips.timeScheduled?.startTime ?? '',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.greyText,
                  ),
                ),
                addHorizontalSpace(10),
                Text(
                  "${trips.origin?.name} -  ",
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
                  trips.timeScheduled?.endTime ?? '',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.greyText,
                  ),
                ),
                addHorizontalSpace(10),
                Text(
                  "${trips.destination?.name} -  ",
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
                      " ${(int.parse(trips.timeScheduled!.endTime.toString().split(":")[0]) - int.parse(trips.timeScheduled!.startTime.toString().split(":")[0])).toString()}hrs",
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
