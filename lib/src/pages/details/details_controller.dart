import 'package:bloc/bloc.dart';
import 'package:lol_app/src/pages/details/details_state.dart';
import 'package:lol_app/src/repositories/champions/champions_repository.dart';

class DetailsController extends Cubit<DetailsState> {
  ChampionsRepository repository;
  DetailsController({
    required this.repository,
  }) : super(DetailsState.initial());

  Future<void> getDetails(String id) async {
    emit(state.copyWith(status: DetailsStateStatus.loading));
    var details = await repository.getDetails(id);
    emit(state.copyWith(
        status: DetailsStateStatus.loaded, championDetails: details));
  }
}
