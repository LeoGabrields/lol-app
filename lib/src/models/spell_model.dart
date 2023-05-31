import 'dart:convert';

class Spell {
  final String id;
  final String name;
  final String description;
  final String image;
  Spell({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory Spell.fromMap(Map<String, dynamic> map) {
    return Spell(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image']['full'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Spell.fromJson(String source) =>
      Spell.fromMap(json.decode(source) as Map<String, dynamic>);
}
