import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/consts/assets_const.dart';
import '../../../shared/consts/routes_const.dart';
import '../../../shared/model/pokemon_model.dart';
import '../../poke_details/components/tuple_for_details.dart';

Widget cardPokemon(BuildContext context,
    {required PokemonModel model, required TupleforDetails tuple}) {
  return GestureDetector(
    onTap: () => Modular.to.pushNamed(RoutesConst.details, arguments: tuple),
    child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: model.baseColor, borderRadius: BorderRadius.circular(12)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: const Alignment(1.4, 0.0),
              child: Opacity(
                child: Image.asset(
                  AssetsConst.pokeballDark,
                  height: 80,
                  width: 80,
                ),
                opacity: 0.1,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(model.name!,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white)),
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: model.types!.map((e) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(e,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: Colors.white)),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                CachedNetworkImage(
                    imageUrl: model.image!,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error))
              ],
            ),
          ],
        )),
  );
}
