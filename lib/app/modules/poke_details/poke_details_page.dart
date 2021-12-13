import 'package:flutter/material.dart';
import '../../shared/localization/app_translate.dart';
import '../../shared/model/pokemon_model.dart';
import 'components/pageView.dart';
import 'components/tabBar_details/about_poke_widget.dart';
import 'components/tabBar_details/evolution_poke_widget.dart';
import 'components/tabBar_details/status_poke_widget.dart';
import 'components/tuple_for_details.dart';

class PokemonDetailsPage extends StatefulWidget {
  final TupleforDetails tuple;
  const PokemonDetailsPage({
    Key? key,
    required this.tuple,
  }) : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late PokemonModel model;

  late AnimationController _rotateController;

  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    _rotateController.repeat();
    model = widget.tuple.model;
    _pageController =
        PageController(initialPage: widget.tuple.index, viewportFraction: .5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widgetOptions = <Widget>[
      aboutPokeWidget(context, model),
      statusPokeWidget(context, model),
      evolutionPokeWidget(context, model)
    ];
    return Scaffold(
      backgroundColor: model.baseColor,
      appBar: AppBar(
        backgroundColor: model.baseColor,
        //title: Text(model.name!),
        elevation: 0.0,
      ),
      body: DefaultTabController(
          length: widgetOptions.length,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: ShowPokemon(
                    rotateController: _rotateController,
                    list: widget.tuple.list,
                    model: model,
                    pageController: _pageController,
                    onChangePokemon: (value) {
                      setState(() {
                        model = value;
                      });
                    },
                  ),
                )
              ];
            },
            body: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 21),
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white.withOpacity(.5), fontSize: 16),
                  tabs: <Widget>[
                    Tab(
                        text:
                            AppTranslate(context).text('pokeDetails.tabBar1')),
                    Tab(
                        text:
                            AppTranslate(context).text('pokeDetails.tabBar2')),
                    Tab(
                        text:
                            AppTranslate(context).text('pokeDetails.tabBar3')),
                  ],
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16))),
                        child: TabBarView(children: widgetOptions))),
              ],
            ),
          )),
    );
  }
}
