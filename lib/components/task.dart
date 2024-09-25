import 'package:flutter/material.dart';
import 'package:alura/components/difficulty.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {super.key});

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  
  int estado = 0;

  bool assetOrNetwork(){
    if (widget.foto.contains('http')){
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: mudarCor(estado),
              borderRadius: BorderRadius.circular(5)
            ),
             height: 140,
             ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5) 
                ), 
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      height: 100,
                      width: 72,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: assetOrNetwork() 
                          ? Image.asset(
                              widget.foto,
                              fit: BoxFit.cover,
                            ) 
                          : Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome, 
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                                ),
                            ),
                          ),
                          Difficulty(dificultyLevel: widget.dificuldade,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              widget.nivel++;
                              if ((widget.nivel == (widget.dificuldade * 10)) && estado <= 5){
                                estado++;
                                widget.nivel = 0;
                              }
                            });
                          }, 
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                              ) 
                            ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'Up',
                                style: TextStyle(fontSize: 17),
                                ),
                            ],
                          )),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.dificuldade > 0) ? (widget.nivel / widget.dificuldade) / 10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Nivel: ${widget.nivel}', 
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                    textAlign: TextAlign.right,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

Color mudarCor(valor){
  switch (valor){
    case 0:
      return Colors.blue;
    case 1:
      return Colors.green;
    case 2:
      return Colors.yellow;
    case 3:
      return Colors.orange;
    case 4:
      return Colors.red;
    case 5:
      return Colors.purple;
    default:
      return Colors.black;
  }
}