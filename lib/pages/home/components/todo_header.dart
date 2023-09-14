import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/cubits/activities_count/activities_count_cubit.dart';

class TodoHeader extends StatelessWidget {
  // final Text activityCount;
  const TodoHeader(
      {
      // required this.activityCount,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'To Do List',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // BlocBuilder<ActivitiesCountCubit, ActivitiesCountState>(
        //   builder: (context, state) {
        //     return Text(
        //       '${state.activitiesCount} itens left',
        //       style: const TextStyle(
        //           fontSize: 20.0,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.redAccent),
        //     );
          
            Text(
              '${context.watch<ActivitiesCountCubit>().state.activitiesCount} itens left',
            ),
        //   },
        // ),
      ],
    );
  }
}
