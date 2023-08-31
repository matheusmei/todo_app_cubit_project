// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';


enum Filters { all, active, completed }


Uuid uuid = Uuid();


class TodoModel extends Equatable {
  final String id;
  final String description;
  final bool isDone;

  TodoModel({
    String? id,
    required this.description,
    this.isDone = false,
  }) :  id = id ?? uuid.v4();
  
  @override
  
  List<Object?> get props => [id, description, isDone];

 @override
 String toString() => 'TodoModel { id: $id, description: $description, isDone: $isDone }';
}
