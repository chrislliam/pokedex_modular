import 'dart:ui';

import '../consts/colors_const.dart';

class PokemonModel {
  String? id;
  String? name;
  String? image;
  String? xdescription;
  String? ydescription;
  String? category;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  int? total;
  String? genderMalePercentage;
  String? genderFemalePercentage;
  int? genderless;
  List<dynamic>? weaknesses;
  List<dynamic>? abilities;
  List<dynamic>? types;
  List<dynamic>? evolutions;
  String? baseExp;
  String? weight;
  String? height;

  PokemonModel({
    this.id,
    this.name,
    this.image,
    this.xdescription,
    this.ydescription,
    this.category,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.genderMalePercentage,
    this.genderFemalePercentage,
    this.genderless,
    this.weaknesses,
    this.abilities,
    this.types,
    this.evolutions,
    this.baseExp,
    this.weight,
    this.height,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    var typeList = json['typeofpokemon'];
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      image: json['imageurl'],
      category: json['category'],
      types: typeList,
      xdescription: json['xdescription'],
      ydescription: json['ydescription'],
      hp: json['hp'],
      attack: json['attack'],
      defense: json['defense'],
      specialAttack: json['special_attack'],
      specialDefense: json['special_defense'],
      speed: json['speed'],
      total: json['total'],
      genderMalePercentage: json['male_percentage'],
      genderFemalePercentage: json['female_percentage'],
      weaknesses: json['weaknesses'],
      abilities: json['abilities'],
      baseExp: json['base_exp'],
      weight: json['weight'],
      height: json['height'],
      evolutions: json['evolutions'],
      genderless: json['genderless'],
    );
  }
  Color get baseColor => ColorsConst.colorTypePokemon(types![0]);
}
