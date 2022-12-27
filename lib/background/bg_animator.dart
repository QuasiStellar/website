import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../sizes.dart';
import 'bg_painter.dart';

const starExpansionLimitLarge = 6000.0;
const starExpansionLimitSmall = 3000.0;
const starRotationPeriod = 60;
const starExpansionPeriod = 5;
const starExpansionDelay = 1;

const orbitExpansionDuration = 8;
const orbitExpansionDelay = 1;
const orbitExpansionCurve = Curves.easeInQuint;
const orbitCount = 4;
const orbitRadii = [5.20, 9.54, 19.22, 30.06];
const orbitRadiusMultiplier = 1500;
const orbitPeriods = [11.86, 29.46, 84.01, 164.79];
const orbitPeriodMultiplier = 0.1;

class BgAnimator extends StatefulWidget {
  const BgAnimator({super.key});

  @override
  State<BgAnimator> createState() => _BgAnimatorState();
}

class _BgAnimatorState extends State<BgAnimator> with TickerProviderStateMixin {
  late AnimationController _starRotationController;
  late Animation<double> _starRotationAnimation;

  late AnimationController _starExpansionController;
  late Animation<double> _starExpansionAnimation;

  late List<AnimationController> _orbitRotationControllers;
  late List<Animation<double>> _orbitRotationAnimations;

  late AnimationController _orbitExpansionController;
  late List<Animation<double>> _orbitExpansionAnimations;

  @override
  void initState() {
    final rotation = Tween(begin: 2 * pi, end: 0.0);

    _starRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: starRotationPeriod),
    );

    _starExpansionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: starExpansionPeriod),
    );
    final starsExpansion = Tween(
            begin: 1.0,
            end: (window.physicalSize.width > fullWidthLimit)
                ? starExpansionLimitLarge
                : starExpansionLimitSmall)
        .chain(CurveTween(curve: Curves.easeOutQuad))
        .chain(CurveTween(
          curve: const Interval(
            starExpansionDelay / starExpansionPeriod,
            1,
          ),
        ));

    _orbitRotationControllers = List<AnimationController>.generate(
        orbitCount,
        (i) => AnimationController(
              vsync: this,
              duration: Duration(
                  seconds: (orbitPeriods[i] * orbitPeriodMultiplier).floor(),
                  milliseconds: ((orbitPeriods[i] * orbitPeriodMultiplier -
                              (orbitPeriods[i] * orbitPeriodMultiplier)
                                  .floor()) *
                          1000)
                      .floor()),
            ));

    _orbitExpansionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: orbitExpansionDuration),
    );

    final orbitExpansions = List<Animatable<double>>.generate(
        orbitCount,
        (i) => Tween(begin: 1.0, end: orbitRadiusMultiplier * orbitRadii[i])
            .chain(CurveTween(curve: orbitExpansionCurve))
            .chain(CurveTween(
                curve: const Interval(
                    orbitExpansionDelay / orbitExpansionDuration, 1))));

    _starRotationAnimation = rotation.animate(_starRotationController);

    _starExpansionAnimation = starsExpansion.animate(_starExpansionController);

    _orbitRotationAnimations = List<Animation<double>>.generate(
        orbitCount, (i) => rotation.animate(_orbitRotationControllers[i]));

    _orbitExpansionAnimations = List<Animation<double>>.generate(orbitCount,
        (i) => orbitExpansions[i].animate(_orbitExpansionController));

    _starRotationController.repeat();
    _starExpansionController.forward();
    for (final controller in _orbitRotationControllers) {
      controller.repeat();
    }
    _orbitExpansionController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _starRotationController.dispose();
    _starExpansionController.dispose();
    for (var controller in _orbitRotationControllers) {
      controller.dispose();
    }
    _orbitExpansionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _starRotationAnimation,
      builder: (context, snapshot) => CustomPaint(
        painter: BgPainter(
          theme: Theme.of(context),
          starRotationValue: _starRotationAnimation.value,
          starExpansionValue: _starExpansionAnimation.value,
          starExpansionLimit: (window.physicalSize.width > fullWidthLimit)
              ? starExpansionLimitLarge
              : starExpansionLimitSmall,
          orbitRotationValues:
              _orbitRotationAnimations.map((a) => a.value).toList(),
          orbitExpansionValues:
              _orbitExpansionAnimations.map((a) => a.value).toList(),
        ),
        child: Container(),
      ),
    );
  }
}
