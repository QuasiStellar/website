import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/content/main_menu.dart';
import 'package:website/content_page_component.dart';

import '../content.dart';
import '../content_page.dart';
import '../sizes.dart';
import '../utils/outlined_text.dart';

class Contacts extends StatelessWidget implements ContentPage {
  const Contacts(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < fullWidthLimit) {
      return ContactsComponent(switchPage, isThin: true);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainMenuComponent(switchPage, isThin: false),
          LocalHero(
            tag: "divider1",
            child: VerticalDivider(
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
          ),
          ContactsComponent(switchPage, isThin: false),
        ],
      );
    }
  }

  @override
  final Function(ContentPage) switchPage;
}

class ContactsComponent extends StatelessWidget
    implements ContentPageComponent {
  const ContactsComponent(this.switchPage, {required this.isThin, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: contactsMenuWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: const OutlinedText(
              "Discord",
              style: TextStyle(
                fontSize: titleFontSize,
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
                fontSize: titleFontSize,
              ),
            ),
            onTap: () async =>
                await launchUrl(Uri.https("github.com", "/QuasiStellar")),
          ),
          const SizedBox(height: largeVerticalInterval),
          InkWell(
            child: const OutlinedText(
              "YouTube",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
            onTap: () async => await launchUrl(Uri.https(
                "www.youtube.com", "/channel/UCuy-CFOwwH4q53_XVUbOeWg")),
          ),
          const SizedBox(height: largeVerticalInterval),
          InkWell(
            child: const OutlinedText(
              "Telegram",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
            onTap: () async =>
                await launchUrl(Uri.https("t.me", "/quasistellar")),
          ),
          const SizedBox(height: largeVerticalInterval),
          InkWell(
            child: const OutlinedText(
              "VK",
              style: TextStyle(
                fontSize: titleFontSize,
              ),
            ),
            onTap: () async =>
                await launchUrl(Uri.https("vk.com", "/quasistellar")),
          ),
          if (isThin)
            const SizedBox(height: largeVerticalInterval),
          if (isThin)
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
      ),
    );
  }

  @override
  final Function(ContentPage) switchPage;

  @override
  final bool isThin;
}
