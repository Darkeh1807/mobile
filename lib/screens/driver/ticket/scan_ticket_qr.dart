import 'dart:convert';

import 'package:bus_booking/utils/logger.dart';
import 'package:flutter/material.dart';
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
        cameraResolution: const Size(1920, 1080));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
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
    );
  }
}
