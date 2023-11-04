import 'package:bot_toast/bot_toast.dart';
import 'package:bus_booking/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showProgressLoader() {
  BotToast.showLoading(
    allowClick: false,
    backButtonBehavior: BackButtonBehavior.ignore,
    align: Alignment.center,
  );
}

void cancelLoader() {
  BotToast.closeAllLoading();
}

SpinKitCircle spinLoader() {
  return const SpinKitCircle(
    color: Palette.primaryColor,
    size: 25,
  );
}
