import 'package:flutter/material.dart';

class ScaffoldMessengerWidget {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.green,
      duration: duration,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    showSnackBar(
      context: context,
      message: message,
      backgroundColor: Colors.red,
      duration: duration,
    );
  }
}