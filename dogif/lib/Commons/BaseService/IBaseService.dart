abstract class IBaseService<T, S> {
  T add(T entity);

  T remove(S id);

  T getById(S id);

  T update(T entity);
}