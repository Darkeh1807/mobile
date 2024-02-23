import 'dart:convert';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:bus_booking/utils/logger.dart';
import 'package:bus_booking/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  late MobileScannerController mobileScannerController;
  @override
  void initState() {
    mobileScannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: mobileScannerController,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final value = jsonDecode(barcode.rawValue.toString());
            if (value != null) {
              logs.d(value["bookingId"]);
              // nextScreen(
              //   context,
              //   SlideLeftRoute(
              //     page: DriversTicketDetailsScreen(
              //       bookingId: value["bookingId"],
              //     ),
              //   ),
              // );
            }
          }
        },
        overlay: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ScannerOverlayWidget(),
            addVerticalSpace(10),
            Text(
              "Molidom is scanning...",
              style: GoogleFonts.lexend(
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerOverlayWidget extends StatelessWidget {
  const ScannerOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.white.withOpacity(0.3),
            width: 3.0,
          ),
        )));
  }
}
