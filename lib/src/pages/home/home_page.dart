import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/src/core/ui/base_state/base_state.dart';
import 'package:lol_app/src/pages/details/details_controller.dart';
import 'package:lol_app/src/pages/home/home_controller.dart';
import 'package:lol_app/src/pages/home/widgets/card_champion.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadChampions();
    super.onReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () => Navigator.of(context).pushNamed('/config'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<HomeController, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              itemCount: state.champions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 180,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                var champion = state.champions[index];
                var navigator = Navigator.of(context);
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () async {
                    showLoader();
                    await context
                        .read<DetailsController>()
                        .getDetails(champion.id);
                    hideLoarder();
                    navigator.pushNamed('/details');
                  },
                  child: CardChampion(
                    champion: champion,
                  ),
                );
              },
            ),
          );
        },
        listener: (context, state) {
          switch (state.status) {
            case HomeStateStatus.initial:
            case HomeStateStatus.loading:
              showLoader();
            case HomeStateStatus.loaded:
              hideLoarder();
            case HomeStateStatus.error:
              hideLoarder();
              showError(
                state.erroMessage ?? 'Erro desconhecido',
                () {
                  controller.loadChampions();
                  Navigator.of(context).pop();
                },
              );
          }
        },
      ),
    );
  }
}
