import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lista_de_tarefas/src/models/task_model.dart';
import 'package:provider/provider.dart';

class AddTaskView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Nova Tarefa',
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: taskTitleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  labelText: 'Título da Tarefa',
                  labelStyle: GoogleFonts.montserrat(),
                ),
                validator: (String? value) {
                  if (value!.trim().isEmpty) {
                    return 'Preencha este campo!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var taskModel = context.read<TaskModel>();
                    taskModel.addTask(
                      TaskModel(title: taskTitleController.text.trim()),
                    );
                    taskTitleController.clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(
                            'Tarefa Salva com Sucesso',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                  }
                },
                child: Text(
                  'Salvar',
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
            ],
          ),
        ),
      ),
    );
  }
}
