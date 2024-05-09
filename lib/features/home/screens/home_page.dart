import 'package:flutter/material.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/details/pages/detail_page.dart';
import 'package:pokedex/features/home/screens/widgets/pokemon_item.dart';
import 'package:pokedex/models/pokemon.dart';

class HomePage extends StatelessWidget{
  const HomePage({ Key? key, required this.list, required this.onItemTap}) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text('Pokedex', style: TextStyle(
            color: Colors.black
          ),),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list.map((e) => PokemonItemWidget(pokemon: e, onTap: onItemTap,)).toList(),
        ),
      ),
    );
  }
}