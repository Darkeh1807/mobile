import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

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
