import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../shared/consts/assets_const.dart';
import '../../../shared/model/pokemon_model.dart';

class ShowPokemon extends StatefulWidget {
  final PageController pageController;
  final ValueChanged<PokemonModel> onChangePokemon;
  final AnimationController rotateController;
  final PokemonModel model;
  final List<PokemonModel> list;
  const ShowPokemon(
      {Key? key,
      required this.pageController,
      required this.onChangePokemon,
      required this.rotateController,
      required this.list,
      required this.model})
      : super(key: key);

  @override
  _ShowPokemonState createState() => _ShowPokemonState();
}

class _ShowPokemonState extends State<ShowPokemon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.model.name!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 21)),
              Text(widget.model.id!,
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ),
        SizedBox(
            height: 200,
            child: PageView.builder(
              controller: widget.pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  widget.onChangePokemon(widget.list[index]);
                });
              },
              itemBuilder: (context, index) {
                var e = widget.list[index];
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                        opacity: 0.1,
                        child: Center(
                          child: RotationTransition(
                            turns: widget.rotateController,
                            child: Image.asset(
                              AssetsConst.pokeballLight,
                              height: widget.model.id == e.id ? 160 : 84,
                            ),
                          ),
                        )),
                    AnimatedPadding(
                        padding:
                            EdgeInsets.all(widget.model.id == e.id ? 0 : 60),
                        duration: Duration(milliseconds: 360),
                        curve: Curves.easeIn,
                        child: CachedNetworkImage(
                            imageUrl: e.image!,
                            color: widget.model.id == e.id
                                ? null
                                : Colors.black.withOpacity(0.4),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: widget.model.id == e.id ? 164 : 60,
                            width: widget.model.id == e.id ? 164 : 60)),
                  ],
                );
              },
            )),
      ],
    );
  }
}
