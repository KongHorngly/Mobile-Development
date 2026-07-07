import 'dart:convert';

import '../../models/todo.dart';

class TodoDto {
  static const id = "id";
  static const title = "title";

  static const completed = "selected";

  static Todo fromJson(String id, Map<String, dynamic> json) {
    // Assert the map contains the keys title and selected with the right data types
    assert(json[title] is String, 'Todo $id is missing a String "title"');
    assert(
      json[completed] is bool,
      'Todo $id is missing a bool "selected"',
    );

    return Todo(
      id: id,
      title: json[title] as String,
      completed: json[completed] as bool,
    );
  }

  static Map<String, dynamic> toJson(Todo todo) {
    return {title: todo.title, completed: todo.completed};
  }
}

void main() {

  const jsonString = '''
  {
    "1": {
      "title": "Buy groceries",
      "selected": false
    },
    "2": {
      "title": "Finish Flutter homework",
      "selected": true
    },
    "3": {
      "title": "Call the dentist",
      "selected": false
    }
  }
  ''';


  final Map<String, dynamic> data = jsonDecode(jsonString);

 
  final List<Todo> todos = data.entries.map((entry) {
    final id = entry.key;
    final json = entry.value as Map<String, dynamic>;

    return TodoDto.fromJson(id, json);
  }).toList();

  for (final todo in todos) {
    print(todo);
  }
}
