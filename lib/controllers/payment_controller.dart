// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bus_booking/services/post_to_server.dart';
import 'package:bus_booking/utils/loaders.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:flutter/material.dart';

import '../config/url/url.dart';

class PaymentsController{
  Future<String?> initPayment(
    BuildContext context,
    Map<String, dynamic> data,
    String authToken,
  ) async {
    showProgressLoader();
    try {
      final resp = await postDataToServer(
        Url.payment,
        data,
        context,
        authToken: authToken,
      );
      final jresp = jsonDecode(resp);
      logs.d(jresp);

      if (jresp["success"] == true) {
        cancelLoader();
        return jresp["data"]["data"]["authorization_url"];
      } else if (jresp["message"] == "Duplicate Transaction Reference") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Request failed: Duplicate Transaction Reference",
            ),
          ),
        );
      } else {
        cancelLoader();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Request failed",
            ),
          ),
        );
      }
    } catch (e) {
      cancelLoader();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Error:Check your internet connection",
          ),
        ),
      );
    }
    return null;
  }
}