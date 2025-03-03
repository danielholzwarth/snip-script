import 'package:app/view/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SnipScript());
}

class SnipScript extends StatelessWidget {
  const SnipScript({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
