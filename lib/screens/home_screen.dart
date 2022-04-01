import 'package:flutter/material.dart';
import 'package:planets/widgets/gradient_app_bar.dart';
import 'package:planets/widgets/planets_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          GradientAppBar(),
          PlanetsList(),
        ],
      ),
    );
  }
}
