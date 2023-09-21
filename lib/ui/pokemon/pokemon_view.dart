import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_honban/ui/base/base.dart';
import 'package:okina_honban/ui/pokemon/pokemon_view_model.dart';

import '../../gen/assets.gen.dart';

class PokemonPage extends HookConsumerWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasePage(body: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildPokemon(),
        _buildMonsterBall(),
      ],
    );
  }

  Widget _buildMonsterBall() {
    return HookConsumer(builder: (context, ref, child) {
      return GestureDetector(
        onTap: () {
          ref.read(pokemonViewModelProvider).getPokemon();
        },
        child: Center(child: Assets.images.pokemon.monsterBall.image()),
      );
    });
  }

  Widget _buildPokemon() {
    return HookConsumer(builder: (context, ref, child) {
      final pokemon = ref.watch(pokemonViewModelProvider).pokemon;
      return SizedBox(
        width: 260,
        height: 260,
        child: pokemon != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(pokemon.dexNumber.toString()),
                  Image.network(pokemon.imageUrl),
                  Text(pokemon.name),
                  Text(pokemon.description),
                ],
              )
            : const SizedBox(),
      );
    });
  }
}
