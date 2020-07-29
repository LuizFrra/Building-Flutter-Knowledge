import 'dart:convert';
import 'dart:isolate';
import 'package:dogif/Commons/BaseService/BaseService.dart';
import 'package:dogif/Models/Gif.dart';
import 'package:dogif/Repositories/GifRepository.dart';
import 'package:dogif/Repositories/IGifRepository.dart';
import 'package:dogif/Services/IGifService.dart';
import 'package:http/http.dart' as http;

class GifService extends BaseService<Gif, String> implements IGifService {

  String _apiKey = "YFeSB1zsjj8DK2fKmCVjo6cl2rbUMnzv";

  static GifService _gifService;

  GifService._internal(IGifRepository gifRepository) {
    repository = gifRepository;
  }

  factory GifService() {
    if(_gifService == null) {
      print("Griando Instancia GifService");
      _gifService = new GifService._internal(new GifRepository());
    }
    return _gifService;
  }

  @override
  Future<List<Gif>> fetchGifs(int offset, String randomId, int limit) async {
    String url = "https://api.giphy.com/v1/gifs/search?q=dog";

    Map<String, dynamic> query = {
      'offset': offset,
      //'random_id': randomId,
      'limit': limit,
      'api_key': _apiKey
    };

    query.forEach((key, value) {
      url += "&" + key + "=" + value.toString();
    });

    final response = await http.get(url);

    if(response.statusCode != 200)
      throw Exception('Failed to load Gifs');

    final responseDecoded = json.decode(response.body);
    return List.castFrom<dynamic, Gif>(responseDecoded['data'].map((item) => Gif.fromJson(item)).toList());
  }

}