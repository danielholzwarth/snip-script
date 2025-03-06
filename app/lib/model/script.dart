import 'package:app/model/command.dart';

class Script {
  final int id;
  final String title;
  final bool isEnabled;
  final DateTime lastRun;
  final DateTime createdAt;
  final List<Command> commands;
  // final IconData icon;
  // final Color iconColor;
  // final Color backgroundColor;

  Script({
    required this.id,
    required this.title,
    required this.isEnabled,
    required this.lastRun,
    required this.createdAt,
    required this.commands,
    // required this.icon,
    // required this.iconColor,
    // required this.backgroundColor,
  });

  static Map<String, dynamic> listToJson(List<Script> scripts) {
    return {'scripts': scripts.map((script) => script.toJson()).toList()};
  }

  static List<Script> listFromJson(Map<String, dynamic> json) {
    return (json['scripts'] as List<dynamic>)
        .map((script) => Script.fromJson(script as Map<String, dynamic>))
        .toList();
  }

  factory Script.fromJson(Map<String, dynamic> json) {
    return Script(
      id: json['id'],
      title: json['title'],
      isEnabled: json['isEnabled'],
      lastRun: DateTime.parse(json['lastRun']),
      createdAt: DateTime.parse(json['createdAt']),
      commands:
          (json['commands'] as List).map((e) => Command.fromJson(e)).toList(),
      // icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
      // iconColor: Color(json['iconColor']),
      // backgroundColor: Color(json['backgroundColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isEnabled': isEnabled,
      'lastRun': lastRun.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'commands': commands.map((e) => e.toJson()).toList(),
      // 'icon': icon.codePoint,
      // 'iconColor': iconColor,
      // 'backgroundColor': backgroundColor,
    };
  }
}
