import 'dart:convert';
import 'dart:io';

import 'package:app/controller/routes.dart';
import 'package:app/model/script.dart';
import 'package:app/view/pages/script_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> data = {};
  List<Script> scripts = [];

  Color primaryGreen = Color(0xFF4CAF50); // Primary Green
  Color secendoryGreen = Color(0xFF2E7D32); // Primary Green
  Color white = Color(0xFFFFFFFF); // White
  Color darkGray = Color(0xFF424242); // Dark Gray
  Color black = Color(0xFF212121); // Dark Gray

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    int crossAxisCount = 15;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: width * 0.3,
          alignment: Alignment.center,
          child: TextField(decoration: InputDecoration(hintText: "Search ...")),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.grid_view_rounded, color: darkGray),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_rounded, color: darkGray),
          ),
        ],
        centerTitle: true,
      ),
      body:
          data.isNotEmpty
              ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                itemCount: scripts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      color: primaryGreen,
                      child: Text(
                        scripts[index].title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              )
              : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Start from scratch or"),
                    TextButton(
                      onPressed: () async {
                        data = await pickAndLoadJsonFile();
                        if (data.isNotEmpty) {
                          scripts = Script.listFromJson(data);
                        }
                        setState(() {});
                      },
                      child: Text("Import data"),
                    ),
                  ],
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routes().pushNamed(context, ScriptPage());
        },
        backgroundColor: primaryGreen,
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.add, size: 30, color: white),
      ),
      bottomNavigationBar: BottomAppBar(child: Text("hello")),
    );
  }
}

Future<Map<String, dynamic>> pickAndLoadJsonFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      String content;

      if (kIsWeb || result.files.single.bytes != null) {
        content = utf8.decode(result.files.single.bytes!);
      } else {
        File file = File(result.files.single.path!);
        content = await file.readAsString();
      }

      if (content.trim().isEmpty) {
        if (kDebugMode) {
          print("Error: JSON file is empty.");
        }
        return {};
      }

      Map<String, dynamic> jsonList = jsonDecode(content);
      return jsonList;
    } else {
      if (kDebugMode) {
        print('File selection canceled');
      }
      return {};
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    return {};
  }
}
