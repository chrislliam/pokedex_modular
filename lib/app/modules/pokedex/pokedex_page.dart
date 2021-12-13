import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/consts/assets_const.dart';
import '../../shared/interfaces/database_service_interface.dart';
import '../../shared/localization/app_translate.dart';
import '../poke_details/components/tuple_for_details.dart';
import 'bloc/pokedex_bloc.dart';

import 'bloc/pokedex_state.dart';
import 'components/card_pokemon.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  late IDatabaseService db;
  @override
  void initState() {
    db = Modular.get<IDatabaseService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var statusWidth = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: statusWidth - 240 / 2.9,
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                AssetsConst.pokeballDark,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  height: statusWidth,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.0, top: 24),
                  child: Text(AppTranslate(context).text('pokedex.title'),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                BlocBuilder<PokedexBloc, PokedexState>(
                  bloc: Modular.get<PokedexBloc>(),
                  builder: (context, state) {
                    if (state is PokedexStateLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is PokedexStateError) {
                      return Center(
                          child: Text(
                        AppTranslate(context).text('pokedex.error',
                            params: {'msg': '${state.error}'}),
                      ));
                    }
                    if (state is PokedexStateLoadSuccess) {
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).orientation ==
                                          Orientation.landscape
                                      ? 3
                                      : 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: (2 / 1),
                            ),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              var pokemon = state.list[index];
                              return cardPokemon(context,
                                  model: pokemon,
                                  tuple: TupleforDetails(
                                      index: index,
                                      list: state.list,
                                      model: pokemon));
                            }),
                      );
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
