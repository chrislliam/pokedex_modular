import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/interfaces/database_service_interface.dart';
import 'pokedex_event.dart';
import 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  PokedexBloc(PokedexState pokedexState) : super(PokedexStateLoading());

  @override
  Stream<PokedexState> mapEventToState(PokedexEvent event) async* {
    if (event is PokedexEvent) {
      yield PokedexStateLoading();

      yield await _fetchList();
    }
  }

  Future<PokedexState> _fetchList() async {
    var list = await Modular.get<IDatabaseService>().loadPokeApi();
    try {
      return PokedexStateLoadSuccess(list: list);
    } on Exception catch (e) {
      return PokedexStateError('Erro: $e');
    }
  }
}
