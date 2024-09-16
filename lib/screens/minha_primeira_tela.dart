import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.red, width: 100, height: 100,),
                Container(color: Colors.blue, width: 50, height: 50,),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(color: Colors.blue, width: 100, height: 100,),
                Container(color: Colors.red, width: 50, height: 50,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(color: Colors.cyan, width: 50, height: 50,),
                Container(color: Colors.pinkAccent, width: 50, height: 50,),
                Container(color: Colors.purple, width: 50, height: 50,),
              ],
            ),
            Container(
              color: Colors.amber,
              width: 300,
              height: 30,
              child: const Text(
                'Diamante Amarelo',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(onPressed: () {
              //print('voce apertou o botao!');
              }, child: const Text('Aperte o Botao!'))
        ],
      ),
      );
  }
}

class MyFirstTaskWidget extends StatelessWidget {
  const MyFirstTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(color: Colors.red, width: 100, height: 100,),
              Container(color: Colors.orange, width: 100, height: 100,),
              Container(color: Colors.yellow, width: 100, height: 100,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(color: Colors.green, width: 100, height: 100,),
              Container(color: Colors.cyanAccent, width: 100, height: 100,),
              Container(color: Colors.blue, width: 100, height: 100,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(color: Colors.purple, width: 100, height: 100,),
              Container(color: Colors.pinkAccent, width: 100, height: 100,),
              Container(color: Colors.white, width: 100, height: 100,),
            ],
          ),
        ],
      );
  }
}