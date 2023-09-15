// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<TodoModel> todoList;

  const TodoListState({
    required this.todoList,
  });

  factory TodoListState.initial() {
    return TodoListState(todoList: [
      TodoModel(id: '1', description: 'Clean the room'),
      TodoModel(id: '2', description: 'Wash the dishes'),
      TodoModel(id: '3', description: 'Disturb the wife'),
      TodoModel(id: '4', description: 'Study Flutter'),
    ]);
  }
  
  @override
  List<Object?> get props => [todoList];

  @override
  String toString() => 'TodoListState { todoList: $todoList }';


  TodoListState copyWith({
    List<TodoModel>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }
}
