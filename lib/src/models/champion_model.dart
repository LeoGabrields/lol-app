import 'dart:convert';

class ChampionModel {
  final String id;
  final String name;
  final String title;
  final String blurb;
  final Map info;
  final List tags;

  ChampionModel({
    required this.id,
    required this.name,
    required this.title,
    required this.blurb,
    required this.info,
    required this.tags,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'title': title,
      'blurb': blurb,
      'info': info,
      'tags': tags,
    };
  }

  factory ChampionModel.fromMap(Map<String, dynamic> map) {
    return ChampionModel(
      id: map['id'] as String,
      name: map['name'] as String,
      title: map['title'] as String,
      blurb: map['blurb'] as String,
      info: map['info'] as Map,
      tags: map['tags'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChampionModel.fromJson(String source) => ChampionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
