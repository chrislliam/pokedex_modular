import 'package:flutter/material.dart';

mixin ColorsConst {
  static const Color green = Color(0xFF4FC1A6);
  static const Color red = Color(0xFFF7786B);
  static const Color blue = Color(0xFF58AAF6);
  static const Color yellow = Color(0xFFFFCE4B);
  static const Color purple = Color(0xFF7C538C);
  static const Color brown = Color(0xFFB1736C);

  static const Color bug = Color(0xFF94BE2C);
  static const Color dragon = Color(0xFF086FC7);
  static const Color fairy = Color(0xFFEE96E6);
  static const Color fire = Color(0xFFFAA14D);
  static const Color ghost = Color(0xFF586CB5);
  static const Color ground = Color(0xFFD87F4F);
  static const Color normal = Color(0xFF969CA3);
  static const Color psychic = Color(0xFFFA8781);
  static const Color steel = Color(0xFF538DA0);
  static const Color dark = Color(0xFF5F5F6D);
  static const Color electric = Color(0xFFEFD94C);
  static const Color fight = Color(0xFFD44260);
  static const Color flying = Color(0xFFA3BAEE);
  static const Color grass = Color(0xFF5DBE68);
  static const Color ice = Color(0xFF75CFBE);
  static const Color poison = Color(0xFFAB62C8);
  static const Color rock = Color(0xFFC9BA89);
  static const Color water = Color(0xFF519ADE);

  static Color colorTypePokemon(String type) {
    switch (type) {
      case 'Electric':
        return ColorsConst.electric;
      case 'Fire':
        return ColorsConst.fire;
      case 'Grass':
        return ColorsConst.grass;
      case 'Water':
        return ColorsConst.water;
      case 'Poison':
        return ColorsConst.poison;
      case 'Flying':
        return ColorsConst.flying;
      case 'Ground':
        return ColorsConst.ground;
      case 'Fairy':
        return ColorsConst.fairy;
      case 'Dragon':
        return ColorsConst.dragon;
      case 'Ghost':
        return ColorsConst.ghost;
      case 'Normal':
        return ColorsConst.normal;
      case 'Ice':
        return ColorsConst.ice;
      case 'Fighting':
        return ColorsConst.fight;
      case 'Rock':
        return ColorsConst.rock;
      case 'Dark':
        return ColorsConst.dark;
      case 'Steel':
        return ColorsConst.steel;
      case 'Bug':
        return ColorsConst.bug;
      case 'Psychic':
        return ColorsConst.psychic;
      default:
        return ColorsConst.blue;
    }
  }
}
