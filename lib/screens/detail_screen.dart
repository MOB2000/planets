import 'package:flutter/material.dart';
import 'package:planets/constants/strings.dart';
import 'package:planets/constants/style.dart';
import 'package:planets/models/planet.dart';
import 'package:planets/widgets/planet_summary.dart';
import 'package:planets/widgets/separator.dart';

class DetailScreen extends StatelessWidget {
  final Planet planet;

  const DetailScreen({
    Key? key,
    required this.planet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(height: 295),
              child: Image.network(
                planet.picture,
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 190),
              height: 110,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
                  stops: [0, 0.9],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(0, 1),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.only(top: 72, bottom: 32),
              children: <Widget>[
                PlanetSummary(
                  planet: planet,
                  horizontal: false,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        kOverview,
                        style: Style.headerTextStyle,
                      ),
                      const Separator(),
                      Text(planet.description, style: Style.commonTextStyle),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: const BackButton(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
