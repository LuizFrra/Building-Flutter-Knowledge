import 'package:dogif/Commons/BaseRepository/IBaseRepository.dart';
import 'package:dogif/Commons/BaseService/IBaseService.dart';
import 'package:dogif/Models/Gif.dart';

abstract class IGifService<T, S> extends IBaseService<Gif, String> {

  Future<List<Gif>> fetchGifs(int offset, String randomId, int limit);

}