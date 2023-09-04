// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'searchs_cubit.dart';

class TodoSearchState extends Equatable {
  final String activitySearch;

  const TodoSearchState({required this.activitySearch});

  factory TodoSearchState.initial() {
    return const TodoSearchState(activitySearch: '');
  }
  
  @override
  List<Object?> get props => [activitySearch];

  @override
  String toString() => 'TodoSearchState(activitySearch: $activitySearch)';

  TodoSearchState copyWith({
    String? activitySearch,
  }) {
    return TodoSearchState(
      activitySearch: activitySearch ?? this.activitySearch,
    );
  }
}
