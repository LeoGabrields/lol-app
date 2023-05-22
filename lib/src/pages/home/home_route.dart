import 'package:flutter/material.dart';
import 'package:lol_app/src/pages/home/home_controller.dart';
import 'package:lol_app/src/pages/home/home_page.dart';
import 'package:lol_app/src/repositories/champions/champions_repository.dart';
import 'package:lol_app/src/repositories/champions/champions_repository_impl.dart';
import 'package:provider/provider.dart';

class HomeRoute {
  HomeRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ChampionsRepository>(
            create: (context) => ChampionsRepositoryImpl(context.read()),
          ),
          Provider(
            create: (context) => HomeController(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
