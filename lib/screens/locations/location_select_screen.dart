import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/base_outlined_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../config/theme/palette.dart';

class LocationSelectScreen extends StatelessWidget {
  const LocationSelectScreen({super.key, required this.selecting});
  final String selecting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context, null),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(selecting,
            style: GoogleFonts.manrope(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              left: 20,
              right: 20,
              bottom: 12,
            ),
            child: BaseOutlinedinput(
              hintText: "Search for station or city",
              prefix: Icon(
                Iconsax.search_normal_1,
                size: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          addVerticalSpace(10),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
              LocationResultTile(
                location: "Kathmandu, Nepal",
              ),
            ],
          ))),
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
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Palette.neutral100,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        onTap: () {},
        leading: Icon(
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
