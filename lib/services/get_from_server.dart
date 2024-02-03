import 'package:bus_booking/screens/auth/login_screen.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/toast.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> getFromServer(String uri, BuildContext ctx,
    {String? authToken}) async {
//Method to get from server and return the body of the response as s String which will then be encoded
  try {
    final url = Uri.parse(uri);
    logs.d(url);
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
      pushNamedRoute(ctx, LoginScreen.routeName);
      return 'Token has expired';
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    showToast("Check your internet  connection ");
    return 'An error occured: ${e.toString()}';
  }
}
