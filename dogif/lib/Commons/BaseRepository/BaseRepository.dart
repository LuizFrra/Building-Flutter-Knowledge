

import 'IBaseRepository.dart';

abstract class BaseRepository<T, S> implements IBaseRepository<T, S> {
  @override
  T add(T entity) {
    print("Adicionando Objeto");
  }

  @override
  T getById(S id){
    print("Obtendo Por ID");
  }

  @override
  T remove(S id){
    print("Removendo Objeto");
  }

  @override
  T update(T entity) {
    print("Atualizando Objeto");
  }

}