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

class Runyourcodewiththisbot extends StatelessWidget implements ContentPage {
  const Runyourcodewiththisbot(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < fullWidthLimit) {
      return RunyourcodewiththisbotComponent(switchPage, isThin: true);
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
          RunyourcodewiththisbotComponent(switchPage, isThin: false),
        ],
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;
}

class RunyourcodewiththisbotComponent extends StatelessWidget
    implements ContentPageComponent {
  const RunyourcodewiththisbotComponent(this.switchPage,
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
                  "RYCWTB",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\npython',
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
                "Telegram bot that runs your code. There are about 30 supported languages.",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            SizedBox(
              child: Image.asset(
                'assets/runyourcodewiththisbot_banner.png',
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Check it out!",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(
                  Uri.https("t.me", "/run_your_code_with_this_bot")),
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
                  "github.com", "/QuasiStellar/RunYourCodeWithThisBot")),
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
                  "RunYourCodeWithThisBot",
                  style: TextStyle(
                    fontSize: titleFontSize,
                  ),
                ),
                const SizedBox(width: horizontalInterval),
                FloatingActionButton(
                  onPressed: () => {},
                  tooltip: 'Tech stack\n\npython',
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
                "Telegram bot that runs your code. There are about 30 supported languages.",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
            ),
            const SizedBox(height: largeVerticalInterval),
            SizedBox(
              height: 266,
              child: Image.asset('assets/runyourcodewiththisbot_banner.png'),
            ),
            const SizedBox(height: largeVerticalInterval),
            InkWell(
              child: const OutlinedText(
                "Check it out!",
                style: TextStyle(
                  fontSize: descriptionFontSize,
                ),
              ),
              onTap: () async => await launchUrl(
                  Uri.https("t.me", "/run_your_code_with_this_bot")),
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
                  "github.com", "/QuasiStellar/RunYourCodeWithThisBot")),
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
