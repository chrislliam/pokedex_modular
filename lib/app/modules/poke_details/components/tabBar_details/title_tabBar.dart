import 'package:flutter/material.dart';
import '../../../../shared/model/pokemon_model.dart';

Widget titleTabBar({required String title, required PokemonModel model}) {
  return Text(title,
      style: TextStyle(
          color: model.baseColor, fontSize: 18, fontWeight: FontWeight.bold));
}
