
import 'package:flutter/material.dart';
import 'package:todolist/repositories/taskExport.dart';


abstract class AbstractTaskRepository{
  Future<List<Task>> getTasks();
  Future<Task?> getTask(int id);
  bool deleteBox();
  Future<void> createTask(String name, String description, int id);
  Future<void> createTaskDialog(
    BuildContext context,
    TextEditingController textEditingController,
  );
  int getId() ;
}