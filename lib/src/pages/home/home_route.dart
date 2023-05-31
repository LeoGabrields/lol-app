import 'package:flutter/material.dart';
import 'package:lol_app/src/pages/home/home_controller.dart';
import 'package:lol_app/src/pages/home/home_page.dart';
import 'package:provider/provider.dart';

class HomeRoute {
  HomeRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => HomeController(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
