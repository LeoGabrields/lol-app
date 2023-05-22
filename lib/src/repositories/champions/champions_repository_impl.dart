import 'package:lol_app/src/core/rest_client/custom_dio.dart';
import 'package:lol_app/src/models/champion_model.dart';
import 'package:lol_app/src/repositories/champions/champions_repository.dart';

class ChampionsRepositoryImpl implements ChampionsRepository {
  final CustomDio _dio;
  ChampionsRepositoryImpl(this._dio);

  @override
  Future<List<ChampionModel>> findAll() async {
    var championResult = await _dio.get('/champion.json');
    List<ChampionModel> champions = [];
    championResult.data['data'].forEach((chave, valor) {
      champions.add(ChampionModel.fromMap(valor));
    });
    return champions;
  }
}
