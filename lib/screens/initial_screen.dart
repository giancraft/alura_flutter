import 'package:flutter/material.dart';
import 'package:alura/components/task.dart';

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
            children: const [
              Task('Aprender Flutter', 'assets/images/logo.png', 3),
              Task('Andar de Bike', 'assets/images/bike.jpeg', 2),
              Task('Meditar', 'assets/images/meditar.jpeg', 5),
              Task('Minecraft', 'assets/images/mine.webp', 1),
              Task('FABTEC', 'assets/images/robo.jpg', 5),
              Task('Alura', 'assets/images/alura.jpg', 2),
              Task('BCC', 'assets/images/bcc.avif', 5),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
        ),
      );
  }
}