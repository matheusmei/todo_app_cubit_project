import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/cubits/activities_count/activities_count_cubit.dart';
import 'package:todo_app_cubit_project/cubits/cubits.dart';
import 'package:todo_app_cubit_project/pages/home/components/todo_create_activity.dart';

import 'components/todo_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Column(
            children: const  [
              TodoHeader(),
              // BlocBuilder<ActivitiesCountCubit, ActivitiesCountState>(
                // builder: (context, state) {
                //   return TodoHeader(
                    // activityCount: 
                    // Text(
                    //   '${state.activitiesCount} itens left',
                    //   style: const TextStyle(
                    //       fontSize: 20.0,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.redAccent),
                    // ),
                    //ANOTHER WAY TO CALL THE ACTIVITIES COUNT
                    // activityCount: Text(
                    // '${context.watch<ActivitiesCountCubit>().state.activitiesCount} itens left'
                    // ),
                  // );
                // },
              // ),
              // TodoCreateActivity(onActivityAdded: (newActivity) {
              //   context.read<TodoListCubit>().addActivity(newActivity);
              // }),
             TodoCreateActivity()
            ],
          ),
        ),
      ),
    ));
  }
}
