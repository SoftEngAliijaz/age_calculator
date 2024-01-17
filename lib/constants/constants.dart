import 'package:flutter/material.dart';

class AppUtils {
  ///method to pick date of birth
  static dateOfBirthPicker(
      BuildContext context, Function(DateTime) onDatePicked) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDatePicked(pickedDate);
    });
  }

  static const sizedBox = SizedBox(height: 20);
}
