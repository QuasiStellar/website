import 'package:flutter/material.dart';

import '../sizes.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText(this.data, {
    super.key,
    this.outlineColor,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  final String data;
  final Color? outlineColor;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) =>
      Stack(
        children: [
          Text(
            data,
            style: TextStyle(
              inherit: true,
              backgroundColor: style?.backgroundColor,
              fontSize: style?.fontSize,
              fontWeight: style?.fontWeight,
              fontStyle: style?.fontStyle,
              letterSpacing: style?.letterSpacing,
              wordSpacing: style?.wordSpacing,
              textBaseline: style?.textBaseline,
              height: style?.height,
              leadingDistribution: style?.leadingDistribution,
              locale: style?.locale,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth * 2
                ..color = outlineColor ?? Theme.of(context).backgroundColor,
              background: style?.background,
              shadows: style?.shadows,
              fontFeatures: style?.fontFeatures,
              fontVariations: style?.fontVariations,
              decoration: style?.decoration,
              decorationColor: style?.decorationColor,
              decorationStyle: style?.decorationStyle,
              decorationThickness: style?.decorationThickness,
              debugLabel: style?.debugLabel,
            ),
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: selectionColor,
          ),
          Text(
            data,
            style: style ?? Theme.of(context).textTheme.bodyMedium,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: selectionColor,
          ),
        ],
      );
}
