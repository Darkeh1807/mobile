import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/theme/sizing.dart';
import 'package:bus_booking/config/theme/spacing.dart';
import 'package:bus_booking/controllers/bookings_controller.dart';
import 'package:bus_booking/models/booked_trip_model.dart';
import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_slide_left.dart';
import 'package:bus_booking/screens/ticket/ticket_details_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  Future<List<BookedTrip>?> getBookedTrips(BuildContext context) async {
    final data = await BookingsController().getBookedTrips(context);
    return data;
  }

  @override
  void initState() {
    super.initState();
    getBookedTrips(context);
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
                    child: FutureBuilder<List<BookedTrip>?>(
                      future: getBookedTrips(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  const CircularProgressIndicator(),
                                  addVerticalSpace(5),
                                  const Text("Loading booked trips..."),
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
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: BookedTripDisplayWidget(
                                      bookedTrip: snapshot.data![index],
                                      callback: () {
                                        nextScreen(
                                            context,
                                            SlideLeftRoute(
                                              page: TicketDetailsScreen(
                                                bookingId:
                                                    snapshot.data![index].id ??
                                                        '',
                                              ),
                                            ));
                                      },
                                    ),
                                  );
                                },
                              );
                            }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookedTripDisplayWidget extends StatelessWidget {
  final BookedTrip bookedTrip;
  final VoidCallback? callback;
  const BookedTripDisplayWidget(
      {super.key, required this.bookedTrip, this.callback});

  @override
  Widget build(BuildContext context) {
    int endTimeHour = int.parse(
        bookedTrip.trip?.timeScheduled?.endTime?.split(":")[0] ?? '0');
    int startTimeHour = int.parse(
        bookedTrip.trip?.timeScheduled?.startTime?.split(":")[0] ?? '0');

    int differenceInHours = endTimeHour - startTimeHour;
    return InkWell(
      onTap: callback,
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
                            bookedTrip.id ?? '',
                            style: const TextStyle(
                              color: Color(0xFF2465C2),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${bookedTrip.createdAt?.day}/${bookedTrip.createdAt?.month}/${bookedTrip.createdAt?.year}",
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
                            bookedTrip.trip?.timeScheduled?.startTime ?? '',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Palette.greyText,
                            ),
                          ),
                          addHorizontalSpace(10),
                          Text(
                            bookedTrip.trip?.origin?.name ?? '',
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
                            bookedTrip.trip?.timeScheduled?.endTime ?? '',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Palette.greyText,
                            ),
                          ),
                          addHorizontalSpace(10),
                          Text(
                            bookedTrip.trip?.destination?.name ?? '',
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
