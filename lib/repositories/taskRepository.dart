import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/models/task.dart';

class TaskRepository {
  Future<List<Task>> getTasks() async {
    try {
      var box = Hive.box<Task>('todoBox');
      final List<Task> taskList = box.values.toList();
      print('я работаю');
      return taskList;
    } catch (e) {
      print(e);
      return [];
    }
  }
  bool deleteBox(){
    try{
      var box = Hive.box<Task>('todoBox');
      var keys = box.keys;
      box.deleteAll(keys);
      return true;
    } catch (e){
      return false;
    }
  }
  Future<void> createTask(String name, String description, int id) async {
    try{
      var box = Hive.box<Task>('todoBox');
      box.put(id, Task(name: name, description: description, id: id));
      print(description);
      print('создана задача');
    } catch (e){
      print('мослину поймал в taskrepository createtask $e');
    }
  }
  Future<void> createTaskDialog(
    BuildContext context,
    TextEditingController textEditingController,
  ) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Новая заметка'),
            content: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(hintText: 'Введите название заметки'),
              maxLines: null,
            ),
            actions: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: const Text('Отмена')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/createTask', (route) => false,
                            arguments: textEditingController);
                            
                      },
                      child: const Text('Создать')),
                ],
              ),
            ],
          );
        });
  }
  int getId() {
    try{
    var box =  Hive.box<Task>('todoBox');  
    var values = box.keys;
    int id = values.length + 1;
    print(values);
    print('id: $id');
    return id;
    } catch (e){
      print(e);
      return 0;
    }
  }
}
