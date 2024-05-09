import 'package:flutter/material.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';
import 'package:pokedex/features/home/screens/home_error.dart';
import 'package:pokedex/features/home/screens/home_loading.dart';
import 'package:pokedex/features/home/screens/home_page.dart';
import 'package:pokedex/models/pokemon.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository, required this.onItemTap});
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
      
        if(snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return HomePage(list: snapshot.data!, onItemTap: (String , DetailArguments ) {  },);
        }

        if(snapshot.hasError) {
          return HomeError(
            error: snapshot.error.toString(), erroor: '',
          );
        }

        return Container();
      });
  }
}