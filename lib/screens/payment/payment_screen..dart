// ignore_for_file: file_names

import 'package:bus_booking/provider/destination_provider.dart';
import 'package:bus_booking/provider/origin_provider.dart';
import 'package:bus_booking/screens/home/app_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreeen extends StatefulWidget {
  final String authorizationUrl;
  final String tripId;

  const PaymentScreeen(
      {Key? key, required this.authorizationUrl, required this.tripId})
      : super(key: key);

  @override
  State<PaymentScreeen> createState() => _PaymentScreeenState();
}

class _PaymentScreeenState extends State<PaymentScreeen> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (url) {
            if (url.contains(
                "https://bus-booking-server-test.azurewebsites.net/api/v1/payment/callback")) {
              context.read<DestinationProvider>().clearDestination();
              context.read<OriginProvider>().clearOrigin();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppHome(),
                  ));
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.authorizationUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
