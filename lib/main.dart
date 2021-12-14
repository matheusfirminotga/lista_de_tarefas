import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app_widget.dart';
import 'package:lista_de_tarefas/src/models/task_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (create) => TaskModel(title: ''),
        child: AppWidget(),
      ),
    );
