import 'package:flutter/material.dart';

import '../../../../shared/model/pokemon_model.dart';
import 'title_tabBar.dart';

Widget aboutPokeWidget(BuildContext context, PokemonModel model) {
  var _size = MediaQuery.of(context).size;
  return ListView(
    shrinkWrap: true,
    children: [
      Text(model.xdescription!),
      SizedBox(height: 24),
      titleTabBar(title: 'Pokédex Data', model: model),
      pokeInfs(
          title: 'Species', subtitle: model.types!.join(', '), size: _size),
      pokeInfs(title: 'Height', subtitle: model.height, size: _size),
      pokeInfs(title: 'Weight', subtitle: model.weight, size: _size),
      pokeInfs(
          title: 'Abilities',
          subtitle: model.abilities!.join(', '),
          size: _size),
      pokeInfs(
          title: 'Weaknesses',
          subtitle: model.weaknesses!.join(', '),
          size: _size),
      pokeInfs(
          title: 'Base exp', subtitle: '${model.baseExp} exp', size: _size),
    ],
  );
}

Widget pokeInfs({required String title, String? subtitle, required Size size}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: size.width * .3, minWidth: size.width * .29),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),
        Text(
          subtitle!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
        )
      ],
    ),
  );
}
