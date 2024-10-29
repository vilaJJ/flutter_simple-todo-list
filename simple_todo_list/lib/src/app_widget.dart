import 'package:flutter/material.dart';
import 'package:simple_todo_list/src/ui/pages/todo_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo List",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}
