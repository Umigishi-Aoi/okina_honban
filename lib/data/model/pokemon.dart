import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int dexNumber,
    required String name,
    required String imageUrl,
    required String description,
  }) = _Pokemon;

  const Pokemon._();

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
