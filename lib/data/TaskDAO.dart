// ignore_for_file: file_names

import 'package:alura/components/task.dart';

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

  save(Task tarefa) async{}
  /*Future<List<Task>> findAll() async{

  }
  Future<List<Task>> find(String nomeDaTarefa) async{}
  delete(String nomeDaTarefa) async{}*/
}