import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_app/src/core/ui/base_state/base_state.dart';
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
      backgroundColor: const Color(0xFF101114),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFF101114),
      ),
      body: BlocConsumer<HomeController, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              itemCount: state.champions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 260,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                var champion = state.champions[index];
                return CardChampion(
                  champion: champion,
                );
              },
            ),
          );
        },
        listener: (context, state) {
          switch (state.status) {
            case HomeStateStatus.initial:
              break;
            case HomeStateStatus.loading:
              showLoader();
              break;
            case HomeStateStatus.loaded:
              hideLoarder();
              break;
            case HomeStateStatus.error:
              hideLoarder();
              showError(
                state.erroMessage ?? 'Erro desconhecido',
                () {
                  controller.loadChampions();
                  Navigator.of(context).pop();
                },
              );
              break;
          }
        },
      ),
    );
  }
}
