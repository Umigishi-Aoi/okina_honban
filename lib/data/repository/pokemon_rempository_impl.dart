import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:okina_honban/data/model/model.dart';
import 'package:okina_honban/data/repository/pokemon_repository.dart';

final pokemonRepositoryProvider = Provider((ref) => PokemonRepositoryImpl());

class PokemonRepositoryImpl extends PokemonRepository {
  PokemonRepositoryImpl();
  final Dio _dio = Dio();

  @override
  Future<Pokemon> getPokemon(int id) async{
    final json = await _dio
        .get('https://pokeapi.co/api/v2/pokemon/$id');
    Logger().d(json);
    final name = json.data['name'] as String;
    final imageUrl = json.data['sprites']['front_default'] as String;
    final descriptionJson = await _dio
        .get('https://pokeapi.co/api/v2/pokemon-species/$id');
    final description = descriptionJson.data['flavor_text_entries'][0]['flavor_text'] as String;
    return Pokemon(
      dexNumber: id,
      name: name,
      imageUrl: imageUrl,
      description: description,
    );
  }
}