// ignore_for_file: file_names

import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/models/trip_model.dart';
import 'package:bus_booking/screens/ticket/gen_ticket_details_screen.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:bus_booking/widgets/base/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreeen extends StatefulWidget {
  final String authorizationUrl;
  final String tripId;
  final String bookingId;
  final String authToken;

  const PaymentScreeen(
      {Key? key,
      required this.authorizationUrl,
      required this.tripId,
      required this.bookingId,
      required this.authToken})
      : super(key: key);

  @override
  State<PaymentScreeen> createState() => _PaymentScreeenState();
}

class _PaymentScreeenState extends State<PaymentScreeen> {
  late WebViewController controller;
  int loadingState = 0;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingState = progress;
            });
          },
          onPageStarted: (url) {
            if (url.contains(
                "https://molidom.adjuma.io/api/v1/payment/callback")) {
              showDialog(
                context: context,
                builder: (context) {
                  return SuccessDialog(
                    dialogtitle: "Transaction Successful",
                    dialogMsg:
                        "Psyment for ticket has successfully been\n completed",
                    btnMsg: "View ticket",
                    bookingId: widget.bookingId,
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GeneratedTicketDetailsScreen(
                            bookingId: widget.bookingId,
                            authToken: widget.authToken,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.authorizationUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logs.d(loadingState);
    return Scaffold(
      body: SafeArea(
        child: loadingState < 100
            ? Column(
                children: [
                  LinearProgressIndicator(
                    value: loadingState.toDouble(),
                  ),
                  Text(
                    loadingState.toString(),
                    style: GoogleFonts.lexend(
                      color: Palette.primaryColor,
                    ),
                  )
                ],
              )
            : WebViewWidget(
                controller: controller,
              ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final Trip? trip;
  final String? dialogtitle;
  final String? dialogMsg;
  final VoidCallback? callback;
  final String? btnMsg;
  final String? bookingId;
  const SuccessDialog(
      {super.key,
      this.trip,
      this.dialogtitle,
      this.dialogMsg,
      this.callback,
      this.btnMsg,
      this.bookingId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 32),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Icon(
                Iconsax.tick_circle,
                color: Palette.primaryColor,
                size: 48,
              ),
            ),
            addVerticalSpace(6),
            Text(
              dialogtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 18,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              dialogMsg!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF1D1D1F),
                fontSize: 14,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
              ),
            ),
            addVerticalSpace(25),
            CustomPrimaryButton(
                text: btnMsg.toString(),
                radius: 4,
                fontWeight: FontWeight.w500,
                height: 44,
                onPressed: callback)
          ],
        ),
      ),
    );
  }
}
