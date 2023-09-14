import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_project/cubits/cubits.dart';
import 'package:todo_app_cubit_project/models/todo_model.dart';

class SearchAndFilterActivity extends StatelessWidget {
  const SearchAndFilterActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(
              labelText: 'Search Activity',
              border: InputBorder.none,
              filled: true,
              prefixIcon: Icon(Icons.search)),
          onChanged: (String? searchActivity) {
            if (searchActivity != null) {
              context.read<SearchsCubit>().setActivitySearch(searchActivity);
            }
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filters.all),
            filterButton(context, Filters.active),
            filterButton(context, Filters.completed),
          ],
        )
      ],
    );
  }
}

Widget filterButton(BuildContext context, Filters filter) {
  final buttonName = filter == Filters.all
      ? 'All'
      : filter == Filters.active
          ? 'Active'
          : 'Completed';

  final currentFilter = context.watch<FiltersCubit>().state.filter;

  return TextButton(
    onPressed: () {
      context.read<FiltersCubit>().changeFilter(filter);
    },
    child: Text(
      buttonName,
      style: TextStyle(
        color: currentFilter == filter ? Colors.blueAccent : Colors.grey,
        fontSize: 18.0,
      ),
    ),
  );
}
