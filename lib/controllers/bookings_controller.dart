// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/models/booked_trip_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingsController {
  //Get user booked trips(This controller method gets all trips booked by the current user)
  Future<List<BookedTrip>?> getBookedTrips(BuildContext context) async {
    final TokenProvider tp = context.read<TokenProvider>();
    final UserProvider up = context.read<UserProvider>();
    try {
      Map<String, dynamic> data = {
        "pagination": {"skip": "0", "limit": "10"},
        "populate": [
          "Trip",
          "Trip.origin",
          "Trip.destination",
          "Trip.busCompany",
          "Trip.bus",
        ],
        "search": {
          "query": "",
          "options": ["i"],
          "fields": ["status", "paymentStatus"]
        },
        "filter": {
          "User": {"eq": "${up.getUser.id}"}
        }
      };
      final res = await postDataToServer(
        Url.bookings,
        data,
        context,
        authToken: tp.getToken,
      );

      final jresp = jsonDecode(res);

      if (jresp != null && jresp["status"] == "success") {
        final serverBookedTrips = jresp["data"]["rows"] as List<dynamic>;

        final bookedTrips =
            serverBookedTrips.map((data) => bookedTripFromJson(data)).toList();

        return bookedTrips;
      }
    } catch (e) {
      logs.d(e);
    }
    return null;
  }

//Book trip method(Controller method)
  Future<String?> bookTrip(
    BuildContext context,
    Map<String, dynamic> data,
    String authToken,
  ) async {
    showProgressLoader();
    try {
      final String res = await postDataToServer(
        Url.booking,
        data,
        context,
        authToken: authToken,
      );

      final jresp = jsonDecode(res);

      if (jresp["success"] == true) {
        cancelLoader();
        // setState(() {
        //   bookingId = jresp["data"]["booking"]["_id"];
        // });

        return "booked ${jresp['data']["booking"]["_id"]}";
      } else if (jresp["message"] == "You have already booked this trip") {
        cancelLoader();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You have already booked this trip")));
      }
    } catch (e) {
      cancelLoader();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Check your internet connection")));
      logs.d("Error: $e");
    }
    return null;
  }
}
