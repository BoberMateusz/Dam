abstract interface class DAO<T>{
  int add(T task);

  T? getById(int id);

  List<T> getAll();

  Stream<List<T>> watchAll();

  int update(T t);

  bool delete(int id);
}