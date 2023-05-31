import 'package:lol_app/src/models/champion_details_model.dart';

enum DetailsStateStatus {
  initial,
  loading,
  loaded,
  erro,
}

class DetailsState {
  DetailsStateStatus status;
  ChampionDetailsModel? championDetails;

  DetailsState({
    required this.championDetails,
    required this.status,
  });

  DetailsState.initial()
      : status = DetailsStateStatus.initial,
        championDetails = null;

  DetailsState copyWith({
    DetailsStateStatus? status,
    ChampionDetailsModel? championDetails,
  }) {
    return DetailsState(
      championDetails: championDetails ?? this.championDetails,
      status: status ?? this.status,
    );
  }
}
