import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/consts/routes_const.dart';
import '../pokedex/pokedex_page.dart';

class PokedexModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RoutesConst.initial, child: (_, args) => PokedexPage())
  ];
}
