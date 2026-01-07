import 'package:hive/hive.dart';
import '../models/todo.dart';
import 'api_service.dart';

class TodoRepository {
  final Box<Todo> _todosBox = Hive.box<Todo>('todos');

  Future<void> syncTodos() async {
    List<Todo> todos = await ApiService.fetchTodos();
    await _todosBox.clear();
    for (var todo in todos) {
      _todosBox.put(todo.id, todo);
    }
  }

  List<Todo> getAllTodos() {
    return _todosBox.values.toList();
  }
}