import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:app/view/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) await requestPermissions(); // For Android and IOs

  runApp(const SnipScript());
}

class SnipScript extends StatelessWidget {
  const SnipScript({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

Future<void> requestPermissions() async {
  if (Platform.isAndroid || Platform.isIOS) {
    await Permission.storage.request();
  }
  return;
}
