

import 'package:equatable/equatable.dart';

class TodoSearchState extends Equatable {
  final String activitySearch;

  const TodoSearchState({required this.activitySearch});

  factory TodoSearchState.initial() {
    return const TodoSearchState(activitySearch: '');
  }

  @override
  List<Object?> get props => [activitySearch];

  @override
  String toString() => 'TodoSearchState { activitySearch: $activitySearch }';

  TodoSearchState copyWith({
    String? activitySearch,
  }) {
    return TodoSearchState(
      activitySearch: activitySearch ?? this.activitySearch,
    );
  }
}
