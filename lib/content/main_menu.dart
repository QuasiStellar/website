import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:website/content/contacts.dart';
import 'package:website/content/projects.dart';
import 'package:website/content_page.dart';

import '../content_page_component.dart';
import '../sizes.dart';
import '../utils/outlined_text.dart';

class MainMenu extends StatelessWidget implements ContentPage {
  const MainMenu(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < fullWidthLimit) {
      return MainMenuComponent(switchPage, isThin: true);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainMenuComponent(switchPage, isThin: false),
        ],
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;
}

class MainMenuComponent extends StatelessWidget
    implements ContentPageComponent {
  const MainMenuComponent(this.switchPage, {required this.isThin, super.key});

  @override
  Widget build(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: Theme.of(context).primaryColor,
    );
    if (isThin) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => switchPage(Projects(switchPage)),
            style: style,
            child: const OutlinedText(
              "projects",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
          const SizedBox(height: largeVerticalInterval),
          TextButton(
            onPressed: () => switchPage(Contacts(switchPage)),
            style: style,
            child: const OutlinedText(
              "contacts",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
        ],
      );
    } else {
      return LocalHero(
        tag: "mainMenu",
        child: SizedBox(
          width: mainMenuWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => switchPage(Projects(switchPage)),
                style: style,
                child: const OutlinedText(
                  "projects",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: largeVerticalInterval),
              TextButton(
                onPressed: () => switchPage(Contacts(switchPage)),
                style: style,
                child: const OutlinedText(
                  "contacts",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;

  @override
  final bool isThin;
}
