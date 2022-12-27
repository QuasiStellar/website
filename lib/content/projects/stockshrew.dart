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

class Stockshrew extends StatelessWidget implements ContentPage {
  const Stockshrew(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < fullWidthLimit) {
      return StockshrewComponent(switchPage, isThin: true);
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
          StockshrewComponent(switchPage, isThin: false),
        ],
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;
}

class StockshrewComponent extends StatelessWidget
    implements ContentPageComponent {
  const StockshrewComponent(this.switchPage, {required this.isThin, super.key});

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
                  "Stockshrew",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\nC++',
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
                "Evaluation engine for the table game Feud. Find the strongest moves, crush your opponents and get banned. Currently accessible via a CLI.",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            Image.asset(
              'assets/stockshrew_banner.png',
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Download for PC",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(
                  Uri.https("github.com", "/QuasiStellar/StockShrew/releases")),
            ),
            const SizedBox(height: smallVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Discord",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("discord.gg", "/bearwaves")),
            ),
            const SizedBox(height: smallVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "GitHub",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(
                  Uri.https("github.com", "/QuasiStellar/StockShrew")),
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
                  "Stockshrew",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\nC++',
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
              height: 80,
              child: OutlinedText(
                "Evaluation engine for the table game Feud. Find the strongest moves, crush your opponents and get banned. Currently accessible via a CLI.",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            Image.asset(
              'assets/stockshrew_banner.png',
              height: 253,
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Download for PC",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(
                  Uri.https("github.com", "/QuasiStellar/StockShrew/releases")),
            ),
            const SizedBox(height: smallVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Discord",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async =>
                  await launchUrl(Uri.https("discord.gg", "/bearwaves")),
            ),
            const SizedBox(height: smallVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "GitHub",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(
                  Uri.https("github.com", "/QuasiStellar/StockShrew")),
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
