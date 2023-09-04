
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  //add Activity
  void addActivity(String newActivity) {
    final newTodo = TodoModel(description: newActivity);
    final newTodos = [...state.todoList, newTodo];

    emit(state.copyWith(todoList: newTodos));
  }

  //Edit Activity
  void editActivity(String id, String newActivity) {
    final newTodos = state.todoList.map((TodoModel currentActivity) {
      if (currentActivity.id == id) {
        return TodoModel(
          id: id,
          description: newActivity,
          isDone: currentActivity.isDone,
        );
      }
      return currentActivity;
    }).toList();

    emit(state.copyWith(todoList: newTodos));
  }

  //Toggle Activity
  void toggleActivity(String id) {
    final newTodo = state.todoList.map((TodoModel currentActivity) {
      if (currentActivity.id == id) {
        return TodoModel(
          id: id,
          description: currentActivity.description,
          isDone: !currentActivity.isDone,
        );
      }
      return currentActivity;
    }).toList();

    emit(state.copyWith(todoList: newTodo));
  }

  //Delete Activity
  void deleteActivity(TodoModel activity) {
    final newTodo = state.todoList.where((TodoModel currentActivity) {
      return currentActivity.id != activity.id;
    }).toList();

    emit(state.copyWith(todoList: newTodo));
  }




}
