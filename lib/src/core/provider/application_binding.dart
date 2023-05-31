import 'package:flutter/material.dart';
import 'package:lol_app/src/core/rest_client/custom_dio.dart';
import 'package:lol_app/src/pages/details/details_controller.dart';
import 'package:provider/provider.dart';
import '../../repositories/champions/champions_repository.dart';
import '../../repositories/champions/champions_repository_impl.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider<ChampionsRepository>(
          create: (context) => ChampionsRepositoryImpl(
            context.read(),
          ),
        ),
        Provider(
          create: (context) => DetailsController(
            repository: context.read(),
          ),
        )
      ],
      child: child,
    );
  }
}
