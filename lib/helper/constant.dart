import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;

final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

final isMobile = defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

class Constant extends InheritedWidget {
  static Constant? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Constant>();

  const Constant({required Widget child, Key? key}) : super(key: key, child: child);
  //& BASEPATH
  static const String pathFe = '/vcc/web';
  //icon
  static const String iconSearch = "assets/icon_search.svg";

  @override
  bool updateShouldNotify(Constant oldWidget) => false;
}
