import 'package:flutter/material.dart';
import 'package:simple_todo_list/src/model/todo_item_model.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    super.key,
    required this.model,
    required this.onRemove,
  });

  final TodoItemModel model;
  final void Function(TodoItemModel value) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text("${model.id}"),
        title: Text(model.content),
        trailing: IconButton(
          onPressed: () => onRemove(model),
          icon: const Icon(Icons.delete_rounded),
        ),
      ),
    );
  }
}
