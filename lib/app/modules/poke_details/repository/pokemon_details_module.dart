import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/consts/routes_const.dart';
import '../poke_details_page.dart';

class PokemonDetailsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RoutesConst.initial,
        child: (_, args) => PokemonDetailsPage(
              tuple: args.data,
            ))
  ];
}
