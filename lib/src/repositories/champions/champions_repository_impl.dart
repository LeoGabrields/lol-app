import 'package:lol_app/src/core/rest_client/custom_dio.dart';
import 'package:lol_app/src/models/champion_model.dart';
import 'package:lol_app/src/repositories/champions/champions_repository.dart';

import '../../models/champion_details_model.dart';

class ChampionsRepositoryImpl implements ChampionsRepository {
  final CustomDio _dio;
  ChampionsRepositoryImpl(this._dio);

  @override
  Future<List<ChampionModel>> findAll() async {
    var championResult = await _dio.get('/13.10.1/data/pt_BR/champion.json');
    List<ChampionModel> champions = [];
    championResult.data['data'].forEach((chave, valor) {
      champions.add(ChampionModel.fromMap(valor));
    });
    return champions;
  }

  @override
  Future<ChampionDetailsModel> getDetails(String id) async {
    var result = await _dio.get('/13.10.1/data/pt_BR/champion/$id.json');

    return ChampionDetailsModel.fromMap(result.data['data'][id]);
  }
}
