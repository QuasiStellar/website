import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/content/main_menu.dart';
import 'package:website/content/projects.dart';
import 'package:website/content_page_component.dart';

import '../../content.dart';
import '../../content_page.dart';
import '../../sizes.dart';
import '../../utils/outlined_text.dart';

class Polytopia3DEdition extends StatelessWidget implements ContentPage {
  const Polytopia3DEdition(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < fullWidthLimit) {
      return Polytopia3DEditionComponent(switchPage, isThin: true);
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
          Polytopia3DEditionComponent(switchPage, isThin: false),
        ],
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;
}

class Polytopia3DEditionComponent extends StatelessWidget
    implements ContentPageComponent {
  const Polytopia3DEditionComponent(this.switchPage,
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
                  "Polytopia 3D",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\nUnity\nC#\nBlender',
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
                "Tiny part of The Battle of Polytopia recreated in 3D. Only this video evidence has survived to this day:",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: SizedBox(
                width: projectDescWidth,
                child: Image.asset('assets/polytopia_3d_edition_banner.png'),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("www.youtube.com", "/watch", {
                'v': 'xsZVOGFiLMU',
              })),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Watch the video!",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("www.youtube.com", "/watch", {
                'v': 'xsZVOGFiLMU',
              })),
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
                  "Polytopia 3D Edition",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\nUnity\nC#\nBlender',
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
                "Tiny part of The Battle of Polytopia recreated in 3D. Only this video evidence has survived to this day:",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: SizedBox(
                width: projectDescWidth,
                height: 338,
                child: Image.asset('assets/polytopia_3d_edition_banner.png'),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("www.youtube.com", "/watch", {
                'v': 'xsZVOGFiLMU',
              })),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Watch the video!",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("www.youtube.com", "/watch", {
                'v': 'xsZVOGFiLMU',
              })),
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
