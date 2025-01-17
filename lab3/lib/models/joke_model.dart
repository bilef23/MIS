class Joke {
  final int id;
  final String type;
  final String setup;
  final String punchline;

  Joke({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'],
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }

  // Override equality operator to compare jokes based on `id` or any other field.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Joke && other.id == id;
  }

  // Override hashCode to support equality checking
  @override
  int get hashCode => id.hashCode;
}
