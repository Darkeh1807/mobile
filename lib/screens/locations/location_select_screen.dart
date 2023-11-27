import 'dart:convert';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/models/locations_model.dart';
import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/services/get_from_server.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/base_outlined_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../config/theme/palette.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({super.key, required this.selecting});
  final String selecting;

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  List<Place> places = [];

  Future<void> getAllAvailableLocations() async {
    try {
      final res = await getFromServer(Url.locations);
      final jresp = jsonDecode(res);
      if (jresp["status"] == "success") {
        var locs = jresp["data"]["locations"] as List<dynamic>;
        List<Place> allLocs = locs.map((loc) => placeFromJson(loc)).toList();
        setState(() {
          places = allLocs;
        });
      }
    } catch (e) {
      logs.d(e);
    }
  }

  _search(String enteredKeyword) {
    List<Place> results = [];

    if (enteredKeyword.isEmpty) {
      results = places;
    } else {
      results = places.where((place) {
        return place.name!.toLowerCase().contains(enteredKeyword.toLowerCase());
      }).toList();
    }

    setState(() {
      places = results;
    });
  }

  @override
  void initState() {
    getAllAvailableLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OriginProvider op = Provider.of<OriginProvider>(context, listen: false);
    DestinationProvider dp =
        Provider.of<DestinationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.selecting,
            style: GoogleFonts.manrope(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 20,
              bottom: 12,
            ),
            child: BaseOutlinedinput(
              hintText: "Search for station or city",
              prefix: const Icon(
                Iconsax.search_normal_1,
                size: 20,
              ),
              onChanged: (value) {
                _search(value);
              },
            ),
          ),
          const Divider(
            height: 1,
          ),
          addVerticalSpace(10),
          places.isEmpty || places == []
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (widget.selecting == "Origin") {
                          op.setOrigin = places[index];
                          Navigator.pop(context);
                        } else if (widget.selecting == "Destination") {
                          dp.setDestionation = places[index];
                          Navigator.pop(context);
                        }
                      },
                      child: LocationResultTile(
                          location: places[index].name.toString()),
                    );
                  },
                )),
        ],
      ),
    );
  }
}

class LocationResultTile extends StatelessWidget {
  const LocationResultTile({
    super.key,
    required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Palette.neutral100,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.location_on_outlined,
          color: Colors.black,
        ),
        title: Text(
          location,
          style: GoogleFonts.manrope(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
