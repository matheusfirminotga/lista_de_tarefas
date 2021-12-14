import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_de_tarefas/src/models/task_model.dart';
import 'package:lista_de_tarefas/src/views/add_task_view.dart';
import 'package:provider/provider.dart';

class TasksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskList = context.watch<TaskModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Lista de Tarefas',
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => AddTaskView()),
                );
              },
              child: Text(
                'Adicionar Nova Tarefa',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle().copyWith(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            Divider(),
            Visibility(
              visible: taskList.taskList().isNotEmpty,
              child: Expanded(
                child: ListView.builder(
                  itemCount: taskList.countElements(),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: CheckboxListTile(
                        title: Text(
                          taskList.taskList().elementAt(index).title,
                          style: GoogleFonts.montserrat(),
                        ),
                        value: taskList.taskList().elementAt(index).isDone,
                        onChanged: (bool? value) {
                          taskList.updateTask(index, value!);
                        },
                        secondary: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          alignment: Alignment.centerLeft,
                          onPressed: () {
                            taskList.removeTaskById(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              replacement: Expanded(
                child: Center(
                  child: Text(
                    'Nenhuma Tarefa Adicionada',
                    style: GoogleFonts.montserrat(fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
