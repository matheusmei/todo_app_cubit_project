import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/cubits/cubits.dart';

class ShowActivities extends StatelessWidget {
  const ShowActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final activity =
        context.watch<FilteredActivityListCubit>().state.filteredTodos;
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(activity[index].id),
            background: showBackGround(0),
            secondaryBackground: showBackGround(1),
            child: Text(
              activity[index].description,
              style: const TextStyle(fontSize: 20.0),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemCount: activity.length);
  }
}

Widget showBackGround(int direction) {
  return Container(
    margin: const EdgeInsets.all(4.0),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    color: Colors.red,
    alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
    child: const Icon(
      Icons.delete,
      color: Colors.white,
      size: 30.0,
    ),
  );
}
