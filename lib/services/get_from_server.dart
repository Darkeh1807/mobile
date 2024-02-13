import 'package:bus_booking/route_transitions/pagesnavigator.dart';
import 'package:bus_booking/route_transitions/route_transition_fade.dart';
import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> getFromServer(String uri, BuildContext ctx,
    {String? authToken}) async {
  try {
    final url = Uri.parse(uri);
    final response = await http.get(
      url,
      headers: {'authorization': 'Bearer $authToken'},
    );
    if (response.statusCode == 200) {
      return response.body.toString();
    } else if (response.statusCode == 401) {
      showToast("token expired");
      await Future.delayed(const Duration(seconds: 3));
      // ignore: use_build_context_synchronously
      nextScreenClosePrev(ctx, FadeRoute(page: const LoginScreen()));
      return 'Token has expired';
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    showToast("Check your internet  connection ");
    return 'An error occured: ${e.toString()}';
  }
}
