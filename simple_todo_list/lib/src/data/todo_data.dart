import 'package:simple_todo_list/src/data/interfaces/i_data.dart';
import 'package:simple_todo_list/src/model/todo_item_model.dart';

class TodoData implements IData<TodoItemModel> {
  TodoData._() {
    _dataSource = List.empty(growable: true);
    _sequence = 0;
  }

  static TodoData? _instance;
  static TodoData get instance => _instance ?? TodoData._();

  late final List<TodoItemModel> _dataSource;
  late int _sequence;

  @override
  void add(TodoItemModel value) {
    _sequence++;

    value.id = _sequence;
    _dataSource.add(value);
  }

  @override
  List<TodoItemModel> get() {
    return _dataSource;
  }

  @override
  void remove(TodoItemModel value) {
    _dataSource.removeWhere((item) => item.id == value.id);
  }

  @override
  void removeAll() {
    _dataSource.clear();
  }
}
