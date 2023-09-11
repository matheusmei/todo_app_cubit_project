import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget {
  final Text activityCount;
  const TodoHeader({
    required this.activityCount,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        const Text(
          'To Do List',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        activityCount
      ],
    );
  }
}