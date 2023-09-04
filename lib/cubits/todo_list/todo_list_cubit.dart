import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addActivity(String newActivity) {
    final newTodo = TodoModel(description: newActivity);
    final newTodos = [...state.todoList, newTodo];

    emit(state.copyWith(todoList: newTodos));
  }

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
}
