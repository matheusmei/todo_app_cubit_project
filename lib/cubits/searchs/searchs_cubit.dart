import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searchs_state.dart';

class SearchsCubit extends Cubit<TodoSearchState> {
  SearchsCubit() : super(TodoSearchState.initial());

  void setActivitySearch(String newSearch) {
    emit(state.copyWith(activitySearch: newSearch));
  }
}
