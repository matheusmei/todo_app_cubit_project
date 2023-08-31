// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filters_cubit.dart';

class TodoFiltersState extends Equatable {
  final Filters filter;

  const TodoFiltersState({required this.filter});

  factory TodoFiltersState.initial() {
    return const TodoFiltersState(filter: Filters.all);
  }

  @override
  List<Object?> get props => [filter];

  @override
  String toString() => 'TodoFiltersState { filters: $filter }';

  TodoFiltersState copyWith({
    Filters? filter,
  }) {
    return TodoFiltersState(
      filter: filter ?? this.filter,
    );
  }
}
