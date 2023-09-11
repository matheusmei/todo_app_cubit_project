// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_activity_list_cubit.dart';

class FilteredActivityListState extends Equatable {
  final List<TodoModel> filteredTodos;

  const FilteredActivityListState({
    required this.filteredTodos,
  });



factory FilteredActivityListState.initial() {
    return const FilteredActivityListState(
      filteredTodos: [],
    );
  }

  @override
  List<Object?> get props => [filteredTodos];


  @override
  String toString() => 'FilteredActivityListState(filteredTodos: $filteredTodos)';

  
  FilteredActivityListState copyWith({
    List<TodoModel>? filteredTodos,
  }) {
    return FilteredActivityListState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
