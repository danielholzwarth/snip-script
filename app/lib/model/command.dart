class Command {
  final String id;
  final String command;
  final DateTime createdAt;
  final String type;

  Command({
    required this.id,
    required this.command,
    required this.createdAt,
    required this.type,
  });

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      id: json['id'],
      command: json['command'],
      createdAt: DateTime.parse(json['createdAt']),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'command': command,
      'createdAt': createdAt.toIso8601String(),
      'type': type,
    };
  }
}
