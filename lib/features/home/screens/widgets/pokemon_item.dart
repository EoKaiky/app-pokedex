import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/home/screens/widgets/type_widget.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({super.key, required this.pokemon, required this.onTap});
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => onTap('/details', DetailArguments(pokemon: pokemon)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemon.baseColor!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(pokemon.name,  style: TextStyle(color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 16,
                                ),
                              ),
                      ),
                      Text('#${pokemon.num}',  style: TextStyle(color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                                ),
                              ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type.map((e) => TypeWidget(e, name: e) ).toList(),
                      ),
                      Column(
                        children: [
                          Flexible(
                            child: Container(
                              height: 100,
                              width: 200,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}