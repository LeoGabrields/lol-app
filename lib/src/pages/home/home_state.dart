import 'package:lol_app/src/models/champion_model.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState {
  final HomeStateStatus status;
  final List<ChampionModel> champions;
  final String? erroMessage;

  const HomeState({
    required this.status,
    this.erroMessage,
    required this.champions,
  });

  HomeState.initial()
      : status = HomeStateStatus.initial,
        champions = [],
        erroMessage = null;

  HomeState copyWith({
    HomeStateStatus? status,
    List<ChampionModel>? champions,
    String? erroMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      champions: champions ?? this.champions,
      erroMessage: erroMessage ?? this.erroMessage,
    );
  }
}
