import 'package:flutter/material.dart';
import 'package:pokedex/features/details/container/detail_container.dart';
import 'package:pokedex/features/home/container/home_container.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({super.key, required this.repository});
  final PokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if(settings.name == '/'){
        // ignore: curly_braces_in_flow_control_structures
         return MaterialPageRoute(
           builder: (context) {
            return HomeContainer(repository: repository,
             onItemTap: (route , arguments ) {
             Navigator.of(context).pushNamed(route, arguments: arguments);
             },
            );
           }
          );  
         };

         if(settings.name == '/details'){
        // ignore: curly_braces_in_flow_control_structures
         return MaterialPageRoute(
           builder: (context) {
            return DetailContainer(repository: repository,
             arguments: (settings.arguments as DetailArguments),
            );
           }
          );  
         } 
        

      },
    );
  }
}