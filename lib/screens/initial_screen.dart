import 'package:alura/data/task_inherited.dart';
import 'package:alura/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas'),
        ),
        body: AnimatedOpacity(
          opacity: (opacidade) ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(
            padding: const EdgeInsets.only(top: 8, bottom: 70),
            children: TaskInherited.of(context).taskList,
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.remove_red_eye),
        ),
      );
  }
}