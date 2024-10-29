import 'package:flutter/material.dart';
import 'package:simple_todo_list/src/data/todo_data.dart';
import 'package:simple_todo_list/src/helpers/focus/focus_helper.dart';
import 'package:simple_todo_list/src/helpers/media_query/media_query_helper.dart';
import 'package:simple_todo_list/src/model/todo_item_model.dart';
import 'package:simple_todo_list/src/ui/widgets/todo_item_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final data = TodoData.instance;

  @override
  void initState() {
    todoNameController = TextEditingController();
    getData();
    super.initState();
  }

  late List<TodoItemModel> todoList;
  late TextEditingController todoNameController;

  bool get removeAllEnabled {
    return todoList.isNotEmpty;
  }

  bool get isValidTodoName {
    return todoNameController.text.trim().isNotEmpty;
  }

  bool get insertEnabled {
    return isValidTodoName;
  }

  String get listCountState {
    if (todoList.isEmpty) {
      return "Nenhuma tarefa adicionada";
    }
    final length = todoList.length;
    return "$length tarefa${length == 1 ? "" : "s"}";
  }

  void refreshList() {
    setState(() {
      getData();
    });
  }

  void addTodo() {
    data.add(
      TodoItemModel(
        content: todoNameController.text,
      ),
    );
    refreshList();
  }

  void getData() {
    todoList = data.get();
  }

  void remove(TodoItemModel value) {
    data.remove(value);
    refreshList();
  }

  void removeAll() {
    if (removeAllEnabled == false) {
      return;
    }

    data.removeAll();
    refreshList();
  }

  void clearTextTodoNameField() {
    todoNameController.clear();
  }

  void unfocusFields() {
    FocusHelper.of(context).unfocus();
  }

  void handleClearTodoName() {
    setState(() {
      clearTextTodoNameField();
      unfocusFields();
    });
  }

  void handleInsertTodo() {
    if (insertEnabled == false) {
      return;
    }

    addTodo();
    clearTextTodoNameField();
    unfocusFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: removeAllEnabled ? removeAll : null,
              icon: const Icon(Icons.delete_sweep_rounded),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQueryHelper.of(context).getWidth(percentage: 0.75),
                    child: TextField(
                      controller: todoNameController,
                      decoration: InputDecoration(
                        labelText: "Tarefa",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        suffixIcon: Visibility(
                          visible: isValidTodoName == true,
                          child: IconButton(
                            onPressed: handleClearTodoName,
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) => setState(() {}),
                      onSubmitted: (value) => handleInsertTodo(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: IconButton.filled(
                      visualDensity: VisualDensity.standard,
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: insertEnabled ? handleInsertTodo : null,
                      icon: const Icon(Icons.add_rounded),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 32,
                    child: Divider(),
                  ),
                  Text(listCountState),
                  const Expanded(
                    flex: 1,
                    child: Divider(),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: todoList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => TodoItemWidget(
                    model: todoList[index],
                    onRemove: remove,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
