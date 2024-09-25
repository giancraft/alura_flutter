// ignore_for_file: file_names

import 'package:alura/components/task.dart';
import 'package:alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
  '$_name TEXT, '
  '$_difficulty INTEGER, '
  '$_image TEXT'
  ')';

  static const String _tableName = 'task';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  save(Task tarefa) async{
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty){
      print('nao existe');
      return await bancoDeDados.insert(_tableName, taskMap);
    } else {
      print('ja existe');
      return await bancoDeDados.update(_tableName, taskMap, where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa){
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;

    print('mapa de tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async{
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tableName);
    print('Resultados encontrados: $result');

    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];

    for (Map<String, dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }

    print('Lista de Tarefas: $tarefas');

    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async{
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);

    print('Tarefa encontrada: $result');

    return toList(result);
  }

  delete(String nomeDaTarefa) async{
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}