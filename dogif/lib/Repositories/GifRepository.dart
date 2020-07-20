import 'package:dogif/Commons/BaseRepository/BaseRepository.dart';
import 'package:dogif/Models/Gif.dart';
import 'package:dogif/Repositories/IGifRepository.dart';

class GifRepository extends BaseRepository<Gif, String> implements IGifRepository {

  static GifRepository _gifRepository;

  factory GifRepository() {
    if(_gifRepository == null) {
      print("Griando Instancia GifRepository");
      _gifRepository = new GifRepository._internal();
    }
    return _gifRepository;
  }

  GifRepository._internal();

  @override
  Gif add(Gif entity) {
    print("oi");
    return new Gif();
  }

  @override
  Gif getById(String id) {
    print("oi");
    return new Gif();
  }

  @override
  Gif remove(String id) {
    print("oi");
    return new Gif();
  }

  @override
  Gif update(Gif entity) {
    print("oi");
    return new Gif();
  }
}