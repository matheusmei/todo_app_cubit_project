import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/todo_list/todo_list_cubit.dart';

class TodoCreateActivity extends StatefulWidget {
  // final Function(String) onActivityAdded;
  const TodoCreateActivity({
    // required this.onActivityAdded,
    super.key});

  @override
  State<TodoCreateActivity> createState() => _TodoCreateActivityState();
}

class _TodoCreateActivityState extends State<TodoCreateActivity> {
 
  final TextEditingController newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: newTodoController,
        decoration: const InputDecoration(
          labelText: 'New Activity',
        ),
        //  onSubmitted: (String valueTyped) {
        //   if(valueTyped.trim().isNotEmpty) {
        //     widget.onActivityAdded(valueTyped);
        //     newTodoController.clear();
            
        //   }
        //  } ,

        onSubmitted: (String? valueTyped) {
          if(valueTyped != null && valueTyped.trim().isNotEmpty) {
            context.read<TodoListCubit>().addActivity(valueTyped);
            newTodoController.clear();
            
          }
        },
        );
  }
}
