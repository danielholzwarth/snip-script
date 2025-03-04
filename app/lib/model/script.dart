import 'package:app/model/command.dart';
import 'package:flutter/material.dart';

class Script {
  final String id;
  final String title;
  final bool isEnabled;
  final DateTime lastRun;
  final DateTime createdAt;
  final List<Command> commands;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  Script({
    required this.id,
    required this.title,
    required this.isEnabled,
    required this.lastRun,
    required this.createdAt,
    required this.commands,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  factory Script.fromJson(Map<String, dynamic> json) {
    return Script(
      id: json['id'],
      title: json['title'],
      isEnabled: json['isEnabled'],
      lastRun: DateTime.parse(json['lastRun']),
      createdAt: DateTime.parse(json['createdAt']),
      commands:
          (json['commands'] as List).map((e) => Command.fromJson(e)).toList(),
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
      iconColor: Color(json['iconColor']),
      backgroundColor: Color(json['backgroundColor']),
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
      'icon': icon.codePoint,
      'iconColor': iconColor.value,
      'backgroundColor': backgroundColor.value,
    };
  }
}
