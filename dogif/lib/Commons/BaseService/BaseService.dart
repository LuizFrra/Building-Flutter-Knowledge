

import 'package:dogif/Commons/BaseRepository/IBaseRepository.dart';
import 'package:flutter/cupertino.dart';

import 'IBaseService.dart';

abstract class BaseService<T, S> implements IBaseService<T, S> {

  @protected
  IBaseRepository repository;

  @override
  T add(T entity) {
    return repository.add(entity);
  }

  @override
  T getById(S id){
    return repository.getById(id);
  }

  @override
  T remove(S id){
    return repository.remove(id);
  }

  @override
  T update(T entity) {
    return repository.update(entity);
  }

}