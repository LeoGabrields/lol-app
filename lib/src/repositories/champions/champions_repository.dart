import 'package:lol_app/src/models/champion_model.dart';
import '../../models/champion_details_model.dart';

abstract class ChampionsRepository {
  Future<List<ChampionModel>> findAll();
  Future<ChampionDetailsModel> getDetails(String id);
}
