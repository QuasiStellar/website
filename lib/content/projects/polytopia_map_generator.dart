import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/content/main_menu.dart';
import 'package:website/content/projects.dart';
import 'package:website/content_page_component.dart';

import '../../content_page.dart';
import '../../sizes.dart';
import '../../utils/outlined_text.dart';

class PolytopiaMapGenerator extends StatelessWidget implements ContentPage {
  const PolytopiaMapGenerator(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < fullWidthLimit) {
      return PolytopiaMapGeneratorComponent(switchPage, isThin: true);
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
          LocalHero(
            tag: "divider2",
            child: VerticalDivider(
              color: Theme.of(context).primaryColor,
            ),
          ),
          PolytopiaMapGeneratorComponent(switchPage, isThin: false),
        ],
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;
}

class PolytopiaMapGeneratorComponent extends StatelessWidget
    implements ContentPageComponent {
  const PolytopiaMapGeneratorComponent(this.switchPage,
      {required this.isThin, super.key});

  @override
  Widget build(BuildContext context) {
    if (isThin) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const OutlinedText(
                  "Polytopia Mapgen",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\nJS',
                  mini: true,
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).backgroundColor,
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 2, color: Theme.of(context).primaryColor)),
                  child: const Icon(Icons.code_rounded),
                ),
              ],
            ),
            const SizedBox(height: largeVerticalInterval),
            const SizedBox(
              width: projectDescWidth,
              child: OutlinedText(
                "Reverse engineered map generation from The Battle of Polytopia.",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: SizedBox(
                width: projectDescWidth,
                child: Image.asset('assets/polytopia_map_generator_banner.png'),
              ),
              onTap: () async => await launchUrl(Uri.https(
                  "quasistellar.github.io", "/Polytopia-Map-Generator")),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Check it out!",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(Uri.https(
                  "quasistellar.github.io", "/Polytopia-Map-Generator")),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Discord",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("discord.gg", "/JWnHK6R")),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "GitHub",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(Uri.https(
                  "github.com", "/QuasiStellar/Polytopia-Map-Generator")),
            ),
            const SizedBox(height: largeVerticalInterval),
            FloatingActionButton(
              onPressed: () => switchPage(Projects(switchPage)),
              tooltip: 'Back',
              mini: true,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).backgroundColor,
              shape: CircleBorder(
                  side: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor)),
              child: const Icon(Icons.arrow_back_rounded),
            ),
            const SizedBox(height: largeVerticalInterval),
          ],
        ),
      );
    } else {
      return SizedBox(
        width: projectWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const OutlinedText(
                  "Polytopia Map Generator",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\nJS',
                  mini: true,
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).backgroundColor,
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 2, color: Theme.of(context).primaryColor)),
                  child: const Icon(Icons.code_rounded),
                ),
              ],
            ),
            const SizedBox(height: largeVerticalInterval),
            const SizedBox(
              width: projectDescWidth,
              height: 50,
              child: OutlinedText(
                "Reverse engineered map generation from The Battle of Polytopia.",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: SizedBox(
                width: projectDescWidth,
                height: 365,
                child: Image.asset('assets/polytopia_map_generator_banner.png'),
              ),
              onTap: () async => await launchUrl(Uri.https(
                  "quasistellar.github.io", "/Polytopia-Map-Generator")),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Check it out!",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(Uri.https(
                  "quasistellar.github.io", "/Polytopia-Map-Generator")),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Discord",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("discord.gg", "/JWnHK6R")),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "GitHub",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(Uri.https(
                  "github.com", "/QuasiStellar/Polytopia-Map-Generator")),
            ),
          ],
        ),
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;

  @override
  final bool isThin;
}
