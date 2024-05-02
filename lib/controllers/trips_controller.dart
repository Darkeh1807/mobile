import 'dart:convert';
import 'package:bus_booking/config/url/url.dart';
import 'package:bus_booking/models/trip_model.dart';
import 'package:bus_booking/provider/token_provider.dart';
import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripsController {
 
  Future<List<Trip>> getAvailableTrips(BuildContext context,
      {String? departureTime, String? destinationId, String? originId}) async {
         final ap = Provider.of<TokenProvider>(context,listen: false);
    Map<String, dynamic> data =
        (departureTime == null && destinationId == null && originId == null)
            ? {
                "pagination": {"skip": "0", "limit": "10"},
                "populate": ["bus", "origin", "destination", "busCompany"],
                "search": {
                  "query": "",
                  "options": ["i"],
                  "fields": ["tripStatus", "tripType"]
                }
              }
            : {
                "pagination": {"skip": "0", "limit": "10"},
                "populate": ["bus", "origin", "destination", "busCompany"],
                "search": {
                  "query": "",
                  "options": ["i"],
                  "fields": ["tripStatus", "tripType"]
                },
                "filter": {
                  "origin": {"eq": "$originId"},
                  "destination": {"eq": "$destinationId"},
                  "date": {"eq": "$departureTime"}
                }
              };

    try {
      final res = await postDataToServer("${Url.trips}/search", data, context,
          authToken: ap.getToken);
      final jresp = jsonDecode(res);

      if (jresp["status"] == "success") {
        var dtrips = jresp["data"]["rows"] as List<dynamic>;
        List<Trip> allTrips = dtrips.map((trip) => tripFromJson(trip)).toList();
        return allTrips;
      } else {
        return [];
      }
    } catch (e) {
      logs.d(e);
      return [];
    }
  }
}
