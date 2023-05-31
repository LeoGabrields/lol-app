// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lol_app/src/models/spell_model.dart';

class ChampionDetailsModel {
  final String key;
  final String name;
  final String title;
  final String lore;
  final String id;
  final List<Spell> spells;
  ChampionDetailsModel({
    required this.key,
    required this.name,
    required this.title,
    required this.lore,
    required this.id,
    required this.spells,
  });

  factory ChampionDetailsModel.fromMap(Map<String, dynamic> map) {
    return ChampionDetailsModel(
      key: map['key'] as String,
      name: map['name'] as String,
      title: map['title'] as String,
      lore: map['lore'] as String,
      spells: (map['spells'] as List).map((e) => Spell.fromMap(e)).toList(),
      id: map['id'],
    );
  }

  factory ChampionDetailsModel.fromJson(String source) =>
      ChampionDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
