import 'package:flutter/material.dart';
import 'package:lol_app/src/core/provider/application_binding.dart';
import 'package:lol_app/src/core/ui/themes/theme_config.dart';
import 'package:lol_app/src/pages/details/details_route.dart';
import 'package:lol_app/src/pages/home/home_route.dart';

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: lightTheme,
        darkTheme: darkTheme,
        routes: {
          '/': (context) => HomeRoute.page,
          '/details': (context) => DetailsRoute.page,
        },
      ),
    );
  }
}
