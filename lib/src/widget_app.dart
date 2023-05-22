import 'package:flutter/material.dart';
import 'package:lol_app/src/core/provider/application_binding.dart';
import 'package:lol_app/src/core/ui/themes/theme_config.dart';
import 'package:lol_app/src/pages/home/home_route.dart';

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeConfig.themeDark,
        routes: {
          '/': (context) => HomeRoute.page,
        },
      ),
    );
  }
}
