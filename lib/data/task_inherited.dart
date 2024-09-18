import 'package:alura/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    const Task('Aprender Flutter', 'assets/images/logo.png', 3),
    const Task('Andar de Bike', 'assets/images/bike.jpeg', 2),
    const Task('Meditar', 'assets/images/meditar.jpeg', 5),
    const Task('Minecraft', 'assets/images/mine.webp', 1),
    const Task('FABTEC', 'assets/images/robo.jpg', 5),
    const Task('Alura', 'assets/images/alura.jpg', 2),
    const Task('BCC', 'assets/images/bcc.avif', 5),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>()!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}