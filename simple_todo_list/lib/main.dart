import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_todo_list/src/app_module.dart';
import 'package:simple_todo_list/src/app_widget.dart';

void main() {
  ModularApp modularApp = ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  );

  runApp(modularApp);
}
