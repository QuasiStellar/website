import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:website/content/main_menu.dart';
import 'package:website/content/projects/hollow_dungeon.dart';
import 'package:website/content/projects/palantir.dart';
import 'package:website/content/projects/polytopia_3d_edition.dart';
import 'package:website/content/projects/polytopia_map_generator.dart';
import 'package:website/content/projects/runyourcodewiththisbot.dart';
import 'package:website/content/projects/stockshrew.dart';
import 'package:website/content_page_component.dart';

import '../content.dart';
import '../content_page.dart';
import '../sizes.dart';
import '../utils/outlined_text.dart';

class Projects extends StatelessWidget implements ContentPage {
  const Projects(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < fullWidthLimit) {
      return ProjectsComponent(switchPage, isThin: true);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainMenuComponent(switchPage, isThin: false),
          LocalHero(
            tag: "divider1",
            child: VerticalDivider(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ProjectsComponent(switchPage, isThin: false),
        ],
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;
}

class ProjectsComponent extends StatelessWidget
    implements ContentPageComponent {
  const ProjectsComponent(this.switchPage, {required this.isThin, super.key});

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
            onPressed: () => switchPage(HollowDungeon(switchPage)),
            style: style,
            child: const OutlinedText(
              "Hollow Dungeon",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
          const SizedBox(height: largeVerticalInterval),
          TextButton(
            onPressed: () => switchPage(Stockshrew(switchPage)),
            style: style,
            child: const OutlinedText(
              "Stockshrew",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
          const SizedBox(height: largeVerticalInterval),
          TextButton(
            onPressed: () => switchPage(Polytopia3DEdition(switchPage)),
            style: style,
            child: const OutlinedText(
              "Polytopia 3D Edition",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
          const SizedBox(height: largeVerticalInterval),
          TextButton(
            onPressed: () => switchPage(Runyourcodewiththisbot(switchPage)),
            style: style,
            child: OutlinedText(
              (MediaQuery.of(context).size.width < fullWidthLimit)
                  ? "RYCWTB"
                  : "RunYourCodeWithThisBot",
              style: const TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
          const SizedBox(height: largeVerticalInterval),
          TextButton(
            onPressed: () => switchPage(PolytopiaMapGenerator(switchPage)),
            style: style,
            child: OutlinedText(
              (MediaQuery.of(context).size.width < fullWidthLimit)
                  ? "Polytopia Mapgen"
                  : "Polytopia Map Generator",
              style: const TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
          const SizedBox(height: largeVerticalInterval),
          TextButton(
            onPressed: () => switchPage(Palantir(switchPage)),
            style: style,
            child: const OutlinedText(
              "Palantir",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
          ),
          const SizedBox(height: largeVerticalInterval),
          FloatingActionButton(
            onPressed: () => switchPage(MainMenu(switchPage)),
            tooltip: 'Back',
            mini: true,
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).backgroundColor,
            shape: CircleBorder(
                side: BorderSide(
                    width: 2, color: Theme.of(context).primaryColor)),
            child: const Icon(Icons.arrow_back_rounded),
          ),
        ],
      );
    } else {
      return LocalHero(
        tag: "projects",
        child: SizedBox(
          width: projectsMenuWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => switchPage(HollowDungeon(switchPage)),
                style: style,
                child: const OutlinedText(
                  "Hollow Dungeon",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: largeVerticalInterval),
              TextButton(
                onPressed: () => switchPage(Stockshrew(switchPage)),
                style: style,
                child: const OutlinedText(
                  "Stockshrew",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: largeVerticalInterval),
              TextButton(
                onPressed: () => switchPage(Polytopia3DEdition(switchPage)),
                style: style,
                child: const OutlinedText(
                  "Polytopia 3D Edition",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: largeVerticalInterval),
              TextButton(
                onPressed: () => switchPage(Runyourcodewiththisbot(switchPage)),
                style: style,
                child: const OutlinedText(
                  "RunYourCodeWithThisBot",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: largeVerticalInterval),
              TextButton(
                onPressed: () => switchPage(PolytopiaMapGenerator(switchPage)),
                style: style,
                child: const OutlinedText(
                  "Polytopia Map Generator",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
              ),
              const SizedBox(height: largeVerticalInterval),
              TextButton(
                onPressed: () => switchPage(Palantir(switchPage)),
                style: style,
                child: const OutlinedText(
                  "Palantir",
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
