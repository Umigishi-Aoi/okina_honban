import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/data/model/model.dart';
import 'package:okina_honban/data/repository/pokemon_repository.dart';
import 'package:okina_honban/ui/base/base.dart';

import '../../data/repository/pokemon_rempository_impl.dart';

final pokemonViewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => PokemonViewModel(ref));

class PokemonViewModel extends BaseViewModel {
  PokemonViewModel(super.ref);

  PokemonRepository get _pokemonRepository =>
      ref.read(pokemonRepositoryProvider);

  Result<Pokemon>? _pokemonResult;

  Result<Pokemon>? get pokemonResult => _pokemonResult;

  Pokemon? get pokemon => _pokemonResult?.data;

  Future<void> getPokemon() async {
    final id = Random().nextInt(1011);
    _pokemonResult = await callFuture(() => _pokemonRepository.getPokemon(id));
    notifyListeners();
  }
}
