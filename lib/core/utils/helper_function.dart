import 'package:flutter/material.dart';

showSnackBar({required BuildContext context, required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "$message",
        style: TextStyle(color: Colors.white, fontSize: 14),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color ?? Colors.red,
    ),
  );
}
