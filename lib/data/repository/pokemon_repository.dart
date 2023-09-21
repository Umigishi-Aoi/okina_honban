import 'package:okina_honban/data/model/model.dart';

abstract class PokemonRepository {

  Future<Pokemon> getPokemon(int id);
}