import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/screens/booking/search_results_filters_screen.dart';
import 'package:bus_booking/screens/booking/select_trip_proceed_screen.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchResultsScreen extends StatefulWidget {
  SearchResultsScreen({super.key});
  static const routeName = 'search_results_screen';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Accra, Ghana - Lagos, Nigeria",
          style: GoogleFonts.manrope(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pushWidgetRoute(context, SearchResultsFilterScreen());
            },
            icon: CircleAvatar(
              backgroundColor: Palette.primaryColor,
              child: Icon(
                Iconsax.setting_4,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _tripTypes
                    .map((e) => Container(
                          margin: EdgeInsets.only(right: 10),
                          child: ChoiceChip(
                            label: Text(e),
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 12, vertical: 12),
                            backgroundColor: Colors.white,
                            elevation: 0,
                            side: BorderSide(
                              color: selectedTripType == e
                                  ? Color(0xFF0402FC)
                                  : Palette.lightBorder,
                              width: 1,
                            ),
                            selectedColor: Palette.primaryColor,
                            labelStyle: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: selectedTripType == e
                                  ? Colors.white
                                  : Color(0xFF808099),
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
            ),
            addVerticalSpace(20),
            AvailableTicketCard(),
            AvailableTicketCard(),
            AvailableTicketCard(),
            AvailableTicketCard(),
            AvailableTicketCard(),
            AvailableTicketCard(),
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
        pushNamedRoute(context, SelectedScreenProceedScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 12, 15, 15),
        margin: EdgeInsets.only(right: 20, bottom: 20, left: 20),
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
