import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit_project/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

part 'activities_count_state.dart';

class ActivitiesCountCubit extends Cubit<ActivitiesCountState> {
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;
  final int initialActivitiesCount;
  ActivitiesCountCubit({
    required this.initialActivitiesCount,
    required this.todoListCubit,
  }) : super(ActivitiesCountState(activitiesCount: initialActivitiesCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('todoListState: $todoListState');
    });

    final int currentActivitiesCount = todoListCubit.state.todoList
        .where((TodoModel activity) => !activity.isDone)
        .toList()
        .length;

    emit(state.copyWith(activitiesCount: currentActivitiesCount));
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }

}
