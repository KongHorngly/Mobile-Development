import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/todo.dart';
import '../dto/todo_dto.dart';
import 'repository_exception.dart';

class TodoRepository {
  static final global = TodoRepository(); // unique instance

  static const String _baseUrl =
      'https://du-bist-gut-genug-default-rtdb.firebaseio.com';

  
  Future<List<Todo>> getTodos() async {
    final url = Uri.parse('$_baseUrl/.json');

    late final http.Response response;
    try {
      response = await http.get(url);
    } catch (e) {
     
      throw RepositoryException("No wifi !");
    }

    if (response.statusCode != 200) {
      throw RepositoryException(
        "Failed to fetch todos (status ${response.statusCode})",
      );
    }

    if (response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    return data.entries
        .where((entry) => entry.key.startsWith('Todo'))
        .map((entry) => TodoDto.fromJson(entry.key, entry.value))
        .toList();
  }

 
  Future<void> updateCompleted(String todoId, bool completed) async {
    final url = Uri.parse('$_baseUrl/$todoId.json');

    late final http.Response response;
    try {
      response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({TodoDto.completed: completed}),
      );
    } catch (e) {
      throw RepositoryException("No wifi !");
    }

    if (response.statusCode != 200) {
      throw RepositoryException(
        "Failed to update todo $todoId (status ${response.statusCode})",
      );
    }
  }
}
