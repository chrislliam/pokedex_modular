import '../model/pokemon_model.dart';

abstract class IDatabaseService {
  Future<List<PokemonModel>> loadPokeApi({String name});
}
