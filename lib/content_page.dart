import 'package:flutter/material.dart';

abstract class ContentPage extends Widget {
  const ContentPage(this.switchPage, {super.key});

  final Function(ContentPage) switchPage;
}
