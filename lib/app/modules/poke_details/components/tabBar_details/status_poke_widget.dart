import 'package:flutter/material.dart';
import '../../../../shared/consts/colors_const.dart';
import '../../../../shared/localization/app_translate.dart';
import '../../../../shared/model/pokemon_model.dart';
import 'title_tabBar.dart';

Widget statusPokeWidget(BuildContext context, PokemonModel model) {
  return ListView(shrinkWrap: true, children: [
    titleTabBar(
        title: AppTranslate(context).text('pokeDetails.status.title'),
        model: model),
    statusBar(context,
        color: model.baseColor,
        name: AppTranslate(context).text('pokeDetails.status.hp'),
        stats: model.hp!,
        max: model.hp == 110 ? 110 : 100),
    statusBar(context,
        name: AppTranslate(context).text('pokeDetails.status.attack'),
        stats: model.attack!,
        color: model.baseColor,
        max: model.attack == 110 ? 110 : 100),
    statusBar(context,
        name: AppTranslate(context).text('pokeDetails.status.defense'),
        stats: model.defense!,
        color: model.baseColor,
        max: model.defense == 110 ? 110 : 100),
    statusBar(context,
        name: AppTranslate(context).text('pokeDetails.status.spAtk'),
        stats: model.specialAttack!,
        color: model.baseColor,
        max: model.specialAttack == 110 ? 110 : 100),
    statusBar(context,
        name: AppTranslate(context).text('pokeDetails.status.spDef'),
        stats: model.specialDefense!,
        color: model.baseColor,
        max: model.specialDefense == 110 ? 110 : 100),
    statusBar(context,
        name: AppTranslate(context).text('pokeDetails.status.speed'),
        stats: model.speed!,
        color: model.baseColor,
        max: model.speed == 110 ? 110 : 100),
    statusBar(context,
        name: AppTranslate(context).text('pokeDetails.status.total'),
        stats: model.total!,
        color: model.baseColor,
        max: model.total! > 400 ? 420 : 400),
  ]);
}

Widget statusBar(BuildContext context,
    {required String name,
    required int stats,
    required int max,
    required Color color}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 3),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .3,
          child: Text(name,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .1,
          child: Text(
            stats.toString(),
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
          ),
        ),
        Expanded(
          child: Container(
              height: 6,
              width: MediaQuery.of(context).size.width * .47,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.black.withOpacity(0.1)),
              child: FractionallySizedBox(
                  widthFactor: stats / max,
                  heightFactor: 1.0,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: stats >= 50
                              ? ColorsConst.green
                              : ColorsConst.red)))),
        ),
      ],
    ),
  );
}
