abstract class IBaseRepository<T, S> {
  T add(T entity);

  T remove(S id);

  T getById(S id);

  T update(T entity);
}