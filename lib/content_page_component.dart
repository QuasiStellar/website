import 'content_page.dart';

abstract class ContentPageComponent extends ContentPage {
  const ContentPageComponent(super.switchPage, {required this.isThin, super.key});

  final bool isThin;
}
