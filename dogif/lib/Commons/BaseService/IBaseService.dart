abstract class IBaseService<T, S> {
  Future<T> add(T entity);

  Future<T> remove(S id);

  Future<T> getById(S id);

  Future<T> update(T entity);
}