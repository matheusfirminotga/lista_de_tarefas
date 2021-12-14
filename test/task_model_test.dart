// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_tarefas/src/models/task_model.dart';

void main() {
  group('verifica funcionamento da classe TaskModel', () {
    var taskModel = TaskModel(title: '');
    taskModel.addTask(TaskModel(title: 'Aprender Programação'));
    taskModel.addTask(TaskModel(title: 'Lavar Carro'));
    taskModel.addTask(TaskModel(title: 'Formatar Notebook', isDone: true));
    taskModel.addTask(TaskModel(title: 'Concertar Ventilador'));
    test('verifica se o item é adicionado na lista', () {
      taskModel.addListener(() {
        expect(4, taskModel.countElements());
        taskModel.addTask(TaskModel(title: 'Cortar Grama'));
      });
    });
    test('verifica se o item é removido da lista', () {
      taskModel.addListener(() {
        expect(4, taskModel.countElements());
        taskModel.removeTaskById(1);
      });
    });
    test('verifica se o item é alterado', () {
      taskModel.addListener(() {
        expect(taskModel.taskList().elementAt(1).isDone, true);
        taskModel.updateTask(1, true);
      });
    });
    test('verifica se os items foram inseridos na lista', () {
      expect(4, taskModel.countElements());
    });
  });
}
