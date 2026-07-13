import 'dart:convert';

import '../dto/todo_dto.dart';
import 'package:flutter_application_1/2%20-%20TODO%20LIST/data/repository/repository_exception.dart';
import 'package:http/http.dart' as http;

import '../../models/todo.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  final List<Todo> fakeTodos = [
    Todo(id: '1', title: 'Buy groceries', completed: false),
    Todo(id: '2', title: 'Finish Flutter homework', completed: true),
    Todo(id: '3', title: 'Call the dentist', completed: false),
    Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
    Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  ];

  Future<List<Todo>> getTodos() async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
    final uri = Uri.parse(
      "https://du-bist-gut-genug-default-rtdb.firebaseio.com/Todo.json",
    );
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw RepositoryException("Can't to Load Todos");
    }
    if (response.body == "null") {
      return [];
    }
    final Map<String, dynamic> data = jsonDecode(response.body);

    return data.entries.where((entry) => entry.value is Map).map<Todo>((entry) {
      return TodoDto.fromJson(
        entry.key,
        Map<String, dynamic>.from(entry.value as Map),
      );
    }).toList();
  }

  //  TODO
  // Ensure the message is displayed on the UI if error occured
  //throw RepositoryException("No wifi !");

  Future<void> updateCompleted(String todoId, bool completed) async {
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
    final uri = Uri.parse(
      "https://du-bist-gut-genug-default-rtdb.firebaseio.com/Todo/$todoId.json",
    );
    final response = await http.patch(
      uri,
      body: jsonEncode({"completed": completed}),
    );
    if (response.statusCode >= 400) {
      throw RepositoryException("Can't update Todo.");
    }
  }
}
