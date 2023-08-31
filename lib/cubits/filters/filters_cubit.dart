
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<TodoFiltersState> {
  FiltersCubit() : super(TodoFiltersState.initial());

  void changeFilter(Filters newFilter) {
  emit(state.copyWith(filter: newFilter));
}

}

