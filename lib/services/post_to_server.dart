import 'dart:math';

import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<String> postToServer(String url, Map<String, dynamic> data,
//     {bool userFormData = true}) async {
//   late Response response;
//   Dio dio = Dio();
//   try {
//     logs.d(data);
//     response = await dio.post(
//       url,
//       data: userFormData ? FormData.fromMap(data) : data,
//       options: Options(
//         headers: {
//           'Accept': 'application/json',
//           'Content-Type': 'application/json'
//         },
//       ),
//     );
//     logs.d(response.data);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return response.toString();
//     } else {
//       return 'Error, Cannot post data';
//     }
//   } catch (e) {
//     return 'Error: $e';
//   }
// }

Future<String> postUrlEncodeToServer(
    String uri, Map<String, dynamic> data) async {
  try {
    final url = Uri.parse(uri);

    //Convert request data into the x-www-urlencoded format

    final body = Uri.encodeQueryComponent(
        data.entries.map((entry) => "${entry.key}=${entry.value}").join("&"));
    final response = await http.post(url, body: body, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (response.statusCode == 201) {
      return response.body.toString();
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    return '$e';
  }
}

Future<String> postDataToServer(String uri, Map<String, dynamic> data,BuildContext ctx) async {
  try {
    logs.d(data);
    final url = Uri.parse(uri);
    final response = await http.post(
      url,
      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      return response.body.toString();
    } else if (response.statusCode == 400) {
     ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('')));
      return 'User already exists';
    } else {
      return 'HTTP error ${response.statusCode}: ${response.reasonPhrase}';
    }
  } catch (e) {
    return 'An error occured: ${e.toString()}';
  }
}
