import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  //Properties
  String title;
  bool isDone;
  List<TaskModel> _todos = [];

  TaskModel({required this.title, this.isDone = false});

  //Methods
  void addTask(TaskModel taskModel) {
    _todos.add(taskModel);
    notifyListeners();
  }

  void removeTaskById(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  int countElements() => _todos.length;

  List<TaskModel> taskList() => _todos;

  void updateTask(int index, bool active) {
    _todos.elementAt(index).isDone = active;
    notifyListeners();
  }
}
