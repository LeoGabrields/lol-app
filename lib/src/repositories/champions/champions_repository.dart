import 'package:lol_app/src/models/champion_model.dart';

abstract class ChampionsRepository {
  Future<List<ChampionModel>> findAll();
}
