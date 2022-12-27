import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:website/background/polar_position.dart';
import 'package:website/globals/random.dart';

import '../sizes.dart';
import 'bg_animator.dart';

const planetRadius = 10.0;

class BgPainter extends CustomPainter {
  final ThemeData theme;
  final double starRotationValue;
  final double starExpansionValue;
  final double starExpansionLimit;
  final List<double> orbitRotationValues;
  final List<double> orbitExpansionValues;

  static final List<PolarPosition> stars = List.generate(
      (window.physicalSize.width > fullWidthLimit) ? 5000 : 1000,
      (index) => PolarPosition(
          radius: pow(random.nextDouble(), 0.5).toDouble(),
          phase: random.nextDouble() * 2 * pi));

  BgPainter({
    required this.theme,
    required this.starRotationValue,
    required this.starExpansionValue,
    required this.starExpansionLimit,
    required this.orbitRotationValues,
    required this.orbitExpansionValues,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, verticalLogoIndent);

    for (var i = 0; i < orbitCount; i++) {
      final expansion = orbitExpansionValues[i];
      final rotation = orbitRotationValues[i];

      Offset position = Offset(
        center.dx + expansion * cos(rotation),
        center.dy + expansion * sin(rotation),
      );

      final curStrikeWidth = strokeWidth * expansion / 1000;
      final curPlanetRadius = planetRadius * orbitExpansionValues[0] / 300;
      canvas.drawCircle(
        center,
        expansion,
        Paint()
          ..color = theme.primaryColor
          ..strokeWidth = curStrikeWidth
          ..style = PaintingStyle.stroke,
      );
      canvas.drawCircle(
        position,
        curPlanetRadius + curStrikeWidth,
        Paint()
          ..color = theme.backgroundColor
          ..strokeWidth = curStrikeWidth
          ..style = PaintingStyle.fill,
      );
      canvas.drawCircle(
        position,
        curPlanetRadius,
        Paint()
          ..color = theme.primaryColor
          ..strokeWidth = curStrikeWidth
          ..style = PaintingStyle.fill,
      );
    }

    canvas.drawPoints(
      PointMode.points,
      stars
          .map((star) => Offset(
                center.dx +
                    star.radius *
                        starExpansionValue *
                        cos(starRotationValue + star.phase),
                center.dy +
                    star.radius *
                        starExpansionValue *
                        sin(starRotationValue + star.phase),
              ))
          .toList(),
      Paint()
        ..color = theme.primaryColor
        ..strokeWidth = 1 +
            (strokeWidth - 1) * (1 - starExpansionValue / starExpansionLimit)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
