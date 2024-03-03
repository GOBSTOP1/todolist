// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateTaskRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTaskRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateTaskScreen(
          key: args.key,
          name: args.name,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    TaskInfoRoute.name: (routeData) {
      final args = routeData.argsAs<TaskInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskInfoScreen(
          key: args.key,
          task: args.task,
        ),
      );
    },
  };
}

/// generated route for
/// [CreateTaskScreen]
class CreateTaskRoute extends PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    Key? key,
    required String name,
    List<PageRouteInfo>? children,
  }) : super(
          CreateTaskRoute.name,
          args: CreateTaskRouteArgs(
            key: key,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTaskRoute';

  static const PageInfo<CreateTaskRouteArgs> page =
      PageInfo<CreateTaskRouteArgs>(name);
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({
    this.key,
    required this.name,
  });

  final Key? key;

  final String name;

  @override
  String toString() {
    return 'CreateTaskRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskInfoScreen]
class TaskInfoRoute extends PageRouteInfo<TaskInfoRouteArgs> {
  TaskInfoRoute({
    Key? key,
    required Task task,
    List<PageRouteInfo>? children,
  }) : super(
          TaskInfoRoute.name,
          args: TaskInfoRouteArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskInfoRoute';

  static const PageInfo<TaskInfoRouteArgs> page =
      PageInfo<TaskInfoRouteArgs>(name);
}

class TaskInfoRouteArgs {
  const TaskInfoRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'TaskInfoRouteArgs{key: $key, task: $task}';
  }
}
