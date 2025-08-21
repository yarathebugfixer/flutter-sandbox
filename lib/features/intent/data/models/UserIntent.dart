class UserIntent {
  final String intent;
  final Map<String, dynamic> parameters;

  const UserIntent({
    required this.intent,
    required this.parameters,
  });

  factory UserIntent.fromJson(Map<String, dynamic> json) {
    return UserIntent(
      intent: json['intent'] as String,
      parameters: Map<String, dynamic>.from(json['parameters'] ?? {}),
    );
  }
}