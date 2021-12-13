import 'package:equatable/equatable.dart';
import '../../../shared/model/pokemon_model.dart';

class PokedexState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokedexStateLoading extends PokedexState {}

class PokedexStateLoadSuccess extends PokedexState {
  final List<PokemonModel> list;

  PokedexStateLoadSuccess({required this.list});
}

class PokedexStateError extends PokedexState {
  final String error;

  PokedexStateError(this.error);
}
