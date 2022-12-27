import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:website/content_page.dart';
import 'package:website/sizes.dart';

import 'content/main_menu.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late ContentPage child = MainMenu(_switchPage);

  void _switchPage(ContentPage widget) {
    FirebaseAnalytics.instance.logEvent(
      name: "switch_page",
      parameters: {
        "page": widget.toString(),
      },
    );
    setState(() {
      child = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LocalHeroScope(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutExpo,
      child: (MediaQuery.of(context).size.width < fullWidthLimit)
          ? child
          : IntrinsicHeight(
              child: child,
            ),
    );
  }
}
