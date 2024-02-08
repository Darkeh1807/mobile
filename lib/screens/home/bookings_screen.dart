import 'dart:convert';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/theme/sizing.dart';
import 'package:bus_booking/config/theme/spacing.dart';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/models/booked_ticket_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/services/get_from_server.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final List<String> _tripTypes = [
    "All",
    "Today",
    "Upcoming",
    "Expired",
  ];

  String selectedTripType = "All";

  Future<List<TicketBooked>?> getBookedTrips(BuildContext context) async {
    final TokenProvider tp = context.read<TokenProvider>();
    try {
      final String res = await getFromServer(
        "${Url.bookings}?skip=0&limit=10&populate=Trip&fields=status&options=i&query&filter=",
        context,
        authToken: tp.getToken,
      );
      final dynamic jresp = jsonDecode(res);

      if (jresp["status"] == "success") {
        final djresp = jresp["data"]["bookings"] as List<dynamic>;
        final allBookedTickets =
            djresp.map((ticket) => ticketBookedFromJson(ticket)).toList();
        logs.d(allBookedTickets);
        return allBookedTickets;
      }
    } catch (e) {
      logs.d(e);
    }
    return null;
  }

  @override
  void initState() {
    getBookedTrips(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'My Bookings',
          style: GoogleFonts.manrope(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _tripTypes
                  .map((e) => Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(e),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 12, vertical: 12),
                          backgroundColor: Colors.white,
                          elevation: 0,
                          side: BorderSide(
                            color: selectedTripType == e
                                ? const Color(0xFF0402FC)
                                : Palette.lightBorder,
                            width: 1,
                          ),
                          selectedColor: Palette.primaryColor,
                          labelStyle: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: selectedTripType == e
                                ? Colors.white
                                : const Color(0xFF808099),
                          ),
                          selected: selectedTripType == e,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedTripType = selected ? e : "";
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
            addVerticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.pageHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently Booked',
                        style: TextStyle(
                          color: Color(0xFF000023),
                          fontSize: 14,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(10),
                  SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: FutureBuilder<List<TicketBooked>?>(
                        future: getBookedTrips(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Align(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CircularProgressIndicator(),
                                    addVerticalSpace(5),
                                    const Text("Loading tickets..."),
                                  ],
                                ),
                              );
                            default:
                              if (snapshot.data == null ||
                                  snapshot.data!.isEmpty) {
                                return const NoBookingWidget();
                              } else {
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return TicketDisplayWidget(
                                      ticket: snapshot.data![index],
                                    );
                                  },
                                );
                              }
                          }
                        },
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketDisplayWidget extends StatelessWidget {
  final TicketBooked ticket;
  const TicketDisplayWidget({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    int endTimeHour =
        int.parse(ticket.trip?.timeScheduled?.endTime?.split(":")[0] ?? '0');
    int startTimeHour =
        int.parse(ticket.trip?.timeScheduled?.startTime?.split(":")[0] ?? '0');

    int differenceInHours = endTimeHour - startTimeHour;
    return InkWell(
      onTap: () {},
      child: Ink(
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: Color(0xFF5E90CC)),
              borderRadius: BorderRadius.circular(Sizing.baseBorderRadius),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.08,
                    20,
                    MediaQuery.of(context).size.width * 0.08,
                    8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ticket.id ?? '',
                            style: const TextStyle(
                              color: Color(0xFF2465C2),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${ticket.createdAt?.day}/${ticket.createdAt?.month}/${ticket.createdAt?.year}",
                            style: const TextStyle(
                              color: Color(0xFF2465C2),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          )
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
                                side: BorderSide(
                                    color: Palette.primaryColor, width: 2),
                              ),
                            ),
                          ),
                          addHorizontalSpace(8),
                          Text(
                            ticket.trip?.timeScheduled?.startTime ?? '',
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
                            ticket.trip?.timeScheduled?.endTime ?? '',
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
                    ]),
              ),
              SizedBox(
                height: 22,
                child: Stack(
                  children: [
                    const Center(
                        child: DottedLine(dashColor: Color(0xFFEEF2F8))),
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
                    8,
                    MediaQuery.of(context).size.width * 0.08,
                    20),
                child: Row(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NoBookingWidget extends StatelessWidget {
  const NoBookingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Center(
        child: Column(
          children: [
            addVerticalSpace(
              MediaQuery.of(context).size.height * 0.18,
            ),
            Image.asset("assets/images/empty_booking.png"),
            addVerticalSpace(24),
            const Text(
              'There are no active bookings here.',
              style: TextStyle(
                color: Color(0xFF777777),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
