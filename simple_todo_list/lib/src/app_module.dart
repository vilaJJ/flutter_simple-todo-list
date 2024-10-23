import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_todo_list/src/modules/todo/todo_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.add(
      ModuleRoute(
        Modular.initialRoute,
        module: TodoModule(),
      ),
    );

    super.routes(r);
  }
}
