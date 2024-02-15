import 'dart:convert';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/models/booked_trip_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/provider/user_provider.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingsController {
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
          "Trip.bus"
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
}
