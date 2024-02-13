// ignore_for_file: use_build_context_synchronously
import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_fade.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> postDataToServer(
    String uri, Map<String, dynamic> data, BuildContext ctx,
    {String? authToken}) async {
  try {
    final url = Uri.parse(uri);

    final response = await http.post(
      url,
      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body.toString();
    } else if (response.statusCode == 400) {
      return response.body.toString();
    } else if (response.statusCode == 401) {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(const SnackBar(content: Text('Token has expired')));
      await Future.delayed(const Duration(seconds: 3));

      nextScreenClosePrev(ctx, FadeRoute(page: const LoginScreen()));
      return 'Token has expired';
    } else if (response.statusCode == 500) {
      return response.body.toString();
    } else {
      return 'HTTP error ${response.statusCode} : ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'An error occured: ${e.toString()}';
  }
}
