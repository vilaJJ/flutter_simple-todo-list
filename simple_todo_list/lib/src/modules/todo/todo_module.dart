import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_todo_list/src/modules/todo/list/todo_list_page.dart';

class TodoModule extends Module {
  @override
  void routes(RouteManager r) {
    r.add(
      ChildRoute(
        Modular.initialRoute,
        child: (context) => const TodoListPage(),
      ),
    );

    super.routes(r);
  }
}
