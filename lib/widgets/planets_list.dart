import 'package:flutter/material.dart';
import 'package:planets/constants/planets.dart';
import 'package:planets/widgets/planet_summary.dart';

class PlanetsList extends StatelessWidget {
  const PlanetsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFF736AB7),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PlanetSummary(
                    planet: planets[index],
                    horizontal: true,
                  ),
                  childCount: planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
