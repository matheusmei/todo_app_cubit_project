part of 'activities_count_cubit.dart';

class ActivitiesCountState extends Equatable {
  final int activitiesCount;

  const ActivitiesCountState({required this.activitiesCount});

  factory ActivitiesCountState.initial() {
    return const ActivitiesCountState(activitiesCount: 0);
  }
  
  @override
  List<Object?> get props => [activitiesCount];

  @override
  String toString() => 'ActivitiesCountState(activitiesCount: $activitiesCount)';

  ActivitiesCountState copyWith({
    int? activitiesCount,
  }) {
    return ActivitiesCountState(
      activitiesCount: activitiesCount ?? this.activitiesCount,
    );
  }
}
