import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/cubits/filters/filters_cubit.dart';
import 'package:todo_app_cubit_project/cubits/searchs/searchs_cubit.dart';
import 'package:todo_app_cubit_project/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

part 'filtered_activity_list_state.dart';

class FilteredActivityListCubit extends Cubit<FilteredActivityListState> {
  late final StreamSubscription filtersSubscription;
  late final StreamSubscription searchsSubscription;
  late final StreamSubscription todoListSubscription;

  final FiltersCubit filtersCubit;
  final SearchsCubit searchsCubit;
  final TodoListCubit todoListCubit;

  FilteredActivityListCubit({
    required this.filtersCubit,
    required this.searchsCubit,
    required this.todoListCubit,
  }) : super(FilteredActivityListState.initial()) {
    filtersSubscription =
        filtersCubit.stream.listen((TodoFiltersState filtersState) {
      setFilteredTodos();
    });

    searchsSubscription =
        searchsCubit.stream.listen((TodoSearchState searchState) {
          setFilteredTodos();
        });

    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
          setFilteredTodos();
        });
  }

  void setFilteredTodos() {
    List<TodoModel> _filteredTodos;

    switch (filtersCubit.state.filter) {
      case Filters.active:
        _filteredTodos =
            todoListCubit.state.todoList.where((todo) => !todo.isDone).toList();
        break;

      case Filters.completed:
        _filteredTodos =
            todoListCubit.state.todoList.where((todo) => todo.isDone).toList();
        break;

      case Filters.all:
      default:
        _filteredTodos = todoListCubit.state.todoList;
        break;
    }

    if (searchsCubit.state.activitySearch.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((TodoModel todo) =>
              todo.description.contains(searchsCubit.state.activitySearch))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    filtersSubscription.cancel();
    searchsSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
