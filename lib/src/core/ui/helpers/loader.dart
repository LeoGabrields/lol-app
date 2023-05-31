import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.white,
              size: 22,
            ),
          );
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
