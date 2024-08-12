import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopliax/model/todo_model.dart';

class TodoBloc {
  final _todoListController = BehaviorSubject<List<Todo>>.seeded([]);
  final String _todoListKey = 'todo_list';
  TodoBloc() {
    _loadTodos();
  }

  Stream<List<Todo>> get todoListStream => _todoListController.stream;
  List<Todo> get currentTodos => _todoListController.value;

  void addTodo(Todo todo) {
    final updatedTodos = List<Todo>.from(currentTodos)..add(todo);
    _updateTodos(updatedTodos);
  }

  void toggleTodoCompletion(String id) {
    final updatedTodos = currentTodos.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          taskName: todo.taskName,
          date: todo.date,
          startTime: todo.startTime,
          endTime: todo.endTime,
          description: todo.description,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    _updateTodos(updatedTodos);
  }

  void removeTodo(String id) {
    final updatedTodos = currentTodos.where((todo) => todo.id != id).toList();
    _updateTodos(updatedTodos);
  }

  void editTodo(String id, String taskName, String date, String startTime,
      String endTime, String description) {
    final updatedTodos = currentTodos.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          taskName: taskName,
          date: date,
          startTime: startTime,
          endTime: endTime,
          description: description,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();

    _updateTodos(updatedTodos);
  }

  void _updateTodos(List<Todo> todos) {
    _todoListController.add(todos);
    _saveTodos(todos);
  }

  Future<void> _saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    await prefs.setString(_todoListKey, todosJson);
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = prefs.getString(_todoListKey);
    if (todosJson != null) {
      final List<dynamic> todosList = jsonDecode(todosJson);
      final todos = todosList.map((json) => Todo.fromJson(json)).toList();
      _todoListController.add(todos);
    }
  }

  // Dispose
  void dispose() {
    _todoListController.close();
  }
}
