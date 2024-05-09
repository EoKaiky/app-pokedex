import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home/container/home_container.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';
import 'package:pokedex/features/home/screens/home_page.dart';
import 'package:pokedex/features/pokedex/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex project',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
      ),
    ),
   );
  }
}

