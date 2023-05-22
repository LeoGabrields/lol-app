import 'package:flutter/material.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
  }

  hideLoarder() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
