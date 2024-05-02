import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String?> showDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime lastDate = now.add(const Duration(days: 30));
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      final String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      return formattedDate;
    }
    return null;
  }