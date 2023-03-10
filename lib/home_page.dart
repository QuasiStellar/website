import 'package:flutter/material.dart';
import 'package:website/background/bg_animator.dart';
import 'package:website/globals/settings.dart';
import 'package:website/sizes.dart';
import 'package:website/utils/outlined_text.dart';

import 'content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              const BgAnimator(),
              Center(
                child: Column(
                  children: const [
                    SizedBox(
                        height: verticalLogoIndent - logoFontSize / 2 - 10),
                    OutlinedText(
                      "quasistellar",
                      style: TextStyle(
                        fontSize: logoFontSize,
                      ),
                    ),
                    SizedBox(height: largeVerticalInterval),
                    Content(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => settings.switchTheme(),
        tooltip: 'Theme',
        foregroundColor: Theme.of(context).backgroundColor,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.dark_mode_outlined),
      ),
    );
  }
}
