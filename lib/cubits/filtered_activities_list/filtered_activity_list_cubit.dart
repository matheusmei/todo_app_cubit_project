import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

part 'filtered_activity_list_state.dart';

class FilteredActivityListCubit extends Cubit<FilteredActivityListState> {
  FilteredActivityListCubit() : super(FilteredActivityListInitial());
}
