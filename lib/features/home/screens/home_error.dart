import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({super.key, required String error, required this.erroor});

final String erroor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(erroor)
      )
    );
  }
}