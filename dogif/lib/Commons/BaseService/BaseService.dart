

import 'package:dogif/Commons/BaseRepository/IBaseRepository.dart';
import 'package:flutter/cupertino.dart';

import 'IBaseService.dart';

abstract class BaseService<T, S> implements IBaseService<T, S> {

  @protected
  IBaseRepository repository;

  @override
  Future<T> add(T entity) async {
    return await repository.add(entity);
  }

  @override
  Future<T> getById(S id) async {
    return await repository.getById(id);
  }

  @override
  Future<T> remove(S id) async {
    return await repository.remove(id);
  }

  @override
  Future<T> update(T entity) async {
    return await repository.update(entity);
  }

}