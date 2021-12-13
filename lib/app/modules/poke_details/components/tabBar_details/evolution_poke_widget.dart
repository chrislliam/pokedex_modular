import 'package:flutter/cupertino.dart';
import '../../../../shared/model/pokemon_model.dart';
import 'title_tabBar.dart';

Widget evolutionPokeWidget(BuildContext context, PokemonModel model) {
  return ListView(
    children: [
      titleTabBar(title: 'Evolution Chain', model: model),
    ],
  );
}
