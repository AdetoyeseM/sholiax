import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shopliax/controllers/todo/todo_bloc.dart';
import 'package:shopliax/model/todo_model.dart';
import 'package:shopliax/service_locator.dart';
import 'package:shopliax/views/components/navigation.dart';
import 'package:shopliax/views/components/widgets/custom_button.dart';
import 'package:shopliax/views/components/widgets/todo_listtile.dart';
import 'package:shopliax/views/screens/add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: StreamBuilder<List<Todo>>(
        stream: $todoBloc.todoListStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/pngs/empty.png",
                    height: 220,
                  ),
                  CustomButton(
                      enabled: true,
                      onTap: () {
                        navigateToPage(AddTodoScreen());
                      },
                      text: "Add New Task"),
                  const SizedBox(
                    height: kBottomNavigationBarHeight * 3,
                  )
                ],
              ),
            );
          }

          final todos = snapshot.data!;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoListtile(
                  index: index,
                  onDeleteClicked: () {
                    $todoBloc.removeTodo(todo.id);
                  },
                  onChanged: (_) {
                    $todoBloc.toggleTodoCompletion(todo.id);
                  },
                  todo: todo);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade400,
        foregroundColor: Colors.white,
        onPressed: () {
          navigateToPage(AddTodoScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
