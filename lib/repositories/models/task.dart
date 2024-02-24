import 'package:hive_flutter/hive_flutter.dart';
part 'task.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 1)
class Task {
  
  @HiveField(0)
  String name;
  @HiveField(1)
  String description;
  @HiveField(2)
  bool succes;
  @HiveField(3, defaultValue: 1337)
  int id;
  Task({
  
  required this.name,
  required this.description,
  this.succes = false,
  required this.id,
  
  });
   // Преобразование Task в Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'success': succes,
    };
  }
}