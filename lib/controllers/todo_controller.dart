import 'package:get/get.dart';
import '../models/todo.dart';
import '../services/api_service.dart';
import 'package:hive/hive.dart';

class TodoController extends GetxController {
  List<Todo> todos = [];
  final box = Hive.box('todos');

  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    loading = true;
    update();

    /// ❌ لا نستخدم object
    /// final api = ApiService();
    /// final fetched = await api.fetchTodos();

    /// ✔️ الصيحة الصحيحة
    final fetched = await ApiService.fetchTodos();

    todos = fetched;

    await box.put(
      'todosList',
      fetched
          .map((e) => {
                'id': e.id,
                'todo': e.todo,
                'completed': e.completed,
              })
          .toList(),
    );

    loading = false;
    update();
  }

  void deleteTodo(int id) {
    todos.removeWhere((x) => x.id == id);
    update();
  }
}
