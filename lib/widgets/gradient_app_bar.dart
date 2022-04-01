import 'package:flutter/material.dart';
import 'package:planets/constants/keys.dart';
import 'package:planets/constants/strings.dart';
import 'package:planets/constants/style.dart';

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + Style.barHeight,
      child: const Center(
        child: Text(
          kTreva,
          style: TextStyle(
            color: Colors.white,
            fontFamily: Keys.poppins,
            fontWeight: FontWeight.w600,
            fontSize: 36,
          ),
        ),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF3366FF),
            Color(0xFF00CCFF),
          ],
          tileMode: TileMode.clamp,
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 0),
          stops: <double>[0, 1],
        ),
      ),
    );
  }
}
