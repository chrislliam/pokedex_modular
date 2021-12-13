import 'package:flutter_modular/flutter_modular.dart';
import 'modules/poke_details/repository/pokemon_details_module.dart';

import 'modules/pokedex/bloc/pokedex_bloc.dart';
import 'modules/pokedex/bloc/pokedex_event.dart';
import 'modules/pokedex/bloc/pokedex_state.dart';
import 'modules/pokedex/pokedex_module.dart';
import 'shared/consts/routes_const.dart';
import 'shared/interfaces/database_service_interface.dart';
import 'shared/repositories/database_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<IDatabaseService>((i) => DatabaseService()),
    Bind.singleton((i) => PokedexBloc(PokedexState())..add(PokedexFetchList()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(RoutesConst.initial, module: PokedexModule()),
    ModuleRoute(RoutesConst.details, module: PokemonDetailsModule())
  ];
}
