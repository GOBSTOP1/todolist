import 'package:hive_flutter/hive_flutter.dart';
part 'task.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  bool succes;
  Task({
  required this.id,
  required this.name,
  required this.description,
  this.succes = false});
}