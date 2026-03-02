final class PostsApiModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  const PostsApiModel(this.id, this.userId, this.title, this.body);

  /// Crear desde JSON
  factory PostsApiModel.fromJson(Map<String, dynamic> json) {
    return PostsApiModel(
      json['id'] as int,
      json['userId'] as int,
      json['title'] as String,
      json['body'] as String,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }

  /// copyWith manual
  PostsApiModel copyWith({int? id, int? userId, String? title, String? body}) {
    return PostsApiModel(
      id ?? this.id,
      userId ?? this.userId,
      title ?? this.title,
      body ?? this.body,
    );
  }

  @override
  String toString() {
    return 'PostsApiModel('
        'id: $id, '
        'userId: $userId, '
        'title: $title, '
        'body: $body'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostsApiModel &&
        other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode => Object.hash(id, userId, title, body);
}
