abstract class IData<Model> {
  void add(Model value);
  List<Model> get();
  void remove(Model value);
  void removeAll();
}
