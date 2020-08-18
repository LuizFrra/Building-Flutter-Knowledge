

import 'IBaseRepository.dart';

abstract class BaseRepository<T, S> implements IBaseRepository<T, S> {
  @override
  Future<T> add(T entity) {
    print("Adicionando Objeto");
  }

  @override
  Future<T> getById(S id){
    print("Obtendo Por ID");
  }

  @override
  Future<T> remove(S id){
    print("Removendo Objeto");
  }

  @override
  Future<T> update(T entity) {
    print("Atualizando Objeto");
  }

}