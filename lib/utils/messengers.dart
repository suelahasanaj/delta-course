import 'package:flutter/material.dart';

showSnackBar(String content, BuildContext context, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
        right: 20,
        left: 20,
      ),
    ),
  );
}
