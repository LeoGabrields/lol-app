import 'dart:developer';
import 'package:lol_app/src/pages/home/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:lol_app/src/repositories/champions/champions_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ChampionsRepository _repository;

  HomeController(this._repository) : super(HomeState.initial());

  Future<void> loadChampions() async {
    try {
      emit(state.copyWith(status: HomeStateStatus.loading));
      var champions = await _repository.findAll();
      emit(
          state.copyWith(status: HomeStateStatus.loaded, champions: champions));
    } catch (e, s) {
      log('Error ao buscar champions', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          erroMessage: 'Error ao buscar champions',
        ),
      );
    }
  }
}
