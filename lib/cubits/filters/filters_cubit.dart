import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<TodoFiltersState> {
  FiltersCubit() : super(TodoFiltersState.initial());
}


