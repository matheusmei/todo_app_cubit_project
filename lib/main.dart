import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/cubits/cubits.dart';
import 'package:todo_app_cubit_project/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FiltersCubit>(
          create: (context) => FiltersCubit(),
        ),
        BlocProvider<SearchsCubit>(
          create: (context) => SearchsCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActivitiesCountCubit>(
          create: (context) => ActivitiesCountCubit(
            initialActivitiesCount: context.read<TodoListCubit>().state.todoList.length,
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
        BlocProvider<FilteredActivityListCubit>(create: (context) {
          return FilteredActivityListCubit(
            initialActivityList: context.read<TodoListCubit>().state.todoList,
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
            filtersCubit: BlocProvider.of<FiltersCubit>(context),
            searchsCubit: BlocProvider.of<SearchsCubit>(context),
          );
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App Cubit Version',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
