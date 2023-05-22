import 'package:flutter/material.dart';
import 'package:lol_app/src/core/ui/extensions/string_extension.dart';
import 'package:lol_app/src/models/champion_model.dart';

class CardChampion extends StatelessWidget {
  final ChampionModel champion;
  const CardChampion({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                  'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.id}_0.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          champion.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Expanded(
          child: Text(
            champion.title.capitalFirstLetter(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
