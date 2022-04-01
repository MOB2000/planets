import 'package:flutter/material.dart';
import 'package:planets/constants/style.dart';
import 'package:planets/models/planet.dart';
import 'package:planets/screens/detail_screen.dart';
import 'package:planets/widgets/separator.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  const PlanetSummary({
    Key? key,
    required this.planet,
    required this.horizontal,
  }) : super(key: key);

  Widget _planetWidget({
    required String value,
    required String image,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(image, height: 12),
        Container(width: 8),
        Text(planet.gravity, style: Style.smallTextStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailScreen(planet: planet),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Stack(
          children: <Widget>[
            Container(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  horizontal ? 76 : 16,
                  horizontal ? 16 : 42,
                  16,
                  16,
                ),
                constraints: const BoxConstraints.expand(),
                child: Column(
                  crossAxisAlignment: horizontal
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(height: 4),
                    Text(planet.name, style: Style.titleTextStyle),
                    Container(height: 10),
                    Text(planet.location, style: Style.commonTextStyle),
                    const Separator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: horizontal ? 1 : 0,
                          child: _planetWidget(
                            value: planet.distance,
                            image: 'assets/img/ic_distance.png',
                          ),
                        ),
                        Container(
                          width: horizontal ? 8 : 32,
                        ),
                        Expanded(
                          flex: horizontal ? 1 : 0,
                          child: _planetWidget(
                            value: planet.gravity,
                            image: 'assets/img/ic_gravity.png',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              height: horizontal ? 124 : 154,
              margin: horizontal
                  ? const EdgeInsets.only(left: 46)
                  : const EdgeInsets.only(top: 72),
              decoration: BoxDecoration(
                color: const Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              alignment: horizontal
                  ? FractionalOffset.centerLeft
                  : FractionalOffset.center,
              child: Hero(
                tag: "planet-hero-${planet.id}",
                child: Image(
                  image: AssetImage(planet.image),
                  height: 92,
                  width: 92,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
