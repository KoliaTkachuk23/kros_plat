class Note {
  final int? id;
  final String text;
  final String createdAt;

  Note({
    this.id,
    required this.text,
    required this.createdAt,
  });

  // Перетворення в Map для збереження у БД
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'created_at': createdAt,
    };
  }

  // Створення об'єкта Note з Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      text: map['text'],
      createdAt: map['created_at'],
    );
  }
}