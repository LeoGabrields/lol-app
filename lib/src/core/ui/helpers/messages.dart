import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError(String message, VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text('Retry'),
            ),
          ],
        );
      },
    );
  }
}
