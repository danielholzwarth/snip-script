import 'package:app/controller/navigation/routes.dart';
import 'package:app/view/pages/script_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () async => Routes().pushNamed(context, ScriptPage()),
        autofocus: false,
        child: Text("open script page"),
      ),
    );
  }
}
