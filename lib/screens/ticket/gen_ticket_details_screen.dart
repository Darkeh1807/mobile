import 'dart:convert';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/theme/sizing.dart';
import 'package:bus_booking/config/theme/spacing.dart';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/models/ticket_model.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_slide_right.dart';
import 'package:bus_booking/screens/home/app_home.dart';
import 'package:bus_booking/services/get_from_server.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_outlined_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class GeneratedTicketDetailsScreen extends StatefulWidget {
  final String bookingId;
  final String? authToken;
  const GeneratedTicketDetailsScreen({
    super.key,
    required this.bookingId,
    this.authToken,
  });

  @override
  State<GeneratedTicketDetailsScreen> createState() =>
      _GeneratedTicketDetailsScreenState();
}

class _GeneratedTicketDetailsScreenState
    extends State<GeneratedTicketDetailsScreen> {
  Ticket tickets = Ticket();
  bool isLoading = true;

  Future<void> getTicket(BuildContext context) async {
    try {
      final res = await getFromServer(
        "${Url.ticket}?bookingId=${widget.bookingId}&populate=Booking,Booking.Trip,Booking.Trip.origin,Booking.Trip.destination,Booking.Trip.bus,Booking.Trip.busCompany",
        context,
        authToken: widget.authToken,
      );
      final jresp = jsonDecode(res);

      if (jresp != null) {
        var serverTicket = jresp as List<dynamic>;
        List<Ticket> assignedTicket =
            serverTicket.map((ticket) => ticketFromJson(ticket)).toList();
        for (var i = 0; i < serverTicket.length; i++) {
          setState(() {
            tickets = assignedTicket[i];
            logs.d(tickets);
            isLoading = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      logs.d(e);
    }
  }

  @override
  void initState() {
    getTicket(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int endTimeHour = int.parse(
        tickets.booking?.trip?.timeScheduled?.endTime?.split(":")[0] ?? '0');
    int startTimeHour = int.parse(
        tickets.booking?.trip?.timeScheduled?.startTime?.split(":")[0] ?? '0');

    int differenceInHours = endTimeHour - startTimeHour;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<DestinationProvider>().clearDestination();
            context.read<OriginProvider>().clearOrigin();

            nextScreenClosePrev(
                context,
                SlideRightRoute(
                  page: const AppHome(),
                ));
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: Text(
          "Ticket Details",
          style: GoogleFonts.manrope(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.string(
                """<svg width="24" height="25" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M11.7057 14.2071L17.9986 7.91421V11.5H19.9986V4.5H12.9986V6.5H16.5844L10.2915 12.7929L11.7057 14.2071Z" fill="#201F20"/>
<path d="M19.0015 18.5V14.5H17.0015V18.5H6.00146V7.5H10.0015V5.5H6.00146C4.8969 5.5 4.00146 6.39543 4.00146 7.5V18.5C4.00146 19.6046 4.8969 20.5 6.00146 20.5H17.0015C18.106 20.5 19.0015 19.6046 19.0015 18.5Z" fill="#201F20"/>
</svg>
"""),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.pageHorizontalPadding,
        ),
        child: isLoading
            ? const Align(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "Loading your ticket",
                      style: TextStyle(
                        color: Color(0xFF2465C2),
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )
            : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                addVerticalSpace(20),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF5E90CC)),
                      borderRadius:
                          BorderRadius.circular(Sizing.baseBorderRadius),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.08,
                            20,
                            20,
                            MediaQuery.of(context).size.width * 0.08),
                        // margin: EdgeInsets.only(right: 20, bottom: 20, left: 20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tickets.id ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFF2465C2),
                                    fontSize: 12,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "${tickets.createdAt?.day}/${tickets.createdAt?.month}/${tickets.createdAt?.year}",
                                  style: const TextStyle(
                                    color: Color(0xFF2465C2),
                                    fontSize: 12,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            addVerticalSpace(10),
                            SizedBox(
                              child: Row(
                                children: [
                                  addHorizontalSpace(4),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const ShapeDecoration(
                                      shape: CircleBorder(
                                        side: BorderSide(
                                            color: Palette.primaryColor,
                                            width: 2),
                                      ),
                                    ),
                                  ),
                                  addHorizontalSpace(8),
                                  Text(
                                    tickets.booking?.trip?.timeScheduled
                                            ?.startTime ??
                                        '',
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Palette.greyText,
                                    ),
                                  ),
                                  addHorizontalSpace(10),
                                  Text(
                                    "${tickets.booking?.trip?.origin?.name} -",
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
                                  tickets.booking?.trip?.timeScheduled
                                          ?.endTime ??
                                      '',
                                  style: GoogleFonts.manrope(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Palette.greyText,
                                  ),
                                ),
                                addHorizontalSpace(10),
                                Text(
                                  "${tickets.booking?.trip?.destination?.name} -  ",
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
                                      "${differenceInHours}hrs",
                                      style: GoogleFonts.manrope(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Palette.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  '1 Seat',
                                  style: TextStyle(
                                    color: Color(0xFF2465C2),
                                    fontSize: 12,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 22,
                        child: Stack(
                          children: [
                            const Center(
                                child:
                                    DottedLine(dashColor: Color(0xFFEEF2F8))),
                            Positioned(
                                left: 0,
                                top: 0,
                                child: SvgPicture.asset(
                                  "assets/svg/ellipse.svg",
                                  height: 22,
                                )),
                            Positioned(
                                right: 0,
                                top: 0,
                                child: SvgPicture.asset(
                                  "assets/svg/ellipse_rotated.svg",
                                  height: 22,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.08,
                            20,
                            35,
                            MediaQuery.of(context).size.width * 0.08),
                        child: Row(
                          children: [
                            IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  DetailDisplayWidget(
                                    title: "Bus Type",
                                    value:
                                        tickets.booking?.trip?.bus?.model ?? '',
                                  ),
                                  addVerticalSpace(24),
                                  DetailDisplayWidget(
                                    title: "Departure Time",
                                    value: tickets.booking?.trip?.timeScheduled
                                            ?.startTime ??
                                        '',
                                  ),
                                  addVerticalSpace(24),
                                  DetailDisplayWidget(
                                    title: "Dropping Point",
                                    value: tickets
                                            .booking?.trip?.destination?.name ??
                                        '',
                                  ),
                                  addVerticalSpace(24),
                                  DetailDisplayWidget(
                                    title: "Buss Number",
                                    value: tickets.booking?.trip?.bus
                                            ?.vehicleNumber ??
                                        '',
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  DetailDisplayWidget(
                                    title: "Bus Operator",
                                    value: tickets
                                            .booking?.trip?.busCompany?.name ??
                                        '',
                                  ),
                                  addVerticalSpace(24),
                                  DetailDisplayWidget(
                                    title: "Arrival Time",
                                    value: tickets.booking?.trip?.timeScheduled
                                            ?.endTime ??
                                        '',
                                  ),
                                  addVerticalSpace(24),
                                  DetailDisplayWidget(
                                    title: "Boarding Point",
                                    value:
                                        tickets.booking?.trip?.origin?.name ??
                                            '',
                                  ),
                                  addVerticalSpace(24),
                                  DetailDisplayWidget(
                                    title: "Seat ",
                                    value: tickets.booking?.seatNumber
                                            .toString() ??
                                        '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 22,
                        child: Stack(
                          children: [
                            const Center(
                                child:
                                    DottedLine(dashColor: Color(0xFFEEF2F8))),
                            Positioned(
                                left: 0,
                                top: 0,
                                child: SvgPicture.asset(
                                  "assets/svg/ellipse.svg",
                                  height: 22,
                                )),
                            Positioned(
                                right: 0,
                                top: 0,
                                child: SvgPicture.asset(
                                  "assets/svg/ellipse_rotated.svg",
                                  height: 22,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.08,
                          0,
                          0,
                          MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              tickets.qrCode ?? '',
                              width: MediaQuery.of(context).size.width * 0.35,
                            ),
                            addVerticalSpace(5),
                            const Text(
                              'Show the QR Code at the boarding point',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                addVerticalSpace(20),
                CustomOutlinedButton(
                  text: "Download",
                  onPressed: () {},
                  icon: const Icon(Iconsax.document_download),
                ),
                addVerticalSpace(70)
              ]),
      ),
    );
  }
}

class DetailDisplayWidget extends StatelessWidget {
  const DetailDisplayWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
              fontSize: 12,
              height: 1,
              color: Palette.greyText,
              fontWeight: FontWeight.w400),
        ),
        addVerticalSpace(6),
        Text(
          value,
          style: GoogleFonts.manrope(
              height: 1,
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
