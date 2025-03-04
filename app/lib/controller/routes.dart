import 'package:app/view/pages/clipboard_page.dart';
import 'package:app/view/pages/home_page.dart';
import 'package:app/view/pages/script_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  void pushNamed(BuildContext context, Widget nextPage) async {
    switch (nextPage) {
      case ClipboardPage():
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: const ClipboardPage(),
          ),
        );
      case HomePage():
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: const HomePage(),
          ),
        );
      case ScriptPage():
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: const ScriptPage(),
          ),
        );
        break;
      default:
        if (kDebugMode) {
          print("Route does not exist!");
        }
    }
  }
}
