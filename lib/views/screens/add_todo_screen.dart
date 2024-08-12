
import 'package:flutter/material.dart';
import 'package:shopliax/model/todo_model.dart';
import 'package:shopliax/service_locator.dart';
import 'package:shopliax/views/components/navigation.dart';
import 'package:shopliax/views/components/widgets/custom_button.dart';
import 'package:shopliax/views/components/widgets/custom_text_field.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({super.key});

  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            popView(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration( 
                shape: BoxShape.circle,
                color: Colors.black12),
            height: 23,
            width: 23,
            child: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text("Create New Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 32),
        child: ListView(
          children: [
            CustomTextField(
                controller: taskNameController, labelText: "Task Name"),
            CustomTextField(
                suffixIcon: const Icon(Icons.date_range_rounded),
                isDate: true,
                controller: dateController,
                labelText: "Date"),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                      isTime: true,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      controller: startTimeController,
                      labelText: "Start Time"),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: CustomTextField(
                      isTime: true,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      controller: endTimeController,
                      labelText: "End Time"),
                ),
              ],
            ),
            CustomTextField(
                controller: descriptionController, labelText: "Description"),
            const SizedBox(
              height: 32,
            ),
            ListenableBuilder(
                listenable: Listenable.merge([
                  taskNameController,
                  dateController,
                  startTimeController,
                  endTimeController,
                  descriptionController
                ]),
                builder: (context, _) {
                  bool isEnabled = ( taskNameController.text.isNotEmpty &&
                  dateController.text.isNotEmpty &&
                  startTimeController.text.isNotEmpty &&
                  endTimeController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty);
                  return CustomButton(
                    enabled: isEnabled,
                    onTap: () {
                      final newTodo = Todo(
                        id: DateTime.now().toString(),
                        taskName: taskNameController.text,
                        date: dateController.text,
                        startTime: startTimeController.text,
                        endTime: endTimeController.text,
                        description: descriptionController.text,
                      );
                      $todoBloc.addTodo(newTodo);
                      Navigator.of(context).pop();
                    },
                    text: "Create task",
                  );
                })
          ],
        ),
      ),
    );
 
  }}