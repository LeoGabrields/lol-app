import 'package:flutter/material.dart';
import 'package:lol_app/src/core/contansts/base_urls.dart';
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
        Hero(
          tag: champion.id,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${BaseUrl.splash}${champion.id}_0.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          champion.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Expanded(
          child: Text(
            champion.title.capitalFirstLetter(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
