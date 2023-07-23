import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});
  static const routeName = '/payment-success';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Dialog(),
      ),
    );
  }
}
