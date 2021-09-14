import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';

import 'package:quizapp/widgets/custom_clipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi / 2.5, 
        child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height *.6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kPinkDark, kPurpleDark]
              )
            ),
        ),
      ),
      )
    );
  }
}