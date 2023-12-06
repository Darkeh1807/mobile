import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/models/trip_model.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/screens/booking/booking_details_cofirm_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SelectedScreenProceedScreen extends StatelessWidget {
  const SelectedScreenProceedScreen({super.key, required this.trip});
  final Trip trip;
  static const routeName = '/selected_screen_proceed_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "${trip.origin?.name} - ${trip.destination?.name}",
          style: GoogleFonts.manrope(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: AvailableTicketCard(
                trips: trip,
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
                        "${trip.timeScheduled!.startTime}",
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
                        "${trip.timeScheduled!.endTime}",
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
                        "${trip.busCompany?.name}",
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
                  Text(
                    "Select Seat",
                    style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  addVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette.greyText,
                                width: 1,
                              ),
                            ),
                          ),
                          addHorizontalSpace(4),
                          Text(
                            "Available",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: const Color(0xFF20415B),
                                fontWeight: FontWeight.w400,
                                height: 1.2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                                color: Palette.primaryColor),
                          ),
                          addHorizontalSpace(4),
                          Text(
                            "Booked",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: const Color(0xFF20415B),
                                fontWeight: FontWeight.w400,
                                height: 1.2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 9,
                            height: 9,
                            decoration:
                                const BoxDecoration(color: Palette.baseBlack),
                          ),
                          addHorizontalSpace(4),
                          Text(
                            "Unavailable",
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: const Color(0xFF20415B),
                                fontWeight: FontWeight.w400,
                                height: 1.2),
                          ),
                        ],
                      ),
                    ],
                  ),
                  addVerticalSpace(30),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing:
                            MediaQuery.of(context).size.width * 50 / 375,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 43,
                        crossAxisCount: 4),
                    children: const [
                      SeatNumberDisplayWidget(seatNumberTitle: "A1"),
                      SeatNumberDisplayWidget(seatNumberTitle: "A2"),
                      SeatNumberDisplayWidget(seatNumberTitle: "A3"),
                      SeatNumberDisplayWidget(seatNumberTitle: "A4"),
                      //DO same for B, C  D , E and F
                      SeatNumberDisplayWidget(seatNumberTitle: "B1"),
                      SeatNumberDisplayWidget(seatNumberTitle: "B2"),
                      SeatNumberDisplayWidget(seatNumberTitle: "B3"),
                      SeatNumberDisplayWidget(seatNumberTitle: "B4"),

                      SeatNumberDisplayWidget(seatNumberTitle: "C1"),
                      SeatNumberDisplayWidget(seatNumberTitle: "C2"),
                      SeatNumberDisplayWidget(seatNumberTitle: "C3"),
                      SeatNumberDisplayWidget(
                          seatNumberTitle: "C4", status: "unavailable"),

                      SeatNumberDisplayWidget(seatNumberTitle: "D1"),
                      SeatNumberDisplayWidget(
                          seatNumberTitle: "D2", status: "booked"),
                      SeatNumberDisplayWidget(seatNumberTitle: "D3"),
                      SeatNumberDisplayWidget(seatNumberTitle: "D4"),

                      SeatNumberDisplayWidget(seatNumberTitle: "E1"),
                      SeatNumberDisplayWidget(
                          seatNumberTitle: "E2", status: "booked"),
                      SeatNumberDisplayWidget(seatNumberTitle: "E3"),
                      SeatNumberDisplayWidget(seatNumberTitle: "E4"),

                      SeatNumberDisplayWidget(seatNumberTitle: "F1"),
                      SeatNumberDisplayWidget(seatNumberTitle: "F2"),
                      SeatNumberDisplayWidget(seatNumberTitle: "F3"),
                      SeatNumberDisplayWidget(seatNumberTitle: "F4")
                    ],
                  ),
                  addVerticalSpace(
                    50,
                  ),
                  CustomPrimaryButton(
                      text: "Continue",
                      onPressed: () {
                        pushNamedRoute(
                            context, BookingDetailsConfirmScreen.routeName);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SeatNumberDisplayWidget extends StatefulWidget {
  const SeatNumberDisplayWidget(
      {super.key, required this.seatNumberTitle, this.status = "available"});
  final String seatNumberTitle;
  final String status;

  @override
  State<SeatNumberDisplayWidget> createState() =>
      _SeatNumberDisplayWidgetState();
}

class _SeatNumberDisplayWidgetState extends State<SeatNumberDisplayWidget> {
  Color bgColor = Colors.white;

  Color textColor = Palette.greyText;

  @override
  Widget build(BuildContext context) {
    switch (widget.status) {
      case "available":
        bgColor = Colors.white;
        textColor = Palette.greyText;
        break;
      case "booked":
        bgColor = Palette.primaryColor;
        textColor = Colors.white;

        break;
      case "unavailable":
        bgColor = Palette.baseBlack;
        textColor = Colors.white;

        break;
      default:
        bgColor = Colors.white;
    }
    return Container(
      width: 43,
      height: 43,
      constraints: const BoxConstraints(
        maxHeight: 43,
        maxWidth: 43,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: bgColor,
        border: Border.all(
          width: 1,
          color: Palette.greyText,
        ),
      ),
      child: Center(
        child: Text(
          widget.seatNumberTitle,
          style: GoogleFonts.manrope(
            fontSize: 12,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedScreenProceedScreen(
                trip: trips,
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 12, 15, 15),
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
                  trips.busCompany!.name.toString(),
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.baseBlack,
                  ),
                ),
                Text(
                  "Total ${trips.bus!.numberOfSeats} seats left",
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
                  "${trips.timeScheduled!.startTime}",
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
                  "${trips.timeScheduled!.endTime}",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.greyText,
                  ),
                ),
                addHorizontalSpace(10),
                Text(
                  "${dp.destinationModel.name} -  ",
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
                      "10hrs",
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
