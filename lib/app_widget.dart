import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/src/views/tasks_view.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      home: TasksView(),
    );
  }
}
