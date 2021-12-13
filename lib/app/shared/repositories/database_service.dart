import 'dart:convert';
import 'package:http/http.dart' as http;
import '../interfaces/database_service_interface.dart';
import '../model/pokemon_model.dart';

class DatabaseService extends IDatabaseService {
  final urlLink =
      'https://gist.githubusercontent.com/scitbiz/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  final client = http.Client();
  @override
  Future<List<PokemonModel>> loadPokeApi({String name = ''}) async {
    final uri = Uri.parse(urlLink);

    final response = await client.get(uri);
    var decode = jsonDecode(response.body);
    if (name.isEmpty) {
      return (decode as List).map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return decode
          .where((element) => element.toString().toLowerCase().startsWith(name))
          .map((e) => PokemonModel.fromJson(e))
          .toList();
    }
  }
}
