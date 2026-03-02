final class PostsModel {
  final int id;
  final int userId;
  final String title;
  final String body;
  final num random;

  const PostsModel(this.id, this.userId, this.title, this.body, this.random);

  /// Crear desde JSON
  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      json['id'] as int,
      json['userId'] as int,
      json['title'] as String,
      json['body'] as String,
      json['random'] as num,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'random': random,
    };
  }

  /// copyWith manual
  PostsModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    num? random,
  }) {
    return PostsModel(
      id ?? this.id,
      userId ?? this.userId,
      title ?? this.title,
      body ?? this.body,
      random ?? this.random,
    );
  }

  @override
  String toString() {
    return 'PostsModel('
        'id: $id, '
        'userId: $userId, '
        'title: $title, '
        'body: $body, '
        'random: $random'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostsModel &&
        other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.body == body &&
        other.random == random;
  }

  @override
  int get hashCode => Object.hash(id, userId, title, body, random);
}
