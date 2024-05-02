import 'dart:convert';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/controllers/trips_controller.dart';
import 'package:bus_booking/models/trip_model.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/screens/booking/select_trip_proceed_screen.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({
    Key? key,
    this.departureTime,
    this.destinationId,
    this.originId,
 
  }) : super(
          key: key,
        );

  final String? departureTime;
  final String? destinationId;
  final String? originId;


  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final List<String> _tripTypes = [
    "All",
    "Cheapest",
    "Fastest",
    "Earliest",
    "Latest"
  ];
  String selectedTripType = "All";

  @override
  Widget build(BuildContext context) {
    OriginProvider op = Provider.of<OriginProvider>(context, listen: false);
    DestinationProvider dp =
        Provider.of<DestinationProvider>(context, listen: false);
    final tc = TripsController(); //Trips controller

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          (op.getOrigin.name == null && dp.getDestination.name == null)
              ? ""
              : "${op.getOrigin.name} - ${dp.getDestination.name}",
          style: GoogleFonts.manrope(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       pushWidgetRoute(context, const SearchResultsFilterScreen());
        //     },
        //     icon: const CircleAvatar(
        //       backgroundColor: Palette.primaryColor,
        //       child: Icon(
        //         Iconsax.setting_4,
        //         size: 20,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _tripTypes
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(e),
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
                      ),
                    )
                    .toList(),
              ),
            ),
            addVerticalSpace(20),
            FutureBuilder<List<Trip>>(
              future: tc.getAvailableTrips(
                context,
                departureTime: widget.departureTime,
                destinationId: widget.destinationId,
                originId: widget.originId,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error loading data"),
                  );
                } else if (snapshot.data?.isEmpty ?? true) {
                  return const Center(
                    child: Text("No trip found"),
                  );
                } else {
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return AvailableTicketCard(
                        trips: snapshot.data![index],
                      );
                    },
                  );
                }
              },
            ),
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
      onTap: () {
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
              children: [
                Text(
                  trips.busCompany?.name ?? '',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.baseBlack,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "seats left: ${trips.bus?.numberOfSeats}",
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
                          color: Palette.primaryColor),
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
