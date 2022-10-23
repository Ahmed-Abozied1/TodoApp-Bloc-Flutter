import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;

  const Task({
    required this.title,
  });

  Task copyWith({
    String? title,
  }) {
    return Task(
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        title,
      ];
}
