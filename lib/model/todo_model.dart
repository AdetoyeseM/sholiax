class Todo {
   String id;
   String taskName;
   String date;
   String startTime;
   String endTime;
   String description;
   bool completed;

  Todo({
    required this.id,
    required this.taskName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      taskName: json['taskName'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      description: json['description'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'completed': completed,
    };
  }
}
