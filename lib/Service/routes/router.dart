import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todolist/repositories/models/task.dart';
import 'package:todolist/screens/CreateTask.dart';
import 'package:todolist/screens/Home.dart';
import 'package:todolist/screens/taskScren.dart';

part 'router.gr.dart';            
              
@AutoRouterConfig()      
class AppRouter extends _$AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [      
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: TaskInfoRoute.page),
    AutoRoute(page: CreateTaskRoute.page)
   ];
 }               